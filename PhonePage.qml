import QtQuick 2.0
import btphonecomponent 1.0

Item {
    id:root;
    width:1682;
    height:720;
    Image {
        id: bk
        source: "qrc:/Image/jdzh/btPhone/bk.png"
    }

    DialKeyboard{
        id:keybord;
        anchors.left: parent.left;
        anchors.leftMargin: 118;
        anchors.top: parent.top;
        anchors.topMargin: 60;
        onDial: {
            console.log("PhonePage"+strDialNumber);
            BtPhoneObj.dial(strDialNumber);
        }

    }

    ComplexListArea{
        id:complexlistarea;
        anchors.top:parent.top;
        anchors.left: keybord.right;
        anchors.leftMargin: 118;
    }


}
