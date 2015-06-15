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
#   @pudu ceachei
#
# Author:
#   @jorgeepunan


ceachei = [
	    "che-hache-iiiii",
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
╦  ╦┬┬  ┬┌─┐  ╔═╗┬ ┬┬┬  ┌─┐┌─┐┌─┐┌─┐┬\n
╚╗╔╝│└┐┌┘├─┤  ║  ├─┤││  ├┤ ├┤ ├┤ ├┤ │\n
 ╚╝ ┴ └┘ ┴ ┴  ╚═╝┴ ┴┴┴─┘└─┘└─┘└─┘└─┘o\n
 ```"
]

module.exports = (robot) ->
	robot.hear /ceachei|í/gi, (msg) ->

		ceacheieleechichichilelelevivachile = (i) ->
			if ceachei[i]
				msg.send ceachei[i]
				setTimeout (->
					ceacheieleechichichilelelevivachile i + 1
					return
				), 1500
			return

		ceacheieleechichichilelelevivachile 0

# module.exports = function(robot) {
#   robot.hear(/ceachei|í/i, function(res) {

# 		var ceacheieleechichichilelelevivachile = function(i) {
# 		  if (ceachei[i]) {
# 		    res.send(ceachei[i]);
# 		    setTimeout(function(){
# 		    	ceacheieleechichichilelelevivachile(i+1);
# 		    }, 1500);
# 		  }
# 		}
# 		ceacheieleechichichilelelevivachile(0);

#   });
# };
