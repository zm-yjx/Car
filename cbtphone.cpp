#include "cbtphone.h"

#ifdef __QNX__
BTService* CBtPhone::m_pBtService=nullptr;
#endif

CBtPhone::CBtPhone(QQuickItem *parent)
    :QQuickItem(parent)
{
//#ifdef __QNX__

//#endif
}

void CBtPhone::dial(QString strNumber)
{
#ifdef __QNX__
    m_pBtService->dialNumber(strNumber.toStdString());
#endif
    qDebug()<<"in cpp strnumber"<<strNumber;
}

CBtPhone *CBtPhone::getInstance()
{
    static CBtPhone btphone;
    return &btphone;
}

QObject *CBtPhone::callBack(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine);
    Q_UNUSED(scriptEngine);
    return getInstance();
}

#ifdef __QNX__
void CBtPhone::initService()
{
    m_pBtService=BTService::getInstance();
    qDebug()<<"CBTphone::initservice";
    qRegisterMetaType<bluetooth::SBtInfo>("bluetooth::SBtInfo");
    connect(m_pBtService,SIGNAL(sigBtInfoEvent(bluetooth::SBtInfo)),this,SLOT(onListenerBtInfoEvent(bluetooth::SBtInfo)));
}

void CBtPhone::onListenerBtInfoEvent(bluetooth::SBtInfo info)
{
    m_bIsBtConnected=info.enabled;
    emit sigBtConnectStateChanged();
}
#endif
