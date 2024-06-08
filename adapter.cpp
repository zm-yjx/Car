#include "adapter.h"

Adapter::Adapter(QObject *parent) : QObject(parent)
{

}

Adapter *Adapter::getInstance()
{
    static Adapter pInstance;
    return  &pInstance;
}
