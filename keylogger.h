#ifndef KEYLOGGER_H
#define KEYLOGGER_H

#include <QObject>

class KeyLogger : public QObject
{
    Q_OBJECT
public:
    explicit KeyLogger(QObject *parent = nullptr);

    /**
     * Log specific key in Morse.
    */
    Q_INVOKABLE void log( int key);

signals:

};

#endif // KEYLOGGER_H
