import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4

Window {
    visible: true
    width: 600
    height: 200
    color: "dimgray"

    Column
    {
        Row
        {
            width: parent.width
            height: parent.height * 0.5

            Rectangle
            {
                width: parent.width / 2
                height: parent.height
                color: "dimgray"
                Text
                {
                    anchors.centerIn: parent
                    text: "GUNSEL"
                    font.pixelSize: 30
                }
            }

            Rectangle
            {
                width: parent.width / 2
                height: parent.height
                color: "dimgray"

                Text
                {
                    anchors.centerIn: parent
                    text: "BMS Check-up"
                    font.pixelSize: 30
                }
            }
        }

        Row
        {
            width: parent.width
            height: parent.height * 0.25
            spacing: 6

            ValueLabels
            {
                id: current_label


                Text
                {
                    text: "Current"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ValueLabels
            {
                id: voltage_label

                Text
                {
                    text: "Voltage"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ValueLabels
            {
                id: capacity_label

                Text
                {
                    text: "Capacity"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ValueLabels
            {
                id: temp1_label

                Text
                {
                    text: "Temp1"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ValueLabels
            {
                id: temp2_label

                Text
                {
                    text: "Temp2"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ValueLabels
            {
                id: balance_label

                Text
                {
                    text: "Balance"
                    font.pixelSize: 15
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

        }

        Row
        {
            id: fields
            spacing: 6

            BlackBox
            {
                id: voltage

                Text {
                    id: current_text
                    color: "white"
                    anchors.centerIn: parent

                    text: "0"
                }
            }

            BlackBox
            {
                id: current

                Text {
                    id: voltage_text
                    color: "white"
                    anchors.centerIn: parent

                    text: "0"
                }
            }

            BlackBox
            {
                id: capacity

                Text {
                    id: capacity_text
                    color: "white"
                    anchors.centerIn: parent

                    text: "0"
                }
            }

            BlackBox
            {
                id: temp1

                Text {
                    id: temp1_text
                    color: "white"
                    anchors.centerIn: parent

                    text: "0"
                }
            }

            BlackBox
            {
                id: temp2

                Text {
                    id: temp2_text
                    color: "white"
                    anchors.centerIn: parent

                    text: "0"
                }
            }

            BlackBox
            {
                id: balance

                Text {
                    id: balance_text
                    color: "white"
                    anchors.centerIn: parent

                    text: "0"
                }
            }
        }
    }

    Item {
        property int c1: 0
        property int v: 0
        property int c2: 0
        property int t1: 0
        property int t2: 0
        property double b: 0
        focus: true

        Keys.onPressed: {
            if(event.key === Qt.Key_A) {
                Timer
                {
                    interval: 100; running: true; repeat: true  // for 100 miliseconds
                            onTriggered: c1--
                }

                current_text.text = Number(c1) + " A" }

            else if(event.key === Qt.Key_Q) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: c1++
                }
                current_text.text = Number(c1) + " A" }

            else if(event.key === Qt.Key_W) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: v++
                }
                voltage_text.text = Number(v) + " V" }

            else if(event.key === Qt.Key_S) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: v--
                }
                voltage_text.text = Number(v) + " V" }

            else if(event.key === Qt.Key_E) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: c2++
                }
                capacity_text.text = Number(c2)  + " Ah"  }

            else if(event.key === Qt.Key_D) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: c2--
                }
                capacity_text.text = Number(c2)  + " Ah"  }

            else if(event.key === Qt.Key_R) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: t1++
                }
                temp1_text.text = Number(t1)  + " C"
                b = (Math.abs(25 - t1)) + (Math.abs(25 - t2)) / 2
                balance_text.text = Number(b) }

            else if(event.key === Qt.Key_F) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: t1--
                }
                temp1_text.text = Number(t1)  + " C"
                b = (Math.abs(25 - t1)) + (Math.abs(25 - t2)) / 2
                balance_text.text = Number(b) }

            else if(event.key === Qt.Key_T) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: t2++
                }
                temp2_text.text = Number(t2)  + " C"
                b= (Math.abs(25 - t1)) + (Math.abs(25 - t2)) / 2
                balance_text.text = Number(b) }

            else if(event.key === Qt.Key_G) {
                Timer
                {
                    interval: 100; running: true; repeat: true
                            onTriggered: t2--
                }
                temp2_text.text = Number(t2)  + " C"
                b= (Math.abs(25 - t1)) + (Math.abs(25 - t2)) / 2
                balance_text.text = Number(b) }
        }


    }

}
