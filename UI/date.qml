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
        anchors.margins: 100
        wrapMode: TextEdit.Wrap
    }
}