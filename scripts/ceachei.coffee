# Description:
#   ceacheieleechichichilelelevivachile
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ceachei
#
# Author:
#   @jorgeepunan


ceachei = [
	    "ce-hache-iiiii",
	    "```\n
┌─┐┬ ┬┬┬┬┬┬┬┬┬\n
│  ├─┤││││││││\n
└─┘┴ ┴┴┴┴┴┴┴┴┴\n
```",
	    "ele-eeeeeee",
	    "```\n
┬  ┌─┐┌─┐┌─┐┌─┐┌─┐┌─┐\n
│  ├┤ ├┤ ├┤ ├┤ ├┤ ├┤ \n
┴─┘└─┘└─┘└─┘└─┘└─┘└─┘\n
```",
	    "```\n
┌─┐┬ ┬┬   ┌─┐┬ ┬┬   ┌─┐┬ ┬┬\n
│  ├─┤│───│  ├─┤│───│  ├─┤│\n
└─┘┴ ┴┴   └─┘┴ ┴┴   └─┘┴ ┴┴\n
```",
	    "```\n
┬  ┌─┐  ┬  ┌─┐  ┬  ┌─┐\n
│  ├┤───│  ├┤───│  ├┤ \n
┴─┘└─┘  ┴─┘└─┘  ┴─┘└─┘\n
```",
	    "```\n
╦  ╦┬┬  ┬┌─┐\n
╚╗╔╝│└┐┌┘├─┤\n
 ╚╝ ┴ └┘ ┴ ┴\n
```",
	    "```\n
╔═╗┬ ┬┬┬  ┌─┐┬\n
║  ├─┤││  ├┤ │\n
╚═╝┴ ┴┴┴─┘└─┘o\n
```"
]

module.exports = (robot) ->
	robot.respond /ceachei|í/gi, (msg) ->

		ceacheieleechichichilelelevivachile = (i) ->
			if ceachei[i]
				msg.send ceachei[i]
				setTimeout (->
					ceacheieleechichichilelelevivachile i + 1
					return
				), 1500
			return

		ceacheieleechichichilelelevivachile 0
