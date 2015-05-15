# Description:
#   pudu commits suicide if offended
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   pudu ql
#   pudu matate
#
# Author:
#   jorgeepunan

ascii = "``\n
━━━━━┓ ＼＼\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃    |😫ノ ~ chaoooooo\n
┓┓┓┓┓┃ 　 /\n
┓┓┓┓┓┃  ノ)\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃\n
``"

module.exports = (robot) ->
  robot.hear /pud[úu] ql|m[áa]tate/gi, (msg) ->
    msg.send ascii