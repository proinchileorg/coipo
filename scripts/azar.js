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
//   azar <algo1>,<algo2>,<algoN>,
//
// Author:
//   @jorgeepunan



function rand(items){
  return items[~~(Math.random() * items.length)];
}

module.exports = function(robot) {
  robot.hear(/azar (.*)/i, function(res) {
    var items = res.match[1].trim().split(",");
    msg = "Uno al azar: `" + rand(items) + "` :ok_hand:";
    res.send(msg);
  });
};
