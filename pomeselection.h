#ifndef POMESELECTION_H
#define POMESELECTION_H

#include <QObject>

class Pomeselection : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString iteid READ iteid WRITE setIteid )
    Q_PROPERTY(QString supid READ supid WRITE setSupid )
    Q_PROPERTY(QString pomeseltypeid READ pomeseltypeid WRITE setPomeseltypeid )
    Q_PROPERTY(QString telara READ telara WRITE setTelara)
    Q_PROPERTY(QString grossweight READ grossweight WRITE setGrossweight )
    Q_PROPERTY(QString netweight READ netweight WRITE setNetweight )
    Q_PROPERTY(QString comments READ comments WRITE setComments )
    Q_PROPERTY(QString sdate READ sdate WRITE setSdate )
    Q_PROPERTY(QString fieldcode READ fieldcode WRITE setFieldcode )
    Q_PROPERTY(QString deadweight READ deadweight WRITE setDeadweight )
    Q_PROPERTY(QString ispackage READ ispackage WRITE setIspackage )

public:
    explicit Pomeselection(QObject *parent = 0);
    Q_INVOKABLE QString id();
    Q_INVOKABLE QString iteid();
    Q_INVOKABLE QString supid();
    Q_INVOKABLE QString pomeseltypeid();
    Q_INVOKABLE QString telara();
    Q_INVOKABLE QString grossweight();
    Q_INVOKABLE QString netweight();
    Q_INVOKABLE QString comments();
    Q_INVOKABLE QString sdate();
    Q_INVOKABLE QString fieldcode();
    Q_INVOKABLE QString deadweight();
    Q_INVOKABLE QString ispackage();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setIteid(QString iteid);
    Q_INVOKABLE void setSupid(QString supid);
    Q_INVOKABLE void setPomeseltypeid(QString pomeseltypeid);
    Q_INVOKABLE void setTelara(QString telara);
    Q_INVOKABLE void setGrossweight(QString grosseight);
    Q_INVOKABLE void setNetweight(QString netweight);
    Q_INVOKABLE void setComments(QString coments);
    Q_INVOKABLE void setSdate(QString sdate);
    Q_INVOKABLE void setFieldcode(QString fieldcode);
    Q_INVOKABLE void setDeadweight(QString deadweight);
    Q_INVOKABLE void setIspackage(QString ispackage);


private:
    QString mid,miteid,msupid,mpomeseltypeid,mtelara,mgrossweight,mnetweight,mcomments,msdate,mfieldcode,mdeadweight,mispackage;

signals:

public slots:

};

#endif // POMESELECTION_H
