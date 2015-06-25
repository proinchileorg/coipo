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

ascii = ["```
\n
━━━━━┓ ＼＼\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃    |😫ノ ~ chaoooooo\n
┓┓┓┓┓┃ 　 /\n
┓┓┓┓┓┃  ノ)\n
┓┓┓┓┓┃\n
┓┓┓┓┓┃\n
```",
"```
\n
   ]      me aburrí      [    ,'|\n
   ]___               ___[ ,'   |\n
   ]  ]\    CHAO     /[  [ |:   |\n
   ]  ] \           / [  [ |:   |\n
   ]  ]  ]         [  [  [ |:   |\n
   ]  ]  ]__     __[  [  [ |:   |\n
   ]  ]  ] ]\ _ /[ [  [  [ |:   |\n
   ]  ]  ] ] (#) [ [  [  [ :===='\n
   ]  ]  ]_].nHn.[_[  [  [\n
   ]  ]  ]  HHHHH. [  [  [\n
   ]  ] |   'HH('N  | [  [\n
   ]__]|     HHH  '  |[__[\n
   ]         NNN         [\n
   ]         N/'         [\n
   ]         N H         [\n
  |          N            |\n
 |           q,            |\n
|                           |\n
```",
"
:bomb: :pudu: :gun: ~ adiós mundo cruel
"
]

module.exports = (robot) ->
  robot.hear /pud[úu] ql|m[áa]tate/gi, (msg) ->
    msg.send msg.random ascii