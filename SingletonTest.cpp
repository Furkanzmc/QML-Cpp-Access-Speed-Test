#include "SingletonTest.h"
#include <QQmlEngine>
#include <QJSEngine>

SingletonTest *SingletonTest::m_Instance = nullptr;

SingletonTest::SingletonTest(QObject *parent)
    : QObject(parent)
    , m_IntProp(05)
{

}

QObject *SingletonTest::singletonProvider(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
{
    if (m_Instance == nullptr) {
        m_Instance = new SingletonTest(qmlEngine);
    }

    Q_UNUSED(jsEngine);
    return m_Instance;
}

void SingletonTest::test()
{

}
