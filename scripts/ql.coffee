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

ascii = ["``
\n
━━━━━┓ ＼＼\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃    |:pudu:ノ ~ chaoooooo\n
┓┓┓┓┓┃ 　 /\n
┓┓┓┓┓┃  ノ)\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃\n
``",
"```
\n
    ______\n
  //       |\n
 ||  ✝     |\n
 || QEPD   |\n
 || pudu   |\n
 ||        |\n
 ||/ / // |/\n
\n
```",
"
:bomb: :pudu: :gun: ~ adiós mundo cruel
",
"``
\n
 _____\n
|     |\n
|     :pudu:\n
|    /|\n
|    / |\n
|
|________\n

``",
"```\n
   ____________\n
  |            |\n
  |  PÚDRANSE  |\n
  |____________|\n
 ∧＿_∧  ||\n
(　´o`) ||\n
/ 　　づ”.\n
=======
```"
]

module.exports = (robot) ->
  robot.respond /ql|rql|ctm|m[áa]tate/gi, (msg) ->
    msg.send msg.random ascii
