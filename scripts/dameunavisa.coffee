# Description:
#   Entrega una visa autogenerada
#
# Dependencies:
#   cheerio
#
# Configuration:
#   None
#
# Commands:
#   `dame una visa`
#
# Author:
#   victorsanmartin

$ = require('cheerio')

module.exports = (robot) ->
  robot.hear /dame una visa/i, (msg) ->

    url = 'http://generatarjetasdecredito.com/generador-tarjetas-visa.php'

    msg.robot.http(url).get() (err, res, body) ->
      dom = $.load(body);
      msg.send "Nº: #{dom('p#text8').html()}, CCV2:#{dom('p#text9 span#textspan').html()}, Vence: #{dom('p#text10 span#textspan1').html()}"
