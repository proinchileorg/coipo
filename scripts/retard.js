/* Description:
    :retard:

  Dependencies:
    None

  Configuration:
    None

  Commands:
    retard|retardao

  Author:
    LasagnaAndroid
*/

module.exports = function(robot) {
  return robot.hear(/retard|retardao/gi, function(msg) {
    console.log(HUBOT_SLACK_TOKEN)
    msg.http("https://slack.com/api/reactions.add")
    .query({
      token: process.env.SLACK_API_TOKEN,
      name: retard,
      channel: msg.message.rawMessage.channel
    });
  });
};
