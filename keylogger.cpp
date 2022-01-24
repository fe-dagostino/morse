#include "keylogger.h"
#include <QDebug>

KeyLogger::KeyLogger(QObject *parent)
    : QObject{parent}
{

}

Q_INVOKABLE void KeyLogger::log( int key)
{
    qDebug() << "KeyLogger:" << key << "\n";
}
