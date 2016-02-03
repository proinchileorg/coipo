// Description:
//   Ask to the last.fm API about and artist similar, top chart and top artist by tag
//   TODO => Add method to ask about and artist and request/concant bio and popular songs   
//
// Dependencies:
//   hubot-slack
//
// Configuartion:
//   None
//
// Commands:
//   @pudu last.fm similar <artist>
//   @pudu last.fm tag <type>
//   @pudu last.fm top
//
// Author:
//   @javier

module.exports = function lastFm(robot) {
    // last.fm API key and method's
    var lastApi = {
        url: 'http://ws.audioscrobbler.com/2.0/?method=',
        key: 'api_key=2e2012c7f4762d0c257820da8eb59300&',
        json: 'format=json&',
        limit: 'limit=5&',
        top: 'chart.getTopTracks&',
        tag: 'tag.getSimilar&artist=',
        similar: 'artist.getSimilar&artist=',
        artistBio: 'artist.getInfo&artist=',
        artistTracks: 'artist.getTopTracks&artist='
    };
    // create url for API request
    function createUrl(type, config, search) {   
        var url = config.url;
        var key = '&' + config.json + config.limit + config.key;
        if(search !== undefined) {
            return type === 'similar' ? 
            url + config.similar + search + key: 
            url + config.tag + search + key;
        } else {
            return url + config.top + key;   
        }
    }
    // hubot respond func
    robot.respond(/last.fm (.*)/i, function(res){
        var type = res.match[1];
        if(type === 'similar' || type === 'tag' || type === 'top') {
            res.send(res.match[0], 'or', res.match[1], 'true');
        } else {
            res.send(res.match[0], 'or', res.match[1], 'null');
        }
        // res.send(res.match[0], res.match[1]);
    });
};
