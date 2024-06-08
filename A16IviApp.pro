QT += quick

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        adapter.cpp \
        cbtphone.cpp \
        main.cpp \
        menulistmode.cpp \
        screenmanager.cpp \
    calculator.cpp

RESOURCES += qml.qrc \
    image.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    adapter.h \
    cbtphone.h \
    menulistmode.h \
    screenmanager.h \
    calculator.h

#LIBS += -L$$PWD/service/BTService/lib/ -lBTService
#INCLUDEPATH += $$PWD/service/BTService/include
#DEPENDPATH += $$PWD/service/BTService/include


qnx{
    INCLUDEPATH += $$PWD/service/libcm/
    LIBS += -L$$PWD/service/libcm -lautosar_cm -lzmq -llog -ldlt -lz -lscreen

    LIBS += -L$$PWD/service/SourceService/lib/ -lSourceService
    INCLUDEPATH += $$PWD/service/SourceService/include
    DEPENDPATH += $$PWD/service/SourceService/include

    LIBS += -L$$PWD/service/BTService/lib/ -lBTService
    INCLUDEPATH += $$PWD/service/BTService/include
    DEPENDPATH += $$PWD/service/BTService/include

    LIBS += -L$$PWD/service/MediaService/lib/ -lMediaService
    INCLUDEPATH += $$PWD/service/MediaService/include
    DEPENDPATH += $$PWD/service/MediaService/include

    LIBS += -L$$PWD/service/VehicleService/lib/ -lVehicleService
    INCLUDEPATH += $$PWD/service/VehicleService/include
    DEPENDPATH += $$PWD/service/VehicleService/include

    LIBS += -L$$PWD/service/OnOffService/lib/ -lOnOffService
    INCLUDEPATH += $$PWD/service/OnOffService/include
    DEPENDPATH += $$PWD/service/OnOffService/include

    LIBS += -L$$PWD/service/SvService/lib/ -lSvService
    INCLUDEPATH += $$PWD/service/SvService/include
    DEPENDPATH += $$PWD/service/SvService/include

    LIBS += -L$$PWD/service/TboxService/lib/ -lTboxService
    INCLUDEPATH += $$PWD/service/TboxService/include
    DEPENDPATH += $$PWD/service/TboxService/include

    LIBS += -L$$PWD/service/NavService/lib/ -lNavService
    INCLUDEPATH += $$PWD/service/NavService/include
    DEPENDPATH += $$PWD/service/NavService/include

    LIBS += -L$$PWD/service/WifiService/lib/ -lWifiService
    INCLUDEPATH += $$PWD/service/WifiService/include
    DEPENDPATH += $$PWD/service/WifiService/include

    LIBS += -L$$PWD/service/TunerService/lib/ -lTunerService
    INCLUDEPATH += $$PWD/service/TunerService/include
    DEPENDPATH += $$PWD/service/TunerService/include

    LIBS += -L$$PWD/service/VrService/lib/ -lVrService
    INCLUDEPATH += $$PWD/service/VrService/include
    DEPENDPATH += $$PWD/service/VrService/include

    LIBS += -L$$PWD/service/NetService/lib/ -lNetService
    INCLUDEPATH += $$PWD/service/NetService/include
    DEPENDPATH += $$PWD/service/NetService/include

    INCLUDEPATH += $$PWD/service/AuthService/include

    QMAKE_CXXFLAGS_RELEASE += -O2
}

DISTFILES +=
