import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0
import Sqlmodel 1.0

Rectangle {
    width: parent.width
    height: parent.height
    id: parameters
    color: mainwindow.bgcolor

    property string hostname
    property string databasename
    property string username
    property string password

    property alias amodel:listview.model
    Sqlmodel {
        id: model1


        }


    //signal insert_customer()

    ListView {
        id:listview
        model: model1.getparameters()
        width:parent.width
        height:parent.height*19/20
        delegate: ParametersDelegate{
            id:dlg
            dlgheight: 58
            name: modelData.role1
            color:mainwindow.fgcolor
            value:modelData.role3
            color1: mainwindow.fgcolor


    }



}


//}
//}
    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();

        onBarclicked:
        {
            if(m1.visible==false)
                m1.visible=true
            else
                m1.visible=false
            //m1.popup()
            console.log("ΠΑΤΗΘΗΚΑ")

        }

        Rectangle{
            id:m1
            width:parent.width
            height: nv.height*3
            anchors.bottom: nv.top
            visible: false
            color: mainwindow.bgcolor

            Rectangle{

                id:b1
                color:mainwindow.bgcolor
                anchors.left: parent.left
                height:parent.height
                width:parent.width
                border.color: mainwindow.fgcolor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("ΠΑΤΗΘΗΚΑ ΠΑΡΑΜΕΤΕΡΣ"+username+":"+password)
                        m1.visible=false
                        model1.setparameters("hostname",hostname)
                        model1.setparameters("databasename",databasename)
                        model1.setparameters("username",username)
                        model1.setparameters("password",password)

                        stackView.pop()
                    }
                }
                Text{
                    id:t1
                    //anchors.top: parent.top

                    //width:parent.width
                    //height:parent.height/2
                    text: "Καταχώρηση"
                    font.bold: true
                    font.pixelSize: 25
                    //anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color:mainwindow.fgcolor

                }
                Image {
                    id:image1
                    anchors.bottom: parent.bottom
                    anchors.top:t1.bottom
                    anchors.right: parent.right

                    //anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height:parent.height/2
                    fillMode: Image.PreserveAspectFit
                    source: "images/checkin.png"


                }
            }






    }

    }










    Component.onCompleted: {

    }







}
