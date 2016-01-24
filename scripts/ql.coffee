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
(҂._.)\n
<,╤╦╤─ ҉ - - - - :pudu:\n
/--\'\n
``",
"``
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
:bomb: :bomb: :bomb:\n
:bomb: :pudu: :bomb: :fire: ~ adiós mundo cruel\n
:bomb: :bomb: :bomb:\n
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
```"
]

module.exports = (robot) ->
  robot.respond /ql|rql|ctm|m[áa]tate/gi, (msg) ->
    msg.send msg.random ascii
