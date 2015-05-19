# Description:
#   Entrega la url a unn sitio para perder el tiempo
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#   uselessweb - Returns a random useless web URL.
#
# Author:
#   victorsanmartin

module.exports = (robot) ->
  robot.respond /uselessweb/i, (msg) ->
    msg
      .http("https://gist.githubusercontent.com/quest/07bbc6908f84b50a9fc8/raw/915d538ae98e34a1038f31da54552749fb9d6953/uselessweb.json")
      .get() (err, res, body) ->
        site = JSON.parse(body)
        if site.uselessweb?
          msg.send msg.random site.uselessweb
        else
          msg.send "Sorry, no hay sitios por hoy"
