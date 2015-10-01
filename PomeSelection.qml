import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import Sqlmodel 1.0
import Delivery 1.0
import Pomeselection 1.0
import QtQuick.Dialogs 1.1


ScrollView
    {
        id:scroll
        anchors.fill: parent
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        property date d:new Date();
        property int textpixelsize: 25
        property alias producername: producervalue.text
        property string iteid
        property string ispackage: '0'
        property string pomeselectionid
        property string selectiontypeid
        property bool updatemode: false

    Rectangle{

    id:selectionform

    width: mainwindow.width
    height: mainwindow.height+700
    color: mainwindow.bgcolor

    onVisibleChanged: {

        producervalue.text=model.getsuppliernamebyid(mainwindow.selectedsupplier)
        fieldcodevalue.text=model.getsupplierfieldcodebyid(mainwindow.selectedsupplier)


    }

    Sqlmodel {
        id: model


    Component.onCompleted: {

        fruitvalue.model=model.getfruits("11","1");
        fruitvalue.textRole="description";
        selectvalue.model=model.getpomeselectiontypes();
        selectvalue.textRole="role2";
        producervalue.text=model.getsuppliernamebyid(mainwindow.selectedsupplier)
        fieldcodevalue.text=model.getsupplierfieldcodebyid(mainwindow.selectedsupplier)
        if(updatemode==true)
            button2.visible=false;




    }




    }

    //////FROYTO

    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:fruit
        anchors.top: parent.top
        anchors.topMargin: 50
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Φρούτο:"


    }
    Rectangle{
        id:fruitvaluer
        width: parent.width*2/3
        height:parent.height/20
        anchors.top: parent.top

        anchors.topMargin: 50
        anchors.left: fruit.right
        anchors.right: parent.right
        anchors.rightMargin: 20

        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        ComboBox
        {
            id:fruitvalue
            visible:true
            anchors.fill: parent


            //textFormat: TextEdit.PlainText

            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }

        }

}
    ///DIALOGH

    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:select
        anchors.top: fruit.bottom
        anchors.topMargin: 50
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Διαλογή:"


    }
    Rectangle{
        id:selectvaluer
        width: parent.width*2/3
        height:parent.height/20
        anchors.top: fruitvaluer.bottom

        anchors.topMargin: 50
        anchors.left: select.right
        anchors.right: parent.right
        anchors.rightMargin: 20

        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        ComboBox
        {
            id:selectvalue
            visible:true
            anchors.fill: parent


            //textFormat: TextEdit.PlainText

            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }

        }

}


    //////DATE
    Text{

        id:deliverydate
        anchors.top: select.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Ημερομηνία:"


    }

    Rectangle{
        id:deliverydatetvaluer
        width: parent.width*2/3
        height:parent.height/20
        anchors.top: selectvaluer.bottom

        anchors.topMargin: 10
        anchors.left: deliverydate.right
        anchors.right: parent.right
        anchors.rightMargin: 1
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.bgcolor
        //border.color: mainwindow.buttonbgcolor
        Text
        {
            id:deliverydatevalue
            visible:true
            anchors.left: parent.left
            width: parent.width*1/3
            color: mainwindow.fgcolor
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 35
            //var d:new Date();
            text:d.getDate()+"-"+(d.getMonth()+1)+"-"+d.getFullYear()
            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }
        Button
        {
            Image{

                width: parent.width
                height: parent.height
                anchors.top: parent.top
                source: "images/Calendar.ico"
                //fillMode: Image.
            }

            //iconSource: "images/Calendar.ico"

            anchors.left: deliverydatevalue.right
            anchors.leftMargin: 100
            //anchors.right: parent.right
            width: 50
            height:50
            onClicked: {

                calendar.visible=true
                calendar.focus=true

            }
        }

}
    Calendar{
        id:calendar
        width:350
        height:350
        z:100
        x: deliverydatetvaluer.x
        y: deliverydatetvaluer.y
        visible: false
        style: CalendarStyle {
                gridVisible: false
                dayDelegate: Rectangle {
                    gradient: Gradient {
                        GradientStop {
                            position: 0.00
                            color: styleData.selected ? "#111" : (styleData.visibleMonth && styleData.valid ? "#444" : "#666");
                        }
                        GradientStop {
                            position: 1.00
                            color: styleData.selected ? "#444" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                        }
                        GradientStop {
                            position: 1.00
                            color: styleData.selected ? "#777" : (styleData.visibleMonth && styleData.valid ? "#111" : "#666");
                        }
                    }

                    Label {
                        text: styleData.date.getDate()
                        anchors.centerIn: parent
                        color: styleData.valid ? "white" : "grey"
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "#555"
                        anchors.bottom: parent.bottom
                    }

                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "#555"
                        anchors.right: parent.right
                    }
                }
            }


        onReleased: {
            d=date;
            calendar.visible=false;

        }
    }


    /////////ORA

    Text{

        //anchors.top: parent.top

        //width:parent.width
        //height:parent.height/2
        id:deliverytime
        anchors.top: deliverydate.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Ώρα:"


    }

    Rectangle{
        id:deliverytimevaluer
        width: parent.width*2/3
        height:parent.height/20
        anchors.top: deliverydatetvaluer.bottom

        anchors.topMargin: 10
        anchors.left: deliverytime.right
        anchors.right: parent.right
        anchors.rightMargin: 1
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.bgcolor


        SpinBox{
            id:deliverytimehour
            width: 75
            height:60
            anchors.top: parent.top
            anchors.left: parent.left
            font.pixelSize: 25
            value: d.getHours().toString()
            minimumValue: 0
            maximumValue: 23
            prefix: {
                if (deliverytimehour.value<10)
                    "0";
                else
                    "";
            }

            onValueChanged: {

                var d2=new Date(d);
                console.log(d2)
                d2.setHours(deliverytimehour.value);
                d=d2;

            }
            style: SpinBoxStyle{
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 20
                        border.color: "gray"
                        radius: 2
                    }
                }

        }

        SpinBox{
            id:deliverytimeminutes
            width: 75
            height:60
            anchors.top: parent.top
            anchors.leftMargin: 25
            anchors.left: deliverytimehour.right
            font.pixelSize: 25
            value: d.getMinutes()
            minimumValue: 00
            maximumValue: 59
            prefix: {
                if (deliverytimeminutes.value<10)
                    "0";
                else
                    "";
            }
            onValueChanged: {
                var d2=new Date(d);
                d2.setMinutes(deliverytimeminutes.value)
                d=d2;

            }
            style: SpinBoxStyle{
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 20
                        border.color: "gray"
                        radius: 2
                    }
                }
        }


}

    //////////////PARAGOGOS

    Text{

        id:producer
        anchors.top: deliverytime.bottom
        anchors.topMargin: 40
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Παραγωγός:"


    }
    Rectangle{
        id:producervaluer
        width: parent.width/3
        height:parent.height/20
        anchors.top: deliverytimevaluer.bottom

        anchors.topMargin: 40
        anchors.left: producer.right
        //anchors.right: parent.right
        anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.bgcolor
        //border.color: mainwindow.buttonbgcolor
        Text
        {
            id:producervalue
            visible:true
            anchors.fill: parent
            text: model.getsuppliernamebyid(mainwindow.selectedsupplier)

            //textFormat: TextEdit.PlainText

            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            color: mainwindow.fgcolor
            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }


        }
        Button
        {
            Image{

                width: parent.width
                height: parent.height
                anchors.top: parent.top
                source: "images/farmer.png"
                //fillMode: Image.
            }
            //iconSource: "images/farmer.png"
            anchors.left: producervaluer.right
            anchors.leftMargin: 100
            //anchors.right: parent.right
            width: 50
            height:50
            onClicked: stackView.push(Qt.resolvedUrl("SupplierList.qml"))
        }



}





    //////FIELDCODE


    Text{

        id:fieldcode
        anchors.top: producer.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Κωδικός Παραγωγού:"


    }
    Rectangle{
        id:fieldcodevaluer
        width: parent.width*1/3
        height:parent.height/20
        anchors.top: producervaluer.bottom

        anchors.topMargin: 10
        anchors.left: fieldcode.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:fieldcodevalue
            visible:true
            anchors.fill: parent
            cursorVisible: true

            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            //horizontalAlignment: TextEdit.AlignLeft
            //validator: DoubleValidator{bottom: -5.0; top: 5.0; decimals: 1; notation: DoubleValidator.StandardNotation }
            onTextChanged: {
                fieldcodevalue.text=fieldcodevalue.text.toUpperCase();
            }



        }

}


    //////////////GROSSWEIGHT

    Text{

        id:grossweight
        anchors.top: fieldcode.bottom
        anchors.topMargin: 40
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Μικτό Βάρος(Kg):"


    }
    Rectangle{
        id:grossweightvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: fieldcodevaluer.bottom

        anchors.topMargin: 40
        anchors.left: grossweight.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:grossweightvalue
            visible:true
            anchors.fill: parent
            cursorVisible: true
            inputMethodHints: Qt.ImhFormattedNumbersOnly

            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: TextEdit.AlignRight
            validator:  IntValidator{bottom: 0; top: 10000;}
            onTextChanged: {
                netweightvalue.text=grossweightvalue.text
            }

        }

}

    //////////////DEADWEIGHT

    Text{

        id:deadweight
        anchors.top: grossweight.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Απόβαρο(Kg):"


    }
    Rectangle{
        id:deadweightvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: grossweightvaluer.bottom

        anchors.topMargin: 10
        anchors.left: deadweight.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:deadweightvalue
            visible:true
            anchors.fill: parent
            cursorVisible: true

            inputMethodHints: Qt.ImhFormattedNumbersOnly
            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: TextEdit.AlignRight
            validator:  IntValidator{bottom: 0; top: 10000;}
            onTextChanged: {
                netweightvalue.text=grossweightvalue.text-deadweightvalue.text;
            }

        }

}


    //////////////telara

    Text{

        id:telara
        anchors.top: deadweight.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Τελάρα:"


    }
    Rectangle{
        id:telaravaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: deadweightvaluer.bottom

        anchors.topMargin: 10
        anchors.left: telara.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:telaravalue
            visible:true
            anchors.fill: parent
            cursorVisible: true

            inputMethodHints: Qt.ImhFormattedNumbersOnly
            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: TextEdit.AlignRight
            validator:  IntValidator{bottom: 0; top: 10000;}


        }

}

    //////////////NETWEIGHT

    Text{

        id:netweight
        anchors.top: telara.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Καθ.Βάρος(Kg):"


    }
    Rectangle{
        id:netweightvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: telaravaluer.bottom

        anchors.topMargin: 10
        anchors.left: netweight.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:netweightvalue
            visible:true
            anchors.fill: parent
            cursorVisible: true

            inputMethodHints: Qt.ImhFormattedNumbersOnly
            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: TextEdit.AlignRight
            validator:  IntValidator{bottom: 0; top: 10000;}


        }

}
    ////ISPACKAGE
    Text{

        id:ispackage
        anchors.top: netweight.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Συσκευασμένα:"


    }

    Rectangle{
        id:ispackagevaluer
        anchors.top:netweightvaluer.bottom
        anchors.topMargin: 15
        width:parent.width/3
        anchors.left: ispackage.right
        height:parent.height/20
        color:mainwindow.bgcolor

    CheckBox{
        id:ispackagevalue
        //text: "Συσκευασμένα:"
        anchors.leftMargin: 5
        anchors.fill: parent
        checked: false
        style: CheckBoxStyle {
                indicator: Rectangle {
                        implicitWidth: 36
                        implicitHeight: 36
                        radius: 3
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            visible: control.checked
                            color: "#555"
                            border.color: "#333"
                            radius: 1
                            anchors.margins: 4
                            anchors.fill: parent
                        }
                }
            }

        onCheckedChanged: checkchanged()
        function checkchanged()
        {
            console.log("PAT")
            if (checked==true)
            {
                 scroll.ispackage="1"
                 console.log(scroll.ispackage)
            }
            else
            {
                scroll.ispackage="0"
                console.log(scroll.ispackage)
            }
        }

    }

    }


    //////////////COMMENTS

    Text{

        id:comments
        anchors.top: ispackagevaluer.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Σχόλια:"


    }
    Rectangle{
        id:commentsvaluer
        width: parent.width*4/6
        height:parent.height*3/20
        anchors.top: ispackagevaluer.bottom

        anchors.topMargin: 10
        anchors.left: comments.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:commentsvalue
            visible:true
            anchors.fill: parent
            cursorVisible: true
            //inputMethodHints: Qt.ImhFormattedNumbersOnly

            //textFormat: TextEdit.PlainText
            cursorPosition: 5
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: TextEdit.AlignLeft
            wrapMode: TextEdit.WordWrap
            //validator:  IntValidator{bottom: 0; top: 10000;}
            onTextChanged: {
                commentsvalue.text=commentsvalue.text.toUpperCase();
            }


        }

}



    Pomeselection{
        id:pomeselectionobj
    }


    Row
    {
        anchors.topMargin: 25
        anchors.top: commentsvaluer.bottom
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        Button{
            id:button1
            width:250
            height:70
            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
            //text:"Καταχώρηση"
            iconSource: "images/android-add-image.png"
            /*
            Image {

                source: "images/android-add-image.png"
            }
            */
            onClicked: {
                button1.enabled=false
                if(mainwindow.selectedsupplier=="")
                {
                    messageDialog.visible=true;
                    return;
                }

                iteid=model.getitemidbydescr(fruitvalue.currentText);
                selectiontypeid=model.getselectiontypebydescr(selectvalue.currentText,1);
                pomeselectionobj.setPomeseltypeid(selectiontypeid);
                pomeselectionobj.setIteid(iteid);
                pomeselectionobj.setSupid(mainwindow.selectedsupplier);
                if(grossweightvalue.text=="")
                    pomeselectionobj.setGrossweight("0");
                else
                    pomeselectionobj.setGrossweight(grossweightvalue.text);


                if (netweightvalue.text=="")
                    pomeselectionobj.setNetweight("0");
                else
                    pomeselectionobj.setNetweight(netweightvalue.text);


                if (telaravalue.text=="")
                    pomeselectionobj.setTelara("0");
                else
                    pomeselectionobj.setTelara(telaravalue.text);


                var datef=d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate()+' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()
                pomeselectionobj.setSdate(datef);
                pomeselectionobj.setComments(commentsvalue.text);
                pomeselectionobj.setFieldcode(fieldcodevalue.text);
                if (deadweightvalue.text=="")
                    pomeselectionobj.setDeadweight("0")
                else
                    pomeselectionobj.setDeadweight(deadweightvalue.text);

                pomeselectionobj.setIspackage(scroll.ispackage);
                console.log("fieldcode")+fieldcodevalue.text

                console.log("ISPACKAGE:")+scroll.ispackage;
                if (updatemode==0)
                    model.insertpomeselection(pomeselectionobj);
                else
                {
                    pomeselectionobj.setId(pomeselectionid);
                    model.updatepomeselection(pomeselectionobj);
                }
                button1.enabled=true
                stackView.pop();
            }
        }

        Button{
            id:button2
            width:250
            height:70
            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
            //text:"Καταχώρηση"
            iconSource: "images/recycle.png"
            onClicked: {
                button2.enabled=false
                if(mainwindow.selectedsupplier=="")
                {
                    messageDialog.visible=true;
                    return;
                }

                iteid=model.getitemidbydescr(fruitvalue.currentText);
                selectiontypeid=model.getselectiontypebydescr(selectvalue.currentText,1);
                pomeselectionobj.setPomeseltypeid(selectiontypeid);
                pomeselectionobj.setIteid(iteid);
                pomeselectionobj.setSupid(mainwindow.selectedsupplier);
                if(grossweightvalue.text=="")
                    pomeselectionobj.setGrossweight("0");
                else
                    pomeselectionobj.setGrossweight(grossweightvalue.text);


                if (netweightvalue.text=="")
                    pomeselectionobj.setNetweight("0");
                else
                    pomeselectionobj.setNetweight(netweightvalue.text);


                if (telaravalue.text=="")
                    pomeselectionobj.setTelara("0");
                else
                    pomeselectionobj.setTelara(telaravalue.text);


                var datef=d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate()+' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()
                pomeselectionobj.setSdate(datef);
                pomeselectionobj.setComments(commentsvalue.text);
                pomeselectionobj.setFieldcode(fieldcodevalue.text);
                pomeselectionobj.setDeadweight(deadweightvalue.text);
                pomeselectionobj.setIspackage(scroll.ispackage);
                console.log("fieldcode")+fieldcodevalue.text
                //console.log("pallettype")+pallettypevalue.text
                console.log("ISPACKAGE:")+scroll.ispackage;
                if (updatemode==0)
                    model.insertpomeselection(pomeselectionobj);
                else
                {
                    pomeselectionobj.setId(pomeselectionid);
                    model.updatepomeselection(pomeselectionobj);
                }

                grossweightvalue.text="0";
                deadweightvalue.text="0";
                telaravalue.text="0";
                netweightvalue.text="0";
                ispackagevalue.checked=false
                commentsvalue.text="";
                button2.enabled=true


            }

    }

        Button{
            id:button3
            width:250
            height:70
            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "#888"
                        radius: 4
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                            GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                        }
                    }
                }
            //text:"Καταχώρηση"
            iconSource: "images/android-delete.png"
            onClicked: {
                button3.enabled=false
                if (updatemode==false)
                {
                    messageDialog1.title="Ακύρωση διαλογής"
                    messageDialog1.text="Είσαι σίγουρος πως θέλεις να ακυρώσεις τη διαλογή"
                    messageDialog1.visible=true
                }
                else
                {
                    messageDialog1.title="Διαγραφή διαλογής"
                    messageDialog1.text="Είσαι σίγουρος πως θέλεις να διαγράψετε τη διαλογή"
                    messageDialog1.visible=true

                }

                button3.enabled=false
            }

    }



}

    MessageDialog {

        id: messageDialog
        title: "Έλεγχος στοιχείων"

        text: "Δεν δώσατε παραγωγό"
        visible: false
        standardButtons: StandardButton.Ok
        onAccepted: messageDialog.close()



}
    MessageDialog {

        id: messageDialog1
        //title: "Έλεγχος στοιχείων"

        //text: "Δεν δώσατε παραγωγό"
        visible: false
        standardButtons: StandardButton.Yes | StandardButton.No
        onYes: {
            if(updatemode==false)
                stackView.pop();

            else
            {
                model.deletepomeselection(pomeselectionid);
                stackView.pop();
            }

            messageDialog1.visible=false

        }
        onNo: {
            messageDialog1.visible=false
        }



}
    }

    Component.onCompleted:
    {

            if(updatemode==1)
            {
                console.log("UPDATE");

                var pomeselection=model.getpomeselectionbyid(pomeselectionid);
                mainwindow.selecteditem=pomeselection.iteid;
                mainwindow.selectedsupplier=pomeselection.supid;
                fruitvalue.find(model.getitemdescriptionbyid(pomeselection.iteid));
                selectvalue.find(model.getselectiontypebyid(pomeselection.pomeseltypeid,1))
                producervalue.text=model.getsuppliernamebyid(mainwindow.selectedcustomer);
                grossweightvalue.text=pomeselection.grossweight;
                netweightvalue.text=pomeselection.netweight;
                var d3=new Date(delivery.deliverydate);


                var d2=new Date(delivery.deliverydate+" GMT+0"+d3.getTimezoneOffset()/60*(-1)+"00");
                d=d2;
                telaravalue.text=pomeselection.telara;
                commentsvalue.text=pomeselection.comments;
                fieldcodevalue.text=pomeselection.fieldcode;
                deadweightvalue.text=pomeselection.deadweight;
                if ((pomeselection.ispackage)==0)
                    ispackagevalue.checked=false;
                else
                    ispackagevalue.checked=true;
                button1.iconSource="images/android-edit-image.png"

            }

    }

}








