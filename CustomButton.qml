import QtQuick 2.0

Item {
    id:root;
    property alias pressPath: custombtn.pressPath
    property alias releasePath: custombtn.releasePath

    signal clicked();
    signal pressed();
    signal released();

    Image {
        id: custombtn;
        property bool pressed: false;
        property string pressPath: "";
        property string releasePath: "";
        source: (pressed===true)?pressPath:releasePath;
        //实现代码复用功能

        MouseArea{
            anchors.fill: parent;
            onPressed: {
                custombtn.pressed=true;
                root.pressed();
            }
            onReleased: {
                custombtn.pressed=false;
                root.released();
            }
        }
    }

    Component.onCompleted: {
        console.log(pressPath);
        console.log(releasePath);
    }//功能类似于qdebug在控制台打印数据
}

//自定义按键函数体
