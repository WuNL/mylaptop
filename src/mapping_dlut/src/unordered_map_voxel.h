/*************************************************************************
	> File Name: src/unordered_map_voxel.h
	> Author: 吴乃亮
	> Mail: wunailiang@gmail.com 
	> Created Time: Mon 28 Apr 2014 04:22:04 PM CST
 ************************************************************************/

#ifndef Unordered_map_h
#define Unordered_map_h

#include<iostream>
#include <vector>
#include <boost/unordered_map.hpp>
#include <eigen3/Eigen/Dense>
#include "ros/ros.h"
using namespace std;
using namespace boost;
using namespace Eigen;





class unordered_map_voxel
{
public:
    unordered_map_voxel(double x,double y,double resolution): //用于从点的三坐标得到栅格坐标
    _resolution(resolution)
		{
		  if(x>=0)
		      _x= x/resolution +1;
		  else
		      _x = x/resolution -1;
		  if(y>=0)
		      _y = y/resolution +1;
		  else
		      _y = y/resolution -1;
		}

    unordered_map_voxel& operator = (const unordered_map_voxel& other)
    {
      _x = other._x;
      _y = other._y;
      _resolution = other._resolution;
      return *this;
    }

    //用于从点的三坐标得到栅格坐标,目的是方便的得到一个临时key来做插入查询
    unordered_map_voxel(int x,int y):
      _x(x),
      _y(y)
    {
    }

    bool operator== (const unordered_map_voxel& v) const // 判断是否相同
    {
        return _x == v._x && _y == v._y;
    }

    //const 返回值 const 函数  防止乱改
    const int x() const
    {
        return _x;
    }

    const int y() const
    {
        return _y;
    }

private:
    double _resolution;
    int _x; // 三坐标
    int _y;
};


size_t hash_value(const unordered_map_voxel &v);
//8，8，8，4，4。占32字节,上面的类占用16字节。加起来一个栅格大约占了48字节
class un_value
{
public:
  un_value():MaxHeight(0),MinHeight(0),Texture(-1),num(0)
  {}
  ros::Time updateTime;
  double MaxHeight;
  double MinHeight;
  int Texture;
  unsigned int num;
};
#endif
