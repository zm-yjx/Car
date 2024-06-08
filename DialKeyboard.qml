import QtQuick 2.0



Image {
    id: root;
    width: 620;
    height: 584;
    source: "qrc:/Image/jdzh/btPhone/group.png"
    property string strDialNumber: "";
    signal dial(var number);
    Text {//number
        id: number;
        text: strDialNumber;
        color: "#A1A1A1";
        font.pixelSize: 48;
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        anchors.topMargin: 6;
    }
    Image {//1
        id: btn1;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/1P.png":
                              "qrc:/Image/jdzh/btPhone/1N.png";
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.topMargin: 108;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "1";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//2
        id: btn2;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/2P.png":"qrc:/Image/jdzh/btPhone/2N.png";
        anchors.left: btn1.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn1.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "2";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//3
        id: btn3;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/3P.png":"qrc:/Image/jdzh/btPhone/3N.png";
        anchors.left: btn2.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn1.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "3";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//4
        id: btn4;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/4P.png":"qrc:/Image/jdzh/btPhone/4N.png";
        anchors.horizontalCenter: btn1.horizontalCenter;
        anchors.top: btn1.bottom;
        anchors.topMargin: 4;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "4";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//5
        id: btn5;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/5P.png":"qrc:/Image/jdzh/btPhone/5N.png";
        anchors.left: btn4.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn4.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "5";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//6
        id: btn6;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/6P.png":"qrc:/Image/jdzh/btPhone/6N.png";
        anchors.left: btn5.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn5.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "6";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//7
        id: btn7;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/7P.png":"qrc:/Image/jdzh/btPhone/7N.png";
        anchors.horizontalCenter: btn1.horizontalCenter;
        anchors.top: btn4.bottom;
        anchors.topMargin: 4;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "7";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//8
        id: btn8;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/8P.png":"qrc:/Image/jdzh/btPhone/8N.png";
        anchors.left: btn7.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn7.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "8";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//9
        id: btn9;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/9P.png":"qrc:/Image/jdzh/btPhone/9N.png";
        anchors.left: btn8.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn8.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "9";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//*
        id: btnX;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/xP.png":"qrc:/Image/jdzh/btPhone/xN.png";
        anchors.horizontalCenter: btn1.horizontalCenter;
        anchors.top: btn7.bottom;
        anchors.topMargin: 4;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "*";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//0
        id: btn0;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/0P.png":"qrc:/Image/jdzh/btPhone/0N.png";
        anchors.left: btn7.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btnX.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "0";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//#
        id: btnWell;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/wellP.png":"qrc:/Image/jdzh/btPhone/wellN.png";
        anchors.left: btn0.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn0.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed    =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                if(!checkLenth())
                {
                    return;
                }
                root.strDialNumber   += "#";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//back
        id: btnBack;
        property bool bBtnPressed: false;
        property bool bEnable: strDialNumber.length > 0 ? true : false;
        source: bEnable ? (bBtnPressed ? "qrc:/Image/jdzh/btPhone/BackP.png":"qrc:/Image/jdzh/btPhone/BackN.png")
                        : "qrc:/Image/jdzh/btPhone/BackDisable.png";
        anchors.left: btn3.right;
        anchors.leftMargin: 4;
        anchors.verticalCenter: btn3.verticalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed  =   true;
            }
            onReleased: {
                parent.bBtnPressed  =   false;
                root.strDialNumber  =   root.strDialNumber.substring(0,root.strDialNumber.length-1);
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//dial
        id: btnDial;
        property bool bBtnPressed: false;
        source: bBtnPressed ? "qrc:/Image/jdzh/btPhone/DialP.png":"qrc:/Image/jdzh/btPhone/DialN.png";
        anchors.top: btnBack.bottom;
        anchors.topMargin: 4;
        anchors.horizontalCenter: btnBack.horizontalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed  =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                console.log("dial   number = "+strDialNumber);
                dial(strDialNumber);
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    Image {//clear
        id: btnClear;
        property bool bBtnPressed: false;
        property bool bEnable: strDialNumber.length > 0 ? true : false;
        source: bEnable ? (bBtnPressed ? "qrc:/Image/jdzh/btPhone/ClearP.png":"qrc:/Image/jdzh/btPhone/ClearN.png")
                        : "qrc:/Image/jdzh/btPhone/ClearDisable.png";
        anchors.top: btnDial.bottom;
        anchors.topMargin: 4;
        anchors.horizontalCenter: btnDial.horizontalCenter;
        MouseArea{
            anchors.fill: parent;
            onPressed: {
                parent.bBtnPressed  =   true;
            }
            onReleased: {
                parent.bBtnPressed    =   false;
                strDialNumber   =   "";
            }
            onCanceled: {
                parent.bBtnPressed    =   false;
            }
        }
    }
    function checkLenth(){
        if(strDialNumber.length >20-1)
        {
            return false;
        }
        return true;
    }
}
