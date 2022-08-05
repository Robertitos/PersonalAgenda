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

        Image {
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "Images/backround.png"
            fillMode: Image.PreserveAspectCrop
        }
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

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        ListView {
            id: listview

            width: 400; height: 250
            snapMode: ListView.SnapOneItem
            orientation: ListView.Vertical
            highlightRangeMode: ListView.StrictlyEnforceRange

            model: CalendarModel {
                from: new Date(2022, 0, 1)
                to: new Date(2022, 11, 31)
            }

            delegate: MonthGrid {
                width: listview.width
                height: listview.height

                month: model.month
                year: model.year
                locale: Qt.locale("ES")
            }

            ScrollIndicator.horizontal: ScrollIndicator { }
        }
    }
}