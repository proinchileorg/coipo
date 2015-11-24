# Description:
#   Saluda cuando hay genre nueva en #general
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None, it works by itself
#
# Author:
#   jorgeepunan

enterReplies = ['𝑘𝔦𝔲𝔟𝔬𝔰','ĤŐĹĨ','ＯＬＡＫＥＡＳＥ','∀ΓOH∀']

module.exports = (robot) ->
  robot.enter (msg) ->
  # robot.hear /hola/i, (msg) -> #test local
    # if msg.message.room == 'Shell' #test local
    if msg.message.room == 'general'
      msg.send msg.random enterReplies
      msg.send "*@#{msg.message.user.name}* bienvenido a *#{msg.message.room}* :clap:"
      msg.send "Soy @pudu amo y cuidador de este grupo. Sírvase presentarte en #introductions y unirte a las discusiones de alguno de los canales de tu interés."
