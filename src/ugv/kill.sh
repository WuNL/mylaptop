################################################################
#sensors
killall -9 app_inertial
killall -9 app_lms1
killall -9 app_lms2
killall -9 app_velodyne0

################################################################
#transformation
killall -9 app_transformation
killall -9 app_velodyne0_to_pc
killall -9 app_lms1_to_pc
killall -9 app_lms2_to_pc

################################################################
#mapping
#killall -9 app_mapping

################################################################
#way_pointer
killall -9 app_way_pointer

################################################################
#way_pointer
killall -9 app_way_pointer
killall -9 app_mission

################################################################
#ros
killall -9 rqt_graph
killall -9 rviz
#killall -9 rosout
#killall -9 rosmaster
#killall -9 roscore
