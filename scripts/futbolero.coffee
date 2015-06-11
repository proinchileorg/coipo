# Description:
#   Dice una frase futbolera al azar
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#   hubot <frase futbolera> - Retorna una frase de algun personaje relacione al fúbtol chileno al azar
#
# Author:
#   victorsanmartin

module.exports = (robot) ->
  robot.respond /frase futbolera/i, (msg) ->
    msg
      .http("https://gist.githubusercontent.com/quest/21f5ee3a78b4422baf5f/raw/2c869633eff63c537582d451caff1066c79398e3/frases-futbol-chileno.json")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        if json.phrases?
          phrase = msg.random json.phrases
          msg.send "\"#{phrase.text}\" - _#{phrase.author}_"
        else
          msg.send "Sorry, an error occurred"
