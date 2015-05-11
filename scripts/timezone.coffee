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
require('moment')

module.exports = (robot) ->
  robot.hear /(.*)(que hora|la hora.*)/i, (msg) ->

    Date::format = (format) ->
      o = 
        'M+': @getMonth() + 1
        'd+': @getDate()
        'h+': @getHours()
        'm+': @getMinutes()
        's+': @getSeconds()
        'q+': Math.floor((@getMonth() + 3) / 3)
        'S': @getMilliseconds()
      if /(y+)/.test(format)
        format = format.replace(RegExp.$1, (@getFullYear() + '').substr(4 - (RegExp.$1.length)))
      for k of o
        if new RegExp('(' + k + ')').test(format)
          format = format.replace(RegExp.$1, if RegExp.$1.length == 1 then o[k] else ('00' + o[k]).substr(('' + o[k]).length))
      format

    msg.send "Son las " + (new Date).format('h:mm')

    horaAhora = (new Date).format('h')
    minsAhora = (new Date).format('mm')

    diffHora = 19 - horaAhora
    diffMins = 60 - minsAhora

    if diffHora > 1
      msg.send "Quedan " + diffHora + " horas para ir por una cerveza. Junta sed."
    if diffHora == 1
      msg.send "Quedan " + diffMins + " minutos para ir por una cerveza. Prepara la garganta. :beers: "
    # if diffHora == 0 
    #   msg.send "Quedan " + diffMins + " minutos para ir por una cerveza. Prepara la garganta. :beers: "
     if diffHora < 1
      msg.send "Ya deberías estar tomando una merecida cerveza. ¡Que esperas! :beers: :laughing:"

  robot.hear /(.*)(tarde.*)/i, (msg) ->
    msg.send 'Nunca es tarde para una chelita :smile:'

  robot.hear /(.*)(noche.*)/i, (msg) ->
    msg.send '¿Noche? Tienes una cerveza helada en la mano ¿cierto?'
#FIN