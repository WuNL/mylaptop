/*************************************************************************
	> File Name: map_ctrl.h
	> Author: 吴乃亮
	> Mail: wunailiang@gmail.com 
	> Created Time: Wed 30 Jul 2014 05:28:54 PM CST
 ************************************************************************/

#include<iostream>
#include<math.h>  
#include <boost/thread/mutex.hpp>
#include <sensor_msgs/point_cloud_conversion.h>
#include <pcl_conversions/pcl_conversions.h>
#include "unordered_map_voxel.h"
using namespace std;
using namespace boost;
typedef boost::unordered_map<unordered_map_voxel,un_value> umap;
class MapCtrl
{
public:
  MapCtrl(double res):resolution(res)
  {}
  void UpdateGrid(sensor_msgs::PointCloud cloud,umap& map);
  void UpdateGrid_PointCloud2(sensor_msgs::PointCloud2 &cloud,umap& map);
  void SelectGrid(float fx,float fy,umap& map)
  {}
  bool Search_Neibor(const unordered_map_voxel& umv,const int n,const double z,umap& map);

private:
  double resolution;
  boost::mutex lock_map;
};

void MapCtrl::UpdateGrid(sensor_msgs::PointCloud cloud,umap& map)
{
  un_value temp_value;
  umap::iterator iter;
  boost::mutex::scoped_lock lock(lock_map);
  for(int i = 0;i<cloud.points.size();++i)
  {
    double x = cloud.points[i].x;
    double y = cloud.points[i].y;
    double z = cloud.points[i].z;
    unordered_map_voxel temp_key(x,y,resolution);
    if(0 == map.count(temp_key))
    {
      temp_value.MaxHeight=z;
      temp_value.MinHeight=z;
      temp_value.num=1;
      map.insert(umap::value_type(temp_key,temp_value));
      continue;  
    }
    //cout <<"marker0\n";
    iter = map.find(temp_key);
    if(z>iter->second.MaxHeight)
      iter->second.MaxHeight = z;
    if(z<iter->second.MinHeight)
      iter->second.MinHeight = z;
    iter->second.num = iter->second.num+1;
    iter->second.updateTime = ros::Time::now();


  }

  //cout <<"map.size="<<map.size()<<endl;
}
void MapCtrl::UpdateGrid_PointCloud2(sensor_msgs::PointCloud2 &cloud,umap& map)
{
  un_value temp_value;
  umap::iterator iter;
  pcl::PointCloud<pcl::PointXYZ> cloud_;
  pcl::fromROSMsg(cloud,cloud_);
  boost::mutex::scoped_lock lock(lock_map);
  for(int i = 0;i<cloud_.points.size();++i)
  {
    double x = cloud_.points[i].x;
    double y = cloud_.points[i].y;
    double z = cloud_.points[i].z;
    unordered_map_voxel temp_key(x,y,resolution);
    if(0 == map.count(temp_key))
    {
      temp_value.MaxHeight=z;
      temp_value.MinHeight=z;
      temp_value.num=1;
      map.insert(umap::value_type(temp_key,temp_value));
      continue;  
    }
    iter = map.find(temp_key);
    if(z>iter->second.MaxHeight)
      iter->second.MaxHeight = z;
    if(z<iter->second.MinHeight)
      iter->second.MinHeight = z;
    iter->second.num = iter->second.num+1;
    iter->second.updateTime = ros::Time::now();
  }

  /*
  for(int i = 0;i< cloud_.points.size();++i)
  {
    float x = cloud_.points[i].x;
    float y = cloud_.points[i].y;
    float z = cloud_.points[i].z;
    unordered_map_voxel temp_key(x,y,resolution);
    if(z>temp_value.MaxHeight)
      temp_value.MaxHeight = z;
    if(z<temp_value.MinHeight)
      temp_value.MinHeight = z;
    temp_value.num++;
    temp_value.updateTime = ros::Time::now();

    map.insert(umap::value_type(temp_key,temp_value));
   
  }
  */
}

bool MapCtrl::Search_Neibor(const unordered_map_voxel& umv,const int n,const double z,umap& map)
{
  int x = umv.x();
  int y = umv.y();
  int n_=0;
  int n_valid=0;
  int sum = (n*2+1)*(n*2+1);
  boost::mutex::scoped_lock lock(lock_map);
  for(int i = x-n;i<=x+n;++i)
  {  
    for(int j = y-n;j<=y+n;++j)
    {  
      unordered_map_voxel temp_key(i,j);
      if(map.count(temp_key)!=0)
      {
        ++n_valid;
        umap::iterator iter = map.find(temp_key);
        if(iter->second.MaxHeight-iter->second.MinHeight>0.4) 
          ++n_;
        continue;
      }
    }
  }
  if(n_>2 || n_valid <3)
    return false;
  else 
    return true;
}
