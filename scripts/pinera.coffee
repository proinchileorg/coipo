# Description:
#   Shows a random Piñera image when someone says a keyword. All pictures were taken from tweets of the @YetaReactions account
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   yeta   - Displays a Piñera picture
#   piñera - Displays a Piñera picture
#
# Author:
#   hectorpalmatellez

images = [
  "https://pbs.twimg.com/media/CDUmITXWIAAAg2J.jpg",
  "https://pbs.twimg.com/media/CD9VseXWoAE200w.jpg",
  "https://pbs.twimg.com/media/CD5RcSuW8AA7C_O.jpg",
  "https://pbs.twimg.com/media/CD43SE2W0AA4byw.jpg",
  "https://pbs.twimg.com/media/CDxpnPrWMAEUDO8.png",
  "https://pbs.twimg.com/media/CD4o8uQXIAATNGG.jpg",
  "https://pbs.twimg.com/media/CDrzrglWYAEzwWM.jpg",
  "https://pbs.twimg.com/media/CDf75TDWgAAlsq6.jpg",
  "https://pbs.twimg.com/media/CDeviChW0AEyd-T.jpg",
  "https://pbs.twimg.com/media/CDKbvdpWAAAyG0c.jpg",
  "https://pbs.twimg.com/media/CDJ8beHW4AA9JBY.jpg",
  "https://pbs.twimg.com/media/CDDK8l7XIAEQFKx.jpg",
  "https://pbs.twimg.com/media/CC0DSPaWgAAm7nx.jpg",
  "https://pbs.twimg.com/media/CCv-2sgW4AAYCeW.jpg",
  "https://pbs.twimg.com/media/CCv9IHmW8AATBx_.jpg",
  "https://pbs.twimg.com/media/CCv8K-TWAAAagOp.jpg",
  "https://pbs.twimg.com/media/CCv7IAWWEAEouEh.jpg",
  "https://pbs.twimg.com/media/CCrDYg0WAAATx3F.jpg",
  "https://pbs.twimg.com/media/CClnArAWYAEiC3s.jpg",
  "https://pbs.twimg.com/media/CClVvQ5W4AE2tPZ.png",
  "https://pbs.twimg.com/media/CCgOS3aWMAAlY1c.jpg"
]

module.exports = (robot) ->
  robot.hear /piñera|yeta/gi, (msg) ->
    msg.send msg.random images