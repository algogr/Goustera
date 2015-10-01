import QtQuick 2.3
import QtQuick.Controls 1.2
import Sqlmodel 1.0

ApplicationWindow {
    visible: true
    id:mainwindow
    width: 1000
    height: 700
    title: qsTr("Goustera")

    property string bgcolor:"#000000"
    property string fgcolor:"#FFFFFF"
    property string buttonbgcolor: "#D8D8D8"
    property string colorbuttonbgcolor: "#000000"
    property string captionfgcolor: "#33FF33"
    property string captionbgcolor: "#333333"
    property string columnlistcolor: "red"

    //property string radiobgcolor:"#92C591"

    property string selectedsupplier
    property string selecteditem
    property string selecteddelivery
    property string selectedpomeselection
    property int rectanglesize:300


Sqlmodel{
    id:model

}



    Rectangle{
        anchors.fill: parent
        color: mainwindow.bgcolor
        focus:true
        Keys.onReleased: {
            //if(event.key == Qt.Key_Back)
            //console.log(event.key)
        }

}



    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Item {
            width: parent.width
            height: parent.height
            Grid{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                //anchors.fill: parent
                spacing:2
                columns:Math.floor(parent.width/mainwindow.rectanglesize)
                Rectangle
                {
                    width: mainwindow.rectanglesize
                    height:mainwindow.rectanglesize
                    border.color: mainwindow.fgcolor
                    color:mainwindow.bgcolor
                    border.width: 2
                    radius:20

                    Image{
                        width: parent.width
                        height: parent.height*8/10
                        anchors.top: parent.top
                        source:"images/fruit.png"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            stackView.push(Qt.resolvedUrl("Deliveries.qml"))
                        }



                    }
                    Text
                    {
                        width:parent.width
                        height: parent*2/10

                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.verticalCenter: parent.verticalCenter
                        //anchors.baseline: parent.baseline
                        text:"Παραλαβή"
                        color:mainwindow.fgcolor
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter

                    }

                }

                Rectangle
                {
                    width: mainwindow.rectanglesize
                    height:mainwindow.rectanglesize
                    border.color: mainwindow.fgcolor
                    color:mainwindow.bgcolor
                    border.width: 2
                    radius:20

                    Image{
                        width: parent.width
                        height: parent.height*8/10
                        anchors.top: parent.top
                        source:"images/pallets.png"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            stackView.push(Qt.resolvedUrl("Selections.qml"))
                        }



                    }
                    Text
                    {
                        width:parent.width
                        height: parent*2/10

                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.verticalCenter: parent.verticalCenter
                        //anchors.baseline: parent.baseline
                        text:"Διαλογή"
                        color:mainwindow.fgcolor
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter

                    }

                }

                Rectangle
                {
                    width: mainwindow.rectanglesize
                    height:mainwindow.rectanglesize
                    border.color: mainwindow.fgcolor
                    color:mainwindow.bgcolor
                    border.width: 2
                    radius:20

                    Image{
                        width: parent.width
                        height: parent.height*8/10
                        anchors.top: parent.top
                        source:"images/configuration.png"
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            stackView.push(Qt.resolvedUrl("Parameters.qml"))
                        }



                    }
                    Text
                    {
                        width:parent.width
                        height: parent*2/10

                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.verticalCenter: parent.verticalCenter
                        //anchors.baseline: parent.baseline
                        text:"Εργασίες διαχειριστή"
                        color:mainwindow.fgcolor
                        font.pixelSize: 20
                        horizontalAlignment: Text.AlignHCenter

                    }

                }




            }



}
    }
    onClosing: {
            console.log("CLOSING")
           //close.accepted = false
            //mainwindow.showFullScreen()


       }



}
