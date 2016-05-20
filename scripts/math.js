// Description:
//   Hubot hace cálculos por ti
//
// Dependencies:
//   mathjs
//
// Configuration:
//   None
//
// Commands:
//   hubot calcula <expresion>
//   hubot convierte <expresion> to/in <unidad> (TODO: convertir la expresion a español)
//
// Notes
//   + info: http://mathjs.org/examples/expressions.js.html
//
// Author:
//   :berrea:

var mathjs = require("mathjs");

module.exports = function(robot) {

  robot.respond(/(calcula|convierte|math|conv)( me)? (.*)/i, function(msg) {
    var error, error1, result;

    try {

      result = mathjs['eval'](msg.match[3]);
      msg.send("Resultado de " + msg.match[3] + ": " + result);

    } catch (error) {

      msg.send(error.message + '. Intenta con otra unidad / tipo de cálculo.' || 'Error mío. De nuevo plz.');

    }

  });

};
