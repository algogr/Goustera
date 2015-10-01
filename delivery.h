#ifndef DELIVERY_H
#define DELIVERY_H

#include <QObject>

class Delivery : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString iteid READ iteid WRITE setIteid )
    Q_PROPERTY(QString supid READ supid WRITE setSupid )
    Q_PROPERTY(QString car READ car WRITE setCar )
    Q_PROPERTY(QString grossweight READ grossweight WRITE setGrossweight )
    Q_PROPERTY(QString deadweight READ deadweight WRITE setDeadweight )
    Q_PROPERTY(QString netweight READ netweight WRITE setNetweight )
    Q_PROPERTY(QString netfruitweight READ netfruitweight WRITE setNetfruitweight )
    Q_PROPERTY(QString telara READ telara WRITE setTelara )
    Q_PROPERTY(QString bins READ bins WRITE setBins )
    Q_PROPERTY(QString pallets READ pallets WRITE setPallets )
    Q_PROPERTY(QString deliverydate READ deliverydate WRITE setDeliverydate )
    Q_PROPERTY(QString inspector READ inspector WRITE setInspector )
    Q_PROPERTY(QString fieldcode READ fieldcode WRITE setFieldcode )
    Q_PROPERTY(QString comments READ comments WRITE setComments)

public:
    explicit Delivery(QObject *parent = 0);
    Q_INVOKABLE QString id();
    Q_INVOKABLE QString iteid();
    Q_INVOKABLE QString supid();
    Q_INVOKABLE QString car();
    Q_INVOKABLE QString grossweight();
    Q_INVOKABLE QString deadweight();
    Q_INVOKABLE QString netweight();
    Q_INVOKABLE QString netfruitweight();
    Q_INVOKABLE QString telara();
    Q_INVOKABLE QString bins();
    Q_INVOKABLE QString pallets();
    Q_INVOKABLE QString deliverydate();
    Q_INVOKABLE QString inspector();
    Q_INVOKABLE QString fieldcode();
    Q_INVOKABLE QString comments();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setIteid(QString iteid);
    Q_INVOKABLE void setSupid(QString supid);
    Q_INVOKABLE void setCar(QString car);
    Q_INVOKABLE void setGrossweight(QString grossweight);
    Q_INVOKABLE void setDeadweight(QString deadweight);
    Q_INVOKABLE void setNetweight(QString netweight);
    Q_INVOKABLE void setNetfruitweight(QString netfruitweight);
    Q_INVOKABLE void setTelara(QString telara);
    Q_INVOKABLE void setBins(QString bins);
    Q_INVOKABLE void setPallets(QString pallets);
    Q_INVOKABLE void setDeliverydate(QString deliverydate);
    Q_INVOKABLE void setInspector(QString inspector);
    Q_INVOKABLE void setFieldcode(QString fieldcode);
    Q_INVOKABLE void setComments(QString comments);

signals:

public slots:

protected:
    QString mid,miteid,msupid,mcar,mgrossweight,mdeadweight,mnetweight,mnetfruitweight,mtelara,mbins,mpallets,mdeliverydate;
    QString minspector,mfieldcode,mcomments;
};

#endif // DELIVERY_H
