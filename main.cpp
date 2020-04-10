#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include "candrv.h"
#include "displaydrv.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<CanDrv>("CanDrv", 1, 0, "CanDrv");
    qmlRegisterType<DisplayDrv>("DisplayDrv", 1, 0, "DisplayDrv");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
