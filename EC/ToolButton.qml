import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

ToolButton {
    id: control
    contentItem: Text {
        text: control.text
        font: control.font
        color: enabled ? "#ffffff":Material.primary
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
