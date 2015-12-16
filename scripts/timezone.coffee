# Description:
#   Cuanto falta
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   `que hora`
#   `la hora`
#
# Author:
#   jorgeepunan

module.exports = (robot) ->
  robot.respond /(.*)(qu[eé] hora|la hora.*)/i, (msg) ->

    #from DayTimr.js 
    #https://github.com/juanbrujo/daytimr/blob/master/js/jquery.dayTimr-1.0.js

    nightStart = '19:00'
    dawnStart = '1:00'
    morningStart = '7:00'
    afternoonStart = '13:00'
    days = ['domingo','lunes','martes','miércoles','jueves','viernes','sábado']
    datetoday       = new Date()
    timenow         = datetoday.getTime()
    datetoday.setTime(timenow)
    theday          = days[datetoday.getDay()]
    thehour         = datetoday.getHours()
    theminute       = datetoday.getMinutes()
    thesecond       = datetoday.getSeconds()
    nightStart      = nightStart.split(':')
    nightStartH     = nightStart[0]
    nightStartM     = nightStart[1]
    dawnStart       = dawnStart.split(':')
    dawnStartH      = dawnStart[0]
    dawnStartM      = dawnStart[1]
    morningStart    = morningStart.split(':')
    morningStartH   = morningStart[0]
    morningStartM   = morningStart[1]
    afternoonStart  = afternoonStart.split(':')
    afternoonStartH = afternoonStart[0]
    afternoonStartM = afternoonStart[1]
    nightEndH       = dawnStartH-1
    dawnEndH        = morningStartH-1
    morningEndH     = afternoonStartH-1
    afternoonEndH   = nightStartH-1

    if nightStartH == 0
      afternoonEndH = 23
    if dawnStartH == 0
      nightEndH = 23
    if nightStartM == "00" or dawnStartM == "00" or morningStartM == "00" or afternoonStartM == "00"
      nightEndM = 59
      dawnEndM = 59
      morningEndM = 59
      afternoonEndM = 59

    if theminute < 10
        theminute = '0' + theminute

    #msg.send "Current Time: "+thehour+':'+theminute+':'+thesecond
    #msg.send "It's night from "+nightStartH+":"+nightStartM+" to "+nightEndH+":"+nightEndM
    #msg.send "It's dawn from "+dawnStartH+":"+dawnStartM+" to "+dawnEndH+":"+dawnEndM
    #msg.send "It's morning from "+morningStartH+":"+morningStartM+" to "+morningEndH+":"+morningEndM
    #msg.send "It's afternoon from "+afternoonStartH+":"+afternoonStartM+" to "+afternoonEndH+":"+afternoonEndM

    if theday == 'sábado'
        #NIGHT
        if thehour >= nightStartH and theminute >= nightStartM and thesecond <= 59 and thehour <= nightEndH and theminute <= nightEndM and thesecond >= 0
            msg.send "Son las " + thehour + ":" + theminute + "y es " + theday + ". ¡Hora de parrandear!"

        #DAWN
        if thehour >= dawnStartH and theminute >= dawnStartM and thesecond <= 59 and thehour <= dawnEndH and theminute <= dawnEndM and thesecond >= 0
            msg.send "Ya es " + theday + " y de madrugada " + thehour + ":" + theminute + ". Trata en volver a casa sano y salvo."

        #MORNING
        if thehour >= morningStartH and theminute >= morningStartM and thesecond <= 59 and thehour <= morningEndH and theminute <= morningEndM and thesecond >= 0
            msg.send "Son las " + thehour + ":" + theminute + " del " + theday + ", vuelve a dormir."

        #TARDE
        if thehour >= afternoonStartH and theminute >= afternoonStartM and thesecond <= 59 and thehour <= afternoonEndH and theminute <= afternoonEndM and thesecond >= 0
             msg.send "Son las " + thehour + ":" + theminute + " de un " + theday + ", junta sed que ya se viene el carrete."

    else if theday == 'domingo'
        #NIGHT
        if thehour >= nightStartH and theminute >= nightStartM and thesecond <= 59 and thehour <= nightEndH and theminute <= nightEndM and thesecond >= 0
            msg.send "Es " + theday " y son las " + thehour + ":" + theminute + ", a preparar la semana."

        #DAWN
        if thehour >= dawnStartH and theminute >= dawnStartM and thesecond <= 59 and thehour <= dawnEndH and theminute <= dawnEndM and thesecond >= 0
            msg.send "Es " + theday + " " + thehour + ":" + theminute + " de madrugada. Vuelve a intentar dormir."

        #MORNING
        if thehour >= morningStartH and theminute >= morningStartM and thesecond <= 59 and thehour <= morningEndH and theminute <= morningEndM and thesecond >= 0
            msg.send "Son las " + thehour + ":" + theminute + " del " + theday + ", es mañana aún."

        #TARDE
        if thehour >= afternoonStartH and theminute >= afternoonStartM and thesecond <= 59 and thehour <= afternoonEndH and theminute <= afternoonEndM and thesecond >= 0
             msg.send "Son las " + thehour + ":" + theminute + " y es " + theday + ", tómate una siesta."

    else
        #NIGHT
        if thehour >= nightStartH and theminute >= nightStartM and thesecond <= 59 and thehour <= nightEndH and theminute <= nightEndM and thesecond >= 0
            msg.send "Es hora de beber, ya son las " + thehour + ":" + theminute + "de un " + theday

        #DAWN
        if thehour >= dawnStartH and theminute >= dawnStartM and thesecond <= 59 and thehour <= dawnEndH and theminute <= dawnEndM and thesecond >= 0
            msg.send "Es madrugada del " + theday + " y son las " + thehour + ":" + theminute + ". Vuelve a intentar dormir."

        #MORNING
        if thehour >= morningStartH and theminute >= morningStartM and thesecond <= 59 and thehour <= morningEndH and theminute <= morningEndM and thesecond >= 0
            msg.send "Son las " + thehour + ":" + theminute + " del " + theday + ", es mañana aún."

        #TARDE
        if thehour >= afternoonStartH and theminute >= afternoonStartM and thesecond <= 59 and thehour <= afternoonEndH and theminute <= afternoonEndM and thesecond >= 0
             msg.send "Son las " + thehour + ":" + theminute + " y es " + theday + ", queda menos para salir del trabajo."


#FIN