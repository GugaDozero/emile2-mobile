import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import "EC" as EC
import QtQml.StateMachine 1.0 as DSM

ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 640
    title: qsTr("Émile 2.0")

    QtObject {
        id: theming

        property color primaryColor: "#4b6c8f"
        property color textColor: "#9aa0a4"
        property color iconColor: "#6bbfaf"
        property color backgroundColor: "white"
    }

    DSM.StateMachine {
        id: stateMachine
        initialState: state
        running: true
        DSM.State {
            id: state
            DSM.SignalTransition {
                targetState: finalState
                signal: button.clicked
            }
        }
        DSM.FinalState {
            id: finalState
        }
    }

    FontLoader { id: titilliumFont; source: "qrc:/TitilliumWeb-Regular.ttf" }
    FontLoader { id: awesomeFont; source: "qrc:/fa-solid-900.ttf" }

    ColumnLayout {
        width: parent.width
        anchors.centerIn: parent
        spacing: 20
        EC.Label {
            icon: true
            rotate: true
            text: "\uf013"
        }
        EC.Label { text: "Bem-vindo ao Émile!"; header: true }
        EC.Label {
            text: "Esta é a primeira vez que você está utilizando o Émile. Este wizard irá guiá-lo na realização das primeiras configurações do aplicativo."
        }
        EC.Button { id: button; text: "PRÓXIMO" }
    }
}
