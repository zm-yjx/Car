#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QQuickItem>

class Calculator : public QQuickItem
{
    Q_OBJECT
    Q_DISABLE_COPY(Calculator)
private:
    Calculator();
    ~Calculator();
    static  Calculator*   m_pInstance;

public:
    static  QObject*            callBack(QQmlEngine *engine, QJSEngine *scriptEngine);
    static  Calculator*         getInstance();
    static  void                deleteInstance();

    Q_INVOKABLE QString getAdd(QString  strData1,QString strdata2);
    Q_INVOKABLE QString getSub(QString  strData1,QString strdata2);
    Q_INVOKABLE QString getMul(QString  strData1,QString strdata2);
    Q_INVOKABLE QString getDiv(QString  strData1,QString strdata2);
    Q_INVOKABLE bool    getIsContainsPoint(QString  str);
    Q_INVOKABLE QString appendVal(QString str,QString strVal);
    Q_INVOKABLE QString getKxVal(QString    strVal);
    Q_INVOKABLE QString backspaceVal(QString str);//退格
};

#endif // CALCULATOR_H
