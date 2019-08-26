import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

import "networkaccessmanager.js" as NAM

Page {

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

    function login() {
        NAM.busyIndicator = busyIndicator
        NAM.errorText = errorText
        NAM.httpRequest.onreadystatechange=function() {
            if (NAM.httpRequest.readyState === XMLHttpRequest.DONE && NAM.httpRequest.status != 0) {
                NAM.reset()
                var re = /errada/
                if (!re.test(NAM.httpRequest.responseText)) {
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
        NAM.post('http://emilegestaoacademica.herokuapp.com/teste/' + txtUser.text + '/' + txtPassword.text)
    }

}
