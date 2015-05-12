# Description:
#   Entrega una tarjeta de crédito autogenerada
#
# Dependencies:
#   cheerio
#
# Configuration:
#   None
#
# Commands:
#   `dame una visa`
#   `dame una mastercard`
#   `dame una american express`
#   `dame una discover`
#
# Author:
#   victorsanmartin

$ = require('cheerio')

module.exports = (robot) ->
  robot.hear /dame una ([visa|mastercard|discover|american express]+)/i, (msg) ->

    quequiere = msg.match[1].toLowerCase()

    if quequiere == 'visa'
      url = 'http://generatarjetasdecredito.com/generador-tarjetas-visa.php'
    else if quequiere == 'american express'
      url = 'http://generatarjetasdecredito.com/generador-tarjetas-american-express.php'
    else if quequiere == 'discover'
      url = 'http://generatarjetasdecredito.com/generador-tarjetas-discover.php'
    else if quequiere == 'mastercard'
      url = 'http://generatarjetasdecredito.com/generador-tarjetas-mastercard.php'
    else
      return false

    msg.robot.http(url).get() (err, res, body) ->
      dom = $.load(body);
      msg.send "Nº: #{dom('p#text8').html()}, CCV2:#{dom('p#text9 span#textspan').html()}, Vence: #{dom('p#text10 span#textspan1').html()}"
