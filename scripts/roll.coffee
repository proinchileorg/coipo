# Description:
#   Responds with a random number from 1 to 6
#
# Dependecies:
#   None
#
# Configuration:
#   None
#
# Commands:
# dice, roll, dado
#
# Author:
#   Narzerus

randomNumber = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

module.exports = (robot) ->
  robot.hear /^dice|^roll|^dado/gi, (res) ->
    res.send ':game_die: Tirando el dado...'
    setTimeout (->
      res.send "Número #{randomNumber(1, 6)}"
    ), 400
