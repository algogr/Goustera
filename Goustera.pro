TEMPLATE = app

QT += qml quick widgets sql

SOURCES += main.cpp \
    sqlmodel.cpp \
    delivery.cpp \
    item.cpp \
    supplier.cpp \
    presentation.cpp \
    pomeselection.cpp

RESOURCES += qml.qrc \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    sqlmodel.h \
    delivery.h \
    item.h \
    supplier.h \
    presentation.h \
    pomeselection.h

OTHER_FILES +=

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../../Downloads/android/ndk/android-ndk-r9d/platforms/android-9/arch-arm/usr/lib/mariadb/libmariadb.so
}
