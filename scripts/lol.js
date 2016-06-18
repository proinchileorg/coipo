// Description:
//   Shows highest winrate League of Legends champions by role on KR
//
//  Dependencies:
//    cheerio
//
// Commands:
//   hubot lol
//
// Author:
//   @ernesto

var cheerio = require('cheerio');

module.exports = function(robot) {

  robot.respond(/(lol)/, function(msg) {

    var url = 'http://www.op.gg/champion/statistics';

    msg.robot.http(url).get()(function(err, res, body) {

      var $ = cheerio.load(body);
      var resultado = '';

      $('.SideContent .ChampionRankingSummary').first().find('.Item').each(function() {
        var lane = $(this).find('.Title').text();
        resultado += '>' + lane + ': ';

        $(this).find('.Champion').each(function(){
          resultado += $(this).find('.Image').text() + ' ';
        });
        resultado += '\n';
      });

      return msg.send(resultado);
    });

  });
};
