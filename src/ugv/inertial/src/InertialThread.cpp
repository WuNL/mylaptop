#include "InertialThread.h"

/**@brief initialization
*
*initialize ros and socket communication;
*@note node name: Inertial; ros msg: inertial;
*/
InertialThread::InertialThread():
    m_strNodeName("InertialDriver"),
    m_strTopicName("inertial"),
    m_strFrameID("inertial")
{
    int argc = 0;
    char **argv;
    argv = NULL;
    ros::init (argc, argv, m_strNodeName);
    m_pNodeHandle = new ros::NodeHandle;
    m_pubInertial = m_pNodeHandle->advertise<inertial::NCOM>(m_strTopicName, 20);

    m_pSocket = new QUdpSocket(this);
    m_pSocket->bind(3000);
    connect(m_pSocket, SIGNAL(readyRead()), this, SLOT(OnReadyRead()));
}

InertialThread::~InertialThread()
{

}

/**@brief if there is new data, this function will be called to process the data;
*
*if there is new data, this function will be called to process the data;
*@return void;
*@note
*/
void InertialThread::OnReadyRead()
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

/**@brief process received data;
*
* process received data: 1. append data to the buffer; 2. try to get complete data frame; 3. validate the data frame; 4. decompose the data frame; 5. publish ncom msg;
*@param data [IN]: received data;
*@return void;
*@note;
*/
void InertialThread::ProcessData(QByteArray data)
{
    m_FrameBuffer.append(data);
    while(GetCompleteDataFrame())
    {
        if(ValidateDataFrame())
        {
            m_FrameBuffer.chop(72);
            DecomposeDataFrame();
            PublishNCOMMsg();
        }
        else
        {
            m_FrameBuffer.chop(1);
        }
    }
}

/**@brief publish ncom msg;
*
*@return void;
*@note;
*/
void InertialThread::PublishNCOMMsg()
{
    m_NCOMMsg.header.stamp = ros::Time::now();
    m_NCOMMsg.header.frame_id = m_strFrameID;
    m_NCOMMsg.time = m_Ncom.time;

    m_NCOMMsg.accelerationX = m_Ncom.accelerationX;
    m_NCOMMsg.accelerationY = m_Ncom.accelerationY;
    m_NCOMMsg.accelerationZ = m_Ncom.accelerationZ;

    m_NCOMMsg.angularRateX = m_Ncom.angularRateX;
    m_NCOMMsg.angularRateY = m_Ncom.angularRateY;
    m_NCOMMsg.angularRateZ = m_Ncom.angularRateZ;

    m_NCOMMsg.navStatus = m_Ncom.navStatus;

    m_NCOMMsg.latitude = m_Ncom.latitude;
    m_NCOMMsg.longitude = m_Ncom.longitude;
    m_NCOMMsg.altitude = m_Ncom.altitude;

    m_NCOMMsg.velocityDown = m_Ncom.velocityDown;
    m_NCOMMsg.velocityEast = m_Ncom.velocityEast;
    m_NCOMMsg.velocityNorth = m_Ncom.velocityNorth;

    m_NCOMMsg.heading = m_Ncom.heading;
    m_NCOMMsg.pitch = m_Ncom.pitch;
    m_NCOMMsg.roll = m_Ncom.roll;

    m_pubInertial.publish(m_NCOMMsg);
}

/**@brief try to get complete NCOM data frame from the frame buffer;
*
*@return if complete data frame is get, return true; else, return false;
*@note
*/
bool InertialThread::GetCompleteDataFrame()
{
    int index = m_FrameBuffer.indexOf(0xE7);
    if(index==-1)
    {
        m_FrameBuffer.clear();
        return false;
    }

    m_FrameBuffer.chop(index);
    if(m_FrameBuffer.size()>=72)
    {
        m_Frame.clear();
        m_Frame = m_FrameBuffer.left(72);
        return true;
    }
    else
    {
        return false;
    }
}

/**@brief validate the ncom data frame by checking 3 checksum;
*@return bool: if all three checksums are valid, return true; else, return false;
*@note
*/
bool InertialThread::ValidateDataFrame()
{
    unsigned char* data = (unsigned char*)(m_Frame.data());
    unsigned char checksum = 0x00;
    int i = 0;
    for(i=1; i<22; i++)
    {
        checksum += data[i];
    }


    if(checksum != data[22])
    {
        std::cerr<<"Warning: checksum1 error, at file: "<<__FILE__<<", function: "<<__FUNCTION__<<", Line: "<<__LINE__<<std::endl;
        std::cerr<<"checksum1:"<<std::hex<<int(checksum)<<"\treceived checksum1:"<<std::hex<<int(data[22])<<std::endl;
        return false;
    }

    for(i=22; i<61; i++)
    {
        checksum += data[i];
    }


    if(checksum != data[61])
    {
        std::cerr<<"Warning: checksum2 error, at file: "<<__FILE__<<", function: "<<__FUNCTION__<<", Line: "<<__LINE__<<std::endl;
        std::cerr<<"checksum2:"<<std::hex<<int(checksum)<<"\treceived checksum2:"<<std::hex<<int(data[61])<<std::endl;
        return false;
    }

    for(i=61; i<71; i++)
    {
        checksum += data[i];
    }


    if(checksum != data[71])
    {
        std::cerr<<"Warning: checksum3 error, at file: "<<__FILE__<<", function: "<<__FUNCTION__<<", Line: "<<__LINE__<<std::endl;
        std::cerr<<"checksum3:"<<std::hex<<int(checksum)<<"\treceived checksum3:"<<std::hex<<int(data[71])<<std::endl;
        return false;
    }

    return true;
}


/**@brief convert 8 bytes char to double;
*
*@param data [IN]: pointer to the data bytes;
*@return double: double data;
*@note
*/
inline static double cast_8_bytes_to_double(const unsigned char* data)
{
    union{double x; unsigned char c[8];}number;
    number.c[0] = data[0];
    number.c[1] = data[1];
    number.c[2] = data[2];
    number.c[3] = data[3];
    number.c[4] = data[4];
    number.c[5] = data[5];
    number.c[6] = data[6];
    number.c[7] = data[7];
    return number.x;
}

/**@brief convert 4 bytes char to float;
*
*@param data [IN]: pointer to the data bytes;
*@return double: float data;
*@note
*/
inline static float cast_4_bytes_to_float(const unsigned char* data)
{
    union{float x; unsigned char c[8];}number;
    number.c[0] = data[0];
    number.c[1] = data[1];
    number.c[2] = data[2];
    number.c[3] = data[3];
    return number.x;
}

/**@brief convert 3 bytes char to int;
*
*@param data [IN]: pointer to the data bytes;
*@return double: int data;
*@note
*/
inline static int cast_3_bytes_to_int(const unsigned char* data)
{
    union{int x; unsigned char c[8];}number;
    number.c[1] = data[0];
    number.c[2] = data[1];
    number.c[3] = data[2];
    return number.x>>8;
}

/**@brief convert deg to rad;
*
*@param deg: the angle in deg to be converted in deg;
*@return double: the angle in rad;
*@note
*/
double InertialThread::Deg2Rad(double deg)
{
    return (deg*3.1415926/180.0);
}

/**@brief convert rad to deg;
*
*@param deg: the angle in rad to be converted;
*@return double: the angle in deg;
*@note
*/
double InertialThread::Rad2Deg(double rad)
{
    return (rad*180.0/3.1415926);
}

/**@brief decompose the data frame;
*
*@return void;
*@note
*/
void InertialThread::DecomposeDataFrame()
{
    unsigned char* data = (unsigned char*)(m_Frame.data());
    m_Ncom.time = data[1]+data[2]*256;

    m_Ncom.accelerationX = cast_3_bytes_to_int(&(data[3]))*0.0001;
    m_Ncom.accelerationY = cast_3_bytes_to_int(&(data[6]))*0.0001;
    m_Ncom.accelerationZ = cast_3_bytes_to_int(&(data[9]))*0.0001;

    m_Ncom.angularRateX = cast_3_bytes_to_int(&(data[12]))*0.00001;
    m_Ncom.angularRateY = cast_3_bytes_to_int(&(data[15]))*0.00001;
    m_Ncom.angularRateZ = cast_3_bytes_to_int(&(data[18]))*0.00001;

    m_Ncom.navStatus = data[21];

    m_Ncom.latitude = Rad2Deg(cast_8_bytes_to_double(&(data[23])));
    m_Ncom.longitude = Rad2Deg(cast_8_bytes_to_double(&(data[31])));
    m_Ncom.altitude = cast_4_bytes_to_float(&(data[39]));

    m_Ncom.velocityNorth = cast_3_bytes_to_int(&(data[43]))*0.0001;
    m_Ncom.velocityEast = cast_3_bytes_to_int(&(data[46]))*0.0001;
    m_Ncom.velocityDown = cast_3_bytes_to_int(&(data[49]))*0.0001;

    m_Ncom.heading = cast_3_bytes_to_int(&(data[52]))*0.000001;
    m_Ncom.pitch = cast_3_bytes_to_int(&(data[55]))*0.000001;
    m_Ncom.roll = cast_3_bytes_to_int(&(data[58]))*0.000001;

    std::cout<<"time:"<<m_Ncom.time<<"\tNavStatus:"<<m_Ncom.navStatus<<std::endl;
    std::cout<<"AccX:"<<m_Ncom.accelerationX<<"\tAccY:"<<m_Ncom.accelerationY<<"\tAccZ:"<<m_Ncom.accelerationZ<<std::endl;
    std::cout<<"RateX:"<<m_Ncom.angularRateX<<"\tRateY:"<<m_Ncom.angularRateY<<"\tRateZ:"<<m_Ncom.angularRateZ<<std::endl;
    std::cout<<"Latitude:"<<m_Ncom.latitude<<"\tLongitude:"<<m_Ncom.longitude<<"\tAltitude:"<<m_Ncom.altitude<<std::endl;
    std::cout<<"VelNorth:"<<m_Ncom.velocityNorth<<"\tVelEast:"<<m_Ncom.velocityEast<<"\tVelDown:"<<m_Ncom.velocityDown<<std::endl;
    std::cout<<"Heading:"<<Rad2Deg(m_Ncom.heading)<<"\tPitch:"<<Rad2Deg(m_Ncom.pitch)<<"\tRoll:"<<Rad2Deg(m_Ncom.roll)<<std::endl;
}
