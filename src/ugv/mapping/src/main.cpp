#include <iostream>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud.h>
#include <geometry_msgs/PolygonStamped.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <ros/timer.h>
#include <nav_msgs/OccupancyGrid.h>
#include <boost/thread/mutex.hpp>
#include "tf/transform_datatypes.h"
#include "gridmap.h"
boost::mutex mtx;
GridMap* g_pGridMap; /**< TODO */

void VehiclePoseCallback(transformation::VehiclePoseConstPtr pose)
{
    if(pose->header.seq%10 == 0)
    {
        boost::mutex::scoped_lock lock(mtx);
        transformation::VehiclePoseConstPtr pose_copy = pose;
        g_pGridMap->PublishGridMap(pose_copy);
    }
}

void Lms1PCCallback(sensor_msgs::PointCloud cloud)
{
    boost::mutex::scoped_lock lock(mtx);
    //std::cout<<"lms1:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
    //g_pGridMap->InertPointCloud(cloud, true);
    //std::cout<<"lms1:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
}

void Lms2PCCallback(sensor_msgs::PointCloud cloud)
{
    boost::mutex::scoped_lock lock(mtx);
    //std::cout<<"lms2:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
    //g_pGridMap->InertPointCloud(cloud, true);
    //std::cout<<"lms2:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
}

void Velodyne1PCCallback(sensor_msgs::PointCloud cloud)
{
    boost::mutex::scoped_lock lock(mtx);
    //std::cout<<"vel0:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
    g_pGridMap->InertPointCloud(cloud, false);
    //std::cout<<"vel0:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
}
void Velodyne2PCCallback(sensor_msgs::PointCloud cloud)
{
    boost::mutex::scoped_lock lock(mtx);
    //std::cout<<"vel0:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
    g_pGridMap->InertPointCloud(cloud, false);
    //std::cout<<"vel0:"<<std::setprecision(16)<<ros::Time::now().toSec()<<std::endl;
}
/**
 * @brief
 *
 * @param argc
 * @param argv
 * @return int
 */
int main(int argc, char** argv)
{
    std::string strNodeName = "Mapping";
    std::string strTopicVehiclePoseName = "vehiclePose";
    std::string strTopicLms1PCName = "lms1PC";
    std::string strTopicLms2PCName = "lms2PC";
    std::string strTopicVelodyne1PCName = "velodyne1PC";
    std::string strTopicVelodyne2PCName = "velodyne2PC";
    std::string strFrameID = "vehicle";
    ros::init(argc, argv, strNodeName);
    ros::NodeHandle node;
    g_pGridMap = new GridMap(node, 0.1, 200);

    ros::Subscriber subLms1;
    ros::Subscriber subLms2;
    ros::Subscriber subVelodyne1;
    ros::Subscriber subVelodyne2;
    ros::Subscriber subVehiclePose;
    subVehiclePose = node.subscribe<transformation::VehiclePose>(strTopicVehiclePoseName, 100, VehiclePoseCallback);
    subLms1 = node.subscribe<sensor_msgs::PointCloud>(strTopicLms1PCName, 100, Lms1PCCallback);
    subLms2 = node.subscribe<sensor_msgs::PointCloud>(strTopicLms2PCName, 100, Lms2PCCallback);
    subVelodyne1 = node.subscribe<sensor_msgs::PointCloud>(strTopicVelodyne1PCName, 2000, Velodyne1PCCallback);
    subVelodyne2 = node.subscribe<sensor_msgs::PointCloud>(strTopicVelodyne2PCName, 2000, Velodyne2PCCallback);

    ros::spin();
}
