#include "VelodyneThread.h"


VelodyneThread::VelodyneThread():
    m_strNodeName("Velodyne0Driver"),
    m_strFrameID("velodyne0"),
    m_strTopicPacketName("velodyne0Packet"),
    m_strTopicPointCloudName("velodyne0Scan")
{
    int argc = 0;
    char **argv;
    argv = NULL;
    ros::init (argc, argv, m_strNodeName);
    m_pNodeHandle = new ros::NodeHandle;
    m_pubVelodyneRawPointCloud = m_pNodeHandle->advertise<sensor_msgs::PointCloud>(m_strTopicPointCloudName, 20);
    m_pubVelodynePacket = m_pNodeHandle->advertise<velodyne0::VelodynePacket>(m_strTopicPacketName, 20);

    this->InitializeAngles();
    this->InitializeRosMsgs();

    m_pSocket = new QUdpSocket(this);
    m_pSocket->bind(2360);
    connect(m_pSocket, SIGNAL(readyRead()), this, SLOT(OnReadyRead()));
}

VelodyneThread::~VelodyneThread()
{

}

/**@brief initialize 32 angles and corresponding sin, cos;
*
*@return void;
*@note
*/
void VelodyneThread::InitializeAngles()
{
    m_Deg2Pi = 3.1415926/180.0;
    m_VerticalAngles[0] = -30.67*m_Deg2Pi;
    m_VerticalAngles[1] = -9.33*m_Deg2Pi;
    m_VerticalAngles[2] = -29.33*m_Deg2Pi;
    m_VerticalAngles[3] = -8.00*m_Deg2Pi;
    m_VerticalAngles[4] = -28.00*m_Deg2Pi;
    m_VerticalAngles[5] = -6.66*m_Deg2Pi;
    m_VerticalAngles[6] = -26.66*m_Deg2Pi;
    m_VerticalAngles[7] = -5.33*m_Deg2Pi;
    m_VerticalAngles[8] = -25.33*m_Deg2Pi;
    m_VerticalAngles[9] = -4.00*m_Deg2Pi;
    m_VerticalAngles[10] = -24.00*m_Deg2Pi;
    m_VerticalAngles[11] = -2.67*m_Deg2Pi;
    m_VerticalAngles[12] = -22.67*m_Deg2Pi;
    m_VerticalAngles[13] = -1.33*m_Deg2Pi;
    m_VerticalAngles[14] = -21.33*m_Deg2Pi;
    m_VerticalAngles[15] = 0.00*m_Deg2Pi;
    m_VerticalAngles[16] = -20.00*m_Deg2Pi;
    m_VerticalAngles[17] = 1.33*m_Deg2Pi;
    m_VerticalAngles[18] = -18.67*m_Deg2Pi;
    m_VerticalAngles[19] = 2.67*m_Deg2Pi;
    m_VerticalAngles[20] = -17.33*m_Deg2Pi;
    m_VerticalAngles[21] = 4.00*m_Deg2Pi;
    m_VerticalAngles[22] = -16.00*m_Deg2Pi;
    m_VerticalAngles[23] = 5.33*m_Deg2Pi;
    m_VerticalAngles[24] = -14.67*m_Deg2Pi;
    m_VerticalAngles[25] = 6.67*m_Deg2Pi;
    m_VerticalAngles[26] = -13.33*m_Deg2Pi;
    m_VerticalAngles[27] = 8.00*m_Deg2Pi;
    m_VerticalAngles[28] = -12.00*m_Deg2Pi;
    m_VerticalAngles[29] = 9.33*m_Deg2Pi;
    m_VerticalAngles[30] = -10.67*m_Deg2Pi;
    m_VerticalAngles[31] = 10.67*m_Deg2Pi;

    int i = 0;
    for(i=0; i<32; i++)
    {
        m_sinVerticalAngles[i] = sin(m_VerticalAngles[i]);
        m_cosVerticalAngles[i] = cos(m_VerticalAngles[i]);
    }
}

void VelodyneThread::InitializeRosMsgs()
{
    m_PointCloud.header.frame_id = m_strFrameID;
    m_PointCloud.points.resize(384);
    m_PointCloud.channels.resize(1);
    m_PointCloud.channels[0].name = "intensity";
    m_PointCloud.channels[0].values.resize(384);


    m_VelodynePacket.header.frame_id = m_strFrameID;
    m_VelodynePacket.header.stamp = ros::Time::now();
    m_VelodynePacket.packet.resize(12);
    int i = 0;
    for(i=0; i<12; i++)
    {
        m_VelodynePacket.packet[i].header.frame_id = m_strFrameID;
        m_VelodynePacket.packet[i].vertical_angle.resize(32);
        m_VelodynePacket.packet[i].dist.resize(32);
        m_VelodynePacket.packet[i].intensity.resize(32);
        m_VelodynePacket.packet[i].x.resize(32);
        m_VelodynePacket.packet[i].y.resize(32);
        m_VelodynePacket.packet[i].z.resize(32);

    }
}

/**@brief read data from the udp socket;
*
*if there is new data at the udp socket, this slot function is called to read data from the socket;
*@return void;
*@note
*/
void VelodyneThread::OnReadyRead()
{
    while (m_pSocket->hasPendingDatagrams())
    {
        QByteArray datagram;
        datagram.resize(m_pSocket->pendingDatagramSize());
        m_pSocket->readDatagram(datagram.data(), datagram.size());
        //std::cout<<datagram.toHex().data()<<"\t"<<datagram.size()<<std::endl;
        ProcessData(datagram);
    }

}

/**@brief try to get complete data frame;
*
*@return bool: if complete data frame is get, return true; else, return false;
*@note complete data frame is defined by head (0xFF, 0xEE) and frame length 1206 bytes;
*/
bool VelodyneThread::GetCompleteDataFrame()
{
    int index = -1;
    char head[3];
    head[0] = 0xFF;
    head[1] = 0xEE;
    head[2] = 0x00;
    index = m_FrameBuffer.indexOf(head);
    //std::cout<<"first index:"<<index<<"\t"<<"frame buffer size:"<<m_FrameBuffer.size()<<std::endl;
    if(-1 == index)
    {
        m_FrameBuffer.clear();
        return (false);
    }

    if(index > 0)
    {
        m_FrameBuffer.remove(0, index);
    }

    if(m_FrameBuffer.size() >= 1206)
    {
        m_Frame.clear();
        m_Frame = m_FrameBuffer.left(1206);
        return (true);
    }
    else
    {
        return (false);
    }
}

/**@brief validate data frame;
*
*validate data frame by 0xFF 0xEE of each 32 vertical measurement;
*@return bool: if the data frame is valid, return true; else, return false;
*@note if any of the frame set is invalid, return false;
*/
bool VelodyneThread::ValidateDataFrame()
{
    unsigned char* dataPtr = ((unsigned char*)m_Frame.data());
    bool valid = true;
    int i = 0;
    for(i=0; i<12; i++)
    {
        if((dataPtr[i*100]!= 0xFF) || (dataPtr[i*100+1] != 0xEE))
        {
            std::cerr<<"Warning: data frame validation failed, at file: "<<__FILE__<<", function: "<<__FUNCTION__<<", line: "<<__LINE__<<std::endl;
            std::cerr<<"i:"<<i<<int(dataPtr[i*100])<<"\t"<<int(dataPtr[i*100+1])<<std::endl;
            valid = false;
            break;
        }
    }

    if(valid)
    {
        //data frame is valid, remove the data frame from the frame buffer;
        m_FrameBuffer.remove(0, 1206);
        return (true);
    }
    else
    {
        //data frame is invalid, remove only the first byte from the frame buffer;
        m_FrameBuffer.remove(0, 1);
        return (false);
    }
}

/**@brief decompose data frame;
*
*decompose data frame;
*@return void;
*@note in each complete data frame, there 12 sets of 32 laser measurements;
*/
void VelodyneThread::DecomposeDataFrame()
{
    unsigned char* dataPtr = ((unsigned char*)m_Frame.data());
    m_PointCloud.header.stamp = ros::Time::now();
    m_VelodynePacket.header.stamp = ros::Time::now();

    float horizontalAngle = 0.0;
    float sinHoriAngle = 0.0;
    float cosHoriAngle = 0.0;
    float horizontalDist = 0.0;

    float fX = 0.0;
    float fY = 0.0;
    float fZ = 0.0;
    float dist = 0.0;
    int intensity = 0;
    int index = 0;

    int i = 0;
    int j = 0;
    for(i=0; i<12; i++)
    {
        horizontalAngle = int(dataPtr[2+i*100]+dataPtr[3+i*100]*256)*0.01*m_Deg2Pi;
        sinHoriAngle = sin(horizontalAngle);
        cosHoriAngle = cos(horizontalAngle);

        m_VelodynePacket.packet[i].header.stamp = ros::Time::now();
        m_VelodynePacket.packet[i].header.seq = i;
        m_VelodynePacket.packet[i].horizontal_angle = horizontalAngle;


        for(j=0; j<32; j++)
        {
            dist = (dataPtr[i*100+4+j*3]+dataPtr[i*100+5+j*3]*256)*0.002;
            intensity = dataPtr[i*100+6+j*3];
            index = i*32+j;
            horizontalDist = dist*m_cosVerticalAngles[j];
            m_PointCloud.points[index].z = dist*m_sinVerticalAngles[j];
            m_PointCloud.points[index].x = -horizontalDist*sinHoriAngle;
            m_PointCloud.points[index].y = -horizontalDist*cosHoriAngle;
            m_PointCloud.channels[0].values[index] = intensity;

            m_VelodynePacket.packet[i].vertical_angle[j] = m_VerticalAngles[j];
            m_VelodynePacket.packet[i].dist[j] = dist;
            m_VelodynePacket.packet[i].intensity[j] = intensity;
            m_VelodynePacket.packet[i].x[j] = m_PointCloud.points[index].x;
            m_VelodynePacket.packet[i].y[j] = m_PointCloud.points[index].y;
            m_VelodynePacket.packet[i].z[j] = m_PointCloud.points[index].z;
        }
    }
    m_pubVelodyneRawPointCloud.publish(m_PointCloud);
    m_pubVelodynePacket.publish(m_VelodynePacket);
}

/**@brief process received data;
*
*process received data frame: 1. append data; 2. get complete data frame; 3. validate data frame; 4. decompose data frame;
*@param data [IN]: received data frame;
*@return void;
*@note
*/
void VelodyneThread::ProcessData(QByteArray data)
{
    if(m_FrameBuffer.size()>5000)
    {
        m_FrameBuffer.clear();
    }

    m_FrameBuffer.append(data);
    while(GetCompleteDataFrame())
    {
        if(ValidateDataFrame())
        {
            DecomposeDataFrame();
        }
    }
}
