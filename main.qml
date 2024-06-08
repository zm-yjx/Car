//import QtQuick 2.14
//import QtQuick.Window 2.14

import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    id:mainwin;
    visible: true;

    width: 1920;
    height: 720;
    color: "#00000000";

    LeftNavigator{

    }//左边窗口

    ScreenMenu{

    }


//    Home{

//    }//中间主题窗口

//    Volumn{
//        id:volumn;
//        visible: false;
//    }

    VolumnLoader{

    }

    RightStatusbar{
//        onSigvolumnButtonclicked: {
//            volumn.visible=true;
//        }//该方法会使得程序的耦合性变大，使程序不易维护与纠错,所以使用中间件的方式来实现信号与槽机制

    }//右边窗口

}
