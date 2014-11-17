#ifndef INERTIALTHREAD_H
#define INERTIALTHREAD_H
#include <QThread>
#include <QUdpSocket>
#include <QtGlobal>
#include <QList>
#include <QStringList>
#include <QFile>
#include <QTextStream>
#include <iostream>
#include "ros/ros.h"
#include "NCOM.h"

struct NCOM
{
    uint16_t time;
    float accelerationX;/**in m/s^2;*/
    float accelerationY;/**in m/s^2;*/
    float accelerationZ;/**in m/s^2;*/
    float angularRateX;/**in rad/s;*/
    float angularRateY;/**in rad/s;*/
    float angularRateZ;/**in rad/s;*/
    unsigned short navStatus;/**4 is ok*/
    double latitude;/**in ddd.dddddd*/
    double longitude;/**in ddd.dddddd*/
    float altitude;/**in m*/
    float velocityNorth;/**in m/s*/
    float velocityEast;/**in m/s*/
    float velocityDown;/**in m/s*/
    float heading;/**in rad, from -pi to +pi*/
    float pitch;/**in rad, from -pi/2 to +pi/2*/
    float roll;/**in rad, from -pi to +pi*/
};

class InertialThread : public QThread
{
    Q_OBJECT
public:
    InertialThread();
    ~InertialThread();
    void ProcessData(QByteArray data);
    bool GetCompleteDataFrame();
    bool ValidateDataFrame();
    void DecomposeDataFrame();
    void PublishNCOMMsg();
    inline double Rad2Deg(double rad);
    inline double Deg2Rad(double deg);
public:
    ros::NodeHandle* m_pNodeHandle;
    ros::Publisher m_pubInertial;
    inertial::NCOM m_NCOMMsg;
    QUdpSocket* m_pSocket;
    QByteArray m_FrameBuffer;
    QByteArray m_Frame;
    NCOM m_Ncom;
    std::string m_strNodeName;
    std::string m_strTopicName;
    std::string m_strFrameID;
signals:
    
public slots:
    void OnReadyRead();
    
};

#endif // INERTIALTHREAD_H
