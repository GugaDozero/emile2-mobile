import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Label {
    id: label

    property bool animate: true
    property bool rotate: false
    property bool header: false
    property bool icon: false

    Layout.preferredWidth: 0.7 * parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    horizontalAlignment: Text.AlignHCenter
    font { family: icon ? awesomeFont.name:titilliumFont.name; pixelSize: header ? 28:(icon ? 80:14) }
    color: header ? theming.primaryColor:(icon ? theming.iconColor:theming.textColor)
    wrapMode: Text.WordWrap
    SequentialAnimation {
        running: icon && animate
        loops: Animation.Infinite
        NumberAnimation { target: label; property: "rotation"; to: 360; duration: rotate ? 1000:0 }
        NumberAnimation { target: label; property: "rotation"; to: 0; duration: 0 }
        NumberAnimation { target: label; property: "scale"; easing.type: Easing.OutElastic; to: 1.5; duration: 1000 }
        NumberAnimation { target: label; property: "scale"; easing.type: Easing.OutElastic; to: 1.0; duration: 1000 }
    }
}
