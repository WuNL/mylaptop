/*************************************************************************
  > File Name: dlut_hash_icp.cpp
  > Author: 吴乃亮
  > Mail: wunailiang@gmail.com
  > Created Time: Wed 21 May 2014 10:13:53 AM CST
 ************************************************************************/

#include<iostream>
#include"ros/ros.h"
//用于打开pcd
#include <pcl/io/io.h>
#include <pcl/io/pcd_io.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/filter.h>



#include "src/voxel.h"
#include "src/icp.h"


#include "src/net_transfor.h"
using namespace std;

typedef boost::unordered_map<unordered_map_voxel,un_key> umap;

int main(int argc,char** argv)
{
    ros::init(argc,argv,"dlut_hash_icp");
    ros::NodeHandle n;

    Voxelize* voxelize1;
    voxelize1 = new Voxelize;

    /*
     *网络传输模块
     */
    Net_transfor n1(0);

    //打开两个pcd文件并且分别进行栅格化处理
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud1(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ> cloud_fil;
    pcl::PointCloud<pcl::PointXYZ> cloud_fil1;
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_unmerged(new pcl::PointCloud<pcl::PointXYZ>);

    pcl::PCDReader reader;
    reader.read<pcl::PointXYZ>("3.pcd",*cloud);

    /*
     *滤波，过滤掉无效激光点
     */
    std::vector<int> indices;
    pcl::removeNaNFromPointCloud(*cloud,*cloud, indices);
    indices.clear();
    cout <<"cloud.size="<<cloud->size()<<endl;

    boost::unordered_map<unordered_map_voxel,un_key> m1;

    /*
     *滤波，用于精简数据加速算法
     */
    pcl::VoxelGrid<pcl::PointXYZ> sor;
    sor.setInputCloud(cloud);
    sor.setLeafSize(0.01f,0.01f,0.01f);
    sor.filter(cloud_fil);

    /*
     * 做一个旋转平移矩阵打乱匹配点云
     */
    Eigen::Matrix4f tf_distored=Eigen::Matrix4f::Identity();
    double theta=3.1415926/6;
    tf_distored(0,0)=cos(theta);
    tf_distored(0,1)=-sin(theta);
    tf_distored(1,0)=sin(theta);
    tf_distored(1,1)=cos(theta);
    tf_distored(0,3)=0.1;
    tf_distored(1,3)=0.1;
    pcl::transformPointCloud(cloud_fil,cloud_fil,tf_distored);

    voxelize1->generateUmap(cloud_fil,0.3,m1);

    reader.read<pcl::PointXYZ>("4.pcd",*cloud1);
    pcl::removeNaNFromPointCloud(*cloud1,*cloud1, indices);

    sor.setInputCloud(cloud1);
    sor.setLeafSize(0.01f,0.01f,0.01f);
    sor.filter(cloud_fil1);
    *cloud_unmerged=(cloud_fil+cloud_fil1);

    /*
     *存储未做任何处理的点云
     */
    pcl::PCDWriter writer;
    writer.write("un_merged.pcd",*cloud_unmerged);

    cout <<"cloud1.size="<<cloud1->size()<<endl;
    boost::unordered_map<unordered_map_voxel,un_key> m2;
    voxelize1->generateUmap(cloud_fil1,0.3,m2);
    /*
       double jd = 30*3.1415927/180;
       double x_shift = 0.1;
       double y_shift = -0.1;
       for(int i = 0;i<cloud.size();i++)
       {
    //cout << cloud[i]<<endl;
    //continue;
    cloud1[i].x = cos(jd)*cloud[i].x-sin(jd)*cloud[i].y+x_shift;
    cloud1[i].y = sin(jd)*cloud[i].x + cos(jd)*cloud[i].y+y_shift;
    cloud1[i].z = cloud[i].z;
    }
    Matrix3d real_R;
    real_R <<cos(jd),-sin(jd),0,sin(jd),cos(jd),0,0,0,1;
    cout <<"实际的旋转弧度为："<<jd<<endl;
    cout <<"实际旋转矩阵="<<endl << real_R<<endl;
    cout << "实际的平移x,y,z为："<<endl<<x_shift<<"\t"<<y_shift<<"\t"<<0<<endl;
    voxelize1->generateUmap(cloud1,0.3,m2);
    */
    /*


       pair<umap::iterator,bool> search_result;
       pcl::PointCloud<pcl::PointXYZ> cloud_a;//用于存储搜索到的重复区域
       for(umap::iterator iter=m2.begin();iter!=m2.end();iter++)
       {
       if(iter->second.p>0.7)
       {
       search_result = voxelize1->neighbor_search(m1,m2,iter->first);
       if(search_result.second)
       {
    //cout <<"size="<<search_result.first->second.vec_index_point.size()<<endl;

    for(int j = 0 ; j< search_result.first->second.vec_index_point.size(); j++)
    {
    double x_ = cloud[search_result.first->second.vec_index_point[j]].x;
    double y_ = cloud[search_result.first->second.vec_index_point[j]].y;
    double z_ = cloud[search_result.first->second.vec_index_point[j]].z;
    pcl::PointXYZ temppoint(0,0,0);

    temppoint.x = x_;
    temppoint.y = y_;
    temppoint.z = z_;
    cloud_a.push_back(temppoint);
    }
    }
    }
    }
    pcl::io::savePCDFileBinary("result.pcd",cloud_a);
    */

    double t0=ros::Time::now().toSec();
    Icp testicp(m1,m2,cloud_fil,0);
    Eigen::Matrix4f tf_mat=testicp.icpFit();
    cout<<"花费时间："<<(ros::Time::now().toSec()-t0)<<endl;
    pcl::transformPointCloud(cloud_fil,cloud_fil,tf_mat);
    cloud->clear();
    *cloud=(cloud_fil+cloud_fil1);
    writer.write("merged.pcd",*cloud);

    delete voxelize1;
    cout << "hello icp" <<endl;
    return 0;
}
