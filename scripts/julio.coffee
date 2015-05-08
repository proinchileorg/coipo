# Description:
#   laura pausini foto prohibida zentaurus taringa crack full
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   juliiiito
#
# Author:
#   eljojo

rand = (array) -> array[Math.floor(Math.random()*array.length)]

class Juliiiiiiito
  constructor: (msg) ->
    @msg = msg

  lyrics: =>
    rand ["a ella le gusta la gasolina",
      "nada tiene de especial, dos mujeres que se dan la mano",
      "dansa cuduro",
      "por amarte asi cristian castro",
      "waka waka futbol",
      "israel, israel, que bonito es israel delfin hasta el fin",
      "maldita amiga no digas que no sientes nada",
      "son amores urbanos mekano regio",
      "cucurucucu paloma mekano",
      "mueve el ombligo mueve cristel"
    ]

  dondebuscar: =>
    rand [
      "bajar arez",
      "bajar taringa",
      "karaoke erotico",
      "acordes guitarra",
      "karaoke",
      "en casete comprar",
      "vevo",
      "groovesharc",
      "sptify"
    ]


  persona_mujer: =>
    rand [
      "paty maldonado",
      "patti maldonado",
      "maria elena sweet",
      "camila vallejo",
      "kel kalderon",
      "rackel argandona",
      "karen paola",
      "gladys del rio",
      "gladys marin",
      "miriam hernandez",
      "karen paola",
      "bachelet",
      "bashele",
      "sarita vasquez",
      "daniela campos",
      "cecilia la imcomparable",
      "maria jose quintanilla",
      "cesilia boloco"
    ]

  persona_hombre: =>
    rand [
      "luciano bello",
      "tata pinocho",
      "chapulin colorado",
      "jaime gusman",
      "jose felisiano",
      "don fransisco",
      "peter roc",
      "pollo fuentes",
      "roberto carlos",
      "jorge pedreros",
      "antonio vodanovich",
      "badi richard",
      "lucho gatica",
      "zalo reyes",
      "luis fonsi",
      "alberto plaza",
      "felipito camiroaga",
      "puma rodriguez",
      "daniel samudio",
      "mauricio israel",
      "nelson avila",
      "zentaurus"
    ]

  persona_cualquiera: =>
    rand [@persona_mujer(), @persona_hombre(), @msg.message.user.name]

  significado: =>
    rand [
      "fake",
      "bacan",
      "choriflai",
      "< 3",
      "bellaka",
      "XD",
      "pelarse",
      "hipster",
      "1313",
      "por el chico no hay guagua",
      "estai papo"
    ]

  preguntas_significado: =>
    rand [
      "por que los niños dicen",
      "por que los lolos dicen",
      "que significa",
      "diccionario rae",
      "ejemplos de uso palabra",
      "como usar la palabra",
      "que significa cuando mi nieto dice"
    ]

  cosa_desconocida: =>
    rand [
      "youtube",
      "twitter",
      "gmail",
      "fotolog",
      "metroflog",
      "maispace",
      "güatsap",
      "slack",
      "php",
      "javascrit",
      "acheteemele",
      "snapchatrs"
    ]

  usar_cosa_desconocida: =>
    rand [
      "como usar",
      "que es un",
      "como funciona el",
      "como jotear lolitas en",
      "donde esta el chat en"
    ]

  cosa_para_hacer: =>
    rand [
      "hakear correo latinmail",
      "alejar a ex novio resentido",
      "hacer peinado Puma Rodriguez",
      "zurcir calcetines con el sexo",
      "curar la depresion inmediatamente",
      "borrar fondo de twiters donde salgo con una vieja fea",
      "orinar crescencios",
      "armar niño teleton",
      "escribir con las letras en grandecito",
      "poner la colita de chancho",
      "ponerle la cola al burro",
      "negar hijo en mapudungun",
      "cambiarle el color a #esto",
      "cocinar niñitos envueltos receta",
      "comprar disket",
      "mandar sms desde fono fax",
      "mandar watsap desde fono fax",
      "mandar foto del sexo por fono fax",
      "hacer un vampirito",
    ]

  tutorial: =>
    rand [
      "tutorial taringa",
      "tutorial paso a paso",
      "guia con fotos",
      "tutorial youtube",
      "tutorial bananero"
    ]

  accion: =>
    rand [
      "cantando en el baño",
      "gritando en la alameda",
      "saludando a el presi",
      "con una gitana",
      "comiendo chumbeque",
      "camara lenta saltando",
      "presas",
      "bailando ganam stile",
      "haciendo el treque treque",
      "baile del pollito"
    ]

  lugar: =>
    rand [
      "verano 94 pichidangui",
      "verano 83 cajon del maipo",
      "verano 43 plaza italia",
      "backstage venga conmigo",
      "detras de escenas cachureos",
      "evento anime 2004",
      "malón privada equipo mekano",
      "malón campo dichato de #{@persona_cualquiera()}",
      "playa nudista miami",
      "festival de viña 74",
      "estudio de grabacion pase lo que pase",
      "detras de escena alo ely",
      "verano 2006 costa varua",
      "verano 97 cachagua",
      "cumpleaños 2000 #{@persona_cualquiera()}",
      "ensayos japennin con já",
      "galpon persa biobio",
      "porlaputa",
      "la cuarta",
      "twitter",
      "slack"
    ]

  accion_una_persona_a_otra: =>
    rand [
      "besando a",
      "entregando su flor",
      "fumando estragon",
      "haciendole los sexos",
      "haciendo el 69 con",
      "entregando su cuerpo a",
      "perdiendo virginidad",
      "fumando insienso con",
      "aspirando lysoform",
      "chocando el hueso",
      "haciendo un vampirito",
    ]

  hacer_pregunta: =>
    rand [
      "#{@usar_cosa_desconocida()} #{@cosa_desconocida()} pregunta",
      "que significa \"#{@msg.message.text}\" pregunta"
    ]

  # "#{@msg.message.text} #{@msg.message.user.name}"
  yapo: =>
    rand [
      "video prohibido #{@persona_cualquiera()} #{@accion()} sin ropa online",
      "fotos de #{@msg.message.user.name} #{@accion()} empelota",
      "#{@lyrics()} #{@dondebuscar()}",
      "#{@persona_hombre()} #{@accion_una_persona_a_otra()} #{@persona_mujer()} #{@lugar()} video prohibido",
      "#{@preguntas_significado()} \"#{@significado()}\"",
      "#{@usar_cosa_desconocida()} #{@cosa_desconocida()} pregunta",
      "como #{@cosa_para_hacer()} #{@tutorial()}",
      "#{@persona_cualquiera()} cantando #{@lyrics()} #{@lugar()}",
      "que significa \"#{@msg.message.text}\" pregunta"
    ]

module.exports = (robot) ->
  # robot.enter (msg) ->
  robot.hear /(julio|videla|taringa)/i, (msg) ->
    # console.log msg
    # msg.send msg.random enterReplies
    # msg.send "Bienvenido a *#{msg.message.room}*"
    respuesta = new Juliiiiiiito(msg)
    msg.send respuesta.yapo()

  # tranquilein john wayne
  robot.hear /pregunta/i, (msg) ->
    if Math.random() * 10 > 6
      respuesta = new Juliiiiiiito(msg)
      msg.send respuesta.hacer_pregunta()
