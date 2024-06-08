#ifndef SCREENMANAGER_H
#define SCREENMANAGER_H

#include <QObject>
#include <QDebug>

class ScreenManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool showVolPopup MEMBER m_bShowVolPopup NOTIFY sigShowVolPopup);
    Q_PROPERTY(ScreenManager::Screen currentScreen READ currentScreen NOTIFY currentScreenChanged);
    Q_ENUMS(Popup);
    Q_ENUMS(Screen);

public:
    explicit ScreenManager(QObject *parent = nullptr);
    static ScreenManager* getinstance();
    enum Popup{
        None,
        VolPopup

    };
    enum Screen{
        HomeScreen,
        TunerScreen,
        MusicScreen,
        PhoneSreen,
        NavigationScreen,
        SettingScreen,
        AircondScreen,
        CalScreen,
        SurroundScreen
    };

signals:
    void sigShowVolPopup();
    //void sigCloseVolPopup();

    void currentScreenChanged();

public slots:
    void showPopup(Popup popup);
    void closePopup(Popup popup);
    void setCurrentScreen(Screen current);
    Screen currentScreen() const;
    void showScreen();
    void setHomeScreen();

private:
    bool m_bShowVolPopup;
    QList<int> m_screenList;
    Screen m_currentScreen;

};

#endif // SCREENMANAGER_H
