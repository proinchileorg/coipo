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

ascii = ["\n
(҂._.)\n
<,╤╦╤─ ҉ - - - - :pudu:\n
/--\'\n
",
"\n
━━━━━┓ ＼＼\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃    |:pudu:ノ ~ chaoooooo\n
┓┓┓┓┓┃ 　 /\n
┓┓┓┓┓┃  ノ)\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃\n
",
"
:bomb: :bomb: :bomb:\n
:bomb: :pudu: :bomb: :fire: ~ adiós mundo cruel\n
:bomb: :bomb: :bomb:\n
",
"\n
 _____\n
|         |\n
|        :pudu:\n
|        /|\n
|        / |\n
|
|________\n

",
"\n
   ________________\n
  |                                |\n
  |  PÚDRANSE   |\n
  |________________|\n
 ∧＿_∧  ||\n
(　´o`) ||\n
/ 　　づ”.\n
"
]

module.exports = (robot) ->
  robot.respond /ql|rql|ctm|m[áa]tate/gi, (msg) ->
    msg.send msg.random ascii
