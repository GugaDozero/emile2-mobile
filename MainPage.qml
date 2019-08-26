import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

import "FontAwesome.js" as FA
import "EC" as EC

Page {
    id: appWindow
    visible: true
    width: 360
    height: 640
    title: qsTr("Emile2")

    Material.primary: "#05070d"
    Material.foreground: "#05070d"
    Material.accent: "#41cd52"

    FontLoader { id: fontAwesome; source: "qrc:///FontAwesome.otf" }

    QtObject {
        id: internal
       // property string baseServer: "http://localhost:4567"
       property string baseServer: "https://emilegestaoacademica.herokuapp.com/"
    }

    header: ToolBar {
        width: parent.width
        RowLayout {
            anchors.fill: parent
            EC.ToolButton {
                text: FA.icons["bars"]
                onClicked: drawer.open()
            }
            Label {
                text: "emile2-mobile"
                font.bold: true
                color: "white"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            EC.ToolButton {
                text: FA.icons["info"]
            }
        }
    }

    Drawer {
        id: drawer
        width: parent.width*2/3
        height: parent.height
        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: appWindow.height / 3
                color: Material.primaryColor

                Label {
                    width: drawer.width / 3 * 2
                    height: contentHeight
                    anchors { left: parent.left; leftMargin: 13; bottom: parent.bottom; bottomMargin: 5 }
                    text: "Emile2"
                    fontSizeMode: Text.HorizontalFit
                    font.pixelSize: width
                    color: "white"
                }
            }
            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: contents
                clip: true
                delegate: EC.IconDelegate {
                    displayText: modelData.menuItem
                    iconName: FA.icons[modelData.iconName]
                    onClicked: {
                        tabBar.currentIndex = index
                        drawer.close()
                    }
                }
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Repeater {
            model: contents
            Loader {
                source: (Qt.platform.os === "android") ?
                        "assets:/plugins/" + modelData.pluginName + "/" + modelData.mainPage
                        :
                        "file://" + modelData.pluginName + "/" + modelData.mainPage
            }
        }
    }

    footer: TabBar {
        id: tabBar
        width: parent.width
        currentIndex: swipeView.currentIndex
        Repeater {
            model: contents
            TabButton { text: modelData.menuItem }
        }
    }
}
