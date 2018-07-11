
var output = document.getElementById("output");
var wsUri = "ws://www.ccis.site:80/WebsocketServer/feedback";
var websocket = new Websocket(wsUri)

websocket.onerror = function(event) {
    updateOutput('<span style="color: red;">ERROR:</span> ' + event.date);
};

websocket.onmessage = function(event) {
    var incomingMsg = event.data;
    if (incomingMsg != "") {
        updateOutput("Received message:" + incomingMsg);
    }
};

websocket.onclose = function(event) {
    updateOutput("Received close event")
};

websocket.onopen = function(event) {
    updateOutput("Connected to:" + wsUri);
};

function submitFeedback() {
    var feedbackText = document.getElementById("feedback").value;
    websocket.send(feedbackText)
}

function updateOutput(message) {
    output.innerHTML = message;
}

