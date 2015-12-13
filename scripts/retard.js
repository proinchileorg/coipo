// Description:
//   :retard:
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   `pruebapruebaprueba`
//
// Author:
//   LasagnaAndroid

module.exports = function(robot) {
  return robot.hear(/pruebapruebaprueba/gi, function(msg) {
    msg.http("https://slack.com/api/reactions.add")
    .query({
      token: process.env.HUBOT_SLACK_TOKEN,
      name: 'retard',
      channel: msg.message.rawMessage.channel,
      timestamp: msg.message.id
    })
    .get()(function(err, resp, body) {
      robot.emit('error', err, resp, msg, body);
    });
  });
};
