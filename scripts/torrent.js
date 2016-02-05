// Description:
//   Get a torrent link from torrentproject.se
//
//  Dependencies:
//    cheerio
//
// Commands:
//   hubot torrent <query>
//
// Author:
//  jorgeepunan

var cheerio = require('cheerio');

module.exports = function(robot) {
  robot.hear(/torrent (.*)/i, function(msg) {
    var busqueda = msg.match[1];

    var url = 'https://torrentproject.se/?t=' + busqueda;

    msg.robot.http(url).get()(function(err, res, body) {

      msg.send('Enviando a Torrent Project y esperando respuesta...');

      var $ = cheerio.load(body);
      var resultados = [];

      $('#similarfiles > div:not(.gac_bb)').each(function() {
        var title = $(this).find('a').text();
        var link = $(this).find('a').attr('href');

        resultados.push( title + ' <' + link + '|Link>' );
      });

      for (var i=0; i < 6; i++) {
        i = parseInt(i + 1);
        msg.send(i + ': ' + resultados[i]);
      }

    });

  });
};