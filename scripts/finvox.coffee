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
#   finvox uf
#   finvox euro
#   finvox ipc
#   finvox utm
#
# Author:
#   jorgeepunan

process.env.API_URL ||= 'http://mindicador.cl/api/'
mensajes = ['Recuerda que sigues siendo pobre. :poop:','Eres un número más. :monkey: ','La economía seguirá mal para ti. :moneybag:','Algún día saldrás de la clase media. :alien: ','Todos los días suben las cosas, menos tu sueldo. :money_with_wings: ']

module.exports = (robot) ->
  robot.hear /finvox (\w+)/i, (msg) ->
    indicador = msg.match[1].toLowerCase()
    url = process.env.API_URL
    msg.robot.http('http://mindicador.cl/api').get() (err, res, body) ->
      res.setEncoding('utf-8')
      data = JSON.parse(body)

      if indicador == 'help'
        msg.send 'Hola soy finvox y mis comandos son:\n\n * `finvox dolar`\n * `finvox euro`\n * `finvox uf`\n * `finvox utm`\n * `finvox ipc`\n'
        return false
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
        msg.send 'El ' + indicador.toUpperCase() + ' actual está a CLP$' + data + '.'
        msg.send msg.random mensajes
      else
        msg.send "Error, intenta nuevamente *zopenco*."

#FIN