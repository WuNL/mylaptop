#include "gridmap.h"
// da yuan quan de ban jing
const int CircleR = 4.0;
//cha ru dian shi de gaodu pan duan . yongyu lv diao sui dao ding
const double altitudeLimit = 1.5;
// gu zhang shan ge de sheng cun shi jian
const double ObLiveTime = 5.0;
GridMap::GridMap(ros::NodeHandle node, float gridResolution, int halfGridSize):
    m_ROSNode(node),
    m_fGridResolution(gridResolution),
    m_fHalfGridResolution(gridResolution/2.0),
    m_nQuaterGridSize(halfGridSize),
    m_nHalfGridSize(2*halfGridSize+1),
    m_nGridSize(2*m_nHalfGridSize+1),
    m_fQuaterLength((m_nQuaterGridSize+0.5)*m_fGridResolution),
    m_fHalfLength((m_nHalfGridSize+0.5)*m_fGridResolution),
    m_fLength(m_nGridSize*m_fGridResolution),
    m_nCenterIndexX(m_nHalfGridSize),
    m_nCenterIndexY(m_nHalfGridSize),
    m_nMemArraySize(m_nGridSize*m_nGridSize),
    m_nNavArraySize(m_nHalfGridSize*m_nHalfGridSize),
    m_bMapInitialized(false),
    liveTime(3.0),
    count(0)
{
    //allocate memory
    m_pMemMap = new Grid[m_nMemArraySize];
    memset(m_pMemMap, 0x00, m_nMemArraySize*sizeof(struct Grid));
    m_pNavMap = new Grid[m_nNavArraySize];
    memset(m_pNavMap, 0x00, m_nNavArraySize*sizeof(struct Grid));
    m_pubOccupancyGrid = m_ROSNode.advertise<nav_msgs::OccupancyGrid>("occupancyMap", 20);
    m_pubMap = m_ROSNode.advertise<mapping::Map>("gridMap", 20);
}
GridMap::~GridMap()
{
    delete []m_pMemMap;
    delete []m_pNavMap;
}

/**@brief insert point cloud into the grid map;
  *
  *insert point cloud into the grid map, point cloud source includes lms1, lms2, velodyne0;
  *@param cloud [IN]: the point cloud to be inserted;
  *@param intensity [IN]: if true, the intensity could be used; if false, the intensity could not be used;
  *@return void;
  *@note the (x,y,z,intensity) is copied to member variables;
  *@todo intensity ?
  */
void GridMap::InertPointCloud(sensor_msgs::PointCloud cloud, bool intensity)
{
    if(!m_bMapInitialized)//if map not initialized, return; the map center altitude is not initialized yet;
    {
        return;
    }
    int i = 0;
    for(i=0; i<cloud.points.size(); i++)
    {
        m_fPointX = cloud.points[i].x;
        m_fPointY = cloud.points[i].y;
        m_fPointZ = cloud.points[i].z;
        //Wu
        if(m_fPointZ > m_fCeneterAltitude+altitudeLimit)
            continue;

        if(intensity)
        {
            m_nPointIntensity = cloud.channels[0].values[i];
        }
        else
        {
            m_nPointIntensity = 0;
        }

        InsertPoint();
    }
}

/**@brief insert point into the grid map;
  *
  *insert LiDAR(m_fPointX, m_fPointY, m_fPointZ, m_nPointIntensity) measurement into the grid;
  *@return void;
  *@note the LMS511 intensity could be used, velodyne intensity should be discarded;
  */
void GridMap::InsertPoint()
{
    if(LocatePointInMemArray(m_fPointX, m_fPointY, &m_nPointIndex))
    {
        UpdateGrid(m_nPointIndex, m_fPointZ, m_nPointIntensity);
    }
}

/**@brief locate point in the memory array;
  *
  *locate point in the memory array by the (x,y) coordinate of the point;
  *@param fX [IN]: the x coordinate of the point;
  *@param fY [IN]: the y coordinate of the point;
  *@param nIndex [OUT]: the index of the point in the memory array;
  *@return bool: if the point is in the memory map, return true; else, return false;
  *@note the index starts from 0;
  */
bool GridMap::LocatePointInMemArray(float fX, float fY, int *nIndex)
{
    if(LocatePointInMemMap(m_fPointX, m_fPointY, &m_nPointIndexX, &m_nPointIndexY))
    {
        if(LocateIndexInMemArray(m_nPointIndexX, m_nPointIndexY, &m_nPointIndex))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}

/**@brief locate point index in memory map;
*
* locate point index (indexX, indexY) in memory map;
*@param fX [IN]: x coordinate of the point in world frame;
*@param fY [IN]: y coordinate of the point in world frame;
*@param nIndexX [OUT]: the x index of the point in memory map;
*@param nIndexY [OUT]: the y index of the point in memory map;
*@return bool: if the point is out of the range of the memory map, return false; else, return true;
*@note the point index is the wrapped index of the point;
*/
bool GridMap::LocatePointInMemMap(float fX, float fY, int *nIndexX, int *nIndexY)
{
    if(!IsInMap(fX, fY))
    {
        return false;
    }

    /**temp variables*/
    int indexX = 0;
    int indexY = 0;

    float distToCenterX = fX-m_fCenterX;
    if(fabs(distToCenterX)<m_fHalfGridResolution)
    {
        indexX = m_nCenterIndexX;
    }
    else
    {
        if(distToCenterX>0.0)
        {
            distToCenterX = distToCenterX-m_fHalfGridResolution;
            indexX = m_nCenterIndexX+ceil(distToCenterX/m_fGridResolution);
        }
        else
        {
            distToCenterX = fabs(distToCenterX+m_fHalfGridResolution);
            indexX = m_nCenterIndexX-ceil(distToCenterX/m_fGridResolution);
        }
    }

    float distToCenterY = fY-m_fCenterY;
    if(fabs(distToCenterY)<m_fHalfGridResolution)
    {
        indexY = m_nCenterIndexY;
    }
    else
    {
        if(distToCenterY>0.0)
        {
            distToCenterY = distToCenterY-m_fHalfGridResolution;
            indexY = m_nCenterIndexY+ceil(distToCenterY/m_fGridResolution);
        }
        else
        {
            distToCenterY = fabs(distToCenterY+m_fHalfGridResolution);
            indexY = m_nCenterIndexY-ceil(distToCenterY/m_fGridResolution);
        }

    }

    *nIndexX = indexX;
    *nIndexY = indexY;

    if(NeedWrapAround(indexX, indexY))
    {
        if(WrapAroundGrid(indexX, indexY, nIndexX, nIndexY))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    return true;
}


/**@brief check if the index of a point need wrap around;
  *
  *
  *@param nIndexX [IN]: x index of the point in memory map;
  *@param nIndexY [IN]: y index of the point in memory map;
  *@return if the point index need wrap around, return true; else, return false;
  *@note if the index is <0 or >= mem_map_grid_size, the index needs wrap around;
  */
bool GridMap::NeedWrapAround(int nIndexX, int nIndexY)
{
    if(nIndexX<0 || nIndexX>=m_nGridSize)
    {
        return true;
    }

    if(nIndexY<0 || nIndexY>=m_nGridSize)
    {
        return true;
    }

    return false;
}

/**@brief wrap around the point index;
  *
  *@param nIndexX [IN]: the x index of the point in memory map;
  *@param nIndexY [IN]: the y index of the point in memory map;
  *@param nWrapIndexX [OUT]: the wrapped x index of the point in memory map;
  *@param nWrapIndexY [OUT]: the wrapped y index of the point in memory map;
  *@return bool: if the wrapped point still needs further wrap around, which means the point is beyond the range of the memory map, return false; else, return true;
  *@note return true indicates the point is not inside the meory map;
  */
bool GridMap::WrapAroundGrid(int nIndexX, int nIndexY, int *nWrapIndexX, int *nWrapIndexY)
{
    int wrapIndexX = nIndexX;
    if(nIndexX<0)
    {
        wrapIndexX = nIndexX+m_nGridSize;
    }
    else
    {
        if(nIndexX>=m_nGridSize)
        {
            wrapIndexX = nIndexX-m_nGridSize;
        }
    }

    int wrapIndexY = nIndexY;
    if(nIndexY<0)
    {
        wrapIndexY = nIndexY+m_nGridSize;
    }
    else
    {
        if(nIndexY>=m_nGridSize)
        {
            wrapIndexY = nIndexY-m_nGridSize;
        }
    }

    *nWrapIndexX = wrapIndexX;
    *nWrapIndexY = wrapIndexY;
    if(NeedWrapAround(wrapIndexX, wrapIndexY))
    {
        return false;
    }
    else
    {
        return true;
    }
}

/**@brief locate index of the point in memory array;
  *
  *@param nIndexX [IN]: the wrapped x index of the point in memory map;
  *@param nIndexX [IN]: the wrapped y index of the point in memory map;
  *@param nIndexX [OUT]: the index of the point in memory array;
  *@return bool: if the point is in the memory array, return true; else, return false;
  *@note
  */
bool GridMap::LocateIndexInMemArray(int nIndexX, int nIndexY, int *nIndex)
{
    if(!IsInArray(nIndexX, nIndexY))
    {
        return false;
    }

    *nIndex = nIndexX*m_nGridSize+nIndexY;
    return true;
}

/**@brief check if the point is in the map or not;
  *
  *check if the point is in the map or not by the distance between the point and the map center;
  *@param fX [IN]: the x coordinate of the point;
  *@param fY [IN]: the y coordinate of the point;
  *@return bool: if the point is in the map, return true; else, return false;
  */
bool GridMap::IsInMap(float fX, float fY)
{
    float fDistX = fabs(fX-m_fCenterX);
    float fDistY = fabs(fY-m_fCenterY);

    if(fDistX>m_fHalfLength || fDistY>m_fHalfLength)
    {
        return false;
    }
    else
    {
        return true;
    }

}

/**@brief check if the point index is in the memory array;
  *
  *@param nIndexX [IN]: the x index of the point;
  *@param nIndexY [IN]: the y index of the point;
  *@return bool: if the point index is in the memroy array, return true; else, return false;
  *@note
  */
bool GridMap::IsInArray(int nIndexX, int nIndexY)
{
    if(nIndexX<m_nGridSize && nIndexY<m_nGridSize)
    {
        return true;
    }
    else
    {
        return false;
    }
}


/**@brief update map center by current vehicle postion;
  *
  *when publishing the map, the map center is updated first by the vehicle position;
  *@param fX [IN]: the x coordinate of the vehicle in world frame;
  *@param fY [IN]: the y coordinate of the vehicle in world frame;
  *@param fZ [IN]: the z coordinate of the vehicle in world frame;
  *@return void;
  *@note the map center is the center of the grid that the vehicle falling into, the altitude of the center is updated by the z coordinate of the vehicle;
  */
void GridMap::UpdateMapCenter(float fX, float fY, float fZ)
{
    if(!m_bMapInitialized)
    {
        m_fCenterX = fX;
        m_fCenterY = fY;
        m_fCeneterAltitude = fZ;
        m_bMapInitialized = true;
        return;
    }
    else
    {
        int nIndexX = 0;
        int nIndexY = 0;

        /**locate the wrapped index of the vehicle*/
        LocatePointInMemMap(fX, fY, &nIndexX, &nIndexY);
        float fCenterX = 0.0;
        float fCenterY = 0.0;

        /**locate the center of the grid of the vehicle*/
        LocateGridCenterInMap(nIndexX, nIndexY, &fCenterX, &fCenterY);//get grid center;

        //update map center;
        m_fCenterX = fCenterX;
        m_fCenterY = fCenterY;
        m_nCenterIndexX = nIndexX;
        m_nCenterIndexY = nIndexY;
        m_fCeneterAltitude = fZ;
    }
}

/**@brief locate grid center by the index of the grid;
  *
  *@param nIndexX [IN]: the x index of the grid;
  *@param nIndexY [IN]: the y index of the grid;
  *@param fCenterX [IN]: the x coordinate of the grid center;
  *@param fCenterY [IN]: the y coordinate of the grid center;
  *@return void;
   *@note
*/
void GridMap::LocateGridCenterInMap(int nIndexX, int nIndexY, float *fCenterX, float *fCenterY)
{
    /**x coordinate*/
    if(nIndexX>m_nCenterIndexX)
    {
        if(nIndexX>m_nCenterIndexX+m_nHalfGridSize)
        {
            *fCenterX = m_fCenterX-(m_nGridSize-nIndexX+m_nCenterIndexX)*m_fGridResolution;
        }
        else
        {
            *fCenterX = m_fCenterX+(nIndexX-m_nCenterIndexX)*m_fGridResolution;
        }
    }
    else
    {
        if(nIndexX+m_nHalfGridSize<m_nCenterIndexX)
        {
            *fCenterX = m_fCenterX + (m_nGridSize-m_nCenterIndexX+nIndexX)*m_fGridResolution;
        }
        else
        {
            *fCenterX = m_fCenterX-(m_nCenterIndexX-nIndexX)*m_fGridResolution;
        }

    }


    /**y coordinate*/
    if(nIndexY>m_nCenterIndexY)
    {
        if(nIndexY>m_nCenterIndexY+m_nHalfGridSize)
        {
            *fCenterY = m_fCenterY-(m_nGridSize-nIndexY+m_nCenterIndexY)*m_fGridResolution;
        }
        else
        {
            *fCenterY = m_fCenterY+(nIndexY-m_nCenterIndexY)*m_fGridResolution;
        }
    }
    else
    {
        if(nIndexY+m_nHalfGridSize<m_nCenterIndexY)
        {
            *fCenterY = m_fCenterY + (m_nGridSize-m_nCenterIndexY+nIndexY)*m_fGridResolution;
        }
        else
        {
            *fCenterY = m_fCenterY-(m_nCenterIndexY-nIndexY)*m_fGridResolution;
        }
    }
}

/**@brief publish grid map;
  *
  *publish grid map: 1. update map center; 2. update navigation map; 3. publish ros msg based on navigation map;
  *@param fVehicleX [IN]: the x coordinate of the vehicle in world frame;
  *@param fVehicleX [IN]: the y coordinate of the vehicle in world frame;
  *@param fVehicleZ [IN]: the z coordinate of the vehicle in world frame;
  *@param fVehicleHeading [IN]: the heading of the vehicle;
  *@return void;
  *@note if the map is not initialized, only update the map center, do not publish ros message;
  */
void GridMap::PublishGridMap(transformation::VehiclePoseConstPtr pose)
{

    if(!m_bMapInitialized)//check if the map is initialized;
    {
        UpdateMapCenter(pose->x, pose->y, pose->z);
        return;
    }

    //Wu
    double linearVelocity = sqrt(pose->velocityX*pose->velocityX + pose->velocityY*pose->velocityY);
    liveTime = m_fHalfLength/(1.2*linearVelocity);
    if(liveTime>5)
        liveTime=5;
    if(liveTime<3)
        liveTime=3;
    std::cout<<liveTime<<std::endl;

    UpdateMapCenter(pose->x, pose->y, pose->z);
    UpdateNavigationMap();
    PublishROSMsg(pose);
}

/**@brief update navigation map;
  *
  *update navigation map by copying grids from memory map to navigation map;
  *@return void;
  *@note
  */
void GridMap::UpdateNavigationMap()
{
    m_fMaxElevationDifference = 0.0;
    m_nMaxUpdateCount = 0;

    //reset map
    memset(m_pNavMap, 0x00, m_nNavArraySize*sizeof(struct Grid));
    int nIndexX = 0;
    int nIndexY = 0;
    int nIndex = 0;
    int nNavIndex = 0;

    int i = 0;
    int j =0;
    for(i=m_nCenterIndexX-m_nQuaterGridSize; i<=m_nCenterIndexX+m_nQuaterGridSize; i++)//copy from right down corner;
    {
        for(j=m_nCenterIndexY-m_nQuaterGridSize; j<=m_nCenterIndexY+m_nQuaterGridSize; j++)
        {
            nIndexX = i;
            nIndexY = j;
            if(NeedWrapAround(i,j))
            {
                WrapAroundGrid(i,j, &nIndexX, &nIndexY);
            }
            LocateIndexInMemArray(nIndexX, nIndexY, &nIndex);
            UpdateNavigationMapGrid(nIndex, nNavIndex);


            if((m_pNavMap[nNavIndex].probability_Obstacle>51)&&(m_pNavMap[nNavIndex].probability_Obstacle<81))
            {
                if(HoleEdge(nNavIndex))
                {
                    if(Hole(nNavIndex)==true)
                    {
                        m_pMemMap[nIndex].is_HoleEdge = true;
                    }
                }
            }
            nNavIndex++;
        }
    }
}

/**@brief update the grid by the measurement;
  *
  * each measurement include z coordinate in world frame and intensity;
  *@param nIndex [IN]: the point index in memory array;
  *@param fZ [IN]: the z coordinate of the point;
  *@param nIntensity [IN]: the intensity of the point;
  *@return void;
  *@note the update scheme should be updated here;
  */
void GridMap::UpdateGrid(int nIndex, float fZ, int nIntensity)
{
    /**@todo update scheme should be updated here, point z should be compared to center altitude*/
    m_TimeStamp = ros::Time::now();
    m_TimeDifference = m_TimeNow-m_pMemMap[nIndex].timeStamp;

    if(m_TimeDifference.toSec()>liveTime)
    {
        //reset grid
        memset(&(m_pMemMap[nIndex]), 0x00, sizeof(struct Grid));
        m_pMemMap[nIndex].timeStamp = m_TimeNow;
        m_pMemMap[nIndex].timeStamp_updateGrids = m_TimeNow;
        m_pMemMap[nIndex].fMaxElevation = fZ;
        m_pMemMap[nIndex].fMinElevation = fZ;
        m_pMemMap[nIndex].fAvgElevation = fZ;
        m_pMemMap[nIndex].nDownCount = 1;
        m_pMemMap[nIndex].nUpCount = 1;
        m_pMemMap[nIndex].nPointCount = 1;
        m_pMemMap[nIndex].probability_Obstacle = 0;
        m_pMemMap[nIndex].maybe_Obstactle = false;
    }
    else
    {
        //Wu
//        if(m_pMemMap[nIndex].maybe_Obstactle == true)
//        {

//            ros::Duration m_TimeDifference_reset = m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids;
//            if(m_TimeDifference_reset.toSec()>1)
//            {
//                //reset grid
//                memset(&(m_pMemMap[nIndex]), 0x00, sizeof(struct Grid));
//                m_pMemMap[nIndex].timeStamp = m_TimeNow;
//                m_pMemMap[nIndex].timeStamp_updateGrids = m_TimeNow;
//                m_pMemMap[nIndex].fMaxElevation = fZ;
//                m_pMemMap[nIndex].fMinElevation = fZ;
//                m_pMemMap[nIndex].fAvgElevation = fZ;
//                m_pMemMap[nIndex].nDownCount = 1;
//                m_pMemMap[nIndex].nUpCount = 1;
//                m_pMemMap[nIndex].nPointCount = 1;
//                m_pMemMap[nIndex].probability_Obstacle = 0;
//                m_pMemMap[nIndex].maybe_Obstactle = false;
//                return;
//            }
//        }

        if(fZ>m_pMemMap[nIndex].fMaxElevation)
        {
            m_pMemMap[nIndex].fMaxElevation = fZ;
            m_pMemMap[nIndex].nUpCount++;
        }

        if(fZ<m_pMemMap[nIndex].fMinElevation)
        {
            m_pMemMap[nIndex].fMinElevation = fZ;
            m_pMemMap[nIndex].nDownCount++;
        }

        m_pMemMap[nIndex].fAvgElevation = (m_pMemMap[nIndex].fAvgElevation*m_pMemMap[nIndex].nPointCount+fZ)/(m_pMemMap[nIndex].nPointCount+1);
        m_pMemMap[nIndex].nUpCount += 1;
        m_pMemMap[nIndex].timeStamp = m_TimeNow;

        //Wu
        float probability_Obstacle = static_cast<float>(100*(m_pMemMap[nIndex].fMaxElevation - m_pMemMap[nIndex].fMinElevation)/0.5) + 1;
        if(probability_Obstacle>101)
            probability_Obstacle = 101;
        m_pMemMap[nIndex].nPointCount++;
        m_pMemMap[nIndex].probability_Obstacle = probability_Obstacle;

        //Wu
        if(probability_Obstacle >81) //1 is the value that confirm obstacle;
        {
            m_pMemMap[nIndex].maybe_Obstactle = true;
        }
    }
}

/**@brief update navigation map grid;
  *
  *update navigation map grid by copy corresponding grid from memory map;
  *@param nIndex [IN]: the index of the grid in memory array;
  *@param nNavIndex [IN]: the index of the grid in navigation array;
  *@return void;
  *@note
  */
void GridMap::UpdateNavigationMapGrid(int nIndex, int nNavIndex)
{
    /**@todo copy grid should consider timestamp here*/
    m_TimeNow = ros::Time::now();

    //Wu
    if(m_pMemMap[nIndex].maybe_Obstactle)
    {
        //Wu 8-21

        if(NearVehicle(nNavIndex) == true)
        {
            //std::cout<<(m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids).toSec()<<std::endl;
            memcpy(&(m_pNavMap[nNavIndex]), &(m_pMemMap[nIndex]), sizeof(struct Grid));
            return;
        }

        if((m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids).toSec()>ObLiveTime)
        {
            //std::cout<<(m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids).toSec()<<std::endl;
            memset(&(m_pMemMap[nIndex]), 0x00, sizeof(struct Grid));
            memset(&(m_pNavMap[nNavIndex]), 0x00, sizeof(struct Grid));

            if((m_pNavMap[nNavIndex].fMaxElevation-m_pNavMap[nNavIndex].fMinElevation)>m_fMaxElevationDifference)
            {
                m_fMaxElevationDifference = m_pNavMap[nNavIndex].fMaxElevation-m_pNavMap[nNavIndex].fMinElevation;
            }
            if(m_pNavMap[nNavIndex].nPointCount>m_nMaxUpdateCount)
            {
                m_nMaxUpdateCount = m_pNavMap[nNavIndex].nPointCount;
            }
            return;
        }
    }

    if(m_pMemMap[nIndex].is_HoleEdge)
    {
        //Wu 8-29

        if(NearVehicle(nNavIndex) == true)
        {
            //std::cout<<(m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids).toSec()<<std::endl;
            memcpy(&(m_pNavMap[nNavIndex]), &(m_pMemMap[nIndex]), sizeof(struct Grid));
            return;
        }

        if((m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids).toSec()>5.0)
        {
            //std::cout<<(m_TimeNow-m_pMemMap[nIndex].timeStamp_updateGrids).toSec()<<std::endl;
            memset(&(m_pMemMap[nIndex]), 0x00, sizeof(struct Grid));
            memset(&(m_pNavMap[nNavIndex]), 0x00, sizeof(struct Grid));

            if((m_pNavMap[nNavIndex].fMaxElevation-m_pNavMap[nNavIndex].fMinElevation)>m_fMaxElevationDifference)
            {
                m_fMaxElevationDifference = m_pNavMap[nNavIndex].fMaxElevation-m_pNavMap[nNavIndex].fMinElevation;
            }
            if(m_pNavMap[nNavIndex].nPointCount>m_nMaxUpdateCount)
            {
                m_nMaxUpdateCount = m_pNavMap[nNavIndex].nPointCount;
            }
            return;
        }
    }

    if((m_TimeNow-m_pMemMap[nIndex].timeStamp).toSec()<liveTime)
    {
        memcpy(&(m_pNavMap[nNavIndex]), &(m_pMemMap[nIndex]), sizeof(struct Grid));

        if((m_pNavMap[nNavIndex].fMaxElevation-m_pNavMap[nNavIndex].fMinElevation)>m_fMaxElevationDifference)
        {
            m_fMaxElevationDifference = m_pNavMap[nNavIndex].fMaxElevation-m_pNavMap[nNavIndex].fMinElevation;
        }
        if(m_pNavMap[nNavIndex].nPointCount>m_nMaxUpdateCount)
        {
            m_nMaxUpdateCount = m_pNavMap[nNavIndex].nPointCount;
        }
    }
    else
    {
        if(NearVehicle(nNavIndex) == true)
        {
            memcpy(&(m_pNavMap[nNavIndex]), &(m_pMemMap[nIndex]), sizeof(struct Grid));
        }
        else
        {
            memset(&(m_pMemMap[nIndex]), 0x00, sizeof(struct Grid));
            memset(&(m_pNavMap[nNavIndex]), 0x00, sizeof(struct Grid));
        }
    }
}

/**@brief publish ros msg;
  *
  *publish ros msg (occupancy grid);
  *@param fVehicleX [IN]: the x coordinate of the vehicle in world frame;
  *@param fVehicleY [IN]: the y coordinate of the vehicle in world frame;
  *@param fVehicleHeading [IN]: the heading of the vehicle;
  *@return void;
  *@note
  */
void GridMap::PublishROSMsg(transformation::VehiclePoseConstPtr pose)
{
    m_msgOccupancyGrid.header.frame_id = "world";
    m_msgOccupancyGrid.header.stamp = pose->header.stamp;
    m_msgOccupancyGrid.info.height = m_nHalfGridSize;
    m_msgOccupancyGrid.info.width = m_nHalfGridSize;
    m_msgOccupancyGrid.info.resolution = m_fGridResolution;
    m_msgOccupancyGrid.data.resize(m_nNavArraySize);
    m_msgOccupancyGrid.info.origin.position.x = pose->x-m_fQuaterLength;
    m_msgOccupancyGrid.info.origin.position.y = pose->y-m_fQuaterLength;
    m_msgOccupancyGrid.info.origin.position.z = pose->z;
    tf::Quaternion qua;
    qua.setEuler(3.1415926, 0.0, 3.1415/2.0);
    m_msgOccupancyGrid.info.origin.orientation.x =qua.x();
    m_msgOccupancyGrid.info.origin.orientation.y =qua.y();
    m_msgOccupancyGrid.info.origin.orientation.z =qua.z();
    m_msgOccupancyGrid.info.origin.orientation.w =qua.w();

    //Wu
    m_msgMap.flagImage = count++;
    m_msgMap.header.frame_id = "wrold";
    m_msgMap.header.stamp = pose->header.stamp;
    m_msgMap.fCenterX = m_fCenterX;
    m_msgMap.fCenterY = m_fCenterY;
    m_msgMap.fResolution = m_fGridResolution;
    m_msgMap.fVehicleX = pose->x;
    m_msgMap.fVehicleY = pose->y;
    m_msgMap.nHalfSize = m_nQuaterGridSize;
    m_msgMap.fVehicleHeading = pose->heading;
    m_msgMap.map.resize(m_nNavArraySize);

    mapping::Grid tempGrid;
    int n_erase = 0;
    for(int i=0; i<m_nNavArraySize; ++i)
    {
        //Wu-8-21        
        if(m_pNavMap[i].probability_Obstacle>81)
        {
            if(noiceFiliter(i))
            {
                n_erase++;
                memset(&(m_pNavMap[i]), 0x00, sizeof(struct Grid));
                m_pNavMap[i].probability_Obstacle = 1;
                m_msgOccupancyGrid.data[i] = m_pNavMap[i].probability_Obstacle -1;
                m_pNavMap[i].nPointCount = 1;
                m_pNavMap[i].fAvgElevation = fAvg;
            }
        }

        //Wu
        tempGrid.fAvgElevation = m_pNavMap[i].fAvgElevation;
        tempGrid.texture = -1;
        tempGrid.proability = m_pNavMap[i].probability_Obstacle -1;
        m_msgMap.map[i] = tempGrid;

        if(m_pNavMap[i].nPointCount == 0)
        {
            m_msgOccupancyGrid.data[i] = -1;
            tempGrid.proability=-1;
        }
        else if(m_pNavMap[i].probability_Obstacle >81)
        {
            m_msgOccupancyGrid.data[i] = 900000;
            tempGrid.proability=100;
        }
        else
        {
            m_msgOccupancyGrid.data[i] = m_pNavMap[i].probability_Obstacle -1;
            tempGrid.proability = m_pNavMap[i].probability_Obstacle -1;
        }
        if(m_pNavMap[i].is_HoleEdge)
        {
            if(HolenoiceFiliter(i)==false)
            {
                m_msgOccupancyGrid.data[i] = 2000;
                tempGrid.proability=100;
            }
        }
    }
    //std::cout <<"***********Erase Noice Grid************"<<n_erase<<std::endl;
    m_pubMap.publish(m_msgMap);
    m_pubOccupancyGrid.publish( m_msgOccupancyGrid);
}

/**@brief judge if the index near the center;
  *Wu
  *brief judge if the index near the center;
  *@param NavIndex: the index of navmap's grid;
  *@return bool;
  *@note
  */
const bool GridMap::NearVehicle(int NavIndex)
{
    int index = NavIndex;
    //X index: 0~m_nHalfGridSize
    int i = static_cast<int>(index%m_nHalfGridSize) - m_nQuaterGridSize;
    //Y index: 0~m_nHalfGridSize
    int j = static_cast<int>(index/m_nHalfGridSize) - m_nQuaterGridSize;


    int Difference = static_cast<int>(CircleR/m_fGridResolution); //plain Grids in 5M near the vehicle don't update
    if((i*i+j*j<Difference*Difference))
    //if((0<i<Difference)&&(-Difference<j<Difference))
    {
        return true;
    }
    else
        return false;
}

/**@brief judge if the index grid is a noice grid;
  *Wu
  *if is a noice grid,retuen true,
  *else return false;
  *@param NavIndex: the index of navmap's grid;
  *@return bool;
  *@note
  */
const bool GridMap::noiceFiliter(int index)
{
    int naborIndex[8] = {index-m_nHalfGridSize-1,index-m_nHalfGridSize,index-m_nHalfGridSize+1,index-1,index+1,index+m_nHalfGridSize-1,index+m_nHalfGridSize+1};
    int count = 0;
    for(int i = 0;i<8;++i)
    {
        if(naborIndex[i]<0 || naborIndex[i]>m_nNavArraySize)
            continue;
        count++;
        if(m_pNavMap[naborIndex[i]].probability_Obstacle>81)
            return false;
    }
    if(count == 0)
        return false;
    return true;
}
const bool GridMap::HoleEdge(int index)
{

    int naborIndex[24] = {index-2*m_nHalfGridSize-2,index-2*m_nHalfGridSize-1,index-2*m_nHalfGridSize,index-2*m_nHalfGridSize+1,index-2*m_nHalfGridSize+2,
                          index-m_nHalfGridSize-2,index-m_nHalfGridSize-1,index-m_nHalfGridSize,index-m_nHalfGridSize+1,index-m_nHalfGridSize+2,
                          index-2,index-1,index+1,index+2,
                          index+m_nHalfGridSize-2,index+m_nHalfGridSize-1,index+m_nHalfGridSize,index+m_nHalfGridSize+1,index+m_nHalfGridSize+2,
                          index+2*m_nHalfGridSize-2,index+2*m_nHalfGridSize-1,index+2*m_nHalfGridSize,index+2*m_nHalfGridSize+1,index+2*m_nHalfGridSize+2};

    //int naborIndex[8] = {index-m_nHalfGridSize-1,index-m_nHalfGridSize,index-m_nHalfGridSize+1,index-1,index+1,index+m_nHalfGridSize-1,index+m_nHalfGridSize+1};
    int countPlain = 0;
    double FAV;
    FAV = m_pNavMap[index].fMinElevation;
    for(int i = 0;i<24;++i)
    {
        if(naborIndex[i]<0 || naborIndex[i]>m_nNavArraySize)
            continue;
        if((m_pNavMap[naborIndex[i]].probability_Obstacle<41)&&(m_pNavMap[naborIndex[i]].probability_Obstacle>0))
        {
            countPlain++;
            if(FAV<m_pNavMap[naborIndex[i]].fMinElevation)
                FAV=m_pNavMap[naborIndex[i]].fMinElevation;
        }
    }
    if((countPlain>4)&&(m_pNavMap[index].fMinElevation<FAV-0.2))
        return true;
    return false;
}

const bool GridMap::Hole(int index)
{

    int naborIndex[24] = {index-2*m_nHalfGridSize-2,index-2*m_nHalfGridSize-1,index-2*m_nHalfGridSize,index-2*m_nHalfGridSize+1,index-2*m_nHalfGridSize+2,
                          index-m_nHalfGridSize-2,index-m_nHalfGridSize-1,index-m_nHalfGridSize,index-m_nHalfGridSize+1,index-m_nHalfGridSize+2,
                          index-2,index-1,index+1,index+2,
                          index+m_nHalfGridSize-2,index+m_nHalfGridSize-1,index+m_nHalfGridSize,index+m_nHalfGridSize+1,index+m_nHalfGridSize+2,
                          index+2*m_nHalfGridSize-2,index+2*m_nHalfGridSize-1,index+2*m_nHalfGridSize,index+2*m_nHalfGridSize+1,index+2*m_nHalfGridSize+2};
    double FAV_Plain;
    double FAV_Ob;
    FAV_Plain = m_pNavMap[index].fAvgElevation;
    FAV_Ob = m_pNavMap[index].fAvgElevation;
    for(int i = 0;i<24;++i)
    {
        if(naborIndex[i]<0 || naborIndex[i]>m_nNavArraySize)
            continue;
        if((m_pNavMap[naborIndex[i]].probability_Obstacle<51)&&(m_pNavMap[naborIndex[i]].probability_Obstacle>0))
        {
            if(FAV_Plain<m_pNavMap[naborIndex[i]].fAvgElevation)
                FAV_Plain=m_pNavMap[naborIndex[i]].fAvgElevation;
        }
        if((m_pNavMap[naborIndex[i]].probability_Obstacle>51))
        {
            if(FAV_Ob<m_pNavMap[naborIndex[i]].fAvgElevation)
                FAV_Ob=m_pNavMap[naborIndex[i]].fAvgElevation;
        }
    }
    if(FAV_Ob>FAV_Plain)
        return false;
//    if(count<1)
//        return false;
    return true;
}
/**@brief judge if the index grid is a noice grid;
  *Wu
  *if is a noice grid,retuen true,
  *else return false;
  *@param NavIndex: the index of navmap's grid;
  *@return bool;
  *@note
  */
const bool GridMap::HolenoiceFiliter(int index)
{
    int naborIndex[24] = {index-2*m_nHalfGridSize-2,index-2*m_nHalfGridSize-1,index-2*m_nHalfGridSize,index-2*m_nHalfGridSize+1,index-2*m_nHalfGridSize+2,
                          index-m_nHalfGridSize-2,index-m_nHalfGridSize-1,index-m_nHalfGridSize,index-m_nHalfGridSize+1,index-m_nHalfGridSize+2,
                          index-2,index-1,index+1,index+2,
                          index+m_nHalfGridSize-2,index+m_nHalfGridSize-1,index+m_nHalfGridSize,index+m_nHalfGridSize+1,index+m_nHalfGridSize+2,
                          index+2*m_nHalfGridSize-2,index+2*m_nHalfGridSize-1,index+2*m_nHalfGridSize,index+2*m_nHalfGridSize+1,index+2*m_nHalfGridSize+2};
    int count =0;
    for(int i = 0;i<24;++i)
    {
        if(naborIndex[i]<0 || naborIndex[i]>m_nNavArraySize)
            continue;
        if(m_pNavMap[naborIndex[i]].is_HoleEdge==true)
            count++;
    }
    if(count<3)
        return true;
    return false;
}
