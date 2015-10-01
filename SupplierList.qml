import QtQuick 2.1
import Sqlmodel 1.0
import Supplier 1.0



Rectangle {
    width: parent.width
    height: parent.height
    id: supplierlist
    color: mainwindow.bgcolor
    onActiveFocusChanged:
     {
        console.log("JIM FOCUS CHANGED")
        test.model=model.getsuppliers()
    }
    onStateChanged: {
        console.log("JIM STATUS CHANGED")
    }

    Sqlmodel {
        id: model


    Component.onCompleted: {
      model.opendb();
        list.model=model.getsuppliers()

    }

    }




    //anchors.fill: parent




    ListView {
        id:list
        model: model.getsuppliers()
        width:parent.width
        height:parent.height*19/20
        delegate: TwoColListDelegate{
            name: modelData.name
            color:mainwindow.fgcolor
            //attr1: modelData.title
            //color1:mainwindow.fgcolor
            imagevisible: false
            onClicked: selectsupplier()
            function selectsupplier(){
                mainwindow.selectedsupplier=modelData.id

                console.log("ID:"+modelData.id);
                stackView.pop(Qt.resolvedUrl("Delivery.qml"));

            }
        }
    }

    Rectangle{
        id:search
        visible:false
        focus: true
        border.color: mainwindow.bgcolor
        border.width: 10
        anchors.left: parent.left
        height:parent.height*2/15
        width: parent.width
        anchors.bottom: nv.top
        color:mainwindow.fgcolor
        TextInput
        {
            id:value
            focus:true
            visible:true
            anchors.fill: parent
            inputMethodHints: Qt.ImhUppercaseOnly

            //anchors.leftMargin: 15
            //anchors.rightMargin: 15
            anchors.margins: 15
            cursorVisible: true
            //textFormat: TextEdit.PlainText
            cursorPosition: 55

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 35

            onTextChanged: {
                model.opendb()
                list.model=model.getsuppliers(value.text)
                list.update()
            }

            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }


    }



    NavigationBar
    {
        id:nv
        onClicked: stackView.pop();
        onBarclicked:
        {
            if(search.visible==true)
            {

                search.visible=false
                return;
            }


            search.visible=true
            //m1.popup()
            value.forceActiveFocus()
            console.log("ΠΑΤΗΘΗΚΑ")

        }


    }


}
