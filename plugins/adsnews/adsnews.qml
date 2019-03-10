import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.XmlListModel 2.12
 
Page {
    header: ToolButton {
            id: toolButton
            text: "\u25C0"
            visible: stackView.depth > 1
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: stackView.pop()
        }
    
    
    XmlListModel {
        id: xmlListModel
        source: "https://ads.ifba.edu.br/tiki-blogs_rss.php?ver=2"
        query: "/rss/channel/item"
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "pubDate"; query: "pubDate/string()" }
        XmlRole { name: "description"; query: "description/string()" }
    }
 
    BusyIndicator {
        anchors.centerIn: parent
        running: xmlListModel.status === XmlListModel.Loading
    }
 
    Component {
        id: xmlContent
         Flickable {
            id: flickArea
            
            property alias text: xmlContentText.text
            
            contentWidth: xmlContentText.width;
            contentHeight: xmlContentText.height;
            flickableDirection: Flickable.VerticalFlick
            
            clip: true
            
            TextArea {
                id: xmlContentText
 
                wrapMode: TextEdit.WordWrap
                textFormat: TextEdit.RichText
                
                width: stackView.width
            }
        }
    }
 
    StackView {
        id: stackView
 
        anchors.fill: parent
        initialItem: ListView {
            model: xmlListModel
            delegate: ItemDelegate {
                width: parent.width
                text: title
                onClicked: stackView.push(xmlContent, {"text": xmlListModel.get(index).description})
            }
        }
    }
}
