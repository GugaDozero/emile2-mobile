import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import "EC" as EC

ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 640
    title: qsTr("Émile 2.0")

    FontLoader { id: titilliumFont; source: "qrc:/TitilliumWeb-Regular.ttf" }
    FontLoader { id: awesomeFont; source: "qrc:/fa-solid-900.ttf" }

    ColumnLayout {
        width: parent.width
        anchors.centerIn: parent
        spacing: 20
        EC.Label {
            icon: true
            text: "\uf013"
            SequentialAnimation on rotation {
                loops: Animation.Infinite
                PropertyAnimation { to: 360; duration: 2000 }
            }
        }
        EC.Label { text: "Bem-vindo ao Émile!"; header: true }
        EC.Label {
            text: "Esta é a primeira vez que você está utilizando o Émile. Este wizard irá guiá-lo na realização das primeiras configurações do aplicativo."
        }
        EC.Button { text: "PRÓXIMO" }
    }
}
