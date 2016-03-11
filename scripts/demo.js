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
//   @hubot demo channellist
//   @hubot demo usernames
//   @hubot demo DM to <username|channel|group>
//   @hubot demo new topic <topic>
//   @hubot demo new purpose ≤purpose>
//   @hubot demo API <method> '<params>'
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
    var channel = CLIENT.getChannelGroupOrDMByName(res.message.room);
    var usernames = [];

    if (channel.getType() === 'DM') { return res.send('does not work in DM'); }


    usernames = channel.members.map(function getUserName(userID) {
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
    var channel = _getChannelOrGroup(res.message.room);
    channel.setTopic(res.match[1]);
  }


  function changePurpose(res) {
    var channel = _getChannelOrGroup(res.message.room);
    channel.setPurpose(res.match[1]);
  }


  function apiCall(res) {
    var input = res.match.input;
    var method = res.match[1];
    var params = {};

    if (input.indexOf('`') !== -1) {
      params = JSON.parse(input.slice(input.indexOf('`')).replace(/`/g, '')) || 
        {};
    }

    CLIENT._apiCall(method, params, function(response) {
      res.send("`" + JSON.stringify(response) + "`");
    });
  }


  function _getChannelOrGroup(roomName) {
    return CLIENT.getChannelByName(roomName) ||CLIENT.getGroupByName(roomName);
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




