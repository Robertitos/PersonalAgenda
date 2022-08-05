import QtQuick
import QtQuick.Controls.Basic
ApplicationWindow {
    
    visible: true
    width: 400  
    height: 600
    title: "Personal Agenda"

    property string currTime: "00:00:00"
    property QtObject backend
    
    Rectangle {
        anchors.fill: parent
    }

        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "Images/backround.png"
            fillMode: Image.PreserveAspectCrop
        }

    Connections {
        target: backend

        function onUpdated(msg){
            currTime = msg;
        }
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
        text: currTime
        font.pixelSize: 48
        color: "White"
        }
    }
}