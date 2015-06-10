# Description:
#   pudú sugiere algo para comer
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @pudu qu[ée] almorzar|comer|cenar
#
# Author:
#   jorgeepunan

comidas = ["pescado","árabe/thai/india","pastas","sushi","china","sandwich","empanada","ensalada","pizza","chatarra","ceviche","carne/parrilla"]

module.exports = (robot) ->
  robot.respond /qu[ée] almorzar|comer|cenar/gi, (msg) ->
    msg.send "Te sugiero: " + msg.random comidas