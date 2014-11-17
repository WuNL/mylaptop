/*************************************************************************
	> File Name: src/hash_map_voxel.cpp
	> Author: 吴乃亮
	> Mail: wunailiang@gmail.com 
	> Created Time: Mon 28 Apr 2014 09:07:43 AM CST
 ************************************************************************/

#include<iostream>
#include"ros/ros.h"
#include"unordered_map_voxel.h" //不需要排序的话最好用这个hash_map
//using namespace std;
//using namespace boost;



size_t hash_value(const unordered_map_voxel &v)
{
    size_t seed =0;
    boost::hash_combine(seed, boost::hash_value(v.x()));
    boost::hash_combine(seed, boost::hash_value(v.y()));
    return seed;
}
