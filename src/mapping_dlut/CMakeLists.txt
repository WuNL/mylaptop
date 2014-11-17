CMAKE_MINIMUM_REQUIRED(VERSION 2.8.3)
project(mapping_dlut)
#set(CMAKE_BUILD_TYPE DEBUG)

#ROS
#=================================================================
find_package(catkin REQUIRED
COMPONENTS roscpp rospy std_msgs message_generation tf)
#find_package(Eigen REQUIRED)
find_package(PCL REQUIRED)
#include_directories(${Eigen_INCLUDE_DIRS})
include_directories(${PCL_INCLUDE_DIRS})
#=================================================================


#cmake settings
#=================================================================
#set output library directory;
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
#message(STATUS "this is LIBRARY_OUTPUT_PATH " ${LIBRARY_OUTPUT_PATH})

#set output binary directory;
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#message(STATUS "this is EXECUTABLE_OUTPUT_PATH " ${EXECUTABLE_OUTPUT_PATH})

#set runtime output directory;
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
#message(STATUS "this is CMAKE_RUNTIME_OUTPUT_DIRECTORY " ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

#set include files;
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include/)
#message(STATUS "this is CMAKE_CURRENT_SOURCE_DIR " ${CMAKE_CURRENT_SOURCE_DIR})

#set source files;
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src/ PROJECT_SOURCES)
#=================================================================


#add messages;
#===============================================================
add_message_files(FILES Grid.msg Map.msg)
generate_messages(DEPENDENCIES std_msgs)
#===============================================================


#message(STATUS "this is catkin_LIBRARIES " ${catkin_LIBRARIES})
#message(STATUS "this is QT_LIBRARIES " ${QT_LIBRARIES})
add_executable(app_mapping_dlut ${PROJECT_SOURCES})
target_link_libraries(app_mapping_dlut ${catkin_LIBRARIES} ${PCL_LIBRARIES})
install(TARGETS app_mapping_dlut
	ARCHIVE DESTINATION ~/catkin_ws/bin#dynamic lib, *.a;
	LIBRARY DESTINATION /~catkin_ws/bin#static lib, *.so;
	RUNTIME DESTINATION ~/catkin_ws/bin#executable;
)
