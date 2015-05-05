# Cordova - Push Notification Extensions

## DESCRIZIONE

Questo plugin offre dei metodi di estensione delle funzionalità push notification per iOs

### UTILIZZO
Una volta installato è possible richiamarlo con:

```js
window.plugins.pushNotificationExtensions.isPushEnabled(function(result) {
	console.log("Push notifications abilitate: " + result);
}, function(error) {
	console.log("Errore: " + JSON.stringify(error));
});
```

la callback di success torna una stringa contenente i seguenti possibili valori:
 - "true": push notifications abilitate
 - "false": push notifications non abilitate
