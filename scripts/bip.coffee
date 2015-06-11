# Description:
#   muestra saldo tarjeta BIP! ázì nòmá
#
# Dependencies:
#   API prestada de alguien más q no lo sabe (aún)
#
# Configuration:
#   None
#
# Commands:
#   @pudu bip <numero>
#
# Author:
#   @jorgeepunan

module.exports = (robot) ->
  robot.respond /bip (\w+)/i, (msg) ->
    indicador = msg.match[1]
    msg.send 'La consulta va en la micro... espere harto... :clock5:'

    if isNaN(indicador)
      msg.send 'El identificador de tu BIP! son sólo números.'
      msg.send 'No sea leso, no se crea hacker. máZnáátèdííghó óèzíí'
    else
      url = 'http://www.psep.cl/api/Bip.php?&numberBip=' + indicador

      msg.http(url).get() (err, res, body) ->
        if err
          msg.send 'Algo pasó, intente nuevamente.'
        if body.indexOf('<') > -1
          msg.send 'Error, intente con otro número.'
        else
          res.setEncoding('utf-8')
          data = JSON.parse(body)
          if data
            for prop of data
              msg.send prop + ' => ' + data[prop]
          else
            msg.send 'Error!'

#FIN