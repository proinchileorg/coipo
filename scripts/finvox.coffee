# Description:
#   Obtiene indicadores económicos para Chile
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   finvox dolar
#   finvox uf
#   finvox euro
#   finvox ipc
#   finvox utm
#
# Author:
#   jorgeepunan

process.env.API_URL ||= 'http://mindicador.cl/api/'

module.exports = (robot) ->
  robot.hear /finvox (\w+)/i, (msg) ->
    indicador = msg.match[1].toLowerCase()
    url = process.env.API_URL
    msg.robot.http('http://mindicador.cl/api').get() (err, res, body) ->
      res.setEncoding('utf-8')
      data = JSON.parse(body)

      if indicador == 'uf'
        data = data.uf.valor
      else if indicador == 'dolar'
        data = data.dolar.valor
      else if indicador == 'euro'
        data = data.euro.valor
      else if indicador == 'ipc'
        data = data.ipc.valor
      else if indicador == 'utm'
        data = data.utm.valor

      if data != null and typeof data != 'object'
        msg.send indicador.toUpperCase() + " actual: $" + data + " pesos."
      else
        msg.send "Error, intenta nuevamente *zopenco*."

#FIN