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
//   @pudu lastfm similar <artist>
//   @pudu lastfm tag <type>
//   @pudu lastfm top
//
// Author:
//   @javier

module.exports = function lastFm(robot) {
    var url = require('url');
    // last.fm API methods
    var lastMethods = {
        topfive: 'chart.getTopTracks',
        como: 'tag.getTopArtists',
        similar: 'artist.getSimilar',
        artistBio: 'artist.getInfo',
        artistTracks: 'artist.getTopTracks'        
    } 
    // hubot respond func
    robot.respond('/(lastfm) (similar|como|topfive) (.*)/i', function(msg){
        var type = msg.match[2];
        var search = msg.match[3].split(' ').join('+');
        // formating url request
        var lastUrl = url.format({
            protocol: 'http',
            hostname: 'ws.audioscrobbler.com/2.0/',
            query: {
                limit: '5',
                format: 'json',
                api_key: '2e2012c7f4762d0c257820da8eb59300',
                method: lastMethods[type],
                tag: 'the xx',
                artist: 'the xx'
                 
            }
        })
        
        //if()
        
        msg.send(msg.match[0], msg.match[1], msg.match[2], type, search, lastUrl);
        
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
                });       
        
    });
    
};
