################################################################
#sensors
killall -9 app_inertial
killall -9 app_lms1
killall -9 app_lms2
killall -9 app_velodyne0
killall -9 app_velodyne1
killall -9 app_velodyne2

################################################################
#transformation
killall -9 app_transformation
killall -9 app_velodyne0_to_pc
killall -9 app_lms1_to_pc
killall -9 app_lms2_to_pc
killall -9 app_velodyne1_to_pc
killall -9 app_velodyne2_to_pc

################################################################
#mapping
killall -9 app_mapping

################################################################
#way_pointer
killall -9 app_way_pointer

################################################################
#way_pointer
killall -9 app_way_pointer
killall -9 app_mission
killall -9 app_trajectory
killall -9 app_arbiter

################################################################
#ros
killall -9 rqt_graph
killall -9 rviz
killall -9 rosout
killall -9 rosmaster
killall -9 roscore
