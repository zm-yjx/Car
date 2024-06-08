import QtQuick 2.0
import an.qt.CModel 1.0
import com.qnx.a16.ui 2.0

Item {
    width: 1682;
    height: 720;
    property bool isPressed: false;

    Component{
        id:menuDelegate;
        Item {
            id: iconItem;
            width: 380;
            height: 433;
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    iconItem.ListView.view.currentIndex=index;
                    console.log("clicked on "+index);
                    handleMenuClicked(index);

                }
                onPressed: {
                    iconItem.ListView.view.currentIndex=index;
                    isPressed=true;
                }
                onReleased: {
                    isPressed=false;
                }
            }
            Image {
                id: icon_bg;
                source: (isPressed&&iconItem.ListView.view.currentIndex===index)?
                            "qrc:/Image/jdzh/home/iconbgp.png":
                            "qrc:/Image/jdzh/home/iconbg.png";
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;
            }
            Image {
                id: iconTitleImage;
                anchors.left: parent.left;
                anchors.leftMargin: 40;
                anchors.top: parent.top;
                anchors.topMargin: 30;

//qrc:/Image/jdzh/home/littleair.png
                source: "qrc:/Image/jdzh/home/"+"little"+name+".png";
            }
            Text {
                id: iconText_jdzh;
                font.pixelSize: 30;
                color: "#a0a0a0";
                visible: true;
                anchors.left: iconTitleImage.right;
                anchors.leftMargin: 10;
                anchors.horizontalCenter: icon_bg.horizontalCenter;
                anchors.verticalCenter: iconTitleImage.verticalCenter;
                text: icontitle;
            }
            Image {
                id: iconImage;
                z:10;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: icon_bg.top;
                anchors.topMargin: 0;
//qrc:/Image/jdzh/home/360.png
                source: "qrc:/Image/jdzh/home/"+name+".png";
            }

        }
    }

    ListView{
        id:listView;
        width: 1653;
        height: 433;
        focus: false;
        orientation: ListView.Horizontal;//列表移动方向为水平

        anchors.left: parent.left;
        anchors.leftMargin: 125;
        anchors.right: parent.right;
        anchors.rightMargin: 15;
        anchors.verticalCenter: parent.verticalCenter;

        delegate: menuDelegate;
        model:MenuListModel{
            source: "";
        }
    }

    function handleMenuClicked(index){


        switch(index)
        {
        case 0:
            console.log("handleMenuClicked"+index);
            break;
        case 1:
            console.log("handleMenuClicked"+index);
            _screenmanger.setCurrentScreen(3);
            break;
        case 6:
            console.log("handleMenuClicked"+index);
            _screenmanger.setCurrentScreen(7);
            break;
        }
    }

}
