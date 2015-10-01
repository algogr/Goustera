#ifndef SQLMODEL_H
#define SQLMODEL_H
#include <QtSql/QSqlDatabase>
#include <QObject>
class Sqlmodel: public QObject
{
    Q_OBJECT

public:
     explicit Sqlmodel(QObject *parent = 0);
     Q_INVOKABLE bool opendb();
     Q_INVOKABLE void closedb();
     Q_INVOKABLE QList<QObject*> getfruits(QString fruit,QString selection);
     Q_INVOKABLE QList<QObject*> getpomeselectiontypes();
     Q_INVOKABLE QList<QObject*> getsuppliers(QString key="");
     Q_INVOKABLE QString getsuppliernamebyid(QString id);
     Q_INVOKABLE QString getitemidbydescr(QString descr);
     Q_INVOKABLE QString getselectiontypebydescr(QString descr,QString type);
     Q_INVOKABLE void insertdelivery(QObject* delivery);
     Q_INVOKABLE QList<QObject*> getdeliverylist();
     Q_INVOKABLE QList<QObject*> getpomeselectionlist();
     Q_INVOKABLE QObject* getdeliverybyid(QString id);
     Q_INVOKABLE QObject* getpomeselectionbyid(QString id);
     Q_INVOKABLE QString getselectiontypebyid(QString id,QString fruit);
     Q_INVOKABLE QString getitemdescriptionbyid(QString id);
     Q_INVOKABLE void updatedelivery(QObject* delivery);
     Q_INVOKABLE void insertpomeselection(QObject* pomesel);
     Q_INVOKABLE void updatepomeselection(QObject* pomesel);
     Q_INVOKABLE QString getsupplierfieldcodebyid(QString id);
     Q_INVOKABLE QList<QObject*> getparameters();
     Q_INVOKABLE void setparameters(const QString &name, const QString &value);
     Q_INVOKABLE void deletepomeselection(QString id);
     Q_INVOKABLE void deletedelivery(QString id);

private:
     QSqlDatabase db;
};

#endif // SQLMODEL_H
