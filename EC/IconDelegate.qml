import QtQuick 2.7
import QtQuick.Controls 2.1

import "./" as EC

ItemDelegate {
    property alias iconName : toolButton.text
    property string displayText

    width: parent.width
    text: "         " + displayText

    EC.ToolButton {
        id: toolButton
        enabled: false
    }
}
