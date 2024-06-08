import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {
    id:progressItem;
    property int minValue: 0;
    property int maxValue: 40;
    property int curValue: 16;
    property int radius: 3;
    property bool textShow: true;
    property color bgColor: "#656565";
    property color valueColor: "#FFFFFF";
//    property string handleImageSource: value

    signal sliderBarChanged();
    signal sliderBarReleased();

    Rectangle{
        //总音量
        id:bdControl;
        width: progressItem.width-40;
        height: progressItem.height;
        anchors.left: progressItem.left;
        anchors.leftMargin: 20;
        anchors.verticalCenter: progressItem.verticalCenter;
        z:1;
        radius: progressItem.radius;
        color: progressItem.bgColor;

        Rectangle{
            //现有音量
            id:valueRectangle;
            anchors.left: bdControl.left;
            anchors.verticalCenter: bdControl.verticalCenter;
            width: bdControl.width*(progressItem.curValue/progressItem.maxValue);
            height: bdControl.height;
            color: progressItem.valueColor;
            radius: progressItem.radius;

            Component.onCompleted: {
                volSlider.value=progressItem.curValue;
            }
        }
    }

    Slider{
        id:volSlider;
        z:20;
        width: progressItem.width;
        height: 50;
        minimumValue: progressItem.minValue;
        maximumValue: progressItem.maxValue;
        anchors.left: progressItem.left;
        anchors.verticalCenter: progressItem.verticalCenter;
        anchors.verticalCenterOffset: 3;
        stepSize: 1;
        style: SliderStyle{
            groove: Rectangle{
                color: "transparent";
                height: 3;
                radius: progressItem.radius;
            }
            handle: Image{
                id:handleImage;
                x:volSlider.leftPadding+volSlider.visualPosition*
                  volSlider.availablewWidth;
                source: "qrc:/Image/jdzh/hardkey/vol_progressbar_bar.png";
            }

        }

        onValueChanged: {
            console.log("the num is",volSlider.value);
            if(progressItem.curValue!==volSlider.value)
            {
                progressItem.curValue=volSlider.value;
                progressItem.sliderBarChanged();
            }

        }
        onPressedChanged: {
            console.log("the pressed changed",pressed);
            if(false===pressed){
                console.log("volslider onrelesed");
                progressItem.sliderBarReleased();

            }

        }

    }

}
