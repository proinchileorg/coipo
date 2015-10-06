# Description:
#   Entrega una clave autogenerada
#
# Dependencies:
#   cheerio
#
# Configuration:
#   None
#
# Commands:
#   `hubot dame una clave`
#   `hubot dame una password`
#   `hubot dame una contraseña`
#
# Author:
#   victorsanmartin

generatePassword = require('password-generator')

module.exports = (robot) ->
  robot.hear /dame una (clave|password|contraseña)( [0-9]{1,2})?/i, (msg) ->

    length = 10
    if msg.match[2]
      length = parseInt(msg.match[2], 10)

    password = generatePassword(length, false)

    msg.send ":passport_control: Clave `#{password}`"
