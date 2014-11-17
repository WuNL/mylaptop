#include <QtCore/QCoreApplication>
#include "InertialThread.h"
#include <iostream>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    InertialThread inertialThread;
    return a.exec();
}
