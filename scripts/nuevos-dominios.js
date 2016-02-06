// Description:
//   Muestra los dominios inscritos en nic.cl en la última hora
//
// Dependencies:
//   cheerio
//
// Configuration:
//   None
//
// Commands:
//   lista dominios
//
// Author:
//   jorgeepunan

var cheerio = require('cheerio');

module.exports = function(robot) {
  robot.hear(/lista dominios/i, function(msg) {

    var url = 'http://www.nic.cl/registry/Ultimos.do?t=1h';

    msg.robot.http(url).get()(function(err, res, body) {

      var $ = cheerio.load(body);
      var dominios = [];

      $('.tablabusqueda td div a').each(function() {
        dominios.push( $(this).text() );
      });

      msg.send( $('.tablabusqueda tr:first-child td').text() + ":" );
      msg.send( dominios.toString() );

    });

  });
};
