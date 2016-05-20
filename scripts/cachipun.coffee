# Description:
#   Juega cachipún (piedra|papel|tijera) contra tu hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cachipun piedra|papel|tijera
#
# Author:
#   @jorgeepunan

tipos =
  'piedra':
    'papel': 'Papel envuelve piedra. Perdiste, LOSER.'
    'tijera': 'Piedra rompe tijera. Ganaste :wink:'
  'papel':
    'piedra': 'Papel envuelve piedra. Weeeena :wink:'
    'tijera': 'Tijera corta papel. Chuuuuuuu'
  'tijera':
    'papel': 'Tijeras cortan papel. ¡Súper! :wink:'
    'piedra': 'Piedra rompe tijera. ¡Amermelao!'

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

  msg.send ":berrea: escoge #{choice}"
  msg.send resultado

module.exports = (robot) ->
  robot.respond /cachipun (piedra|papel|tijera)/i, (msg) ->
    userChoice = msg.match[1].toLowerCase()
    respuestas(msg, userChoice)
