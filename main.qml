import QtQuick
import QtQuick.Controls
import QtQuick.Window
import com.key.logger

import 'qrc:///js/encoder.js' as Encoder

Window {
    id: root
    width: 1024
    height: 700
    title: qsTr("Morse Encoder v0.0.1")
    minimumWidth: 1024
    minimumHeight: 700
    visible: true

    KeyLogger {
        id: keylogger
    }

    Rectangle {
        id: rectOut
        height: 600
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5

        Rectangle {
            id: rectMorseTable
            x: 802
            width: 580
            color: "#3300FF00"
            border.color: "black"
            border.width: 1
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0

            Image {
                id: image
                anchors.fill: parent
                source: "qrc:///images/International_Morse_Code.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectMorseOutput
            width: rectOut.width - (rectMorseTable.width + rectOut.anchors.rightMargin )
            height: rectMorseTable.height
            border.color: "black"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 0

            ScrollView {
                id: scrollView1
                anchors.fill: parent
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                TextArea {
                    id: txtMorseOutput

                    background: Rectangle {
                        color: "#3300FF00"
                    }

                    width: parent.width
                    height: parent.height
                    anchors.fill: parent
                    anchors.margins: 0

                    readOnly: true

                    font.family: "Monospace"
                    font.weight: Font.Bold
                    font.pointSize: 12
                    text: ""
                }
            }
        }
    }

    Rectangle {
        id: rectLabel
        color: "#33DDDDDD"
        width: parent.width - ( rectOut.anchors.leftMargin +  rectOut.anchors.rightMargin )
        x: rectOut.anchors.rightMargin
        y: rectOut.height + rectOut.anchors.bottomMargin

        height: 15

        Text {


            text: "Write your text here:"
            font.weight: Font.DemiBold
        }
    }

    Rectangle {
        id: rectInput
        y: 621
        height: parent.height - ( rectOut.height + rectLabel.height + rectOut.anchors.topMargin + rectOut.anchors.bottomMargin )
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        border.color: "black"
        border.width: 1

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.margins: 0
            ScrollBar.horizontal.policy: ScrollBar.AsNeeded
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            TextArea {
                function translateKey( key ) {
                     console.log( "Pressed Key:" + key);
                     keylogger.log( key );
                     txtMorseOutput.text = txtMorseOutput.text + Encoder.encode(key);
                }

                id: txtInput

                background: Rectangle {
                    color: "#3300FF00"
                }

                width: rectInput.width
                height: rectInput.height
                anchors.left: parent.left
                anchors.top: parent.top
                leftPadding: 7
                anchors.leftMargin: 0
                anchors.topMargin: 0
                focus: true
                font.weight: Font.DemiBold
                Keys.onPressed: function(event) { translateKey( event.key ); }
            }
        }
    }

}
