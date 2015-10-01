#ifndef ITEM_H
#define ITEM_H

#include <QObject>

class Item : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ id WRITE setId )
    Q_PROPERTY(QString code READ code WRITE setCode )
    Q_PROPERTY(QString description READ description WRITE setDescription )

public:
    explicit Item(QObject *parent = 0);
    Q_INVOKABLE QString id();
    Q_INVOKABLE QString code();
    Q_INVOKABLE QString description();
    Q_INVOKABLE void setId(QString id);
    Q_INVOKABLE void setCode(QString code);
    Q_INVOKABLE void setDescription(QString description);

protected:
    QString mid,mcode,mdescription;
signals:

public slots:

};

#endif // ITEM_H
