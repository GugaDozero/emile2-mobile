import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

//import "networkaccessmanager.js" as NAM

ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 640


    StackView {
        id: stackView
        anchors.fill: parent
        visible: !busyIndicator.running
        initialItem: MainPage {}
    }
}
