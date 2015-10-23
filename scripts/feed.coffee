#
# Description:
#   Feeds pudu when it deserves it or when he's starving.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   pudu <toma|come|alimentate|traga|engulle> <food|emoji>
#
# Author:
#   Ravenous <hello@ravenous.io>

hungry = ['Ahhh! Un manjarsh!','Gracias! Me moría de hambre','Ñam ñam ñam~ :yum:', 'Por fin alguien se digna a alimentarme! :clap:']
satisfied = ['No puedo más, mi barriga va a explotar!','No gracias, ya estoy llenito! :relaxed:','¿Me estás haciendo engordar? :anguished:']
taste = ['¿Cómo se te ocurre que comeré eso? :triumph:','¿Mamá? ¡¿Eres tú?! :cry:','Deberías buscar hervíboro en Google :unamused:']
blacklist = ['pudu','carne','pollo','caca',':meat_on_bone:',':pultry_leg:',':egg:',':hamburger:']

module.exports = (robot) ->
  robot.respond /(?:toma|come|alimentate|traga|engulle)\s(\w+)/i, (res) ->
    food = res.match[1]
    foodHad = robot.brain.get('totalFood') * 1 or 0
    if food not in blacklist
      if foodHad > 3
        res.send res.random satisfied
      else
        res.send res.random hungry
        robot.brain.set 'totalFood', foodHad+1
    else
      res.send res.random taste
      
