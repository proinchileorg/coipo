// Description:
//   :retard:
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Notes:
//   hear retard
//
// Author:
//   @lasagnaAndroid

module.exports = function(robot) {
  return robot.hear(/retard|retardao|:retard:|:retardao:/gi, function(msg) {
    msg.http("https://slack.com/api/reactions.add")
    .query({
      token: process.env.HUBOT_SLACK_TOKEN,
      name: 'retard',
      channel: msg.message.rawMessage.channel,
      timestamp: msg.message.id
    })
    .get(function(err, resp, body) {
      robot.emit('error', err, resp, msg, body);
    });
  });
};
