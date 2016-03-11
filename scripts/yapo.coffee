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
#   hubot yapo|nopo|sipo
#
# Author:
#   @jorgeepunan

respuestas = ['yapo','nopo','kepo']

module.exports = (robot) ->
  robot.respond /(yapo)/gi, (msg) ->
    msg.send respuestas[1]
  robot.respond /(nopo)/gi, (msg) ->
    msg.send respuestas[0]
  robot.respond /(sipo)/gi, (msg) ->
    msg.send respuestas[2]
