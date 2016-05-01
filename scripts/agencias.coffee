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
#   hubot agencias add <url> -> Add new gif to agencias
#
# Author:
#   @jorgeepunan

images = [
  'http://i.imgur.com/IW6O268.gif'
  'http://data.whicdn.com/images/66984539/large.gif'
  'http://stream1.gifsoup.com/view6/4649173/disaster-movie-chipmunk-rabies-o.gif'
  'https://media.giphy.com/media/x13saNuWqUPPW/giphy.gif'
  'http://i.imgur.com/PimcI7P.gif'
  'http://i.imgur.com/f6iwaCk.gif'
  'http://i.imgur.com/b1YkaV3.gif'
  'http://31.media.tumblr.com/f08f0922da3d090269f5b90c7cea6cbb/tumblr_inline_o4d5eeZRfB1raprkq_500.gif'
  'https://i.imgur.com/czGiyVX.gif'
  'http://www.gifbin.com/bin/022013/1361304798_dominoes_launch_fail.gif'
  'https://media.giphy.com/media/d71sJZ0RQAPOo/giphy.gif'
  'http://www.gif-king.com/files/uSers/gif-king-e60d7560ccdde09ca0bee3ec54807731.gif'
  'https://i.uploadly.com/2x4tok3k.gif'
]

module.exports = (robot) ->
  robot.hear /#agencia|#agencias (.*)/gi, (msg) ->
    msg.send 'agencias... :point_down::skin-tone-4:'
    agencias = robot.brain.get("agencias")
    agencias = "[]" if agencias is null
    agencias = JSON.parse(agencias)
    agencias = agencias.concat(images)
    msg.send(msg.random(agencias))

  robot.respond /agencias add ((https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?)/, (res) ->
    uri = res.match[1]
    agencias = robot.brain.get("agencias")
    agencias = "[]" if agencias is null
    agencias = JSON.parse(agencias)
    agencias.push(uri)
    robot.brain.set("agencias", JSON.stringify(agencias))
    res.send("New image saved :ok_hand:")
