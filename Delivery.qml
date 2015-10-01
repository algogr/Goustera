import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import Sqlmodel 1.0
import Delivery 1.0
import QtQuick.Dialogs 1.1


ScrollView
    {
        anchors.fill: parent
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
        property date d:new Date();
        property int textpixelsize: 25
        property alias producername: producervalue.text
        property string iteid
        property string deliveryid
        property bool updatemode: false

    Rectangle{

    id:deliveryform

    width: mainwindow.width
    height: mainwindow.height+2000
    color: mainwindow.bgcolor

    onVisibleChanged: {

        producervalue.text=model.getsuppliernamebyid(mainwindow.selectedsupplier)
        fieldcodevalue.text=model.getsupplierfieldcodebyid(mainwindow.selectedsupplier)

    }

    Sqlmodel {
        id: model


    Component.onCompleted: {

        fruitvalue.model=model.getfruits("10,11","1");

        fruitvalue.textRole="description"
        producervalue.text=model.getsuppliernamebyid(mainwindow.selectedsupplier)
        fieldcodevalue.text=model.getsupplierfieldcodebyid(mainwindow.selectedsupplier)


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
    //////DATE
    Text{

        id:deliverydate
        anchors.top: fruit.bottom
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
        anchors.top: fruitvaluer.bottom

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
            onClicked: calendar.visible=true
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
                d2.setHours(deliverytimehour.value)
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
                d2.setMinutes(deliverytimeminutes.value);
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

    //////////////CAR

    Text{

        id:car
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
        text:"Αυτοκίνητο:"


    }
    Rectangle{
        id:carvaluer
        width: parent.width*1/3
        height:parent.height/20
        anchors.top: producervaluer.bottom

        anchors.topMargin: 10
        anchors.left: fruit.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:carvalue
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
                carvalue.text=carvalue.text.toUpperCase();
            }


        }

}

    //////FIELDCODE
    //////////////CAR

    Text{

        id:fieldcode
        anchors.top: car.bottom
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
        anchors.top: carvaluer.bottom

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
        anchors.left: fruit.right
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
                netweightvalue.text=grossweightvalue.text-deadweightvalue.text;
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

    //////////////NETWEIGHT

    Text{

        id:netweight
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
        text:"Καθ.Βάρος(Φ+Σ)(Kg):"


    }
    Rectangle{
        id:netweightvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: deadweightvaluer.bottom

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

    //////////////NETWEIGHTFRUIT

    Text{

        id:netweightfruit
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
        text:"Καθ.Βάρος(Φ)(Kg):"


    }
    Rectangle{
        id:netweightfruitvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: netweightvaluer.bottom

        anchors.topMargin: 10
        anchors.left: netweightfruit.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:netweightfruitvalue
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


    //////////////BINS

    Text{

        id:bins
        anchors.top: netweightfruit.bottom
        anchors.topMargin: 40
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Bins:"


    }
    Rectangle{
        id:binsvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: netweightfruitvaluer.bottom

        anchors.topMargin: 40
        anchors.left: bins.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:binsvalue
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
            validator:  IntValidator{bottom: 0; top: 100;}


        }

}


    //////////////PALLETS

    Text{

        id:pallets
        anchors.top: bins.bottom
        anchors.topMargin: 10
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Παλέτες:"


    }
    Rectangle{
        id:palletsvaluer
        width: parent.width*1/6
        height:parent.height/20
        anchors.top: binsvaluer.bottom

        anchors.topMargin: 10
        anchors.left: pallets.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:palletsvalue
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
            validator:  IntValidator{bottom: 0; top: 100;}


        }

}


    //////////////TELARA

    Text{

        id:telara
        anchors.top: pallets.bottom
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
        anchors.top: palletsvaluer.bottom

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
            validator:  IntValidator{bottom: 0; top: 100;}


        }

}


    //////////////INSPECTOR

    Text{

        id:inspector
        anchors.top: telara.bottom
        anchors.topMargin: 40
        font.bold: true
        font.pixelSize: textpixelsize
        width:parent.width/3

        height:parent.height/20

        anchors.left: parent.left
        anchors.leftMargin: 1

        color:mainwindow.fgcolor
        wrapMode: Text.Wrap
        text:"Παραλαβών:"


    }
    Rectangle{
        id:inspectorvaluer
        width: parent.width*3/6
        height:parent.height/20
        anchors.top: telaravaluer.bottom

        anchors.topMargin: 40
        anchors.left: inspector.right
        //anchors.right: parent.right
        //anchors.rightMargin: 20
          //anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        //color:mainwindow.bgcolor
        color:mainwindow.fgcolor
        border.color: mainwindow.buttonbgcolor
        TextInput
        {
            id:inspectorvalue
            visible:true
            anchors.fill: parent
            cursorVisible: true


            //textFormat: TextEdit.PlainText
            cursorPosition: 35
            focus: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            horizontalAlignment: TextEdit.AlignLeft
            ///validator:  IntValidator{bottom: 0; top: 100;}
            onTextChanged: {
                inspectorvalue.text=inspectorvalue.text.toUpperCase();
            }


        }

}
    //////////////COMMENTS

    Text{

        id:comments
        anchors.top: inspector.bottom
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
        anchors.top: inspectorvaluer.bottom

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
                comments.text=comments.text.toUpperCase();
            }


        }

}

    Delivery{
        id:deliveryobj
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
                deliveryobj.setIteid(iteid);
                deliveryobj.setSupid(mainwindow.selectedsupplier);
                deliveryobj.setCar(carvalue.text)

                if(grossweightvalue.text=="")
                    deliveryobj.setGrossweight("0");
                else
                    deliveryobj.setGrossweight(grossweightvalue.text);

                if (deadweightvalue.text=="")
                    deliveryobj.setDeadweight("0");
                else
                    deliveryobj.setDeadweight(deadweightvalue.text);

                if (netweightvalue.text=="")
                    deliveryobj.setNetweight("0");
                else
                    deliveryobj.setNetweight(netweightvalue.text);
                if (netweightfruitvalue.text=="")
                    deliveryobj.setNetfruitweight("0");
                else
                    deliveryobj.setNetfruitweight(netweightfruitvalue.text);

                if (telaravalue.text=="")
                    deliveryobj.setTelara("0");
                else
                    deliveryobj.setTelara(telaravalue.text);

                if (binsvalue.text=="")
                    deliveryobj.setBins("0");
                else
                    deliveryobj.setBins(binsvalue.text);

                if (palletsvalue.text=="")
                    deliveryobj.setPallets("0");
                else
                    deliveryobj.setPallets(palletsvalue.text);

                var datef=d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDate()+' '+d.getHours()+':'+d.getMinutes()+':'+d.getSeconds()
                deliveryobj.setDeliverydate(datef);
                deliveryobj.setInspector(inspectorvalue.text);
                deliveryobj.setFieldcode(fieldcodevalue.text);
                deliveryobj.setComments(commentsvalue.text)
                if (updatemode==0)
                    model.insertdelivery(deliveryobj);
                else
                {
                    deliveryobj.setId(mainwindow.selecteddelivery);
                    model.updatedelivery(deliveryobj)
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
            iconSource: "images/android-delete.png"
            onClicked: {
                button2.enabled=false
                if (updatemode==false)
                {
                    messageDialog1.title="Ακύρωση παραλαβής"
                    messageDialog1.text="Είσαι σίγουρος πως θέλεις να ακυρώσεις τη παραλαβή"
                    messageDialog1.visible=true
                }
                else
                {
                    messageDialog1.title="Διαγραφή παραλαβής"
                    messageDialog1.text="Είσαι σίγουρος πως θέλεις να διαγράψετε τη παραλαβήδιαλογή"
                    messageDialog1.visible=true

                }

                button2.enabled=false

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
                model.deletedelivery(deliveryid);
                stackView.pop();
            }

            messageDialog1.visible=false

        }
        onNo: {
            messageDialog1.visible=false
        }


    }

    Component.onCompleted:
    {
            if(updatemode==1)
            {
                var delivery=model.getdeliverybyid(deliveryid);
                mainwindow.selecteditem=delivery.iteid;
                mainwindow.selectedsupplier=delivery.supid;
                fruitvalue.find(model.getitemdescriptionbyid(delivery.iteid));
                producervalue.text=model.getsuppliernamebyid(mainwindow.selectedcustomer);
                carvalue.text=delivery.car;
                grossweightvalue.text=delivery.grossweight;
                deadweightvalue.text=delivery.deadweight;
                netweightvalue.text=delivery.netweight;
                netweightfruitvalue.text=delivery.netfruitweight;
                var d3=new Date(delivery.deliverydate);


                var d2=new Date(delivery.deliverydate+" GMT+0"+d3.getTimezoneOffset()/60*(-1)+"00");
                d=d2;
                binsvalue.text=delivery.bins;
                palletsvalue.text=delivery.pallets;
                telaravalue.text=delivery.telara;
                inspectorvalue.text=delivery.inspector;
                fieldcodevalue.text=delivery.fieldcode;
                commentsvalue.text=delivery.comments;
                button1.iconSource="images/android-edit-image.png"

            }

    }

}



}




