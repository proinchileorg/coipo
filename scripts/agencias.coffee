# Description:
#   muestra un gif relacionado con la asombrosa experiencia de trabajar en agencia
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   #agencia|#agencias
#
# Author:
#   jorgeepunan

images = [
  'http://i.imgur.com/IW6O268.gif'
  'http://i.imgur.com/h874JeX.gifv'
  'http://i.imgur.com/xcHlIXi.gif'
  'http://i.imgur.com/UXTJJGU.gif'
  'http://i.imgur.com/PimcI7P.gif'
  'http://i.imgur.com/bmnELrT.gif'
  'http://i.imgur.com/f6iwaCk.gif'
  'http://i.imgur.com/qiTwF5H.gif'
  'http://i.imgur.com/2nJL8yz.gif'
  'http://i.imgur.com/wJ7xZZI.gif'
  'http://i.imgur.com/Z1w5IKP.gif'
  'http://i.imgur.com/3S9ksPo.gif'
  'http://i.imgur.com/b1YkaV3.gif'
]

module.exports = (robot) ->
  robot.hear /#agencia|#agencias (.*)/gi, (msg) ->
    msg.send 'agencias... :point_down::skin-tone-4:'
    msg.send msg.random images