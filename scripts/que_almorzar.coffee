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

desayuno 	= ["cereal","sandwich","frutas","desayuno dominó","quesillo + marmelada","huevos","lo mismo que ayer"]
almuerzo 	= ["pescado","árabe/thai/india","pastas","sushi","china","sandwich","empanada","ensalada","pizza","chatarra","ceviche","carne/parrilla","lo mismo que ayer"]
cena 		= ["carne","pastas","árabe/thai/india","pizza","sanguche","lo mismo que ayer","lasagna","china"]
bebidas		= ['cerveza','agüita de hierba','piscola/roncola/whiscola','absenta','pájaro verde','vino tinto/blanco','lo mismo que ayer nomás']
cervezas	= ['pale ale inglesa','brown ale inglesa','barley wine','scottish ale','ale belga','trapense belga','de abadía belga','pilsner alemana/checa','dunkel alemana/checa','marzenbier alemana','bock/doppelbock/maibock','weizenbier alemana','porter/stout','su escudo nomás']

module.exports = (robot) ->
  robot.respond /qu[ée] desayunar/gi, (msg) ->
    msg.send ":pudu: Te sugiero: " + msg.random desayuno

  robot.respond /qu[ée] almorzar/gi, (msg) ->
    msg.send ":pudu: Te sugiero: " + msg.random almuerzo

  robot.respond /qu[ée] cenar/gi, (msg) ->
    msg.send ":pudu: Para el *anvre*: " + msg.random cena

  robot.respond /qu[ée] tomar/gi, (msg) ->
    msg.send ":pudu: Si tienes sed: " + msg.random bebidas

  robot.respond /qu[ée] cerveza tomar/gi, (msg) ->
    msg.send ":pudu: Si tienes sed: " + msg.random cervezas

  robot.respond /qu[ée] comer/gi, (msg) ->
    msg.send ":pudu: Depende de la comida para: *desayunar*, *almorzar* ó *cenar*. Pregúntame de nuevo."