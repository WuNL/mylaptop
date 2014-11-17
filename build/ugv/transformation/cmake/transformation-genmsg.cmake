# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "transformation: 1 messages, 0 services")

set(MSG_I_FLAGS "-Itransformation:/home/wunl/catkin_ws/src/ugv/transformation/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(transformation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg" NAME_WE)
add_custom_target(_transformation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "transformation" "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(transformation
  "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transformation
)

### Generating Services

### Generating Module File
_generate_module_cpp(transformation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transformation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(transformation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(transformation_generate_messages transformation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg" NAME_WE)
add_dependencies(transformation_generate_messages_cpp _transformation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transformation_gencpp)
add_dependencies(transformation_gencpp transformation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transformation_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(transformation
  "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transformation
)

### Generating Services

### Generating Module File
_generate_module_lisp(transformation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transformation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(transformation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(transformation_generate_messages transformation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg" NAME_WE)
add_dependencies(transformation_generate_messages_lisp _transformation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transformation_genlisp)
add_dependencies(transformation_genlisp transformation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transformation_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(transformation
  "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transformation
)

### Generating Services

### Generating Module File
_generate_module_py(transformation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transformation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(transformation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(transformation_generate_messages transformation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/transformation/msg/VehiclePose.msg" NAME_WE)
add_dependencies(transformation_generate_messages_py _transformation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transformation_genpy)
add_dependencies(transformation_genpy transformation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transformation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transformation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transformation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(transformation_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transformation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transformation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(transformation_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transformation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transformation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transformation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(transformation_generate_messages_py std_msgs_generate_messages_py)
