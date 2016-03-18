# Description:
#   Saluda cuando hay gente nueva
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   @jorgeepunan

module.exports = (robot) ->
  robot.enter (msg) ->
  # robot.hear /hola/i, (msg) -> #test local
  if msg.message.room == 'anuncios'
    robot.emit 'slack.attachment', {channel: msg.message.user.name, text: """
      ¡Hola, *<@#{msg.message.user.name}>*! :wave:

      Soy <@#{robot.name}> :robot: y te doy la bienvenida a *DevsChile*, la comunidad chilena de desarrolladores web.
      Entre los canales que te pueden interesar están: <#C0R6E10LC|frontend>, <#C0R7P17AQ|backend>, <#C0R6AM4DP|pegas>, y otros que puedes seleccionar a tu izquierda :point_left:.
      Si lo deseas, te puedes presentar en <#C0R6E19QS|random> y te daremos la bienvenida como corresponde.
      Recuerda leer nuestro <http://www.devschile.cl/coc/|Código de Conducta>. Cualquier duda o consulta sobre el CdC o el Slack puedes hacerla en <#C0TFU7ZJA|comunidad>.

      Esperamos tu participación, saludos!"""};
