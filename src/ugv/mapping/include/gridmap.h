#ifndef GRIDMAP_H
#define GRIDMAP_H

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <ros/ros.h>
#include <nav_msgs/OccupancyGrid.h>
#include <message_filters/subscriber.h>
#include <sensor_msgs/PointCloud.h>
#include <nav_msgs/OccupancyGrid.h>
#include "tf/transform_datatypes.h"
#include <mapping/Grid.h>
#include <mapping/Map.h>
#include <transformation/VehiclePose.h>

#include <tf/tf.h>

class GridMap
{
public:
    GridMap(ros::NodeHandle node, float gridResolution, int halfGridSize);
    ~GridMap();
    void InertPointCloud(sensor_msgs::PointCloud cloud, bool intensity);
    void PublishGridMap(transformation::VehiclePoseConstPtr pose);
private:
    void InsertPoint();
    inline bool LocatePointInMemMap(float fX, float fY, int* nIndexX, int* nIndexY);
    inline bool LocateIndexInMemArray(int nIndexX, int nIndexY, int* nIndex);
    inline bool LocatePointInMemArray(float fX, float fY, int* nIndex);
    inline void UpdateGrid(int nIndex, float fZ, int nIntensity = 0);
    inline bool IsInMap(float fX, float fY);
    inline bool IsInArray(int nIndexX, int nIndexY);
    inline bool NeedWrapAround(int nIndexX, int nIndexY);
    inline bool WrapAroundGrid(int nIndexX, int nIndexY, int* nWrapIndexX, int* nWrapIndexY);
    void UpdateMapCenter(float fX, float fY, float fZ);
    void LocateGridCenterInMap(int nIndexX, int nIndexY, float* fCenterX, float* fCenterY);
    void UpdateNavigationMap();
    inline void UpdateNavigationMapGrid(int nIndex, int nNavIndex);
    void PublishROSMsg(transformation::VehiclePoseConstPtr pose);
    const bool NearVehicle(int NavIndex);
    const bool noiceFiliter(int navIndex);
		const bool HolenoiceFiliter(int navIndex);
		const bool HoleEdge(int index);
		const bool Hole(int index);
private:
    float m_fPointX;
    float m_fPointY;
    float m_fPointZ;
    int m_nPointIntensity;
    int m_nPointIndexX;
    int m_nPointIndexY;
    int m_nPointIndex;

    /**map settings*/
    float m_fGridResolution;//grid resolution in meter;
    float m_fHalfGridResolution;//half of grid resolution in meter;
    int m_nQuaterGridSize;//quater of memory map;
    int m_nHalfGridSize;//half grid size of memory map, also the grid size of navigation map;
    int m_nGridSize;//grid size of memory map;
    int m_nMemArraySize;//memory array size;
    int m_nNavArraySize;//navigation memory size;
    float m_fQuaterLength;//
    float m_fHalfLength;//half map length;
    float m_fLength;//map length;

    bool m_bMapInitialized;

    /**map center*/
    float m_fCenterX;//center coordinate in x(north) direction;
    float m_fCenterY;//center coordinate in y(west) direction;
    int m_nCenterIndexX;//center index in x(north) direction;
    int m_nCenterIndexY;//center index in y(west) direction;
    float m_fCeneterAltitude;//center altitude;
    /**
    * @brief the struct of grid;
    *
    */
    struct Grid
    {
        float fMaxElevation;//maximum elevation in this grid;
        float fMinElevation;//minimum elevation in this grid;
        float fAvgElevation;//average elevation in this grid;
        int nPointCount;//point count in this grid;
        int nUpCount;//up point count in this grid;
        int nDownCount;//down point count in this grid;
        float probability_Obstacle;//the probability of grid is obstacle or not. -1:unknown,0:plain,100:obstacle;
        bool maybe_Obstactle;
				bool maybe_HoleEdge;
				bool is_HoleEdge;
        ros::Time timeStamp;//latest timestamp of this grid, update at every new point;
        ros::Time timeStamp_updateGrids;//latest reset timestamp of this grid, update every 3-7S,obstacle 0.5s;
    };
    Grid* m_pMemMap;
    Grid* m_pNavMap;
    float m_fMaxElevationDifference;
    float m_nMaxUpdateCount;

    ros::Time m_TimeStamp;
    ros::Time m_TimeNow;
    ros::Duration m_TimeDifference;

    //    nav_msgs::OccupancyGrid m_OccupancyGrid;
    //    ros::NodeHandle m_ROSNode;
    //    ros::Publisher m_OccPublisher;
    //
    float liveTime;
    float fAvg;
    int count:8;
    //    mapping::Map my_GridMap;
    //    ros::Publisher m_GridMapPublisher;
    nav_msgs::OccupancyGrid m_msgOccupancyGrid;
    ros::NodeHandle m_ROSNode;
    ros::Publisher m_pubOccupancyGrid;

    /** current vehicle pose*/
    transformation::VehiclePose m_currentVehiclePose;
    mapping::Map m_msgMap;
    ros::Publisher m_pubMap;
};
#endif // GRIDMAP_H
