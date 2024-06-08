import QtQuick 2.0

Loader {
    Connections{
        target: _adapter;
        onSigVolIconClickedOnRightStatusBar:{
            source = "Volumn.qml";
        }

        onSigVolumnClosed:{
            source = "";
        }

    }

}//使用loader来进行资源的动态加载，当接收到对应信号时才进行图片资源的加载
