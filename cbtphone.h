#ifndef CBTPHONE_H
#define CBTPHONE_H

#include <QQuickItem>

#ifdef __QNX__
#include "BTService.h"
#endif

class CBtPhone : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(bool bIsBtConnected MEMBER m_bIsBtConnected NOTIFY sigBtConnectStateChanged)
public:
    CBtPhone(QQuickItem *parent=0);
    Q_INVOKABLE void dial(QString strNumber);
    static CBtPhone* getInstance();
    static QObject* callBack(QQmlEngine *engine, QJSEngine *scriptEngine);

#ifdef __QNX__
    void initService();
#endif

public slots:
#ifdef __QNX__
    void onListenerBtInfoEvent(bluetooth::SBtInfo info);
#endif

signals:
    void sigBtConnectStateChanged();

private:
#ifdef __QNX__
    static BTService* m_pBtService;
#endif
    bool m_bIsBtConnected;
};

#endif // CBTPHONE_H
