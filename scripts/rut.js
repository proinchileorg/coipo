// Description:
//  entrega un número de RUT válido aleatorio
//
// Dependencies:
//  rutjs
//
// Configuration:
//   None
//
// Commands:
//   hubot dame un rut
//
// Author:
//   @jorgeepunan

// var jsdom = require("jsdom");
// var $ = require("jquery")(jsdom.jsdom().parentWindow);
var Rut = require("rutjs");

module.exports = function(robot) {

  // jQuery RUT
  // $.fn.Rut=function(r){{var t={digito_verificador:null,on_error:function(){},on_success:function(){},validation:!0,format:!0,format_on:"change"};$.extend(t,r)}return this.each(function(){if(t.format&&jQuery(this).bind(t.format_on,function(){jQuery(this).val(jQuery.Rut.formatear(jQuery(this).val(),null==t.digito_verificador))}),t.validation)if(null==t.digito_verificador)jQuery(this).bind("blur",function(){var r=jQuery(this).val();""==jQuery(this).val()||jQuery.Rut.validar(r)?""!=jQuery(this).val()&&t.on_success():t.on_error()});else{var r=jQuery(this).attr("id");jQuery(t.digito_verificador).bind("blur",function(){var i=jQuery("#"+r).val()+"-"+jQuery(this).val();""==jQuery(this).val()||jQuery.Rut.validar(i)?""!=jQuery(this).val()&&t.on_success():t.on_error()})}})},$.Rut={formatear:function(r,t){var i=new String(r),u="";if(i=jQuery.Rut.quitarFormato(i),t){var o=i.charAt(i.length-1);i=i.substring(0,i.length-1)}for(;i.length>3;)u="."+i.substr(i.length-3)+u,i=i.substring(0,i.length-3);return u=i+u,""!=u&&t?u+="-"+o:t&&(u+=o),u},quitarFormato:function(r){for(var t=new String(r);-1!=t.indexOf(".");)t=t.replace(".","");for(;-1!=t.indexOf("-");)t=t.replace("-","");return t},digitoValido:function(r){return"0"!=r&&"1"!=r&&"2"!=r&&"3"!=r&&"4"!=r&&"5"!=r&&"6"!=r&&"7"!=r&&"8"!=r&&"9"!=r&&"k"!=r&&"K"!=r?!1:!0},digitoCorrecto:function(r){return largo=r.length,largo<2?!1:(rut=largo>2?r.substring(0,largo-1):r.charAt(0),dv=r.charAt(largo-1),jQuery.Rut.digitoValido(dv),null==rut||null==dv?0:(dvr=jQuery.Rut.getDigito(rut),dvr!=dv.toLowerCase()?!1:!0))},getDigito:function(r){for(suma=0,mul=2,i=r.length-1;i>=0;i--)suma+=r.charAt(i)*mul,7==mul?mul=2:mul++;return res=suma%11,1==res?"k":0==res?"0":11-res},validar:function(r){if(r=jQuery.Rut.quitarFormato(r),largo=r.length,largo<2)return!1;for(i=0;i<largo;i++)if(!jQuery.Rut.digitoValido(r.charAt(i)))return!1;var t="";for(i=largo-1,j=0;i>=0;i--,j++)t+=r.charAt(i);var u="";for(u+=t.charAt(0),u+="-",cnt=0,i=1,j=2;i<largo;i++,j++)3==cnt?(u+=".",j++,u+=t.charAt(i),cnt=1):(u+=t.charAt(i),cnt++);for(t="",i=u.length-1,j=0;i>=0;i--,j++)t+=u.charAt(i);return jQuery.Rut.digitoCorrecto(r)?!0:!1}};

  var generar = function(){
      var num_aleatorio = Math.round(Math.random()*(25000000-5000000))+5000000;
      // return num_aleatorio+'-'+$.Rut.getDigito(num_aleatorio+"");
      var rut = new Rut(num_aleatorio.toString(), true);
      return rut.getNiceRut()
  }

  robot.respond(/dame un rut/i, function(res) {
    res.send( "Un RUT: " + generar() );
  });

};
