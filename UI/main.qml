import QtQuick
import QtQuick.Controls.Basic
ApplicationWindow {
    
    visible: true
    width: 400  
    height: 600
    title: "Personal Agenda"
    
    Rectangle {
        anchors.fill: parent
    }

        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "Images/backround.png"
            fillMode: Image.PreserveAspectCrop
        }

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text {
            anchors {
                bottom: parent.bottom
                bottomMargin: 12
                left: parent.left
                leftMargin: 12
            }    
        text: "Sweet Home Alabama"
        font.pixelSize: 24
        color: "Black"
        }
    }
}