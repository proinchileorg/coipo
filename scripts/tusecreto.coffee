# Description:
#   Tu secreto queda entre tú y :pudu:
#   Dile un secreto a @Pudu por DM y éste lo anunciará en el canal #random sin mencionarte.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None, it works by itself
#
# Author:
#   jorgeepunan

#introduccion = ["Nuevo secreto: ","Me acaban de contar que ","UH! Alguien me dijo que "]

module.exports = (robot) ->
  robot.respond /mi secreto (.*)/i, (msg) -> #test local
    secreto = msg.match[1]
    notAllowed = secreto.indexOf('@');
    if notAllowed != -1
      robot.messageRoom '#random', "El tonto de #{msg.message.user.name} trató de usar @ :facepalm:"
    else
      robot.messageRoom '#random', ":zipper_mouth_face: *Me contaron* #{secreto}"
