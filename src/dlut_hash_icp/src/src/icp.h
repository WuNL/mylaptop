/*************************************************************************
  > File Name: icp.h
  > Author: 吴乃亮
  > Mail: wunailiang@gmail.com
  > Created Time: Wed 21 May 2014 07:00:53 PM CST
 ************************************************************************/
#ifndef icp_h
#define icp_h

#include<iostream>
#include "ros/ros.h"
#include <eigen3/Eigen/Dense>
#include<boost/unordered_map.hpp> //不需要排序的话最好用这个hash_map
#include"unordered_map_voxel.h"
#include "voxel.h"
#include <vector>
#include <pcl/console/parse.h>
#include <pcl/registration/ia_ransac.h>
using namespace std;


typedef boost::unordered_map<unordered_map_voxel,un_key> umap;


class LS_Param //least_square_param
{
    public:
        Matrix3d S_merged;
        Vector3d u_a;
        Vector3d u_b;
        Vector3d v1;
        ArrayXd CT;
        double lamada1;
};




class Icp
{
    public:
        //Icp(){}
        Icp(umap &m1, umap &m2,pcl::PointCloud<pcl::PointXYZ> &cloud,double jd);
        ~Icp(){RT.close();}
        void least_Square();//最小二乘
        bool voxel_Merge(unordered_map_voxel &v1 , unordered_map_voxel &v2);//合并匹配对，计算出CT行向量
        bool linear_System();//建立Ax=b的线性模型
        bool correction();//校正

        Eigen::Matrix4f icpFit();

    private:
        Matrix3d R;
        Vector3d t;
        umap& m_1;
        umap& m_2;
        vector<LS_Param> mat_param;
        LS_Param temp_ls;
        umap m_1_copy;
        pcl::PointCloud<pcl::PointXYZ> cloud_source;
        bool first_iter;

        double jd_real;
        double jd_x;
        double jd_y;
        double jd_z;

        std::ofstream RT;

};



#endif
