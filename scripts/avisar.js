'use strict';

/**
 *
 * Description:
 *   [description]
 *
 * Dependencies:
 *   hubot-slack
 *
 * Configuartion:
 *   None
 *
 * Commands:
 *   @pudu avisar <message> en <channel1> [, channelN]
 *   @pudu avisar help - Imprime una ayuda la ayuda del comando `avisar`
 *   @pudu avisar -h - alias de `@pudu avisar help`
 *   @pudu avisar ? - alias de `@pudu avisar help`
 *
 * Author:
 *   @eseceve
 *
 */
module.exports = function avisar(robot) {
  var VALIDHELPINPUTS = ['avisar help', 'avisar -h', 'avisar ?'];

  robot.respond(/avisar (help|\-h|\?)/i, help);
  robot.respond(/avisar ([\w\d\s]+) en (#[\w]+,?\s?)+/i, notify);


  /**
   *
   * @jsdoc function
   * @name avisar#notify
   * @description
   *
   * Write a message in each channel
   *
   * @param  {Object} res Robot's response
   *
   */
  function notify(res) {
    var message = res.match[1];
    var channels = getChannels(res.message.text, res.message.room);

    robot.send({room: channels}, message);
  }


  /**
   *
   * @jsdoc function
   * @name avisar#getChannels
   * @description
   *
   * Get the channels from the robot's message
   *
   * @param  {String} message User's input
   * @param  {String=} exclude Channel name to exclude
   * @return {Array} An array of channels names (without #)
   *
   */
  function getChannels(message, exclude) {
    if (exclude) { exclude = exclude.toLowerCase(); }

    return message.substr(message.lastIndexOf(' en ') + 4)
      .match(/[\w]+/ig)
      .filter(function filterChannels(channel) {
        return exclude && channel.toLowerCase() === exclude ? false : channel;
      });
  }


  /**
   *
   * @jsdoc function
   * @name avisar#help
   * @description
   *
   * Write a help for `avisar` command
   *
   * @param  {Object} res Robot's response
   *
   */
  function help(res) {
    if (VALIDHELPINPUTS.indexOf(res.message.text) == -1) { return; }

    var channels = ['#general', 'general', 'Shell'];
    var sended = robot.send({room: channels}, 'test');
    console.log('sended');
    console.log(sended);
    console.log('sended');

    res.send('Esto es bien simple. Solo debes escribirme algo como ' +
      ' `avisar :mensaje en :canales`');
    res.send('  `:mensaje` Lo que quieres avisar');
    res.send('  `:canales` La lista de canales donde quieres avisar. ' +
      'Debe ser algo como `#canal1, #canal2, #canalN`');
  }
};




