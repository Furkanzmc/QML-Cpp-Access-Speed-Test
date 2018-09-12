import QtQuick 2.11
import QtQuick.Window 2.11

Window {
    id: window
    visible: true
    width: 1024
    height: 600


    Column {
        anchors.centerIn: parent
        spacing: 50

        Repeater {
            model: 3

            Test {}
        }
    }
}
