sh kill.sh
#roscore &
sleep 2
cd /program/catkin_ws/bin


datetime=$(date +%Y_%m_%d_%H_%M_%S)

######################################################################
#sensors
#./app_inertial 1>/dev/null 2>log/${datetime}_inertial_error.txt &
#./app_lms1 1>/dev/null 2>log/${datetime}_lms1_error.txt &
./app_lms2 1>/dev/null 2>log/${datetime}_lms2_error.txt &
./app_velodyne0 1>/dev/null 2>log/${datetime}_velodyne0_error.txt &

######################################################################
#transformations
./app_transformation 1>/dev/null 2>log/${datetime}_transformation_error.txt &
./app_lms1_to_pc 1>/dev/null 2>log/${datetime}_lms1_to_pc_error.txt &
./app_lms2_to_pc 1>/dev/null 2>log/${datetime}_lms2_to_pc_error.txt &
./app_velodyne0_to_pc 1>/dev/null 2>log/${datetime}_velodyne0_to_pc_error.txt &

######################################################################
#mapping
./app_mapping 1>/dev/null 2>log/${datetime}_mapping_error.txt &

######################################################################
#mission
./app_mission 2014_08_11_09_55_31_KY2014RW1.txt 1>/dev/null 2>log/${datetime}_mission_error.txt &

######################################################################
#way_pointer
#./app_way_pointer 1>/dev/null 2>log/${datetime}_way_pointer_error.txt &

