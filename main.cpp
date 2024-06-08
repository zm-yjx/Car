#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "screenmanager.h"
#include "adapter.h"
#include "menulistmode.h"
#include "cbtphone.h"
#include "calculator.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterUncreatableType<ScreenManager>("com.qnx.a16.ui",2,0,"ScreenManager",QStringLiteral("Access to enums"));
    qmlRegisterType<MenuListMode>("an.qt.CModel",1,0,"MenuListModel");
    qmlRegisterType<CBtPhone>("an.qt.CPhone",1,0,"CBtPhone");

    Adapter* adapter = Adapter::getInstance();//使用单例模式实例化唯一的一个上下文关联的中间件对象
    ScreenManager* screenmanger=ScreenManager::getinstance();
    Calculator* calculator=Calculator::getInstance();

    qmlRegisterSingletonType<CBtPhone>("btphonecomponent",1,0,"BtPhoneObj",CBtPhone::callBack);
    qmlRegisterSingletonType<Calculator>("calculatorcomponent",1,0,"CalcObj",Calculator::callBack);

    QQmlApplicationEngine engine; 
    engine.rootContext()->setContextProperty(QStringLiteral("_adapter"),adapter);//进行上下文关联，将实例化的对象adapter与"_adapter"关联，理解为adapter在qml文件中的名字
    engine.rootContext()->setContextProperty(QStringLiteral("_screenmanger"),screenmanger);
    engine.rootContext()->setContextProperty(QStringLiteral("CalcObj"),calculator);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    return app.exec();
}
