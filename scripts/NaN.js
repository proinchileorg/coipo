// Description:
//   NaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaNNaN Batman!
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   hear 'NaN'
//
// Author:
//   @jorgeepunan



function batman(){
  return Array(16).join('wat' - 1) + " Batman! ~ :pudu:";
}

module.exports = function(robot) {
  robot.hear(/NaN/, function(res) {
    msg = batman();
    res.send(msg);
  });
};
