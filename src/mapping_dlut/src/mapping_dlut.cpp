/*************************************************************************
	> File Name: mapping_dlut.cpp
	> Author: 吴乃亮
	> Mail: wunailiang@gmail.com 
	> Created Time: Wed 30 Jul 2014 09:08:46 PM CST
 ************************************************************************/

#include<iostream>
#include "ros/ros.h"


#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Point32.h>
#include <boost/unordered_map.hpp>
#include "map_ctrl.h"

#include <boost/thread/mutex.hpp>
#include "unordered_map_voxel.h"

#include <sensor_msgs/ChannelFloat32.h>
/****栅格的分辨率******/
const double resolution = 0.2;
//栅格一半的边长。避免每次都做运算增加负担
const double half_res = resolution/2;

using namespace std;
using namespace boost;

/******栅格存储的数据结构*****/
typedef boost::unordered_map<unordered_map_voxel,un_value> umap;

MapCtrl mc(resolution);
umap map_1;
boost::mutex lock_map;
ros::Publisher grid_to_graph;
tf::TransformListener* g_pTransformListener; /**< TODO */
tf::StampedTransform* g_pStampedTransform; /**< TODO */

/****左侧激光的回调******/
void PointCloudCallback1(sensor_msgs::PointCloud cloud)
{
  mc.UpdateGrid(cloud,map_1);
}

/*******发送给自动化所的时间回调******/
void TimerCallback1(const ros::TimerEvent& timerEvent)
{
  //cout <<"TimerCallback1"<<endl;
  /*
  boost::mutex::scoped_lock lock(lock_map);
  if(map_1.empty())
    return;
  for(umap::iterator iter=map_1.begin();iter!=map_1.end();)
  {
    if(ros::Time::now().toSec() -iter->second.updateTime.toSec()>0.5)
    {
      map_1.erase(iter++);

      continue;
    }
    iter++;
  }
  */
  //cout <<"map.size="<<map_1.size()<<endl;
}

/*******判断路面栅格，并发送给邱曾帅*********/
void TimerCallback2(const ros::TimerEvent& timerEvent)
{
  cout <<"TimerCallback2\n";
  sensor_msgs::PointCloud grids;
  grids.header.stamp = ros::Time::now();
  grids.header.frame_id="/world";
  geometry_msgs::Point32 p;
  ros::Time now = ros::Time::now();
  sensor_msgs::ChannelFloat32 colors;
  colors.name="rgb";
  {
  boost::mutex::scoped_lock lock(lock_map);
  if(map_1.empty())
    return;
  for(umap::iterator iter=map_1.begin();iter!=map_1.end();)
  {
    if(ros::Time::now().toSec() -iter->second.updateTime.toSec()>0.5)
    {
      map_1.erase(iter++);

      continue;
    }
    iter++;
  }
  }
  try{
    g_pTransformListener->waitForTransform("/world", "/vehicle",now, ros::Duration(0.5));
    g_pTransformListener->lookupTransform("/world", "/vehicle",now, (*g_pStampedTransform));
        
  }
  catch (tf::TransformException ex){
    ROS_INFO("%s",ex.what());
    return;
        
  }
  double x_v = g_pStampedTransform->getOrigin().x();
  double y_v = g_pStampedTransform->getOrigin().y();
  double z_v = g_pStampedTransform->getOrigin().z();
  /*
  //cout <<x_v<<"\t"<<y_v<<"\t"<<z_v<<endl;
  double fYaw, fPitch, fRoll,x,y,z;
  double x_o,y_o;
  double height_left,height_right;
  height_left = (-0.9)*sin(fYaw)+z_v;
  height_right = 0.9*sin(fYaw)+z_v;
  tf::Matrix3x3(g_pStampedTransform->getRotation()).getEulerYPR(fYaw, fPitch, fRoll);
  */
  unordered_map_voxel temp_key(0,0,resolution);
  { 
    boost::mutex::scoped_lock lock(lock_map);
    if(map_1.empty())
      return;
    for(umap::iterator iter=map_1.begin();iter!=map_1.end();iter++)
    {
      //筛选出高低差较小，最大高度比车当前高度差不多的栅格。即初选疑似平坦栅格
      if(iter->second.MaxHeight-iter->second.MinHeight<0.4 && (iter->second.MaxHeight - z_v < 1))
      {
        const int x = iter->first.x();
        const int y = iter->first.y();
        //排除掉最低高度比车当前位置低很多的栅格
        if(z_v-iter->second.MinHeight > 1)
        {
          continue;
        }
        //搜索近邻，只要周围没有不平坦栅格的栅格。再次排除掉一部分
        if(mc.Search_Neibor(iter->first,2,z_v,map_1))
        {
          //得到栅格中心点的坐标。用于显示
          if(x>0)
            p.x = x*resolution - resolution/2;
          else
            p.x = x*resolution + resolution/2;
          if(y>0)
            p.y = y*resolution - resolution/2;
          else
            p.y = y*resolution + resolution/2;
          p.z = iter->second.MaxHeight;
          colors.values.push_back(255);
          grids.points.push_back(p); 
          continue;
        }

        //周围有崎岖栅格的存在，那么直接跳过，不要这个栅格了
        else
        {
          continue;
        }
      }
      else
      {
      }
    }
  }
  cout <<"publish grids sum = "<<grids.points.size()<<endl;
  grids.channels.push_back(colors);
  grid_to_graph.publish(grids);

}
/******右侧激光的回调*****/
//现在数据还没有
void PointCloudCallback2(sensor_msgs::PointCloud cloud)
{
  //mc.UpdateGrid(cloud,map_1);
}

/******接受邱曾帅的图像处理结果*******/
void PointCloudCallback3(sensor_msgs::PointCloud cloud)
{

}

/****三维激光数据的回调******/
//现在还没做激光数据与惯导的融合,这部分目前只用来测试效率
void PointCloudCallback4(sensor_msgs::PointCloud2 cloud)
{
  //mc.UpdateGrid_PointCloud2(cloud,map_1);
}


int main(int argc,char** argv)
{
  ros::init(argc,argv,"mapping_dlut");
  ros::NodeHandle node;

  //发给邱增帅的消息
  grid_to_graph = node.advertise<sensor_msgs::PointCloud>("/grid_to_graph",10);

  ros::Subscriber sub1;
  ros::Subscriber sub2;
  ros::Subscriber sub3;
  ros::Subscriber sub4;

  g_pTransformListener = new tf::TransformListener;
  g_pStampedTransform = new tf::StampedTransform;

  sub1 = node.subscribe<sensor_msgs::PointCloud>("lms1PC",10,PointCloudCallback1);
  //sub2 = node.subscribe<sensor_msgs::PointCloud>("/lms2_point_cloud",10,PointCloudCallback2);
  sub3 = node.subscribe<sensor_msgs::PointCloud>("/graph_to_grid",10,PointCloudCallback3);
  sub4 = node.subscribe<sensor_msgs::PointCloud2>("/velodyne_points",10,PointCloudCallback4);

  //发给自动化所的消息在这个时间回调中完成
  ros::Timer timer1=node.createTimer(ros::Duration(0.5),TimerCallback1);

  //发给邱增帅的消息在这个时间回调中完成
  ros::Timer timer2=node.createTimer(ros::Duration(0.5),TimerCallback2);

  ros::spin();

  delete g_pTransformListener;
  delete g_pStampedTransform;

}
