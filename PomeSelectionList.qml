import QtQuick 2.1
import Sqlmodel 1.0
import Delivery 1.0



Rectangle {
    width: parent.width
    height: parent.height
    id: pomeselectionlist
    color: mainwindow.bgcolor
    onVisibleChanged: {
        list.model= model.getpomeselectionlist();
    }

    onActiveFocusChanged:
     {
        console.log("JIM FOCUS CHANGED")
        //test.model=model.getdeliverylist()
    }
    onStateChanged: {
        console.log("JIM STATUS CHANGED")
    }

    Sqlmodel {
        id: model


    Component.onCompleted: {
      model.opendb();
        list.model=model.getpomeselectionlist()

    }

    }




    //anchors.fill: parent




    ListView {
        id:list
        model: model.getpomeselectionlist()
        width:parent.width
        height:parent.height*19/20
        delegate: ThreeColListDelegate{
            name: modelData.role2
            color:mainwindow.fgcolor
            widthdivisor: 3
            attr1: modelData.role3
            color1:mainwindow.fgcolor
            widthdivisor1: 3
            attr2: modelData.role4
            color2:mainwindow.fgcolor
            halign2: Text.AlignRight
            widthdivisor2: 5
            onClicked: selectpomeselection()
            function selectpomeselection(){

                mainwindow.selectedpomeselection=modelData.role1

                console.log("ID:"+modelData.role);
                stackView.push(Qt.resolvedUrl("PomeSelection.qml"),{pomeselectionid:modelData.role1,updatemode:true});

            }
        }
    }




    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();



}
}
