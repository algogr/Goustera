import QtQuick 2.0



Rectangle {
    width: parent.width
    height: parent.height
    color: mainwindow.bgcolor
//////////***************************GRID   REPLACEMENT************************************
/*
    ListModel {
        id: pageModel


        ListElement {
            title: "Αποθήκη"
            page: "Storefindata.qml"

        }

        ListElement {
            title: "Παραστατικά"
            page: "InvoiceList.qml"
            params:""
        }
        ListElement {
            title: "Υπόλοιπα"
            page: "CustomerBalance.qml"
        }
                }

    ListView{
                    model: pageModel
                    anchors.fill: parent
                    delegate: SimpleListDelegate {
                        name: title
                        color: mainwindow.fgcolor
                        onClicked:
                        {

                            stackView.push(Qt.resolvedUrl(page))

                        }
                    }
                }
                */
    Grid{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        //anchors.fill: parent
        spacing:2
        columns:parent.width/mainwindow.rectanglesize
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
                source:"images/order_new.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("Delivery.qml"))
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
                text:"Νέα Παραλαβή"
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
                source:"images/order_edit.png"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("DeliveryList.qml"))
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
                text:"Επεξεργασία παραλαβής"
                color:mainwindow.fgcolor
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter

            }

        }




    }

    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();


    }



}
