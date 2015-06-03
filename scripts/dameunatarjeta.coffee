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
      dom = $.load(body)
      section = dom(dom('section').get(3))

      msg.send "Nº: #{section.find('p.resalta').html()}, CVV2/VCV2: #{dom(section.find('p.centrado em').get(0)).html().split(': ')[1]}, Vence: #{dom(section.find('p.centrado em').get(1)).html().split(': ')[1]}"
