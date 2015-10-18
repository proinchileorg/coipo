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
  robot.hear /mi secreto (.*)/i, (msg) -> #test local
    secreto = msg.match[1]
    # if msg.message.room == 'Shell' #test local
    #robot.messageRoom '#pudu-devs', msg.random introduccion
    robot.messageRoom '#random  ', "Me contaron este secreto: " + secreto
