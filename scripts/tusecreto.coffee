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
forbidden = 'channel'

module.exports = (robot) ->
  robot.hear /mi secreto (.*)/i, (msg) -> #test local
    secreto = msg.match[1]

    if secreto.indexOf(forbidden) >= 0
      robot.messageRoom '#random', 'un tonto trató de hacer `channel` :facepalm:'
    else
      robot.messageRoom '#random', "Me contaron este secreto: " + secreto