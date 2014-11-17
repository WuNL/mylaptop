#include <QtCore/QCoreApplication>
#include <iostream>
#include "VelodyneThread.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    VelodyneThread velodyneThread;
    return a.exec();
}
