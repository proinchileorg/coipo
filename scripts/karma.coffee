# Description:
#   A simple karma tracking script for hubot.
#
# Commands:
#   <name>++ - adds karma to a user
#   <name>-- - removes karma from a user
#   karma <name> - shows karma for the named user
#   karma todos|all - shows all users' karama
#   karma - shows all users' karama
#
# Adaptado para pudu por @clsource Camilo Castro
#  Basado en
#   https://www.npmjs.com/package/hubot-karma

module.exports = (robot) ->

  hubotWebSite = "http://#{robot.name}.herokuapp.com/#{robot.name}"

  robot.hear /@?(\S*)(\b(?:\+\+|--))/, (response) ->
    thisUser = response.message.user
    targetToken = response.match[1].trim()
    return if not targetToken
    targetUser = userForToken targetToken, response
    return if not targetUser
    return response.send "Oe no po, el karma es pa otros no pa ti!" if thisUser is targetUser
    op = response.match[2]
    limit = canUpvote(thisUser, targetUser)
    if Number.isFinite(limit)
      response.send "¡No abuses! Intenta en " + limit + " minutos"
      return
    targetUser.karma += if op is "++" then 1 else -1
    robot.brain.save()
    response.send "#{getCleanName(targetUser.name)} ahora tiene #{targetUser.karma} puntos de karma."

  robot.hear /^karma(?:\s+@?(.*))?$/, (response) ->
    targetToken = response.match[1]?.trim()
    return if not targetToken
    if targetToken.toLowerCase() in ["todos", "all"]
      msg = "Karma de todos: #{hubotWebSite}/karma/todos"
    else if targetToken.toLowerCase().split(' ')[0] == 'reset'
      thisUser = response.message.user
      if thisUser.name.toLowerCase() != "hector"
        response.send "Tienes que ser :stalin: para realizar esta función"
        return
      resetCommand = targetToken.toLowerCase().split(' ')[1]
      return if not resetCommand
      if resetCommand in ["todos", "all"]
        users = robot.brain.users()
        list = Object.keys(users)
          .map((k) -> users[k].karma = 0)
        msg = "Todo el mundo ha quedado libre de toda bendición o pecado."
      else
        targetUser = userForToken resetCommand, response
        targetUser.karma = 0
        msg = "#{getCleanName(targetUser.name)} ha quedado libre de toda bendición o pecado."
    else
      targetUser = userForToken targetToken, response
      return if not targetUser
      msg = "#{getCleanName(targetUser.name)} tiene #{targetUser.karma} puntos de karma."
    robot.brain.save()
    response.send msg

  robot.router.get "/#{robot.name}/karma/todos", (req, res) ->
    users = robot.brain.users()
    list = Object.keys(users)
      .sort()
      .filter((k) -> users[k].karma)
      .map((k) -> [users[k].karma or 0, "<strong>#{users[k].name}</strong>"])
      .sort((line1, line2) -> if line1[0] < line2[0] then 1 else if line1[0] > line2[0] then -1 else 0)
      .map((line) -> line.join " ")
    msg = "Karma de todos:\n
          <ul>
          <li>#{list.join '</li><li>'}</li>
          </ul>"
    res.setHeader 'content-type', 'text/html'
    res.end msg

  userForToken = (token, response) ->
    users = usersForToken token
    if users.length is 1
      user = users[0]
      user.karma ?= 0
    else if users.length > 1
      response.send "Se más específico, Hay #{users.length} personas que se parecen a: #{(getCleanName(u.name) for u in users).join ", "}."
    else
      response.send "Chaucha, no encuentro al usuario '#{token}'."
    user

  usersForToken = (token) ->
    user = robot.brain.userForName token
    return [user] if user
    user = userForMentionName token
    return [user] if user
    robot.brain.usersForFuzzyName token

  userForMentionName = (mentionName) ->
    for id, user of robot.brain.users()
      return user if mentionName is user.mention_name

  canUpvote = (user, victim) ->
    robot.brain.karmaLimits ?= {}
    robot.brain.karmaLimits[user.id] ?= {}
    if not robot.brain.karmaLimits[user.id][victim.id]
      robot.brain.karmaLimits[user.id][victim.id] = new Date()
      robot.brain.save()
      return true
    else
      oldDate = robot.brain.karmaLimits[user.id][victim.id]
      timePast = Math.round((new Date().getTime() - oldDate.getTime())) / 60000
      if timePast > 59
        robot.brain.karmaLimits[user.id][victim.id] = new Date()
        robot.brain.save()
        return true
      else
        return Math.floor(60 - timePast)

  getCleanName = (name) ->
    return name[0] + '.' + name.substr(1)
