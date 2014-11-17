# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lms1: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ilms1:/home/wunl/catkin_ws/src/ugv/lms1/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lms1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg" NAME_WE)
add_custom_target(_lms1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lms1" "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg" "std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lms1
  "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lms1
)

### Generating Services

### Generating Module File
_generate_module_cpp(lms1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lms1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lms1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lms1_generate_messages lms1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg" NAME_WE)
add_dependencies(lms1_generate_messages_cpp _lms1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lms1_gencpp)
add_dependencies(lms1_gencpp lms1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lms1_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lms1
  "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lms1
)

### Generating Services

### Generating Module File
_generate_module_lisp(lms1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lms1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lms1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lms1_generate_messages lms1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg" NAME_WE)
add_dependencies(lms1_generate_messages_lisp _lms1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lms1_genlisp)
add_dependencies(lms1_genlisp lms1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lms1_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lms1
  "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lms1
)

### Generating Services

### Generating Module File
_generate_module_py(lms1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lms1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lms1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lms1_generate_messages lms1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/lms1/msg/Lms1Status.msg" NAME_WE)
add_dependencies(lms1_generate_messages_py _lms1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lms1_genpy)
add_dependencies(lms1_genpy lms1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lms1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lms1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lms1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(lms1_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lms1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lms1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(lms1_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lms1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lms1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lms1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(lms1_generate_messages_py std_msgs_generate_messages_py)
