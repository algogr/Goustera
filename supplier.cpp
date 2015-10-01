#include "supplier.h"

Supplier::Supplier(QObject *parent) :
    QObject(parent)
{
}

QString Supplier::id()
{
    return mid;
}

QString Supplier::code()
{
    return mcode;
}

QString Supplier::name()
{
    return mname;
}

void Supplier::setId(QString id)
{
    mid=id;
}

void Supplier::setCode(QString code)
{
    mcode=code;
}
void Supplier::setName(QString name)
{
    mname=name;
}
