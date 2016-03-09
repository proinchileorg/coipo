# Description:
#   Saluda cuando hay gente nueva en #general
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

module.exports = (robot) ->
  robot.enter (msg) ->
  # robot.hear /hola/i, (msg) -> #test local
    # if msg.message.room == 'Shell' #test local
    if msg.message.room == 'general'
      msg.send "¡Hola, *@#{msg.message.user.name}*! Bienvenido a *#{msg.message.room}* :clap:"
      msg.send "Soy @huemul :robot: y te doy la bienvenida a *DevsChile*. Esperamos puedas compartir y aportar en cualquiera de los canales creados para temas de variados intereses."
