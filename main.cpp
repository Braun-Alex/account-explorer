#include <Qaterial/Qaterial.hpp>
#include "account_handler.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
int main(int argc, char* argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication application(argc, argv);
    QQmlApplicationEngine engine;
    qmlRegisterType<Account_Handler>("Account_Handler", 1, 0, "Account_Handler");
    engine.addImportPath("qrc:///");
    qaterial::loadQmlResources();
    qaterial::registerQmlTypes();
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &application, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return QGuiApplication::exec();
}
