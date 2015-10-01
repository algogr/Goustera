#include "pomeselection.h"

Pomeselection::Pomeselection(QObject *parent) :
    QObject(parent)
{
}

QString Pomeselection::id()
{
    return mid;
}

QString Pomeselection::iteid()
{
    return miteid;
}

QString Pomeselection::supid()
{
    return msupid;
}

QString Pomeselection::pomeseltypeid()
{
    return mpomeseltypeid;
}

QString Pomeselection::telara()
{
    return mtelara;
}

QString Pomeselection::grossweight()
{
    return mgrossweight;
}

QString Pomeselection::netweight()
{
    return mnetweight;
}

QString Pomeselection::comments()
{
    return mcomments;
}

QString Pomeselection::sdate()
{
    return msdate;
}

QString Pomeselection::fieldcode()
{
    return mfieldcode;
}

QString Pomeselection::deadweight()
{
    return mdeadweight;
}

QString Pomeselection::ispackage()
{
    return mispackage;
}


void Pomeselection::setId(QString id)
{
    mid=id;
}

void Pomeselection::setIteid(QString iteid)
{
    miteid=iteid;
}

void Pomeselection::setSupid(QString supid)
{
    msupid=supid;
}

void Pomeselection::setPomeseltypeid(QString pomeseltypeid)
{
    mpomeseltypeid=pomeseltypeid;
}

void Pomeselection::setTelara(QString telara)
{
    mtelara=telara;
}

void Pomeselection::setGrossweight(QString  grossweight)

{
    mgrossweight=grossweight;
}

void Pomeselection::setNetweight(QString  netweight)

{
    mnetweight=netweight;
}


void Pomeselection::setComments(QString comments)
{
    mcomments=comments;
}

void Pomeselection::setSdate(QString  sdate)

{
    msdate=sdate;
}

void Pomeselection::setFieldcode(QString fieldcode)
{
    mfieldcode=fieldcode;
}

void Pomeselection::setDeadweight(QString deadweight)
{
    mdeadweight=deadweight;
}

void Pomeselection::setIspackage(QString ispackage)
{
    mispackage=ispackage;
}
