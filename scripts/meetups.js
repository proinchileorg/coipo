// Description:
//   Shows upcoming events on meetup.com

// Dependencies:
//   hubot-slack
//
// Configuration:
//   None
//
// Commands:
//   hubot meetups
//
// Author:
//   @ernesto

module.exports = function meetups(robot) {
    var url = require('url');
    var moment = require('moment');

    robot.respond(/(meetups)/, function(msg) {
      var meetupURL = url.format( {
        protocol: 'https',
        hostname: 'api.meetup.com/2',
        pathname: 'open_events',
        query: {
          sign: true,
          key: '731d1af64d7c606ad3264d386539',
          'photo-host': 'public',
          lat: -33.447487,
          country: 'Chile',
          city: 'Santiago',
          category: 34,
          lon: -70.673676,
          page: 20,
          format: 'json'
        }
      });

      msg.http(meetupURL).get()(function(err, res, body) {
          var response = '';
          var json = JSON.parse(body);
          if(json.results.length > 0){
            json.results.forEach(function(meetup) {
              if(meetup.hasOwnProperty('venue')){
                return response += ':meetup: '+ meetup.name + ' ¿Cuándo? *' + moment.unix(meetup.time * 0.001).add(1, 'hour').format('H:mm DD/MM/YYYY') + '* ¿Dónde? '+ meetup.venue.name + ' *'+meetup.venue.address_1 + '* \n\n';
              }
              else{
                return response += ':meetup: '+ meetup.name + ' ¿Cuándo? *' + moment.unix(meetup.time * 0.001).add(1, 'hour').format('H:mm DD/MM/YYYY') + '* (No hay una ubicación definida) \n\n';
              }
            });
          }
          else {
            response += ('No se encontraron eventos :sadparrot:');
          }
          return msg.send(response);
      });
    });
};
