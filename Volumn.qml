import QtQuick 2.0

Item {
    id:control;
    readonly property int autoCloseTime: 3000;
    property bool isMute: false;

    Rectangle{
        id:volRectangle;
        x:350;
        y:520;
        width: bgImage.width;
        height: bgImage.height;
        color: "transparent";

        BorderImage {
            id: bgImage;
            source: "qrc:/Image/jdzh/hardkey/bg.png";

            MouseArea{
                anchors.fill:parent;
                onPressed: {
                    console.log("volume border image Pressed");
                    if(true===autoCloseTimer.running)
                    {
                        autoCloseTimer.stop;
                    }
                }
                onReleased: {
                    console.log("volume border image Released");
                    autoCloseTimer.restart();
                }

            }

        }

        Text {
            id: sourceName;
            anchors.left: bgImage.left;
            anchors.leftMargin: 40;
            anchors.top:bgImage.top;
            anchors.topMargin: 20;

            text: qsTr("媒体音量");
            font.pixelSize: 30;
            color: "#787878";

        }

        Rectangle{
            id:volImageRectangle;
            anchors.left:sourceName.right;
            anchors.leftMargin: 60;
            anchors.verticalCenter: bgImage.verticalCenter;
            width: volImage.width+20;
            height: volImage.height+20;
            color: "transparent"

            Image {
                id: volImage;
                source: control.isMute?"qrc:/Image/jdzh/hardkey/mute.png":"qrc:/Image/jdzh/hardkey/vol.png";
            }

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    if(true===autoCloseTimer.running)
                    {
                        autoCloseTimer.stop();
                    }
                }
                onReleased: {
                    if(true===control.isMute)
                    {
                        console.log("volum.qml onreleased");
                    }
                    autoCloseTimer.restart();
                }

            }
        }

        CustomProgressBar{
            id:volSlider;
            width: 652;
            height: 11;
            anchors.right: bgImage.right;
            anchors.rightMargin: 60;
            anchors.verticalCenter: bgImage.verticalCenter;

            minValue: 0;
            maxValue: 40;
            curValue: 16;
            onCurValueChanged: {
                autoCloseTimer.restart();
            }
            onSliderBarReleased: {

            }

        }


    }

    onVisibleChanged: {
        if(visible)
        {
            autoCloseTimer.start();
        }
    }//三秒之后visit状态改变

    Timer{
        id:autoCloseTimer;
        interval: control.autoCloseTime;
        repeat: false;
        running: false;
        triggeredOnStart: false;
        onTriggered: {
            console.log("hahaha");
            //control.visible = false;
            _adapter.sigVolumnClosed();
        }
    }

    Component.onCompleted: {
        if(!autoCloseTimer.running)
        {
            autoCloseTimer.start();
        }
    }

//    Connections{
//        target: _adapter;
//        onSigVolIconClickedOnRightStatusBar:{
//            control.visible=true;
//        }
//    }

}
