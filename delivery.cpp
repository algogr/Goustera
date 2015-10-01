#include "delivery.h"

Delivery::Delivery(QObject *parent) :
    QObject(parent)
{
}


QString Delivery::id()
{
    return mid;
}
QString Delivery::iteid()
{
    return miteid;
}
QString Delivery::supid()
{
    return msupid;
}
QString Delivery::car()
{
    return mcar;
}
QString Delivery::grossweight()
{
    return mgrossweight;
}
QString Delivery::deadweight()
{
    return mdeadweight;
}
QString Delivery::netweight()
{
    return mnetweight;
}
QString Delivery::netfruitweight()
{
    return mnetfruitweight;
}
QString Delivery::telara()
{
    return mtelara;
}
QString Delivery::bins()
{
    return mbins;
}
QString Delivery::pallets()
{
    return mpallets;
}
QString Delivery::deliverydate()
{
    return mdeliverydate;
}
QString Delivery::inspector()
{
    return minspector;
}
QString Delivery::fieldcode()
{
    return mfieldcode;
}
QString Delivery::comments()
{
    return mcomments;
}

void Delivery::setId(QString id)
{
    mid=id;
}
void Delivery::setIteid(QString iteid)
{
    miteid=iteid;
}
void Delivery::setSupid(QString supid)
{
    msupid=supid;
}
void Delivery::setCar(QString car)
{
    mcar=car;
}
void Delivery::setGrossweight(QString grossweight)
{
    mgrossweight=grossweight;
}
void Delivery::setDeadweight(QString deadweight)
{
    mdeadweight=deadweight;
}
void Delivery::setNetweight(QString netweight)
{
    mnetweight=netweight;
}
void Delivery::setNetfruitweight(QString netfruitweight)
{
    mnetfruitweight=netfruitweight;
}
void Delivery::setTelara(QString telara)
{
    mtelara=telara;
}
void Delivery::setBins(QString bins)
{
    mbins=bins;
}
void Delivery::setPallets(QString pallets)
{
    mpallets=pallets;
}
void Delivery::setDeliverydate(QString deliverydate)
{
    mdeliverydate=deliverydate;
}
void Delivery::setInspector(QString inspector)
{
    minspector=inspector;
}
void Delivery::setFieldcode(QString fieldcode)
{
    mfieldcode=fieldcode;
}

void Delivery::setComments(QString comments)
{
    mcomments=comments;
}


