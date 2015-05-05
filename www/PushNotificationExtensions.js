var PushNotificationExtensions = function() {};

/*
 * Extension per solo iOs che controlla se le push sono abilitate per l'app (impostazioni di sistema)
*/
PushNotificationExtensions.prototype.isPushEnabled = function (successCallback, errorCallback) {
    if (errorCallback == null) { errorCallback = function () { } }

    if (typeof errorCallback != "function") {
        console.log("PushNotificationExtensions.isPushEnabled failure: failure parameter not a function");
        return
    }

    if (typeof successCallback != "function") {
        console.log("PushNotificationExtensions.isPushEnabled failure: success callback parameter must be a function");
        return
    }

    cordova.exec(successCallback, errorCallback, "PushNotificationExtensions", "isPushEnabled", []);
};

//-------------------------------------------------------------------

if(!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.pushNotificationExtensions) {
    window.plugins.pushNotificationExtensions = new PushNotificationExtensions();
}

if (typeof module != 'undefined' && module.exports) {
  module.exports = PushNotificationExtensions;
}