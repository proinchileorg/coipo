// Description:
//   TODO
//
// Dependencies:
//   moment-business-days
//
// Configuration:
//   None
//
// Commands:
//   @pudu gardel
//
// Author:
//   hectorpalmatellez

var moment = require('moment-business-days');

module.exports = function gardel(robot) {
  'use strict';

  var today = moment().format('D');
  var lastBusinessDay = moment().endOf('month').isBusinessDay() ? moment().endOf('month').format('D') : moment().endOf('month').prevBusinessDay().format('D');
  var dayCount = lastBusinessDay - today;

  robot.respond(/(gardel)/, function(msg) {
    return msg.send('Faltan ' + dayCount + ' días para que paguen.');
  });
};
