#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "sqlmodel.h"
#include "delivery.h"
#include "item.h"
#include "supplier.h"
#include "pomeselection.h"
#include <QQuickView>
#include <QQuickWindow>
#include <QSettings>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QFile st(QDir::currentPath()+ "/settings.ini");
    qDebug()<<QDir::currentPath()+"/settings.ini";
        if(!st.open(QIODevice::ReadOnly | QIODevice::Text))

        {

            qDebug()<<"Need settings.ini to start";
            QString settingsFile = (QDir::currentPath()+ "/settings.ini");
            QSettings *settings =new QSettings(settingsFile,QSettings::IniFormat);
            settings->setValue("databasename","atlantis");
            settings->setValue("username","root");
            settings->setValue("password","101264");
            settings->setValue("hostname","192.168.0.14");
            settings->sync();
            delete (settings);
        }
        st.close();

    qmlRegisterType<Sqlmodel>("Sqlmodel", 1, 0, "Sqlmodel");
    qmlRegisterType<Delivery>("Delivery", 1, 0, "Delivery");
    qmlRegisterType<Pomeselection>("Pomeselection", 1, 0,"Pomeselection");
    //qmlRegisterType<Item>("Item", 1, 0, "Item");
    qmlRegisterType<Supplier>("Supplier", 1, 0, "Supplier");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
