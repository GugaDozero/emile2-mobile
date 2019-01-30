import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.XmlListModel 2.12

Item {
    
    XmlListModel {
        id: xmlListModel
        source: "https://ads.ifba.edu.br/tiki-blogs_rss.php?ver=2"
        query: "/rss/channel/item"
        XmlRole { name: "title"; query: "title/string()" }
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: xmlListModel.status === XmlListModel.Loading
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
                    // Fazer o push da pagina com o post.
                }
            }
        }
    }
}
