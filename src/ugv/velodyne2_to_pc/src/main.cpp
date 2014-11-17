#include <iostream>
#include "ros/ros.h"
#include "tf/transform_listener.h"
#include "tf/transform_datatypes.h"
#include "sensor_msgs/PointCloud.h"
#include <velodyne0/VelodynePacket.h>
#include <transformation/VehiclePose.h>

ros::NodeHandle* g_pNode;
ros::Subscriber* g_pSub;
ros::Publisher* g_pPub;
tf::TransformListener* g_pTfListener;
tf::StampedTransform* g_pTransform;
tf::Quaternion* g_pQuaternion;
tf::Vector3 point_in;
tf::Vector3 point_out;
sensor_msgs::PointCloud cloud_out;
transformation::VehiclePose g_VehiclePose;

void VehiclePoseCallback(transformation::VehiclePose pose)
{
    g_VehiclePose = pose;
}

void TransformVelodynePacket(const velodyne0::VelodynePacketPtr packet)
{
    if(g_VehiclePose.accelerationZ<-10.0 || g_VehiclePose.accelerationZ>-9.65)
    {
        //std::cout<<g_VehiclePose.accelerationZ<<std::endl;
        return;
    }

    cloud_out.header = packet->header;
    cloud_out.header.frame_id = "world";

    int i = 0;
    int j = 0;
    int index = 0;
    for(i=0; i<12; i++)
    {
        //std::cout<<"angle:"<<packet->packet[i].horizontal_angle<<std::endl;
        for(j=0; j<32; j++)
        {
            if(packet->packet[i].dist[j]<3.0 || packet->packet[i].dist[j]>25.0)
            {
                continue;
            }

            point_in.setValue(packet->packet[i].x[j], packet->packet[i].y[j], packet->packet[i].z[j]);
            point_out = (*g_pTransform)*point_in;
            //std::cout<<"point in:"<<point_in.x()<<"\t"<<point_in.y()<<"\t"<<point_in.z()<<std::endl;
            //std::cout<<"point out:"<<point_out.x()<<"\t"<<point_out.y()<<"\t"<<point_out.z()<<std::endl;
            cloud_out.points[index].x = point_out.x();
            cloud_out.points[index].y = point_out.y();
            cloud_out.points[index].z = point_out.z();
            cloud_out.channels[0].values[index] = packet->packet[i].intensity[j];
            index++;
        }
    }
    g_pPub->publish(cloud_out);
}


void PacketCallback(const velodyne0::VelodynePacketPtr packet)
{
    if(g_pTfListener->waitForTransform ("world", "velodyne2", packet->header.stamp, ros::Duration(0.002), ros::Duration(0.0001)))
    {
        g_pTfListener->lookupTransform("world", "velodyne2", packet->header.stamp, *g_pTransform);
        TransformVelodynePacket(packet);
    }
    else
    {
        std::cerr<<"Warning: wait for transform error, at file: "<<__FILE__<<", function: "<<__FUNCTION__<<", line: "<<__LINE__<<std::endl;
        std::cerr<<"TimeStamp:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
    }

}
int main(int argc, char *argv[])
{
    std::string strNodeName = "Velodyne2ToPC";
    std::string strSubTopicName = "velodyne2Packet";
    std::string strPubTopicName = "velodyne2PC";
    std::string strSubVehiclePoseTopicName = "vehiclePose";

    ros::init(argc, argv, strNodeName);
    g_pNode = new ros::NodeHandle;
    g_pSub = new ros::Subscriber;
    g_pPub = new ros::Publisher;
    g_pQuaternion = new tf::Quaternion;
    g_pTfListener = new tf::TransformListener;
    g_pTransform = new tf::StampedTransform;

    cloud_out.points.resize(384);
    cloud_out.channels.resize(1);
    cloud_out.channels[0].values.resize(384);
    cloud_out.channels[0].name = "intensity";

    ros::Subscriber subVehiclePose;
    subVehiclePose = g_pNode->subscribe(strSubVehiclePoseTopicName, 20, &VehiclePoseCallback);
    *g_pSub = g_pNode->subscribe(strSubTopicName, 2000, &PacketCallback);
    *g_pPub = g_pNode->advertise<sensor_msgs::PointCloud>(strPubTopicName, 20);

    ros::spin();
}
