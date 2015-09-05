# Description:
#   Te dice en donde chucha venden la gasolina mas barata para que las gatas
#   prendan sus motores.
#   La comuna y distrubuidor son opcionales, pero se recomienda agregar la
#   comuna porque busca en todo chile.
#
# Dependencies:
#   cne
#
# Configuration:
#   None
#
# Commands:
#   @pudu cne help
#   @pudu cne obtener <tipo-de-combustible> [comuna] [distribuidor]
#   @pudu cne listar combustibles
#   @pudu cne listar comunas
#   @pudu cne listar distribudores
#
# Author:
#   @lgaticaq

cne = require "cne"

module.exports = (robot) ->
  help = (msg) ->
    msg.send "pudu cne obtener <combustible> <comuna> <distribuidor>"
    msg.send "pudu cne listar combustibles"
    msg.send "pudu cne listar comunas"
    msg.send "pudu cne listar distribudores"

  getFuelTypes = (msg) ->
    msg.send cne.fuelTypes.join ", "

  getCommunes = (msg) ->
    msg.send cne.communes.join ", "

  getDistributors = (msg) ->
    msg.send cne.distributors.join ", "

  robot.respond /cne help/i, help
  robot.respond /cne listar combustibles/i, getFuelTypes
  robot.respond /cne listar comunas/i, getCommunes
  robot.respond /cne listar distribudores/i, getDistributors

  robot.respond /cne obtener (\w+)( [a-zA-ZñáéíóúñÁÉÍÓÚÑ]+)?( \w+)?/i, (msg) ->
    fuelType = msg.match[1]
    if fuelType not in cne.fuelTypes
      msg.send "En el servicentro no tenemos #{fuelType} ni tampoco criptonita"
      msg.send "Estos son los tipos de combustibles: #{fuelTypes.join(", ")}"
    else
      options =
        fuelType: fuelType
      options.commune = msg.match[2].trim() if msg.match[2]
      options.distributor = msg.match[3].trim() if msg.match[3]
      cne.get(options)
        .then (data) ->
          price = data.precio_por_combustible[fuelType]
          street = data.direccion_calle
          number = data.direccion_numero
          commune = data.nombre_comuna
          dist = data.nombre_distribuidor
          addr = "#{street} #{number} #{commune}"
          msg.send "En #{dist} de #{addr} la venden a $#{price} CLP el litro"
        .fail (err) ->
          msg.send "Entraron a robar el servicentro. Error 500"
