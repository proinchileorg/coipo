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

enterReplies = ['𝑘𝔦𝔲𝔟𝔬𝔰','ĤŐĹĨ','ＯＬＡＫＥＡＳＥ','∀ΓOH∀']

module.exports = (robot) ->
  #robot.enter (msg) ->
  robot.hear /hola/i, (msg) -> 
    msg.send msg.random enterReplies
    msg.send "Bienvenido a *#{msg.message.room}*"