# Description:
#   Cachipún con :pudu:
#
# Dependencies:
#   None
#
# Configuration:
#   none
#
# Commands:
#   pudu cachipun piedra|papel|tijera
#
# Author:
#   jorgeepunan

tipos =
  'piedra':
    'papel': 'papel envuelve piedra. Perdiste LOOSER.'
    'tijera': 'piedra rompe tijera. Ganaste :wink:'
  'papel':
    'piedra': 'papel envuelve piedra. Weeeena :wink:'
    'tijera': 'tijera corta papel. Chuuuuuuu'
  'tijera':
    'papel': 'tijeras cortan papel. Super! :wink:'
    'piedra': 'piedra rompe tijera. Amarmelao!'

respuestas = (msg, userChoice) ->
  choices = ['piedra','papel','tijera']
  i = Math.floor(Math.random() * 3)
  choice = choices[i]

  seleccion = tipos[userChoice]

  if seleccion[choice]? # user wins
    resultado = tipos[userChoice][choice]
  else # hubot wins
    resultado = tipos[choice][userChoice]

  resultado = "¡Empate!" if not resultado

  msg.send ":pudu: escoje #{choice}"
  msg.send resultado

module.exports = (robot) ->
  # robot.respond /cachipun/i, (msg) ->
  robot.respond /cachipun (piedra|papel|tijera)/i, (msg) ->
    userChoice = msg.match[1].toLowerCase()
    respuestas(msg, userChoice)
