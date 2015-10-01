#ifndef PRESENTATION_H
#define PRESENTATION_H

#include <QObject>

class Presentation : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString role1 READ role1 WRITE setRole1 )
    Q_PROPERTY(QString role2 READ role2 WRITE setRole2 )
    Q_PROPERTY(QString role3 READ role3 WRITE setRole3 )
    Q_PROPERTY(QString role4 READ role4 WRITE setRole4 )
    Q_PROPERTY(QString role5 READ role5 WRITE setRole5 )
    Q_PROPERTY(QString role6 READ role6 WRITE setRole6 )
    Q_PROPERTY(QString role7 READ role7 WRITE setRole7 )
    Q_PROPERTY(QString role8 READ role8 WRITE setRole8 )
    Q_PROPERTY(QString role9 READ role9 WRITE setRole9 )
    Q_PROPERTY(QString role10 READ role10 WRITE setRole10 )


public:
    explicit Presentation(QObject *parent = 0);
    QString role1();
    QString role2();
    QString role3();
    QString role4();
    QString role5();
    QString role6();
    QString role7();
    QString role8();
    QString role9();
    QString role10();
    void setRole1(QString role1);
    void setRole2(QString role2);
    void setRole3(QString role3);
    void setRole4(QString role4);
    void setRole5(QString role5);
    void setRole6(QString role6);
    void setRole7(QString role7);
    void setRole8(QString role8);
    void setRole9(QString role9);
    void setRole10(QString role10);

protected:
    QString mrole1,mrole2,mrole3,mrole4,mrole5,mrole6,mrole7,mrole8,mrole9,mrole10;

};

#endif // PRESENTATION_H
