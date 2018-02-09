import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Label {
    property alias animate: scaleAnimation.running
    property bool header: false
    property bool icon: false

    Layout.preferredWidth: 0.7 * parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    horizontalAlignment: Text.AlignHCenter
    font { family: titilliumFont.name; pixelSize: header ? 28:(icon ? 80:14) }
    color: header ? "#4b6c8f":(icon ? "#6bbfaf":"#9aa0a4")
    wrapMode: Text.WordWrap
    SequentialAnimation on scale {
        id: scaleAnimation
        running: icon
        loops: Animation.Infinite
        PropertyAnimation { to: 1.25; duration: 1000 }
        PropertyAnimation { to: 1.00; duration: 1000 }
    }
}
