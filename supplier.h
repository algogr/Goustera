#ifndef SUPPLIER_H
#define SUPPLIER_H

#include <QObject>

class Supplier : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString code READ code WRITE setCode )
    Q_PROPERTY(QString name READ name WRITE setName )

public:
    explicit Supplier(QObject *parent = 0);
    Q_INVOKABLE QString id();
    Q_INVOKABLE QString code();
    Q_INVOKABLE QString name();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setCode(QString code);
    Q_INVOKABLE void setName(QString name);

protected:
    QString mid,mcode,mname;

signals:

public slots:

};

#endif // SUPPLIER_H
