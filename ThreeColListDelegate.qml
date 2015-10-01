import QtQuick 2.1

Item {
    id: root
    width: parent.width
    height: 88
    property alias name: textitem.text
    property alias color: textitem.color
    property int widthdivisor
    property alias attr1: textitem1.text
    property alias color1: textitem1.color
    property alias halign1: textitem1.horizontalAlignment
    property int widthdivisor1
    property alias attr2: textitem2.text
    property alias color2: textitem2.color
    property alias halign2: textitem2.horizontalAlignment
    property int widthdivisor2
    signal clicked

    Rectangle {
        anchors.fill: parent
        color: mainwindow.bgcolor
        visible: mouse.pressed
    }

    Text {
        id: textitem
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/30
        width:parent.width/widthdivisor
        text: modelData
        elide: Text.ElideRight
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: textitem1.left
        //anchors.right: textitem1.left
        anchors.leftMargin: 30
    }

    Text {
        id: textitem1
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/30
        width:parent.width/widthdivisor1
        text: modelData
        elide: Text.ElideRight
        ///horizontalAlignment: Text.AlignRight
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: textitem.right
        anchors.right: textitem2.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10
    }

    Text {
        id: textitem2
        //color: mainwindow.fgcolor
        font.pixelSize: parent.width/30
        width:parent.width/widthdivisor2
        text: modelData
        //horizontalAlignment: Text.AlignRight
        anchors.verticalCenter: parent.verticalCenter
        //anchors.left: textitem1.right
        anchors.right: img.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10

    }

    Rectangle {
        id: sep
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 15
        height: 1
        color: mainwindow.bgcolor
    }

    Image {
        id:img
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        source: "images/general/navigation_next_item.png"

    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: root.clicked()


    }
}
