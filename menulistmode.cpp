#include "menulistmode.h"

MenuListMode::MenuListMode(QObject *parent)
    :QAbstractListModel(parent)
{

}

MenuListMode::~MenuListMode()
{

}

MenuListMode *MenuListMode::getInstance()
{
    static MenuListMode model;
    return &model;
}

int MenuListMode::rowCount(const QModelIndex &parent) const
{
    return this->m_menus.size();
}

QVariant MenuListMode::data(const QModelIndex &index, int role) const
{
    MenuData* d=this->m_menus[index.row()];
    return d->at(role-Qt::UserRole);
}

QHash<int, QByteArray> MenuListMode::roleNames() const
{
    return this->m_roleNames;
}

QString MenuListMode::source() const
{

}

void MenuListMode::setSource(const QString filePath)
{
    int role=Qt::UserRole;
    this->m_roleNames.insert(role++,"name");
    this->m_roleNames.insert(role++,"icontitle");

    MenuData* menu=nullptr;
    menu=new MenuData;
    menu->append("navi");
    menu->append("导航");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("phone");
    menu->append("电话");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("setting");
    menu->append("设置");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("music");
    menu->append("多媒体");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("360");
    menu->append("环视");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("air");
    menu->append("空调");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("calc");
    menu->append("计算器");
    this->m_menus.append(menu);

    menu=new MenuData;
    menu->append("tuner");
    menu->append("收音机");
    this->m_menus.append(menu);
}
