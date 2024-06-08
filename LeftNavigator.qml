import QtQuick 2.0
import com.qnx.a16.ui 2.0

Item {
    x:0;
    y:0;
    width: 114;
    height: 720;
    Image {
        id: bgImage
        source: "qrc:/Image/jdzh/statusbar/bg_left.png"
    }

    CustomButton{
        id:bt_back;
        x:5;
        y:0;
        width: 100;
        height: 100;
        pressPath: "qrc:/Image/jdzh/statusbar/backp.png"
        releasePath: "qrc:/Image/jdzh/statusbar/backn.png"
        onReleased: {
            _screenmanger.showScreen();
        }

    }
    //使用自定义控件

    CustomButton{
        id:bt_home;
        anchors{
            top: bt_back.bottom;
            topMargin: 200;
            left: bt_back.left;
        }
        width:100;
        height: 100;
        pressPath: "qrc:/Image/jdzh/statusbar/homep.png"
        releasePath:"qrc:/Image/jdzh/statusbar/homen.png"

        onReleased: {
             _screenmanger.setHomeScreen();
        }
    }

    CustomButton{
        id:bt_speech;
        anchors{
            bottom: parent.bottom;
            bottomMargin: 25;
            horizontalCenter: bt_back.horizontalCenter;
        }
        width:65;
        height: 65;
        pressPath: "qrc:/Image/jdzh/statusbar/speechp.png"
        releasePath:"qrc:/Image/jdzh/statusbar/speechn.png"
    }

}

//左功能栏函数体
