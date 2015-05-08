# Description:
#   Cuanto falta pa salir a tomar cerveza
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   `que hora`
#   `la hora`
#
# Author:
#   jorgeepunan

module.exports = (robot) ->
  robot.hear /(.*)(que hora|la hora.*)/i, (msg) ->
    horaAhora = new Date().getHours()
    # if horaAhora.length = 1
    #   horaAhora = '0' + horaAhora
    minsAhora = new Date().getMinutes()
    if minsAhora.length = 1
      minsAhora = '0' + minsAhora

    msg.send "Son las " + horaAhora + ":" + minsAhora

    diffHora = 19 - horaAhora
    diffMins = 60 - minsAhora

    if diffHora > 1
      msg.send "Quedan " + diffHora + " horas para ir por una cerveza. Junta sed."
    if diffHora == 1
      msg.send "Queda " + diffHora + " hora para ir por una cerveza. Queda poco, aguanta. :beer: "
    if diffHora == 0 
      msg.send "Quedan " + diffMins + " minutos para ir por una cerveza. Prepara la garganta. :beers: "
     if diffHora < 1
      msg.send "Ya deberías estar tomando una merecida cerveza. ¡Que esperas! :beers: :laughing:"

#FIN