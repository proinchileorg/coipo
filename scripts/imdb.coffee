#
# Description:
#   Get detailed information of movies or series from IMDb
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Full search: @pudu <imdb|movie> <movie or serie>
#   Specific search: @pudu <imdb|movie> <year|rate|plot|poster> <movie or serie>
#
# Author:
#   Ravenous

module.exports = (robot) ->
  robot.respond /(imdb|movie)\s(year|rate|plot|poster)?\s?(.*)/i, (msg) ->
    query = msg.match[3]
    msg.http("http://omdbapi.com/")
      .query({
        t: query
      })
      .get() (err, res, body) ->
        movie = JSON.parse(body)
        label = msg.match[2] ? 'full'
        if label is 'year' and movie.Year?
          msg.send ">*#{movie.Title} (#{movie.Year})*"
        else if label is 'rate' and movie.imdbRating?
          if movie.imdbRating isnt 'N/A'
            msg.send ">IMDb Rating: `#{movie.imdbRating}/10`"
          else
            msg.send "Nadie la ha calificado aún :disappointed:"    
        else if label is 'plot' and movie.Plot?
          if movie.Plot isnt 'N/A'
            msg.send ">_#{movie.Plot}_"
          else
            msg.send "No tiene argumento! Ain´t nobody got time for that! :gun:" 
        else if label is 'poster' and movie.Poster?
          if movie.Poster isnt 'N/A'
            msg.send "#{movie.Poster}"
          else
            msg.send "No hay imagen disponible para mostrar :cry:"
        else if label is 'full' and movie.Title?
          full = ">*#{movie.Title} (#{movie.Year})*\n" 
          full += ">IMDb Rating: `#{movie.imdbRating}/10`\n"
          full += ">_#{movie.Plot}_\n"
          full += "#{movie.Poster}" if movie.Poster? and movie.Poster isnt "N/A"
          msg.send full
        else
          msg.send "¿Seguro qué ese es el nombre?\n¡Tienes que elegir una película o serie!"


