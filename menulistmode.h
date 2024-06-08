#ifndef MENULISTMODE_H
#define MENULISTMODE_H

#include <QAbstractListModel>

class MenuListMode : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QString source READ source WRITE setSource NOTIFY sourceChanged)
public:
    MenuListMode(QObject *parent=nullptr);
    ~MenuListMode();

    static MenuListMode* getInstance();
    int rowCount(const QModelIndex &parent)const;
    QVariant data(const QModelIndex &index,int role)const;
    QHash <int,QByteArray> roleNames()const;
    QString source()const;
    void setSource(const QString filePath);
signals:
    void sourceChanged();
private:
    typedef QVector<QString> MenuData;
    QHash <int,QByteArray> m_roleNames;
    QVector<MenuData*>m_menus;
};

#endif // MENULISTMODE_H
