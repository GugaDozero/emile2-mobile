var httpRequest = new XMLHttpRequest();
var busyIndicator
var errorText
var timer

function reset() {
    timer.stop()
    timer.destroy()
    errorText.text = ""
}

function timeout() {
    httpRequest.abort()
    timer.stop()
    timer.destroy()
    errorText.text = "erro de timeout\nsem conexão ou servidor emile indisponível"
}

function get(url) {
    httpRequest.open("GET", url);
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    timer = Qt.createQmlObject("import QtQuick 2.12; Timer { interval: 20000; repeat: false; running: true }", Qt.application, "timeoutTimer");
    timer.triggered.connect(timeout)
    httpRequest.send()
}

function post(url, params) {
    httpRequest.open("POST", url);
    httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    timer = Qt.createQmlObject("import QtQuick 2.12; Timer { interval: 20000; repeat: false; running: true }", Qt.application, "timeoutTimer");
    timer.triggered.connect(timeout)
    httpRequest.send(params)
}
