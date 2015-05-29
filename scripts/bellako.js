// Description:
//   traduce de chileno a bèlláákó lang
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   @pudu bellako <frase>
//
// Author:
//   @jorgeepunan


function aflaitar(aString) {
	aString = aString.toLowerCase();
	aString = aString.replace(/hola/gi,"wena");
	aString = aString.replace(/mujer/gi,"bellaka");
	aString = aString.replace(/hombre/gi,"bellako");
	aString = aString.replace(/mina/gi,"washa");
	aString = aString.replace(/minitas/gi,"washitas");
	aString = aString.replace(/bakan/gi,"del korte");
	aString = aString.replace(/bacan/gi,"del korte");
	aString = aString.replace(/bkn/gi,"del korte");
	aString = aString.replace(/arregla/gi,"azicala");
	aString = aString.replace(/fino/gi,"fino y elegante");
	aString = aString.replace(/bailar/gi,"perrear");
	aString = aString.replace(/el pico/gi,"la pishula");
	aString = aString.replace(/beso/gi,"kiss");
	aString = aString.replace(/besito/gi,"lanwetazo");
	aString = aString.replace(/compadre/gi,"socio");
	aString = aString.replace(/en serio/gi,"la pulenta");
	aString = aString.replace(/cacha /gi,"sapea ");
	aString = aString.replace(/buena /gi,"wena ");
	aString = aString.replace(/destacado/gi,"connotado");
	aString = aString.replace(/script/gi,"escrip");
	aString = aString.replace(/css/gi,"estail");
	aString = aString.replace(/javascript/gi,"java-escrip");
	
	var last = aString.length;
	var result = "";
	var vowels = new Array('A','E','I','O','U');
	for (var i = 0; i<last; i++) {
		result += flChar(aString.charAt(i));
	}
	if (result.length > 10) {
		result += ' m\xE1Zn\xE1\xE1t\xE8d\xED\xEDgh\xF3 \xF3\xE8z\xED\xED'; 
	}
	return result;
}
function flChar(c) {
	if (c == 'a') {
		return '\xE1\xE1';
	}
	else if (c == 'e') {
		return '\xE8';
	}
	else if (c == 'i') {
		return '\xED\xED\xED';
	}
	else if (c == 'o') {
		return '\xF3';
	}
	else if (c == 'u') {
		return '\xFA\xFA';
	}
	return c;
}

module.exports = function(robot) {
  robot.respond(/bellako (.*)/i, function(res) {
    var frase = res.match[1];

    msg = aflaitar(frase);
    res.send(msg);
  });
};
