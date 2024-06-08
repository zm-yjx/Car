import QtQuick 2.0

Item {
    id:homeroot
    //对象的唯一标识id，可以通过指定方式调用对象内数据与方法
    x:114;
    y:0;
    width: 1682
    height: 720
    //初始化中间窗体的数据初始坐标与宽高

    Image {
        id: home_bg;
        anchors.fill: parent;
        source: "qrc:/Image/jdzh/home/homebg.png";
    }

    HomeMenu{
        id:homeMenu;
        anchors.top: parent.top;
        anchors.topMargin: -10;
    }

    Image {
        id: screenofButton;
        property bool pressed: false;
        //利用类JavaScript方式来声明变量，模型为property 变量类型 变量名: 初始值
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 2;
        source: (pressed===true)?"qrc:/Image/jdzh/home/screenoffP.png":
                                 "qrc:/Image/jdzh/home/screenoff.png";
        //利用三目运算符来进行图片切换
        MouseArea{
            anchors.fill: parent;//填充鼠标事件到父对象
            onPressed: {
                screenofButton.pressed=true;
            }
            onReleased: {
                screenofButton.pressed=false;
            }
        }//自定义鼠标事件，并且指定当前父对象screenofButton，在当前区域内进行点击即可触发对应鼠标事件
    }

    Volumn{
        id:volumn;
        visible: false;
        
    }

//    RightStatusbar{
//        id:rightstatusbar;
//        visible: false;
//        onSigvolumnButtonclicked: {
//            console.log("right clicked");
//            volumn.visible=true;
//        }
//    }

}

//主窗口函数体
