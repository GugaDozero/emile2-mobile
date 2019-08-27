import QtQuick 2.11
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import "networkaccessmanager.js" as NAM

ApplicationWindow {
    id: appWindow 
    visible: true
    width: 360
    height: 460
    title: qsTr("Emile2")
    
    ColumnLayout {
        id: columnLayout
        anchors.centerIn: parent

        TextField { id: txtUser; placeholderText: "login" }

        TextField { id: txtPassword; placeholderText: "password"; echoMode: TextInput.Password }

        Button {
            id: loginButton
            Layout.preferredWidth: parent.width
            text: "login"
            onClicked: login()
            Text {
                id: errorText
                color: "#607D8B"
                horizontalAlignment: Label.AlignHCenter
                anchors { horizontalCenter: parent.horizontalCenter; top: loginButton.bottom; topMargin: columnLayout.spacing }
            }
        }
    }

    Settings {
        id: userSettings
        property alias user: txtUser.text
        property alias password: txtPassword.text
    }

    Component.onCompleted: {
        if (userSettings.user !== "" && userSettings.password !== "") {
            txtUser.text = userSettings.user
            txtPassword.text = userSettings.password
            login()
        }
    }
    
    StackView {
        id: stackView
        anchors.fill: parent
        visible: true
    }

    function login() {
        NAM.errorText = errorText
        NAM.httpRequest.onreadystatechange=function() {
            if (NAM.httpRequest.readyState === XMLHttpRequest.DONE && NAM.httpRequest.status != 0) {
                NAM.reset()
                var re = "Wrong user/password"
                console.log("resposta foi" + NAM.httpRequest.responseText);
                if (re !== NAM.httpRequest.responseText) {
                     var processedResponseText = NAM.httpRequest.responseText; // tratar o json para pegar o tipo e nome do usuario
                    stackView.push("qrc:/MainPage.qml",
                                   {// passar as propriedades dos usuarios
                                   })
                    if (Qt.platform.os == "android") {
                        configurator.username = txtUser.text
                        configurator.password = txtPassword.text
                    }
                } else {
                    errorText.text = "acesso negado"
                }
            }
        }
        NAM.get('http://localhost:4567/teste/' + txtUser.text + '/' + txtPassword.text)
    }

}
