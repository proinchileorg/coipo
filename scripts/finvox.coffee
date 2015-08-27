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
#   finvox help
#   finvox dolar
#   finvox bitcoin
#   finvox uf
#   finvox euro
#   finvox ipc
#   finvox utm
#
# Author:
#   jorgeepunan

#process.env.API_URL ||= 'http://mindicador.cl/api' # old, slow and shitty
process.env.API_URL ||= 'http://indicadoresdeldia.cl/webservice/indicadores.json'
process.env.BIT_API_URL ||= 'https://blockchain.info/es/ticker'

mensajes = ['Aunque te esfuerces, seguirás siendo pobre. :poop:','Para el gobierno, eres un número más. :monkey: ','La economía seguirá mal para ti pero no para tu AFP. :moneybag:','Algún día saldrás de la clase media. Partiste a jugarte un LOTO. :alien: ','Todos los días suben las cosas, menos tu sueldo. :money_with_wings: ']

module.exports = (robot) ->
  robot.hear /finvox (\w+)/i, (msg) ->
    indicador = msg.match[1].toLowerCase()

    if indicador == 'help'
      msg.send 'Mis comandos son:\n\n * `finvox dolar`\n * `finvox euro`\n * `finvox bitcoin`\n * `finvox uf`\n * `finvox utm`\n * `finvox ipc`\n * `finvox getonbrd`\n'
      return false
    if indicador == 'uf' or indicador == 'dolar' or indicador == 'euro' or indicador == 'ipc' or indicador == 'utm' or indicador == 'getonbrd'
      url = process.env.API_URL
    else if indicador == 'bitcoin'
      url = process.env.BIT_API_URL

    msg.robot.http(url).get() (err, res, body) ->
      res.setEncoding('utf-8')
      data = JSON.parse(body)

      date = data.date

      if indicador == 'uf'
        data = data.indicador.uf
      else if indicador == 'dolar' || indicador == 'usd'
        data = data.moneda.dolar
      else if indicador == 'getonbrd'
        data = data.moneda.dolar * 1130
      else if indicador == 'euro' || indicador == 'eur'
        data = data.moneda.euro
      else if indicador == 'ipc'
        data = data.indicador.ipc + '%'
      else if indicador == 'utm'
        data = data.indicador.utm
      else if indicador == 'bitcoin' || indicador == 'btc'
        data = data.CLP.last

      if data != null and typeof data != 'object'
        data = data.toString().split ',', 1
        msg.send indicador.toUpperCase() + ': ' + data + ' (' + date + ')'
        msg.send msg.random mensajes
      else
        msg.send "Error, intenta nuevamente *zopenco*."

#FIN