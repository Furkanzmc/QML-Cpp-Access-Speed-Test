#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <iostream>

#include "SingletonTest.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterSingletonType<SingletonTest>("Test", 1, 0, "SingletonTest", SingletonTest::singletonProvider);
    qmlRegisterType<SingletonTest>("Test", 1, 0, "SingletonTestInst");
    SingletonTest st;
    engine.rootContext()->setContextProperty("st", &st);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
