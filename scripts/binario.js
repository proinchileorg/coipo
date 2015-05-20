// Description:
//   Transforma un string a binario
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   binario <texto> (máx. 60 caracteres porque @gmq abusa)
//
// Author:
//   @jorgeepunan

function toBin(str){
 var st,i,j,d;
 var arr = [];
 var len = str.length;
 for (i = 1; i<=len; i++){
  d = str.charCodeAt(len-i);
  for (j = 0; j < 8; j++) {
   arr.push(d%2);
   d = Math.floor(d/2);
  }
 }
 return arr.reverse().join("");
}

module.exports = function(robot) {

  robot.hear(/binario (\w+)/i, function(res) {
    var texto = res.match[1].trim(),
        largo = 60,
        cortado = texto.substring(0, largo);
        binario = toBin(cortado);
    msg = cortado + " en binario es: " + binario;

    res.send(msg);
  });
};
