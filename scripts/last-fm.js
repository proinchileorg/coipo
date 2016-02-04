// Description:
//   Ask to the last.fm API about and artist similar, top chart and top artist by tag
//   TODO
//   Use the node=>url method for parse the last.fm url
//   Add method to ask about and artist and request/concat bio and popular songs    
//   pass the msg.match[1] to RegExp     
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
    var lastRoutes = {
        url: 'http://ws.audioscrobbler.com/2.0/?',
        key: 'api_key=2e2012c7f4762d0c257820da8eb59300&',
        json: 'format=json&',
        limit: 'limit=5&',
        top: 'method=chart.getTopTracks',
        tag: 'method=tag.getTopArtists&tag=',
        similar: 'method=artist.getSimilar&artist=',
        artistBio: 'method=artist.getInfo&artist=',
        artistTracks: 'method=artist.getTopTracks&artist='
    };
    // create url for API request
    function createUrl(type, config, search) {
        var url = config.url + config.key + config.json + config.limit;
        if(type !== 'top') {
            if(search.length > 0) {
                return type === 'similar' ? 
                    url + config.similar + search: 
                    url + config.tag + search;                
            } else {return null;}
        } else {
            return url + config.top;
        }
    }
    // hubot respond func
    robot.respond(/last.fm (.*)/i, function(msg){
        // parse msg
        var str = msg.match[1].split(' ');
        var type = str.shift();
        var search = str.join('+');
        // validate the query
        if(type === 'similar' || type === 'tag' || type === 'top') {
            var url = createUrl(type, lastRoutes, search);
            if(url !== null) {
                // ask to last.fm api
                msg.http(url).get()(function(err, res, body){
                    var respond;
                    var json = JSON.parse(body);
                    if(type === 'similar' && json.similarartists.artist.length > 0) {
                        respond = 'Si te gusta ' + search + ' te podrian interesar: \n';
                        json.similarartists.artist.forEach(function(elem){
                            return respond += elem.name + '\n';
                        }); 
                    } else if(type === 'tag' && json.topartists.artist.length > 0) {
                        respond = 'Si te gusta la musica ' + search + ' te podrian interesar: \n';
                        json.topartists.artist.forEach(function(elem){
                            return respond += elem.name + '\n';
                        });                        
                    } else if(type === 'top' && json.tracks.track.length > 0) {
                        respond = 'Lo más escuchado esta semana en last.fm es: \n';
                        json.tracks.track.forEach(function(elem){
                            return respond += elem.name + ' de ' + elem.artist.name + '\n';
                        });                        
                    } else {
                        respond = 'OH SNAP! se fue todo a la mierda'
                    }
                    msg.send(respond);
                })
                
            } else {
                // bad respond
                msg.send('OH SNAP! te falto agregar el grupo o el estilo');
            }
        } else {
            // help
            msg.send('OH SNAP! @pudu last.fm similar <artista> | tag <tipo de musica> | top');
        }
    });
};
