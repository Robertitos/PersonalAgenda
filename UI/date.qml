import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    
    visible: true
    width: 400  
    height: 600
    title: "hola"

    property QtObject backend
    
    Rectangle {
        anchors.fill: parent

        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "Images/backround.png"
            fillMode: Image.PreserveAspectCrop
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

    TextArea{
        anchors {
                bottom: parent.bottom
                bottomMargin: 72
                left: parent.left
                leftMargin: 12
                right: parent.right
                rightMargin: 12
            }
        id: txtarea 
        anchors.margins: 100
        wrapMode: TextEdit.Wrap
    }

    Rectangle{
        id: submitBtn
        width: 90
        height: 40
        color: "#9de1ed"
        Text{
            anchors.verticalCenter: parent.verticalCenter 
            anchors.horizontalCenter: parent.horizontalCenter
            text: "SUBMIT"
            font.family: "Impact"
            font.pixelSize: 24
            color: "#2c646e"
        }
        anchors{
            right: parent.right
            rightMargin: 12
            bottom: parent.bottom
            bottomMargin: 20
        }
        MouseArea {
            anchors.fill: parent
            onClicked:{
                parent.color = "Black"
            }
        }

    }
}