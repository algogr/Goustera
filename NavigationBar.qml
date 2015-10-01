import QtQuick 2.1

Rectangle {
    id: root
    height: parent.height/15
    anchors.bottom: parent.bottom
    width: parent.width
    color: mainwindow.bgcolor
    signal clicked
    signal barclicked

    Image {
        id: arrow
        source: "./images/navigation_previous_item.png"
        anchors.left: root.left
        anchors.leftMargin: 20
        anchors.verticalCenter: root.verticalCenter
        //visible: root.currentIndex == 1 ? true : false
        MouseArea {
            id:mouse
            anchors.fill: parent
            onClicked: root.clicked()

        }

    }



    Item {
        id: textItem
        width: parent.width*8/10
        height: root.height
        anchors.right: logo.left
        anchors.left: arrow.right
        anchors.verticalCenter: root.verticalCenter
        MouseArea {

            id:mouse1
            anchors.fill: parent
            onClicked: root.barclicked()

        }
    }

    Rectangle{
        id:logo
        anchors.right: parent.right
        anchors.left: textItem.right
        Text {
            id: stocText

            anchors.verticalCenter: textItem.verticalCenter
            anchors.horizontalCenter: parent.Center
            anchors.right: qtText.left
            //color: "#ffffff"
            color: "red"
            font.family: "Abel"
            font.pointSize: 25
            text: "Gou"
            MouseArea {

                id:mouse5
                anchors.fill: parent
                onClicked: stackView.pop(0)

            }
            }

        Text {
            id: qtText
            anchors.verticalCenter: textItem.verticalCenter

            anchors.right: qtText1.left

            //color: "#5ea813"
            color:"white"
            font.family: "Abel"
            font.pointSize: 25
            text: "ste"
            MouseArea {

                id:mouse4
                anchors.fill: parent
                onClicked: stackView.pop(0)

            }
        }
        Text {
            id: qtText1
            anchors.verticalCenter: textItem.verticalCenter

            anchors.right: parent.right

            //color: "#5ea813"
            color:"green"
            font.family: "Abel"
            font.pointSize: 25
            text: "ra"
            MouseArea {

                id:mouse3
                anchors.fill: parent
                onClicked: stackView.pop(0)

            }
        }
    }



}

