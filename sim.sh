sh kill.sh
roscore &

sleep 2

rosparam set use_sim_time true
rosrun rviz rviz &
#rqt_graph &

cd ~/catkin_ws/bin


datetime=$(date +%Y_%m_%d_%H_%M_%S)

######################################################################
#sensors
#./app_inertial 1>/dev/null 2>log/${datetime}_inertial_error.txt &
#./app_lms1 1>/dev/null 2>log/${datetime}_lms1_error.txt &
#./app_lms2 1>/dev/null 2>log/${datetime}_lms2_error.txt &
#./app_velodyne0 1>/dev/null 2>log/${datetime}_velodyne0_error.txt &
#./app_velodyne1 1>/dev/null 2>log/${datetime}_velodyne1_error.txt &
#./app_velodyne2 1>/dev/null 2>log/${datetime}_velodyne2_error.txt &

######################################################################
#transformations
#./app_transformation 1>/dev/null 2>log/${datetime}_transformation_error.txt &
#./app_lms1_to_pc 1>/dev/null 2>log/${datetime}_lms1_to_pc_error.txt &
#./app_lms2_to_pc 1>/dev/null 2>log/${datetime}_lms2_to_pc_error.txt &
#./app_velodyne0_to_pc 1>/dev/null 2>log/${datetime}_velodyne0_to_pc_error.txt &
#./app_velodyne1_to_pc 1>/dev/null 2>log/${datetime}_velodyne1_to_pc_errosr.txt &
#./app_velodyne2_to_pc 1>/dev/null 2>log/${datetime}_velodyne2_to_pc_error.txt &
./app_transformation 1>/dev/null 2>log/${datetime}_transformation_error.txt &
./app_lms1_to_pc 1>/dev/null 2>log/${datetime}_lms1_to_pc_error.txt &
./app_lms2_to_pc 1>/dev/null 2>log/${datetime}_lms2_to_pc_error.txt &
#./app_velodyne0_to_pc 1>/dev/null 2>log/${datetime}_velodyne0_to_pc_error.txt &
./app_velodyne1_to_pc 1>/dev/null 2>log/${datetime}_velodyne1_to_pc_errosr.txt &
./app_velodyne2_to_pc 1>/dev/null 2>log/${datetime}_velodyne2_to_pc_error.txt &
######################################################################
#mapping
./app_mapping 1>/dev/null  2>log/${datetime}_mapping_error.txt &

######################################################################
#mission
#./app_mission 2014-08-06-12-30-03_KY2014RW1.txt 1>/dev/null 2>log/${datetime}_mission_error.txt &

######################################################################
#trajectory
#./app_trajectory 1>/dev/null 2>log/${datetime}_trajectory_error.txt &

######################################################################
#arbiter
#./app_arbiter 1>/dev/null 2>log/${datetime}_arbiter_error.txt &

######################################################################
#way_pointer
#./app_way_pointer 1>/dev/null 2>log/${datetime}_way_pointer_error.txt &

sleep 4
cd  ~/data
rosbag play --clock --hz=2000 2014-08-24-09-27-41.bag
