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

    ListModel { id: listaQuehaceres }

    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
              

        RowLayout{
            Layout.fillWidth: true
            spacing: 10
            z: 1
            TextArea {
                id: todoInputField
                placeholderText: qsTr("Escribe aqui...")
                color: "Purple"
                Layout.fillWidth: true
                Layout.preferredHeight: 40
            }
            Button {
                Layout.preferredWidth: 90
                Layout.preferredHeight: 40
                Text{
                    anchors.verticalCenter: parent.verticalCenter 
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "AÑADIR"
                    font.family: "Impact"
                    font.pixelSize: 24
                    color: "#2c646e"
                }
                background: Rectangle {
                    radius: 5
                    color: parent.down ? "#9de1ed" :
                        (parent.hovered ? "#edccde" : "#9de1ed")
                }
                onClicked: {
                   listaQuehaceres.append({ content: todoInputField.text })
                   todoInputField.text = ''
                }
            }
        }

        ListView {
            id: todoList
            model: listaQuehaceres
            Layout.fillWidth: true
            Layout.fillHeight: true
            delegate: ColumnLayout {
                width: todoList.width
                height: 40
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 15
                    TextField {
                        color: "Black"
                        background: Item {}
                        text: model.content
                        Layout.fillWidth: true
                    }
                    Button {
                        Layout.preferredHeight: 25
                        Layout.preferredWidth: 70
                        Text{
                            anchors.verticalCenter: parent.verticalCenter 
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "BORRAR"
                            font.family: "Impact"
                            font.pixelSize: 14
                            color: "#2c646e"
                        }
                        background: Rectangle {
                            radius: 5
                            color: parent.down ? "#9de1ed" :
                                (parent.hovered ? "#edccde" : "#9de1ed")
                        }
                        onClicked: listaQuehaceres.remove(model.index)
                        height: parent.height
                   }
              }
              Rectangle { color: "#2c646e"; height: 1; Layout.fillWidth: true }
             }
        }
    }
}