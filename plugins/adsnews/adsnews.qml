import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.XmlListModel 2.12

Item {
    property int xmlIndex: 0
    
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

        Text {
            id: xmlContentText
            text: xmlListModel.get(xmlIndex).description
            clip: true
            wrapMode: Text.Wrap
            MouseArea {
                anchors.fill: parent
                onClicked: stackView.pop()
            }
        }
    }

    function pushAndSetIndex(stack, content, index) {
        xmlIndex = index
        stack.push(content)
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: ListView {
            model: xmlListModel
            delegate: ItemDelegate {
                width: parent.width
                text: title
                onClicked: {
                    pushAndSetIndex(stackView, xmlContent, index)
                }
            }
        }
    }
}
