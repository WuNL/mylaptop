#ifndef VELODYNETHREAD_H
#define VELODYNETHREAD_H
#include <QThread>
#include <QUdpSocket>
#include <QtGlobal>
#include <QList>
#include <QStringList>
#include <QFile>
#include <QTextStream>
#include <iostream>
#include <string>
#include "ros/ros.h"
#include "sensor_msgs/PointCloud.h"
#include "sensor_msgs/ChannelFloat32.h"
#include "geometry_msgs/Point32.h"
#include "VerticalMeasurements.h"
#include "VelodynePacket.h"

class VelodyneThread : public QThread
{
    Q_OBJECT
public:
    VelodyneThread();
    ~VelodyneThread();
    void ProcessData(QByteArray data);
    bool GetCompleteDataFrame();
    bool ValidateDataFrame();
    void DecomposeDataFrame();
    void InitializeAngles();
    void InitializeRosMsgs();
public:
    ros::NodeHandle* m_pNodeHandle;
    ros::Publisher m_pubVelodyneRawPointCloud;
    ros::Publisher m_pubVelodynePacket;
    QUdpSocket* m_pSocket;
    QByteArray m_FrameBuffer;
    QByteArray m_Frame;
    float m_Deg2Pi;
    float m_VerticalAngles[32];
    float m_sinVerticalAngles[32];
    float m_cosVerticalAngles[32];
    sensor_msgs::PointCloud m_PointCloud;
    sensor_msgs::ChannelFloat32 m_IntensityChannel;
    velodyne0::VelodynePacket m_VelodynePacket;
    std::string m_strNodeName;//node name;
    std::string m_strFrameID;//frame id;
    std::string m_strTopicPacketName;//msg VelodynePackets name;
    std::string m_strTopicPointCloudName;//msg velodyne point cloud name;
public slots:
    void OnReadyRead();
};

#endif // VELODYNETHREAD_H
