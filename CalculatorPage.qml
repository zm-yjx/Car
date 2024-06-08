import QtQuick 2.0
import  calculatorcomponent 1.0//CalcObj
Rectangle {
    id: root;
    width: 1682;
    height: 720;
    color: "black";
    property string strData1:"0";
    property string strOperator: "";
    property string strData2: "";
    property string strResult: "";
    property string strData1Kx;//: CalcObj.getKxVal(root.strData1);
    property string strData2Kx;//: CalcObj.getKxVal(root.strData2);
    property string strResultKx;//:CalcObj.getKxVal(root.strResult);
    onStrData1Changed: {
        strData1Kx  =   CalcObj.getKxVal(root.strData1);
    }
    onStrData2Changed: {
        strData2Kx  =   CalcObj.getKxVal(root.strData2);
    }
    onStrResultChanged: {
        strResultKx =   CalcObj.getKxVal(root.strResult);
    }
    function initAllData(){
        root.strData1       =   "0";
        root.strData2       =   "";
        root.strOperator    =   "";
        root.strResult      =   "";
    }
    function getResult(){
        if(strOperator === "+")
        {
            return  CalcObj.getAdd(root.strData1,root.strData2);
        }
        else if(strOperator === "-")
        {
            return  CalcObj.getSub(root.strData1,root.strData2);
        }
        else if(strOperator === "x")
        {
            return  CalcObj.getMul(root.strData1,root.strData2);
        }
        else if(strOperator === "/")
        {
            return  CalcObj.getDiv(root.strData1,root.strData2);
        }
        return   "0";
    }
    function onNumberReleased(strNumber){
        if(root.strResult !== ""){
            initAllData();
            root.strData1   =   CalcObj.appendVal(root.strData1,strNumber);
        }
        else if(root.strOperator == ""){
            root.strData1   =   CalcObj.appendVal(root.strData1,strNumber);
            strData1Kx  =   CalcObj.getKxVal(root.strData1);
        }
        else{
            root.strData2   =   CalcObj.appendVal(root.strData2,strNumber);
        }
    }
    function onBackspaceReleased(){
        console.log("Calculator.qml---zy---onBackspaceReleased");
        if(root.strResult !== ""){
            initAllData();
            root.strData1   =   CalcObj.backspaceVal(root.strData1);
        }
        else if(root.strOperator == ""){
            root.strData1   =   CalcObj.backspaceVal(root.strData1);
        }
        else{
            if(root.strData2 == "")
            {
                root.strOperator  = "";
            }
            else
            {
                root.strData2   =   CalcObj.backspaceVal(root.strData2);
            }
        }
    }
    function onOperatorReleased(strOper){
        if(strOper === "="){//=
            if(root.strData2 === "")
            {
                root.strResult      = root.strData1;
                root.strData1       = root.strResult
                root.strData2       = "";
                root.strOperator    = "";
            }
            else{
                root.strResult = root.getResult();
                root.strData1       = root.strResult;
                root.strData2       = "";
                root.strOperator    = "";
            }
        }
        else if(strOper === "%"){
            //%
            if(root.strResult !== "")
            {
                root.strResult      = CalcObj.getMul(root.strResult,"0.01");
                root.strData1       = strResult;
                root.strData2       = "";
                root.strOperator    = "";
            }
            else if(root.strData2 !== ""){
                root.strData2    =   CalcObj.getMul(root.strData2,"0.01");
            }
            else
            {
                root.strData1       = CalcObj.getMul(root.strData1,"0.01");
            }
        }
        else{
            if(root.strResult !== "")
            {
                root.strData1 = root.strResult;
                root.strResult  =   "";
                root.strData2 = "";
            }
            else if(root.strData2 !== ""){
                root.strData1    =   getResult();
                root.strData2   =   "";
            }
            else if(root.strData1 === "0")
            {
                root.strData1    =   "0";
            }
            root.strOperator = strOper;
        }
    }
    function onPointReleased(){
        if(root.strResult !== ""){
            root.strResult = "";
            root.strData1 = "0.";
        }
        else if(root.strOperator !== ""){
            if(root.strData2 === ""){
                root.strData2 = "0.";
            }
            else{
                if(!CalcObj.getIsContainsPoint(root.strData2)){
                    root.strData2 += ".";
                }
            }
        }
        else if(root.strOperator === ""){
            if(root.strData1 === "0"){
                root.strData1 = "0.";
            }
            else{
                if(!CalcObj.getIsContainsPoint(root.strData1)){
                    root.strData1 += ".";
                }
            }
        }
    }
    Image {
        id: bkImg;
        source: "qrc:/Image/jdzh/calculator/web/整体深框.png";
        anchors.centerIn: parent;
        //1268*560
        Item{
            id:txtRect;
            width: parent.width;
            height: 139;
            Text {
                id: txt;
                text: root.strResult === "" ? root.strData1Kx+root.strOperator+root.strData2Kx:root.strResultKx;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 50;
                font.pixelSize: 48;
                color: "#A1A1A1";
            }
            Text {
                id: divtip;
                text: "不能除以0";
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: txt.right;
                anchors.leftMargin: 50;
                font.pixelSize: 48;
                color: "#A1A1A1";
                visible: false;
            }
        }

        //row1
        Image {//1
            id: number1;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/1P.png":"qrc:/Image/jdzh/calculator/web/1N.png";
            anchors.left: parent.left;
            anchors.top: txtRect.bottom;
            anchors.topMargin: 4;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("1");
                }
            }
        }
        Image {//2
            id: number2;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/2P.png":"qrc:/Image/jdzh/calculator/web/2N.png";
            anchors.left: number1.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number1.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("2");
                }
            }
        }
        Image {//3
            id: number3;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/3P.png":"qrc:/Image/jdzh/calculator/web/3N.png";
            anchors.left: number2.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number1.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("3");
                }
            }
        }
        Image {//=
            id: operatorResult;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/=P.png":"qrc:/Image/jdzh/calculator/web/=N.png";
            anchors.left: number3.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number1.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    if(root.strData2 === "0" && strOperator === "/")
                    {
                        console.log("Calculator.qml---zy---root.strData2=0");
                        divtip.visible = true;
                        tipTimer.start();
                    }
                    else
                    {
                        console.log("Calculator.qml---zy---root.strData2!=0");
                        onOperatorReleased("=");
                    }
                }
            }
        }
        Image {//+
            id: operatorAdd;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/+P.png":"qrc:/Image/jdzh/calculator/web/+N.png";
            anchors.left: operatorResult.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number1.verticalCenter;
            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onOperatorReleased("+");
                }
            }
        }
        Image {//-
            id: operatorSub;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/-P.png":"qrc:/Image/jdzh/calculator/web/-N.png";
            anchors.left: operatorAdd.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number1.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onOperatorReleased("-");
                }
            }
        }
        //row2
        Image {//4
            id: number4;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/4P.png":"qrc:/Image/jdzh/calculator/web/4N.png";
            anchors.left: parent.left
            anchors.top: number1.bottom;
            anchors.topMargin: 4;
            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("4");
                }
            }
        }
        Image {//5
            id: number5;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/5P.png":"qrc:/Image/jdzh/calculator/web/5N.png";
            anchors.left: number4.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number4.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("5");
                }
            }
        }
        Image {//6
            id: number6;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/6P.png":"qrc:/Image/jdzh/calculator/web/6N.png";
            anchors.left: number5.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number4.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("6");
                }
            }
        }
        Image {//0
            id: number0;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/0P.png":"qrc:/Image/jdzh/calculator/web/0N.png";
            anchors.left: number6.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number4.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("0");
                }
            }
        }
        Image {//*
            id: operatorMul;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/x-P.png":"qrc:/Image/jdzh/calculator/web/x-N.png";
            anchors.left: number0.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number4.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onOperatorReleased("x");
                }
            }
        }
        Image {// /
            id: operatorDiv;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/斜P.png":"qrc:/Image/jdzh/calculator/web/斜N.png";
            anchors.left: operatorMul.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number4.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onOperatorReleased("/");
                }
            }
        }
        Image {//7
            id: number7;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/7P.png":"qrc:/Image/jdzh/calculator/web/7N.png";
            anchors.left: parent.left
            anchors.top: number4.bottom;
            anchors.topMargin: 4;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("7");
                }
            }
        }
        Image {//8
            id: number8;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/8P.png":"qrc:/Image/jdzh/calculator/web/8N.png";
            anchors.left: number7.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number7.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("8");
                }
            }
        }
        Image {//9
            id: number9;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/9P.png":"qrc:/Image/jdzh/calculator/web/9N.png";
            anchors.left: number8.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number7.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onNumberReleased("9");
                }
            }
        }
        Image {//.
            id: point;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/.P.png":"qrc:/Image/jdzh/calculator/web/.N.png";
            anchors.left: number9.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number7.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onPointReleased();
                }
            }
        }
        Image {//AC
            id: ac;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/AC-P.png":"qrc:/Image/jdzh/calculator/web/AC-N.png";
            anchors.left: point.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number7.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    initAllData();
                }
            }
        }
        Image {//<-
            id: percent;
            property bool bIsPressed: false;
            source: bIsPressed ? "qrc:/Image/jdzh/calculator/web/%P.png":"qrc:/Image/jdzh/calculator/web/%N.png";
            anchors.left: ac.right;
            anchors.leftMargin: 4;
            anchors.verticalCenter: number7.verticalCenter;

            MouseArea{
                anchors.fill: parent;
                onPressed: {
                    parent.bIsPressed   =   true;
                }
                onReleased: {
                    parent.bIsPressed   =   false;
                    onBackspaceReleased();
                }
            }
        }

        Timer{
            id: tipTimer;
            running: false;
            repeat: false;
            interval: 1000;
            onTriggered:{
                divtip.visible = false;
            }
        }
    }

    Component.onCompleted: {
        initAllData();
    }
}
