// General selections, handlers etc.


output = document.getElementById('json')

//Eventbus connections and handlers
var eb = new vertx.EventBus(window.location.protocol
    + '//'
    + window.location.hostname
    + ':'
    + window.location.port
    + '/eventbus');

eb.onopen = function() {

    console.log("eventbus is open");
    eb.registerHandler('controller.heartbeat', function(message) {
            console.log(message);
            output.innerHTML = JSON.stringify(message, undefined, 2)
        }
    );
};