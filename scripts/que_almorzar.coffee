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
#   @pudu qu[ée] desayunar|almorzar|cenar
#
# Author:
#   jorgeepunan

desayuno = ["cereal","sandwich","frutas","desayuno dominó","quesillo + marmelada","huevos","lo mismo que ayer"]
almuerzo = ["pescado","árabe/thai/india","pastas","sushi","china","sandwich","empanada","ensalada","pizza","chatarra","ceviche","carne/parrilla","lo mismo que ayer"]
cena = ["carne","pastas","chatarra","pizza","sanguchón","lo mismo que ayer"]

module.exports = (robot) ->
  robot.respond /qu[ée] desayunar/gi, (msg) ->
    msg.send ":pudu: Te sugiero: " + msg.random desayuno

  robot.respond /qu[ée] almorzar/gi, (msg) ->
    msg.send ":pudu: Te sugiero: " + msg.random almuerzo

  robot.respond /qu[ée] cenar/gi, (msg) ->
    msg.send ":pudu: Te sugiero: " + msg.random cena

  robot.respond /qu[ée] comer/gi, (msg) ->
    msg.send ":pudu: Depende de la comida para: *desayunar*, *almorzar* ó *cenar*. Pregúntame de nuevo."