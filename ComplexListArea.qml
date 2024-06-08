import QtQuick 2.0

import btphonecomponent 1.0



Item {

    id: root;



    width: 826;

    height: 720;



    //contact signal

    signal  sigContactItemReleased(var name,var number);

    signal  sigCallLogtItemclickd(var name,var number);

    signal  sigSeachBtnClicked();

    signal  sigCheckMsg(var index);



    //device signal

    signal sigBtSetBtnClicked();



    property bool bIsInput: false;



    property int nCurChildIndex: 2;



    onBIsInputChanged: {

        if(bIsInput){

            if(BtPhoneObj.bIsBtConnected)

            {

                root.nCurChildIndex    = 1;

            }

        }

    }



    Image {

        id: partLine;

        source: "qrc:/Image/jdzh/btPhone/PartLine826.png"

        anchors.top: parent.top;

        anchors.topMargin: 120;

        anchors.right: parent.right;

    }



    Image {//搜索

        id: searchBtn;



        property bool bIsPressed: false;

        source: bIsPressed ? "qrc:/Image/jdzh/btPhone/SearchP.png":"qrc:/Image/jdzh/btPhone/SearchN.png"

        anchors.top: parent.top;

        anchors.topMargin: 18;

        anchors.left: parent.left;

        anchors.leftMargin: 74;



        MouseArea{

            anchors.fill: parent;

            onPressed: {

                if(!BtPhoneObj.bIsBtConnected)

                {

                    return;

                }

                parent.bIsPressed   =   true;

            }

            onReleased: {

                if(!BtPhoneObj.bIsBtConnected)

                {

                    return;

                }

                parent.bIsPressed   =   false;

            }

            onCanceled: {

                if(!BtPhoneObj.bIsBtConnected)

                {

                    return;

                }

                parent.bIsPressed   =   false;

            }

            onClicked: {

                if(!BtPhoneObj.bIsBtConnected)

                {

                    return;

                }

                sigSeachBtnClicked();

            }

        }

    }

    Rectangle{//最近通话-title

        id:callLog;

        width: 154//205;

        height: 120;

        color: "transparent";

        anchors.left: searchBtn.right;

        anchors.top: parent.top;

        Text {

            text: qsTr("最近通话")+BtPhoneObj.getEmptyStr();

            font.pixelSize: 32;

            anchors.centerIn: parent;

            color:  (root.nCurChildIndex    === 0)?"#FFFFFF":"#474747";

        }

        MouseArea{

            anchors.fill: parent;

            onClicked: {

                if(BtPhoneObj.bIsBtConnected)

                {

                    root.nCurChildIndex    = 0;

                }

            }

        }

    }

    Rectangle{//联系人-title

        id:contact;

        width: 154//205;

        height: 120;

        color: "transparent";

        anchors.left: callLog.right;

        anchors.top: parent.top;

        Text {

            text: qsTr("联系人")+BtPhoneObj.getEmptyStr();

            font.pixelSize: 32;

            anchors.centerIn: parent;

            color:  (root.nCurChildIndex    === 1)?"#FFFFFF":"#474747";

        }

        MouseArea{

            anchors.fill: parent;

            onClicked: {

                if(BtPhoneObj.bIsBtConnected)

                {

                    root.nCurChildIndex    = 1;

                }

            }

        }

    }

    Rectangle{//设备管理-title

        id:deviceManger;

        width: 154//205;

        height: 120;

        color: "transparent";

        anchors.left: contact.right;

        anchors.top: parent.top;

        Text {

            text: qsTr("设备管理")+BtPhoneObj.getEmptyStr();

            font.pixelSize: 32;

            anchors.centerIn: parent;

            color:  (root.nCurChildIndex    === 2)?"#FFFFFF":"#474747";

        }

        MouseArea{

            anchors.fill: parent;

            onClicked: {

                root.nCurChildIndex    = 2;

            }

        }

    }

    Rectangle{//短信-title

        id:message;

        width: 154//205;

        height: 120;

        color: "transparent";

        anchors.left: deviceManger.right;

        anchors.top: parent.top;

        Text {

            text: qsTr("短信")+BtPhoneObj.getEmptyStr();

            font.pixelSize: 32;

            anchors.centerIn: parent;

            color:  (root.nCurChildIndex    === 3)?"#FFFFFF":"#474747";

        }

        MouseArea{

            anchors.fill: parent;

            onClicked: {

                if(BtPhoneObj.bIsBtConnected)

                {

                    root.nCurChildIndex    = 3;

                }

            }

        }

    }



//    CallLogView{

//        id:callLogView;

//        width: parent.width;

//        height: 588;

//        anchors.top: partLine.bottom;

//        anchors.topMargin: 10;

//        anchors.horizontalCenter: parent.horizontalCenter;

//        visible: (root.nCurChildIndex === 0) ? true:false;



//        onCallLogtItemclickd:{

//            sigCallLogtItemclickd(name,number);

//        }

//    }

//    ContactView{

//        id:contactView;

//        width: parent.width;

//        height: 588;

//        anchors.top: partLine.bottom;

//        anchors.topMargin: 10;

//        anchors.horizontalCenter: parent.horizontalCenter;

//        visible: (root.nCurChildIndex === 1) ? true:false;

//        showDialContacts:bIsInput;



//        onContactItemReleased:{//signal contactItemReleased(var name,var number);

//            console.log("contactItemReleased  2");

//            console.log("contactItemReleased   name = "+ name + "   number = "+number);

//            sigContactItemReleased(name,number);

//        }

//    }

    DeviceManagerView{

        id:deviceMangerView;

        width: parent.width;

        height: 588;

        anchors.top: partLine.bottom;

        anchors.topMargin: 10;

        anchors.horizontalCenter: parent.horizontalCenter;

        visible: (root.nCurChildIndex    === 2) ? true:false;



        onBtSetBtnClicked: {

            sigBtSetBtnClicked();

        }

    }

//    MessageView{

//        id:messageView;

//        width: parent.width;

//        height: 588;

//        anchors.top: partLine.bottom;

//        anchors.topMargin: 10;

//        anchors.horizontalCenter: parent.horizontalCenter;

//        visible: (root.nCurChildIndex    === 3) ? true:false;

//        //color: "red";



//        onCheckMessage: {

//            sigCheckMsg(index);

//        }

//    }

}
