// Description:
//   [description]
//
// Dependencies:
//   hubot-slack
//
// Configuartion:
//   None
//
// Commands:
//   @pudu demo channellist
//   @pudu demo usernames
//   @pudu demo DM to <username|channel|group>
//   @pudu demo new topic <topic>
//   @pudu demo new purpose ≤purpose>
//   @pudu demo API <method> '<params>'
//
// Author:
//   @eseceve


module.exports = function scrum(ROBOT) {
  var ROBOTNAME = ROBOT.name;
  var CLIENT = ROBOT.adapter.client; // https://github.com/slackhq/node-slack-client

  ROBOT.respond(/demo channellist/i, getChannelList);
  ROBOT.respond(/demo usernames/i, getUsernames);
  ROBOT.respond(/demo DM to (@[\w]+)/i, sendDM);
  ROBOT.respond(/demo new topic ([\w\d\s]+)/i, changeTopic);
  ROBOT.respond(/demo new purpose ([\w\d\s]+)/i, changePurpose);
  ROBOT.respond(
    /demo API ([\w\.]+)(\s*)(`\{("[\w\d\s\._-]+":"[\w\d\s\._-]+"(,*))+\}`)*/i,
    apiCall
  );


  function getUsernames(res) {
    var channel = CLIENT.getChannelByName(res.message.room);
    var usernames = channel.members.map(function getUserName(userID) {
      var user = CLIENT.getUserByID(userID);
      return user.real_name || user.name;
    });
    res.send('usernames: ' + usernames.join(', '));
  }


  function getChannelList(res) {
    var channels = Object.keys(CLIENT.channels)
      .map(function getChannelName(channelID) {
        return CLIENT.getChannelByID(channelID).name;
      });
    res.send('channellist: ' + channels.join(', '));
  }


  function sendDM(res) {
    var user = CLIENT.getUserByName(res.match[1].slice(1));
    if (user) {
      ROBOT.send({room: user.name}, 'A demo message');
    } else {
      res.send('user does not exists');
    }
  }


  function changeTopic(res) {
    var channel = CLIENT.getChannelByName(res.message.room);
    channel.setTopic(res.match[1]);
  }


  function changePurpose(res) {
    var channel = CLIENT.getChannelByName(res.message.room);
    channel.setPurpose(res.match[1]);
  }


  function apiCall(res) {
    var channel = CLIENT.getChannelByName(res.message.room);

    var method = res.match[1];
    var params = {};

    var input = res.match.input;

    if (input.indexOf('`') !== -1) {
      params = JSON.parse(
          input.slice(input.indexOf('`'))
          .replace(/`/g, '')
        ) || {};
    }

    CLIENT._apiCall(method, params, function(response) {
      res.send("`" + JSON.stringify(response) + "`");
    });
  }


  function _fetchHistory(channel, params, done) {
    var type = channel.getType();
    var method = 'channels.history';

    if (type === 'Group') method = 'groups.history';
    if (type === 'DM') method = 'im.history';

    params.channel = channel.id;

    CLIENT._apiCall(method, params, done);
  }
};




