import QtQuick 2.0
import btphonecomponent 1.0

Item {
    width: 826;
    height: 588;

    signal btSetBtnClicked();

    Image {
        id: btUnConnected;
        source: BtPhoneObj.bIsBtConnected?"qrc:/Image/jdzh/btPhone/btConnected.png":
                                           "qrc:/Image/jdzh/btPhone/btUnConect.png";
//        source: "qrc:/Image/jdzh/btPhone/btUnConect.png";
        anchors.left: parent.left;
        anchors.leftMargin: 106;
        anchors.top: parent.top;
        anchors.topMargin: 101;
    }
    Text {
        id: btUnConnectedText;
        text: "蓝牙未连接";
        font.pixelSize: 30;
        color: "#A1A1A1";
        anchors.left: btUnConnected.left;
        anchors.leftMargin: 230;
        anchors.top: btUnConnected.top;
        anchors.bottomMargin: -18;
        visible: !BtPhoneObj.bIsBtConnected;
    }
    Text {
        id: devName;
        width: 290;
        text: BtPhoneObj.strDevName;
        font.pixelSize: 28;
        color: "#A1A1A1";
        anchors.left: btUnConnected.left;
        anchors.leftMargin: 388;
        anchors.top: btUnConnected.bottom;
        anchors.topMargin: 15;
        elide: Text.ElideRight;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
    }
    Image {
        property bool bBtnPressed: false;
        id: btnBtSet;
        source: btnBtSet.bBtnPressed ? "qrc:/Image/jdzh/btPhone/btSetBtnBkP.png":
                              "qrc:/Image/jdzh/btPhone/btSetBtnBk.png";
        anchors.horizontalCenter: btUnConnectedText.horizontalCenter;
        anchors.top: btUnConnected.bottom;
        anchors.topMargin: 72;
        Text {
            text: qsTr("蓝牙设置");
            font.pixelSize: 36;
            color: "#242424";
            anchors.centerIn: parent;
        }

        MouseArea{
            anchors.fill: parent;
            onPressed: {
                btnBtSet.bBtnPressed = true;
            }
            onReleased: {
                btnBtSet.bBtnPressed = false;
            }

            onClicked: {
                btSetBtnClicked();
            }
        }
    }

}
