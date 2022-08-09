import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
    id: control
    implicitWidth: 400
    implicitHeight: 500
    color: "transparent"
    border.color: "transparent"

    property alias font: month_grid.font
    property alias locale: month_grid.locale
    property date selectDate: new Date()
    // botones
    component CalendarButton : AbstractButton {
        id: c_btn
        implicitWidth: 30
        implicitHeight: 30
        contentItem: Text {
            font: control.font
            text: c_btn.text
            color: "black"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        background: Item{}
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 2
        columns: 2
        rows: 3
        columnSpacing: 1
        rowSpacing: 1

        Rectangle {
            implicitWidth: 30
            implicitHeight: 40
            color: "transparent"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // resetea fecha
                    let cur_date=new Date();
                    month_grid.year=cur_date.getUTCFullYear();
                    month_grid.month=cur_date.getUTCMonth();
                }
            }
        }

        Rectangle {
            Layout.row: 0
            Layout.column: 1
            Layout.fillWidth: true
            implicitHeight: 40
            color: "transparent"
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                CalendarButton {
                    text: "<"
                    onClicked: {
                        month_grid.year-=1;
                    }
                }
                Text {
                    font: control.font
                    color: "black"
                    text: month_grid.year
                }
                CalendarButton {
                    text: ">"
                    onClicked: {
                        month_grid.year+=1;
                    }
                }
                Item {
                    implicitWidth: 20
                }
                CalendarButton {
                    text: "<"
                    onClicked: {
                        if(month_grid.month===0){
                            month_grid.year-=1;
                            month_grid.month=11;
                        }else{
                            month_grid.month-=1;
                        }
                    }
                }
                Text {
                    font: control.font
                    color: "black"
                    text: month_grid.month+1
                }
                CalendarButton {
                    text: ">"
                    onClicked: {
                        if(month_grid.month===11){
                            month_grid.year+=1;
                            month_grid.month=0;
                        }else{
                            month_grid.month+=1;
                        }
                    }
                }
            }
        }

        Rectangle {
            implicitWidth: 30
            implicitHeight: 40
            color: "transparent"
        }

        // semana 1-7
        DayOfWeekRow {
            id: week_row
            Layout.row: 1
            Layout.column: 1
            Layout.fillWidth: true
            implicitHeight: 40
            spacing: 1
            topPadding: 0
            bottomPadding: 0
            font: control.font
            locale: control.locale
            delegate: Text {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: shortName
                font: week_row.font
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                required property string shortName
            }
            contentItem: Rectangle {
                color: "transparent"
                border.color: "transparent"
                RowLayout {
                    anchors.fill: parent
                    spacing: week_row.spacing
                    Repeater {
                        model: week_row.source
                        delegate: week_row.delegate
                    }
                }
            }
        }

        // numero de semanas en la izquierda
        WeekNumberColumn {
            id: week_col
            Layout.row: 2
            Layout.fillHeight: true
            implicitWidth: 30
            spacing: 1
            leftPadding: 0
            rightPadding: 0
            font: control.font
            month: month_grid.month
            year: month_grid.year
            locale: control.locale
            delegate: Text {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: weekNumber
                font: week_col.font
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                required property int weekNumber
            }
            contentItem: Rectangle {
                color: "transparent"
                border.color: "transparent"
                ColumnLayout {
                    anchors.fill: parent
                    spacing: week_col.spacing
                    Repeater {
                        model: week_col.source
                        delegate: week_col.delegate
                    }
                }
            }
        }

         
        MonthGrid {
            id: month_grid
            Layout.fillWidth: true
            Layout.fillHeight: true

            locale: Qt.locale("ES")
            spacing: 1
            font{
                family: "Arial"
                pixelSize: 14
            }
            delegate: Rectangle {
                color: model.today
                       ?"#9de1ed" //fecha hoy
                       :control.selectDate.valueOf()===model.date.valueOf()
                         ?"#edccde" // fecha seleccionada
                         :"transparent"
                border.color: "transparent"
                border.width: 1
                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 2
                    color: "transparent"
                    border.color: "transparent"
                    visible: item_mouse.containsMouse
                }
                Text {
                    anchors.centerIn: parent
                    text: model.day
                    color: model.month===month_grid.month?"purple":"black"
                }
                MouseArea {
                    id: item_mouse
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                }
            }
            onClicked: (date)=> {
                           control.selectDate=date;
                           console.log(date.getUTCDate(), month_grid.title)

                            var component = Qt.createComponent("date.qml");
                            var asdf = component.createObject(month_grid);
                            asdf.show();
                       }
        }
    }
}
}