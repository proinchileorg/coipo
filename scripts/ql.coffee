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
┓┓┓┓┓┃    |😫ノ ~ chaoooooo\n
┓┓┓┓┓┃ 　 /\n
┓┓┓┓┓┃  ノ)\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃\n
``",
"```
\n
       |///|\n
       |///|\n
       |///|\n
       (¯¯¯¯)\n
       (¯¯¯¯)\n
       /¯¯¯¯/|\n
      / ,.^.//|\n
     / /      |/|\n
    | |        |/|\n
    | | :pudu: |/|\n
    | |       / /\n
      `----' /\n
       `------'\n
\n
```",
"```
\n
    ______\n
  //  +    |\n
 ||        |\n
 ||  RIP   |\n
 || :pudu: |\n
 ||        |\n
 ||/ / // |/\n
\n
```"
"
:bomb: :pudu: :gun: ~ adiós mundo cruel
"
]

module.exports = (robot) ->
  robot.hear /pud[úu] ql|m[áa]tate/gi, (msg) ->
    msg.send msg.random ascii
