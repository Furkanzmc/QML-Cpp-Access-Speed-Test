#ifndef SINGLETONTEST_H
#define SINGLETONTEST_H
#include <QObject>

// Forward Declerations
class QQmlEngine;
class QJSEngine;

class SingletonTest : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int intProperty READ intProperty WRITE setIntProperty NOTIFY intPropertyChanged)

public:
    enum SomeEnum {
        EnumVal
    };
    Q_ENUM(SomeEnum);

public:
    SingletonTest(QObject *parent = nullptr);

    static QObject *singletonProvider(QQmlEngine *qmlEngine, QJSEngine *jsEngine);

    Q_INVOKABLE void test();

    int intProperty() const
    {
        return m_IntProp;
    }

    void setIntProperty(int prop)
    {
        if (m_IntProp != prop) {
            m_IntProp = prop;
            emit intPropertyChanged();
        }
    }

signals:
    void intPropertyChanged();

private:
    static SingletonTest *m_Instance;
    int m_IntProp;
};

#endif // SINGLETONTEST_H
