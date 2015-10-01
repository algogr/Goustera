#include "item.h"

Item::Item(QObject *parent) :
    QObject(parent)
{
}

QString Item::id()
{
    return mid;
}

QString Item::code()
{
    return mcode;
}

QString Item::description()
{
    return mdescription;
}

void Item::setId(QString id)
{
    mid=id;
}

void Item::setCode(QString code)
{
    mcode=code;
}

void Item::setDescription(QString description)
{
    mdescription=description;
}
