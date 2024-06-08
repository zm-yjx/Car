#include "calculator.h"

#include <string>
#include <cassert>
#include <iostream>
#include <sstream>

#define MIN_VALUE 0.00000000001
#define IS_DOUBLE_ZERO(d)  (qAbs(d) < MIN_VALUE)

Calculator* Calculator::m_pInstance =   NULL;

Calculator::Calculator()
{

}

Calculator::~Calculator()
{

}

QObject *Calculator::callBack(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    return  getInstance();
}

Calculator *Calculator::getInstance()
{
    if(NULL == m_pInstance)
    {
        m_pInstance =   new Calculator();
    }
    return  m_pInstance;
}

void Calculator::deleteInstance()
{
    if(m_pInstance)
    {
        delete  m_pInstance;
        m_pInstance =   NULL;
    }
}

QString Calculator::getAdd(QString strData1, QString strdata2)
{
    double  dVal1   =   strData1.toDouble();
    double  dVal2   =   strdata2.toDouble();

    double  result  =   dVal1   +   dVal2;

    QString strResult   =   QString::number(result,'f',10);
    std::string str     =   strResult.toStdString();
    int nLastNumIndex   =   str.find_last_not_of("0");
    int nPointIndex     =   str.find(".");
    if(nPointIndex >= nLastNumIndex)
    {
        str =   str.substr(0,nPointIndex);
    }
    else
    {
        str =   str.substr(0,nLastNumIndex+1);
    }

    return  QString::fromStdString(str);
}

QString Calculator::getSub(QString strData1, QString strdata2)
{
    double  dVal1   =   strData1.toDouble();
    double  dVal2   =   strdata2.toDouble();

    double  result  =   dVal1   -   dVal2;

    QString strResult   =   QString::number(result,'f',10);
    std::string str     =   strResult.toStdString();
    int nLastNumIndex   =   str.find_last_not_of("0");
    int nPointIndex     =   str.find(".");
    if(nPointIndex >= nLastNumIndex)
    {
        str =   str.substr(0,nPointIndex);
    }
    else
    {
        str =   str.substr(0,nLastNumIndex+1);
    }

    return  QString::fromStdString(str);
}

QString Calculator::getMul(QString strData1, QString strdata2)
{
    double  dVal1   =   strData1.toDouble();
    double  dVal2   =   strdata2.toDouble();

    double  result  =   dVal1   *   dVal2;

    QString strResult   =   QString::number(result,'f',15);
    std::string str     =   strResult.toStdString();
    int nLastNumIndex   =   str.find_last_not_of("0");
    int nPointIndex     =   str.find(".");
    if(nPointIndex >= nLastNumIndex)
    {
        str =   str.substr(0,nPointIndex);
    }
    else
    {
        str =   str.substr(0,nLastNumIndex+1);
    }

    return  QString::fromStdString(str);
}

QString Calculator::getDiv(QString strData1, QString strdata2)
{
    double  dVal1   =   strData1.toDouble();
    double  dVal2   =   strdata2.toDouble();
    if(IS_DOUBLE_ZERO(dVal2))
    {
        return "0";
    }

    double  result  =   dVal1   /   dVal2;

    QString strResult   =   QString::number(result,'f',10);
    std::string str     =   strResult.toStdString();
    int nLastNumIndex   =   str.find_last_not_of("0");
    int nPointIndex     =   str.find(".");
    if(nPointIndex >= nLastNumIndex)
    {
        str =   str.substr(0,nPointIndex);
    }
    else
    {
        str =   str.substr(0,nLastNumIndex+1);
    }

    return  QString::fromStdString(str);
}

bool Calculator::getIsContainsPoint(QString str)
{
    return str.contains(".");
}

QString Calculator::appendVal(QString str, QString strVal)
{
    std::string stdstr  =   str.toStdString();
    int nPointIndex =   stdstr.find_first_of(".");
    //限制小数点后最长9位，否则会超出屏幕
    if(nPointIndex!=-1 && ((str.length()-nPointIndex)==10))
    {
        return  str;
    }
    if(-1   ==  str.toStdString().find_first_not_of("0"))
    {
        return  strVal;
    }

    if(strVal == "0")
    {
        std::string strTp   =   str.toStdString();
        if(-1   !=   strTp.find_first_not_of("0"))
        {
            return  str+strVal;
        }
    }
    else
    {
        return  str+strVal;
    }
    return  str;
}

QString Calculator::getKxVal(QString strVal)
{
    if(strVal.length() < 16)
    {
        return  strVal;
    }

    std::string stdstr  =   strVal.toStdString();
    int nPointIndex =   stdstr.find_first_of(".");
    if(-1 == nPointIndex || nPointIndex > 16)
    {
        std::ostringstream  stream;
        stream<<strVal.toDouble();
        stdstr  =   stream.str();
    }
    else
    {
        return  strVal;
    }

    return  QString::fromStdString(stdstr);
}
//退格
QString Calculator::backspaceVal(QString str)
{
    if(str.length()>0)
    {
        QString result = str.mid(0, (str.length()-1));
        if(result.length()>0)
        {
            return result;
        }
        else
        {
            return "0";
        }
    }
    return "";
}
