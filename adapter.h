#ifndef ADAPTER_H
#define ADAPTER_H

#include <QObject>

class Adapter : public QObject
{
    Q_OBJECT
public:
    explicit Adapter(QObject *parent = nullptr);
    static Adapter* getInstance();

signals:
    void sigVolIconClickedOnRightStatusBar();
    void sigVolumnClosed();

public slots:

private:

};

#endif // ADAPTER_H
