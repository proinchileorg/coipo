// Description:
//   Muestra los últimos temblores significativos en Chile.
//
// Dependencies:
//   none
//
// Configuration:
//   None
//
// Commands:
//   pudu temblores
//
// Author:
//   jorgeepunan

var request = require('request');
var url = 'http://earthquake-report.com/feeds/recent-eq?json';

module.exports = function(robot) {
  robot.respond(/temblores/i, function(res) {
    var suffix = res.match[1];
    request(url, function (error, response, body) {
      if (!error && response.statusCode == 200) {
        var data = JSON.parse(body);
        data.forEach (function(d) {
          var donde = d.location;
          if( donde.toUpperCase().indexOf('CHILE') > -1 ) {
            res.send( d.title + ": \n- Lugar: " + d.location + "\n- Magnitud: " + d.magnitude + " (richter)\n- Enlace: " + d.link);
          } else {
            res.send( "Por suerte, ningún temblor significativo en Chile" )
          }
        });
      } else {
        res.send(":facepalm: Error: ", error);
      }
    });
  });
};
