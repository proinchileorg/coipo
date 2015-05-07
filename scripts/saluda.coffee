# Description:
#   Greets when someone enters a room
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

enterReplies = ['Holi', 'Bienvenido', 'OLAKEASE', 'Kiubos', '¡ALOHAAA!']

module.exports = (robot) ->
  robot.enter (res) ->
    res.send res.random enterReplies