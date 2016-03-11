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
#   hubot imdb <movie or serie>
#   hubot movie <movie or serie>
#   hubot imdb <year|rate|plot|genre|director|actors|url> <movie or serie>
#   hubot movie <year|rate|plot|genre|director|actors|url> <movie or serie>
#
# Notes:
#   Filter search by year or type (movie or serie) for more accuracy
#
# Author:
#   @ravenous <hello@ravenous.io>

module.exports = (robot) ->
  robot.respond /(imdb|movie)\s(year|rate|plot|genre|director|actors|url)?\s?(.*)/i, (msg) ->
    query = msg.match[3]
    msg.http("http://omdbapi.com/")
      .query({
        t: query,
        tomatoes: true
      })
      .get() (err, res, body) ->
        movie = JSON.parse(body)
        label = msg.match[2] ? 'full'
        if label is 'year' and movie.Year?
          msg.send ">*#{movie.Title} (#{movie.Year})*"
        else if label is 'rate' and movie.imdbRating?
          if movie.imdbRating isnt 'N/A'
            msg.send ">IMDb Rating: `#{movie.imdbRating}/10`"
            msg.send ">Rotten Tomatoes: `#{movie.tomatoMeter}%`" if movie.tomatoMeter? and movie.tomatoMeter isnt "N/A"
          else
            msg.send "Nadie la ha calificado aún :disappointed:"
        else if label is 'plot' and movie.Plot?
          if movie.Plot isnt 'N/A'
            msg.send ">_#{movie.Plot}_"
          else
            msg.send "No tiene argumento! Ain't nobody got time for that! :gun:"
        else if label is 'genre' and movie.Genre?
          if movie.Genre isnt 'N/A'
            msg.send ">#{movie.Genre}"
          else
            msg.send "¿Qué clase de películas ves? :anguished:"
        else if label is 'director' and movie.Director?
          if movie.Director isnt 'N/A'
            msg.send ">#{movie.Director}"
          else
            msg.send "Ni Santa Isabel lo conoce! :laughing:"
        else if label is 'actors' and movie.Actors?
          if movie.Actors isnt 'N/A'
            msg.send ">#{movie.Actors}"
          else
            msg.send "Son puros extras! :unamused"
        else if label is 'url' and movie.imdbID?
          if movie.imdbID isnt 'N/A'
            msg.send "www.imdb.com/title/#{movie.imdbID}"
          else
            msg.send "Google es tu amigo! :ok_hand:"
        else if label is 'full' and movie.Title?
          full = ">*#{movie.Title} (#{movie.Year})*\n"
          full += ">IMDb Rating: `#{movie.imdbRating}/10`\n" if movie.imdbRating? and movie.imdbRating isnt "N/A"
          full += ">Rotten Tomatoes: `#{movie.tomatoMeter}%`\n" if movie.tomatoMeter? and movie.tomatoMeter isnt "N/A"
          full += ">_#{movie.Plot}_\n" if movie.Plot? and movie.Plot isnt "N/A"
          full += ">Genre: `#{movie.Genre}`\n" if movie.Genre? and movie.Genre isnt "N/A"
          full += ">Director: #{movie.Director}\n" if movie.Director? and movie.Director isnt "N/A"
          full += ">Actors: #{movie.Actors}\n" if movie.Actors? and movie.Actors isnt "N/A"
          full += ">URL: www.imdb.com/title/#{movie.imdbID}" if movie.imdbID? and movie.imdbID isnt "N/A"
          msg.send full
        else
          msg.send "¿Seguro qué ese es el nombre?\n¡Tienes que elegir una película o serie!"


