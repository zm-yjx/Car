import QtQuick 2.0

Item {
    id:control;
    x:1796;
    y:0;
    width: 124;
    height: 720;
    Image {
        id: bgImage
        source: "qrc:/Image/jdzh/statusbar/bg_right.png"
    }

    Text {
        id: timetext
        anchors{
            horizontalCenter: parent.horizontalCenter;
            top: parent.top;
            topMargin: 30;
        }
        font.pixelSize: 28;
        color: "white";
        horizontalAlignment: Text.AlignHCenter;
        //font: "Arial";
    }//文本框数据可动态实现文本数据改变

    Timer{
        id:timeUpdateTimer;
        triggeredOnStart: true;
        running: true;
        repeat: true;
        interval: 1000;
        onTriggered: {
            updateTime();
        }
        //触发之后会调用函数
    }
    //qml自定义计时器

    function updateTime(){
        timetext.text=Qt.formatDateTime(new Date(),"AP\nhh:mm");
        //timetext.text=Qt.formatDateTime(new Date(),"HH:mm");
        timeUpdateTimer.restart();
    }
    //自定义函数体关键字function

    Column{
        spacing: 10;
        anchors{
            top: parent.top;
            topMargin: 236;
            right: parent.right;
            rightMargin: 40;
        }

        Image {
            id:state_tbox_singal;
            source: "qrc:/Image/jdzh/statusbar/0.png";
        }

        Image {
            id: state_internet;
            source: "qrc:/Image/jdzh/statusbar/internet.png";
        }

        Image {
            id: state_wifi;
            source: "qrc:/Image/jdzh/statusbar/wifi.png";
        }

        Image {
            id: state_bluetooth;
            source: "qrc:/Image/jdzh/statusbar/bluetooth.png";
        }

        Image {
            id: state_usb;
            source: "qrc:/Image/jdzh/statusbar/usb.png";
        }

        Image {
            id: state_battery;
            source: "qrc:/Image/jdzh/statusbar/battery.png";
        }

    }//按列排放

    Rectangle{
        id:volRectangle;
        width: control.width;
        height: volume_image.height;
        color: "transparent";
        anchors.left: parent.left;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 20;

        Image {
            id: volume_image;
            source: "qrc:/Image/jdzh/hardkey/vol.png";
            anchors.left: parent.left;
            anchors.leftMargin: 30;
            anchors.verticalCenter: volRectangle.verticalCenter;

        }
        Text {
            id: volume_text;
            anchors.left: volume_image.right;
            anchors.leftMargin: 10;
            anchors.verticalCenter: volume_image.verticalCenter;
            font.pixelSize: 22;
            color: "#A0A0A0";
//            text: qsTr("text");
            font.family: "Source Han Sans CN Medium";
        }
        
        MouseArea{
            id:volumn_clicked;
            anchors.fill: parent;
            onClicked:{
//                console.log("volume_image clicked");
//                volumn.visible=true;
//                 sigvolumnButtonclicked();
                _adapter.sigVolIconClickedOnRightStatusBar();
            }
        }
    }

//    signal sigvolumnButtonclicked();

    Volumn{
        id:volumn;
        visible: false;
    }

}

//右状态栏函数体
