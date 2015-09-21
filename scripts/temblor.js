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
//   pudu temblores Chile|mundo
//
// Author:
//   jorgeepunan

var request = require('request');
var url = 'http://earthquake-report.com/feeds/recent-eq?json';

module.exports = function(robot) {
  robot.respond(/temblores (.*)/i, function(res) {
    var cual = res.match[1];

    request(url, function (error, response, body) {

      if (!error && response.statusCode == 200) {
        
        var data = JSON.parse(body);

        data.forEach (function(d) {

          var donde = d.location;
          var magnitud = d.magnitude;

          if( magnitud.split('.')[0] >= 6 ) { // con un temblor menos de 6 grados ni me muevo de la silla menos de la cama asi q este es el mínimo

            if( cual == 'chile' || cual == 'Chile' || cual == 'CHILE' ) {
              if( donde.toUpperCase().indexOf('CHILE') > -1 ) {
                res.send( d.title + ": \n- Lugar: " + d.location + "\n- Magnitud: " + d.magnitude + " (richter)\n- Fecha/Hora: " + d.date_time + "\n- Enlace: " + d.link);
              } else {
                res.send( "Por suerte, ningún temblor mayor a 6 grados recientemente en Chile." )
              }
            } else if( cual == 'mundo' || cual == 'Mundo' || cual == 'MUNDO' ) {
              if( donde.toUpperCase().indexOf('CHILE') == -1 ) {
                res.send( d.title + ": \n- Lugar: " + d.location + "\n- Magnitud: " + d.magnitude + " (richter)\n- Enlace: " + d.link);
              } else {
                res.send( "Por suerte, ningún temblor mayor a 6 grados recientemente fuera de Chile." )
              }
            }
          }

        });

      } else {
        res.send(":facepalm: Error: ", error);
      }

    });
  });
};
