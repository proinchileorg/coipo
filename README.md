# Mr. Pudú

El señor Pudú es un bot basado en [Hubot](https://hubot.github.com/) para [Hashtag Chile](http://hashtagchile.com) ([canal en Slack](http://hashtagchile.slack.com)).
Tiene todas las funciones básicas de Hubot, más algunas que se le irán ido agregando para hacerlo más inteligente. Para consultar cuáles son las cosas que trae, puedes hablarle públicamente así: `@pudu help`, si quieres preguntarle en privado, debes ir a *direct messages*, hablarle al bot y simplemente decir: `help`.  Normalmente es muy rápido, a menos que esté ocupado en otra cosa.

## ¿Qué comandos sabe?

Si la paciencia no te da, puedes ir a [esta URL](http://pudu.herokuapp.com/pudu/help), en esa lista se irán actualizando los comandos que sepa.

## Contribuir

El repositorio queda abierto para todos los miembros de [Hashtag Chile en GitHub](https://github.com/hashtagchile), si quieres agregar alguna función sigue los pasos 👇👇👇

### Pasos:

- Forkea y clona este repo en tu local.
- `$ cd path/to/pudu-bot`
- `$ npm install` (probablemente sea mejor usar `sudo`).
- Haz tu código JS (o CoffeeScript) y déjalo en `pudu-bot/scripts`. Para más info sobre *Hubot* consulta [Hubot Documentation > Scripting](https://hubot.github.com/docs/scripting/). **No olvides documentar tu código**.
- Para probar tus cambios localmente: `$ bin/hubot` y activarás a pudu y podrás invocarlo junto con [sus comandos](http://pudu.herokuapp.com/pudu/help) y los que hayas escrito.
- Para enviarlo a Heroku, haz un _pull request_, coméntalo en Slack canal *#pudu-devs* y será revisado, testeado, linteado y si pasa los rigurosos tests será activado.

---

![puducito](http://petitecurie.com/wp-content/uploads/2013/05/pudu1.jpg)
