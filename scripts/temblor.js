// Description:
//   Muestra los últimos temblores significativos en Chile.
//
// Dependencies:
//   request
//
// Configuration:
//   None
//
// Commands:
//   pudu temblores [Chile|Mundo]
//
// Author:
//   jorgeepunan

var request = require('request');
var url = 'http://earthquake-report.com/feeds/recent-eq?json';

module.exports = function(robot) {
  robot.respond(/temblores (.*)/i, function(res) {
    var cual = (res.match[1]).trim().toUpperCase();
    request(url, function (error, response, body) {

      if (!error && response.statusCode == 200) {

        /* Leer el JSON */
        var data = JSON.parse(body);
        var magnitudMinima = 6;
        var chile = [];
        var mundo = [];

        data.forEach (function(d) {
          var donde = d.location;
          var magnitud = d.magnitude;
          if( parseInt(magnitud) >= magnitudMinima ) {
            /* con un temblor menos de 6 grados ni me muevo de la silla menos de la cama asi q este es el mínimo */
            contenedor = (donde.toUpperCase().indexOf('CHILE') > -1)?chile:mundo;
            contenedor.push(d.title + ": \n- Lugar: " + d.location + "\n- Magnitud: " + d.magnitude + " (richter)\n- Fecha/Hora: " + d.date_time + "\n- Enlace: " + d.link);
          }
        });

        var mensaje;
        if(cual == 'CHILE') {
          mensaje = (chile.length > 0)?chile.join("\n\n"):"Por suerte, ningún temblor mayor a " + magnitudMinima + " grados recientemente en Chile.";
        } else {
          mensaje = (mundo.length > 0)?mundo.join("\n\n"):"Por suerte, ningún temblor mayor a " + magnitudMinima + " grados fuera de Chile.";
        }
        res.send(mensaje);
      } else {
        res.send(":facepalm: Error: ", error);
      }

    });
  });
};
