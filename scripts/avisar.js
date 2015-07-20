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
//   @pudu avisar <message> en <room1>, <roomN>
//   @pudu avisar help - Imprime una ayuda la ayuda del comando `avisar`
//   @pudu avisar -h - alias de `@pudu avisar help`
//   @pudu avisar ? - alias de `@pudu avisar help`
//
// Author:
//   @eseceve


module.exports = function avisar(robot) {
  var VALIDHELPINPUTS = ['avisar help', 'avisar -h', 'avisar ?'];

  robot.respond(/avisar (help|\-h|\?)/i, help);
  robot.respond(/avisar ([\w\d\s]+) en (([#|@][\w]+,?\s?)+)/i, notify);


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
    var rooms = getRooms(res.match[2], res.message.room);

    robot.send({room: rooms}, message);
  }


  /**
   *
   * @jsdoc function
   * @name avisar#getRooms
   * @description
   *
   * Get the rooms from the robot's message
   *
   * @param  {String} message User's input
   * @param  {String=} exclude room name to exclude
   * @return {Array} An array of room names
   *
   */
  function getRooms(message, exclude) {
    if (exclude) { exclude = exclude.toLowerCase(); }

    return message.match(/(#|@)[\w]+/ig)
      .filter(function filterRooms(room) {
        return exclude && room.toLowerCase() === exclude ? false : room;
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

    res.send('Esto es bien simple. Solo debes escribirme algo como ' +
      ' `avisar :mensaje en :rooms`');
    res.send('  `:mensaje` Lo que quieres avisar');
    res.send('  `:rooms` La lista de canales/usuarios donde quieres avisar. ' +
      'Debe ser algo como `#canal1, @user1, #canalN, @userN`');
  }
};




