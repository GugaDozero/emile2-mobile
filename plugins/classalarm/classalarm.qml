import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Page {
    JSONListModel { id: alarmModel; source: internal.baseServer }
    
    /*BusyIndicator {
        anchors.centerIn: parent
        running: alarmModel.status === alarmModel.Loading
    }*/
 
    Component {
        id: jsonContent
         Flickable {
            id: flickArea
            
            property alias text: jsonContentText.text
            
            contentWidth: jsonContentText.width;
            contentHeight: jsonContentText.height;
            flickableDirection: Flickable.VerticalFlick
            
            clip: true
            
            TextArea {
                id: jsonContentText
 
                wrapMode: TextEdit.WordWrap
                textFormat: TextEdit.RichText
                
                width: stackView.width
            }
        }
    }
    
    Component.onCompleted: {
            alarmModel.load()
            console.log("json: " + JSON.stringify(alarmModel.json));
    }
 
    StackView {
        id: stackView
 
        anchors.fill: parent
        initialItem: ListView {
            model: alarmModel.json
            delegate: ItemDelegate {
                width: parent.width
                text: modelData.autor
                onClicked: stackView.push(jsonContent, {"text": modelData.descricao})
            }
        }
    }
}
