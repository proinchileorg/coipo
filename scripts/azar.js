// Description:
//   selecciona al azar de un conjunto separados por coma (,)
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   @pudu al azar <algo1>,<algo2>,<algoN>,
//
// Author:
//   @jorgeepunan



var random = require('./helpers/random');

module.exports = function(robot) {
  robot.respond(/al azar (.*)/i, function(res) {
    var items = res.match[1].trim().split(",");
    msg = "Al azar: `" + random.item(items) + "` :dart: :ok_hand:";
    res.send(msg);
  });
};
