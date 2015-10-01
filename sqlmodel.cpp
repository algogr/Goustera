#include "sqlmodel.h"
#include <QMessageBox>
#include <QDebug>
#include <QtSql/QSqlError>
#include <QSqlQuery>
#include "item.h"
#include "supplier.h"
#include "delivery.h"
#include "presentation.h"
#include "pomeselection.h"
#include <QDateTime>
#include <QSettings>
#include <QDir>

Sqlmodel::Sqlmodel(QObject *parent) :
    QObject(parent)
{

}


bool Sqlmodel::opendb()
{

    //db = QSqlDatabase::addDatabase("QMYSQL");
    //db.setDatabaseName("Goustera");
    //db.setUserName("root");
    //db.setPassword("101264");
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    db = QSqlDatabase::addDatabase("QMYSQL",settings->value("databasename").toString());
    db.setDatabaseName(settings->value("databasename").toString());
    db.setUserName(settings->value("username").toString());
    db.setPassword(settings->value("password").toString());
    db.setHostName(settings->value("hostname").toString());


    db=QSqlDatabase::database(settings->value("databasename").toString());
   // QPluginLoader *thePlugin = new QPluginLoader("/home/jim/qt/qt-4.6.3/plugins/sqldrivers/libqsqlmysql.so");



    if (!db.open())
    {
        qDebug()<<"Απέτυχε η σύνδεση με τη βάση";

    }
}
void Sqlmodel::closedb()
{
    db.close();
}

QList <QObject*> Sqlmodel::getfruits(QString fruit,QString selection)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="select m.id as id ,m.description as description from material m where m.igpid in ("+fruit+") and m.comid=2 and "\
               "m.igsid in ("+selection+") order by m.description";

    qDebug()<<querystr;
    query.exec(querystr);
    QList <QObject*> items;
    while (query.next())
    {
        Item *item=new Item;
        item->setId(query.value(0).toString());
        item->setDescription(query.value(1).toString());
        items<<(QObject*)item;
    }
    closedb();
    return items;

}


QList<QObject*> Sqlmodel::getpomeselectiontypes()
{
    opendb();
    QSqlQuery query(db);
    QString querystr="select codeid,descr from itemlookup1 where comid=2 order by descr";

    qDebug()<<querystr;
    query.exec(querystr);
    QList <QObject*> selectiontypes;
    while (query.next())
    {
        Presentation * selectiontype=new Presentation;
        selectiontype->setRole1(query.value(0).toString());
        selectiontype->setRole2(query.value(1).toString());
        selectiontypes<<selectiontype;

    }
    closedb();
    return selectiontypes;


}

QList <QObject*> Sqlmodel::getsuppliers(QString key)
{
    opendb();
    QSqlQuery query(db);
    query.exec("select id,name from supplier where name like '%"+key+"%' order by name");
    qDebug()<<key;
    QList <QObject*> suppliers;
    while (query.next())
    {
        Supplier *supplier=new Supplier;
        supplier->setId(query.value(0).toString());
        supplier->setName(query.value(1).toString());
        suppliers<<(QObject*)supplier;
    }
    closedb();
    return suppliers;

}

QString Sqlmodel::getsuppliernamebyid(QString id)
{
    opendb();
    QSqlQuery query(db);
    query.exec("select name from supplier where id="+id);
    query.next();
    closedb();
    return  query.value(0).toString();
}

QString Sqlmodel::getitemidbydescr(QString descr)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="select id from material where description='"+descr+"'";
    qDebug()<<querystr;
    query.exec(querystr);
    query.next();
    closedb();
    return  query.value(0).toString();
}

QString Sqlmodel::getselectiontypebydescr(QString descr, QString type)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="select codeid from itemlookup"+type+" where descr='"+descr+"'";
    qDebug()<<querystr;
    query.exec(querystr);
    query.next();
    closedb();
    return  query.value(0).toString();

}

void Sqlmodel::insertdelivery(QObject *delivery)
{
    opendb();
    Delivery *delv=(Delivery *)delivery;
    QSqlQuery query(db);
    QString querystr;
    querystr="INSERT INTO z_delivery(iteid,supid,car,grossweight,deadweight,netweight,telara,netfruitweight,bins,pallets,deliverydate,"\
            "inspector,fieldcode,comments) VALUES ("+delv->iteid() +","+delv->supid()+",'"+delv->car()+"',"+delv->grossweight()+","
            +delv->deadweight()+","+delv->netweight()+","+delv->telara()+","+delv->netfruitweight()+","+delv->bins()+","+
            delv->pallets()+",'"+delv->deliverydate()+"','"+delv->inspector()+"','"+delv->fieldcode()+"','"+delv->comments()+"')";
    query.exec(querystr);
    qDebug()<<querystr;
    closedb();
}

QList<QObject*> Sqlmodel::getdeliverylist()
{
    opendb();
    QSqlQuery query(db);

    query.exec("select d.id,d.deliverydate,s.name,d.car from z_delivery d,supplier s where d.supid=s.id order by d.deliverydate desc");
    QList <QObject*> deliveries;
    while (query.next())
    {
        QDateTime gdate=query.value(1).toDateTime();
        QString fdate=gdate.toString("dd-MM-yy hh:mm");
        Presentation *delivery=new Presentation;
        delivery->setRole1(query.value(0).toString());
        delivery->setRole2(fdate);
        delivery->setRole3(query.value(2).toString());
        delivery->setRole4(query.value(3).toString());
        deliveries<<(QObject*)delivery;
    }
    closedb();
    return deliveries;

}

QList<QObject*> Sqlmodel::getpomeselectionlist()
{
    opendb();
    QSqlQuery query(db);

    query.exec("select z.id,z.sdate,s.name,z.telara from z_pomeselection z,supplier s where z.supid=s.id order by z.sdate desc");
    QList <QObject*> pomeselections;
    while (query.next())
    {
        QDateTime gdate=query.value(1).toDateTime();
        QString fdate=gdate.toString("dd-MM-yy hh:mm");
        Presentation *pomeselection=new Presentation;
        pomeselection->setRole1(query.value(0).toString());
        pomeselection->setRole2(fdate);
        pomeselection->setRole3(query.value(2).toString());
        pomeselection->setRole4(query.value(3).toString());
        pomeselections<<(QObject*)pomeselection;
    }
    closedb();
    return pomeselections;


}

QObject* Sqlmodel::getdeliverybyid(QString id)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="SELECT iteid,supid,car,grossweight,deadweight,netweight,telara,netfruitweight,bins,pallets,deliverydate,"\
            "inspector,fieldcode,comments FROM z_delivery where id="+id;
    query.exec(querystr);
    query.next();
    Delivery* delivery=new Delivery;
    delivery->setIteid(query.value(0).toString());
    delivery->setSupid(query.value(1).toString());
    delivery->setCar(query.value(2).toString());
    delivery->setGrossweight(query.value(3).toString());
    delivery->setDeadweight(query.value(4).toString());
    delivery->setNetweight(query.value(5).toString());
    delivery->setTelara(query.value(6).toString());
    delivery->setNetfruitweight(query.value(7).toString());
    delivery->setBins(query.value(8).toString());
    delivery->setPallets(query.value(9).toString());
    delivery->setDeliverydate(query.value(10).toString());
    delivery->setInspector(query.value(11).toString());
    delivery->setFieldcode(query.value(12).toString());
    delivery->setComments(query.value(13).toString());
    closedb();
    return (QObject*) delivery;

}

QObject* Sqlmodel::getpomeselectionbyid(QString id)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="SELECT iteid,supid,pomeseltypeid,grossweight,netweight,telara,comments,sdate,fieldcode,deadweight,ispackage"\
            " FROM z_pomeselection where id="+id;
    query.exec(querystr);
    query.next();
    Pomeselection* pomeselection=new Pomeselection;
    pomeselection->setIteid(query.value(0).toString());
    pomeselection->setSupid(query.value(1).toString());
    pomeselection->setPomeseltypeid(query.value(2).toString());
    pomeselection->setGrossweight(query.value(3).toString());
    pomeselection->setNetweight(query.value(4).toString());
    pomeselection->setTelara(query.value(5).toString());
    pomeselection->setComments(query.value(6).toString());
    pomeselection->setSdate(query.value(7).toString());
    pomeselection->setFieldcode(query.value(8).toString());
    pomeselection->setDeadweight(query.value(9).toString());
    pomeselection->setIspackage(query.value(10).toString());
    qDebug()<<":L::L:L:L:"<<pomeselection->sdate();
    closedb();
    return (QObject*) pomeselection;

}

QString Sqlmodel::getselectiontypebyid(QString id,QString fruit)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="SELECT descr from itemlookup"+fruit+" where id="+id;
    query.exec(querystr);
    query.next();
    QString seltype=query.value(0).toString();
    return seltype;

}

QString Sqlmodel::getitemdescriptionbyid(QString id)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="select description from material where id="+id;
    query.exec(querystr);
    query.next();
    closedb();
    return query.value(0).toString();

}

void Sqlmodel::updatedelivery(QObject *delivery)
{
    opendb();
    Delivery *delv=(Delivery*)delivery;
    QSqlQuery query(db);
    QString querystr;
    querystr="UPDATE z_delivery set iteid="+delv->iteid()+",supid="+delv->supid()+",car='"+delv->car()+"',grossweight="+delv->grossweight()\
            +",deadweight="+delv->deadweight()+",netweight="+delv->netweight()+",telara="+delv->telara()+",netfruitweight="\
            +delv->netfruitweight()+",bins="+delv->bins()+",pallets="+delv->pallets()+",deliverydate='"+delv->deliverydate()\
            +"',inspector='"+delv->inspector()+"',fieldcode='"+delv->fieldcode()+"',comments='"+delv->comments() +"' where id="+delv->id();
    query.exec(querystr);
    qDebug()<<querystr;
    closedb();
}

void Sqlmodel::insertpomeselection(QObject *pomesel)
{
    opendb();
    Pomeselection* pomeselection= (Pomeselection*) pomesel;
    QSqlQuery query(db);
    QString querystr;
    querystr="INSERT INTO z_pomeselection (iteid,supid,pomeseltypeid,telara,grossweight,netweight,comments,sdate,fieldcode,deadweight,"\
            "ispackage) VALUES ("\
            +pomeselection->iteid()+","+pomeselection->supid()+","+pomeselection->pomeseltypeid()+","+pomeselection->telara()+","\
            +pomeselection->grossweight()+","+pomeselection->netweight()+",'"+pomeselection->comments()+"','"+pomeselection->sdate()+"','"\
            +pomeselection->fieldcode()+"',"+pomeselection->deadweight()+","+pomeselection->ispackage()+")";
    query.exec(querystr);
    qDebug()<<querystr;
    closedb();




}

void Sqlmodel::updatepomeselection(QObject *pomesel)
{
    opendb();
    Pomeselection* pomeselection= (Pomeselection*) pomesel;
    QSqlQuery query(db);
    QString querystr;
    querystr="UPDATE z_pomeselection set iteid="+pomeselection->iteid()+",supid="+pomeselection->supid()+" ,pomeseltypeid="\
            +pomeselection->pomeseltypeid()+",telara="+pomeselection->telara()+",grossweight="+pomeselection->grossweight()+",netweight="\
            +pomeselection->netweight()+",comments='"+pomeselection->comments()+"',sdate='"+pomeselection->sdate()+"',fieldcode='"\
            +pomeselection->fieldcode()+"',deadweight="+pomeselection->deadweight()+",ispackage="+pomeselection->ispackage()\
            +" where id=" +pomeselection->id();
    query.exec(querystr);
    qDebug()<<querystr;
    closedb();


}

QString Sqlmodel::getsupplierfieldcodebyid(QString id)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="SELECT identitynum from supplier where comid=2 and id="+id;
    query.exec(querystr);
    query.next();
    QString fieldcode=query.value(0).toString();
    return fieldcode;

}

QList<QObject*> Sqlmodel::getparameters()
{
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    QString hostname=settings->value("hostname").toString();
    QString databasename=settings->value("databasename").toString();
    QString username=settings->value("username").toString();
    QString password=settings->value("password").toString();
    QList<QObject*> parameters;

    Presentation* hostnameP=new Presentation;
    hostnameP->setRole1("Hostname");
    hostnameP->setRole2("hostname");
    hostnameP->setRole3(hostname);
    parameters.append(hostnameP);

    Presentation* databasenameP=new Presentation;
    databasenameP->setRole1("Databasename");
    databasenameP->setRole2("databasename");
    databasenameP->setRole3(databasename);
    parameters.append(databasenameP);

    Presentation* usernameP=new Presentation;
    usernameP->setRole1("Username");
    usernameP->setRole2("username");
    usernameP->setRole3(username);
    parameters.append(usernameP);

    Presentation* passwordP=new Presentation;
    passwordP->setRole1("Password");
    passwordP->setRole2("password");
    passwordP->setRole3(password);
    parameters.append(passwordP);

    delete settings;
    return parameters;

}

void Sqlmodel::setparameters(const QString &name, const QString &value)
{
    qDebug()<<"NAME:"<<name;
    QByteArray byteArray = name.toUtf8();
    const char* param = byteArray.constData();

    //const char* param=name.toStdString().c_str();
    qDebug()<<"PARAMETER:"<<param;
    QString settingsFile = (QDir::currentPath()+ "/settings.ini");
    QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
    /*
    if (name=="hostname")
    {
        QString oldvalue=settings->value(param).toString();
        qDebug()<<"OLD VALUE:"<<oldvalue;
        QString newvalue=oldvalue.left(12)+value;
        settings->setValue(param,newvalue);
    }

    else
    */
        settings->setValue(param,value);
    settings->sync();
    qDebug()<<"TELOS";
    delete (settings);

}

void Sqlmodel::deletepomeselection(QString id)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="delete from z_pomeselection where id="+id;
    qDebug()<<querystr;
    query.exec(querystr);
    closedb();
}

void Sqlmodel::deletedelivery(QString id)
{
    opendb();
    QSqlQuery query(db);
    QString querystr="delete from z_delivery where id="+id;
    qDebug()<<querystr;
    query.exec(querystr);
    closedb();
}

