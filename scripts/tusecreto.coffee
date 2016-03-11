# Description:
#   Tu secreto queda entre tú y :huemul:
#   Dile un secreto a @huemul por DM y éste lo anunciará en el canal #random sin mencionarte.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot mi secreto <secreto>
#
# Author:
#   @jorgeepunan

module.exports = (robot) ->
  robot.respond /mi secreto (.*)/i, (msg) -> #test local
    secreto = msg.match[1]
    notAllowed = secreto.indexOf('@');
    if notAllowed != -1
      robot.messageRoom '#random', "El tonto de #{msg.message.user.name} trató de usar @"
    else
      robot.messageRoom '#random', ":speak_no_evil: *Un secreto:* #{secreto}"
