# Description:
#   Indica si el auto asociado a la patente indicada ha sido rematado
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot `ZN1616` fue rematado?
#   hubot `ZN1616` ha sido rematado?
#
# Author:
#   victorsanmartin

$ = require('cheerio')

module.exports = (robot) ->
  robot.hear /([A-Za-z]{2,4}[0-9]{2,4}) (fue|ha sido) rematado\?/i, (msg) ->

    patente = msg.match[1].toLowerCase()
    url = 'http://especial.t13.cl/consulta-patente/index.php?patent=' + patente

    msg.robot.http(url).get() (err, res, body) ->
      data = JSON.parse(body)
      if (data.Patente == 'No Encontrado')
        msg.send "El :car: no ha sido rematado."
      else
        msg.send "Si, el :car: #{data.Marca} #{data.Modelo} fue rematado el #{data.FechaRemate}."
