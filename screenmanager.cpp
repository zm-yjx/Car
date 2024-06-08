#include "screenmanager.h"

ScreenManager::ScreenManager(QObject *parent) : QObject(parent),m_currentScreen(HomeScreen)
{

}

ScreenManager *ScreenManager::getinstance()
{
    qDebug()<<"ScreenManager::getinstance()";

    static ScreenManager screen;
    return &screen;
}

void ScreenManager::showPopup(ScreenManager::Popup popup)
{
    qDebug()<<"showPopup"<<popup;
    if(popup == VolPopup)
    {
        this->m_bShowVolPopup=true;
        emit sigShowVolPopup();
    }

}

void ScreenManager::closePopup(ScreenManager::Popup popup)
{
    qDebug()<<"closePopup"<<popup;
    if(popup==VolPopup)
    {
        this->m_bShowVolPopup=false;
        emit sigShowVolPopup();
    }
}

void ScreenManager::setCurrentScreen(ScreenManager::Screen current)
{
    qDebug()<<"ScreenManager::setCurrentScreen"<<current;
    if(this->m_currentScreen==current)
    {
        qDebug()<<"these Screen is simple"<<current;
        return;
    }
    this->m_currentScreen=current;
    this->m_screenList.append(this->m_currentScreen);
    emit currentScreenChanged();
}

ScreenManager::Screen ScreenManager::currentScreen() const
{
    qDebug()<<"ScreenManager::currentScreen"<<this->m_currentScreen;
    return this->m_currentScreen;
}

void ScreenManager::showScreen()
{
    qDebug()<<"ScreenManager::showScreen";
    for(int screen:this->m_screenList)
    {
        qDebug()<<"listitem:"<<screen;
    }
    if(!this->m_screenList.isEmpty())
    {
        int tmp=this->m_screenList.last();
        Screen lastScreen=static_cast<Screen>(tmp);
        qDebug()<<"lastScreen="<<lastScreen;
        this->m_screenList.removeAll(lastScreen);
    }
    if(!this->m_screenList.isEmpty())
    {
        int screen=this->m_screenList.last();
        this->m_currentScreen=static_cast<Screen>(screen);
        qDebug()<<"m_currentScreen="<<screen;
        emit currentScreenChanged();
    }
    else
    {
        qDebug()<<"sethome";
        this->setHomeScreen();
    }

}

void ScreenManager::setHomeScreen()
{
    this->m_currentScreen=HomeScreen;
    emit currentScreenChanged();
}
