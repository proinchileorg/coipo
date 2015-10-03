# Description:
#   Entrega una clave autogenerada
#
# Dependencies:
#   cheerio
#
# Configuration:
#   None
#
# Commands:
#   `hubot dame una clave`
#   `hubot dame una password`
#   `hubot dame una contraseña`
#
# Author:
#   victorsanmartin

$ = require('cheerio')

module.exports = (robot) ->
  robot.hear /dame una (clave|password|contraseña)/i, (msg) ->

    url = 'http://www.datafakegenerator.com/genepas.php'

    msg.robot.http(url).get() (err, res, body) ->
      dom = $.load(body)
      section = dom(dom('section').get(1))

      msg.send "Clave: #{section.find('p.resalta').html().replace(/&amp;/g, '&')}"
