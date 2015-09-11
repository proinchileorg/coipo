# Description:
#   pudu yapo/nopo
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   (yapo|nopo)
#   
#
# Author:
#   jorgeepunan

respuestas = ['yapo','nopo']

module.exports = (robot) ->
  robot.hear /(yapo)/gi, (msg) ->
    msg.send respuestas[1]
  robot.hear /(nopo)/gi, (msg) ->
    msg.send respuestas[0]
  robot.hear /(sipo)/gi, (msg) ->
    msg.send msg.random respuestas