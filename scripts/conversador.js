// Description:
//   Pudu conversa contigo
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   pudu |chao|c[oó]mo est[aá]s)
//
// Author:
//   jorgeepunan


var saludo = ['hola','que tal','hey'];
var animo = ['aquí estamos','más o menos...','¡Bien! ¿Y tu?','mejor ni preguntes'];
var razon = ['es complicado','no quiero hablar de ello'];
var despedida = ['chao','chaíto','nos belmont','de ahí seguimos'];
var msg = null;

function rand(items){
  return items[~~(Math.random() * items.length)];
}

module.exports = function(robot) {
  robot.respond(/hola/i, function(res) {
    msg = rand(saludo) + "@#{msg.message.user.name}";
    res.send( msg );
  });
  robot.respond(/c[oá]mo est[aá]s/i, function(res) {
    msg = rand(animo);
    res.send( msg );
  });
  robot.respond(/(porque|porqué|por que|por qué|porq)( ?)/i, function(res) {
    msg = rand(razon);
    res.send( msg );
  });
  robot.respond(/cha[ou]/i, function(res) {
    msg = rand(despedida);
    res.send( msg );
  });
};
