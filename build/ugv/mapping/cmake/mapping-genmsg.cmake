# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mapping: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imapping:/home/wunl/catkin_ws/src/ugv/mapping/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mapping_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg" NAME_WE)
add_custom_target(_mapping_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mapping" "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg" "mapping/Grid:std_msgs/Header"
)

get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg" NAME_WE)
add_custom_target(_mapping_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mapping" "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mapping
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping
)
_generate_msg_cpp(mapping
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping
)

### Generating Services

### Generating Module File
_generate_module_cpp(mapping
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mapping_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mapping_generate_messages mapping_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg" NAME_WE)
add_dependencies(mapping_generate_messages_cpp _mapping_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg" NAME_WE)
add_dependencies(mapping_generate_messages_cpp _mapping_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mapping_gencpp)
add_dependencies(mapping_gencpp mapping_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mapping_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mapping
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping
)
_generate_msg_lisp(mapping
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping
)

### Generating Services

### Generating Module File
_generate_module_lisp(mapping
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mapping_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mapping_generate_messages mapping_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg" NAME_WE)
add_dependencies(mapping_generate_messages_lisp _mapping_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg" NAME_WE)
add_dependencies(mapping_generate_messages_lisp _mapping_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mapping_genlisp)
add_dependencies(mapping_genlisp mapping_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mapping_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mapping
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping
)
_generate_msg_py(mapping
  "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping
)

### Generating Services

### Generating Module File
_generate_module_py(mapping
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mapping_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mapping_generate_messages mapping_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Map.msg" NAME_WE)
add_dependencies(mapping_generate_messages_py _mapping_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wunl/catkin_ws/src/ugv/mapping/msg/Grid.msg" NAME_WE)
add_dependencies(mapping_generate_messages_py _mapping_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mapping_genpy)
add_dependencies(mapping_genpy mapping_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mapping_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(mapping_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(mapping_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(mapping_generate_messages_py std_msgs_generate_messages_py)
