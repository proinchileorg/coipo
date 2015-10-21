# Description:
#   Imprime una url a un gif de table flipping
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot flipper
#
# Author:
#   @hectorpalmatellez

module.exports = (robot) ->
  robot.respond /flip/i, (msg) ->

    url = 'http://tableflipper.com/json'

    msg.robot.http(url).get() (err, res, body) ->
      data = JSON.parse(body)
      msg.send data.gif
