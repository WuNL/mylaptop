# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mapping_dlut: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imapping_dlut:/home/wunl/catkin_ws/src/mapping_dlut/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mapping_dlut_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg" NAME_WE)
add_custom_target(_mapping_dlut_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mapping_dlut" "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg" ""
)

get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg" NAME_WE)
add_custom_target(_mapping_dlut_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mapping_dlut" "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg" "mapping_dlut/Grid:std_msgs/Header"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mapping_dlut
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping_dlut
)
_generate_msg_cpp(mapping_dlut
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping_dlut
)

### Generating Services

### Generating Module File
_generate_module_cpp(mapping_dlut
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping_dlut
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mapping_dlut_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mapping_dlut_generate_messages mapping_dlut_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg" NAME_WE)
add_dependencies(mapping_dlut_generate_messages_cpp _mapping_dlut_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg" NAME_WE)
add_dependencies(mapping_dlut_generate_messages_cpp _mapping_dlut_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mapping_dlut_gencpp)
add_dependencies(mapping_dlut_gencpp mapping_dlut_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mapping_dlut_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mapping_dlut
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping_dlut
)
_generate_msg_lisp(mapping_dlut
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping_dlut
)

### Generating Services

### Generating Module File
_generate_module_lisp(mapping_dlut
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping_dlut
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mapping_dlut_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mapping_dlut_generate_messages mapping_dlut_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg" NAME_WE)
add_dependencies(mapping_dlut_generate_messages_lisp _mapping_dlut_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg" NAME_WE)
add_dependencies(mapping_dlut_generate_messages_lisp _mapping_dlut_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mapping_dlut_genlisp)
add_dependencies(mapping_dlut_genlisp mapping_dlut_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mapping_dlut_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mapping_dlut
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping_dlut
)
_generate_msg_py(mapping_dlut
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg"
  "${MSG_I_FLAGS}"
  "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping_dlut
)

### Generating Services

### Generating Module File
_generate_module_py(mapping_dlut
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping_dlut
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mapping_dlut_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mapping_dlut_generate_messages mapping_dlut_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Grid.msg" NAME_WE)
add_dependencies(mapping_dlut_generate_messages_py _mapping_dlut_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wunl/catkin_ws/src/mapping_dlut/msg/Map.msg" NAME_WE)
add_dependencies(mapping_dlut_generate_messages_py _mapping_dlut_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mapping_dlut_genpy)
add_dependencies(mapping_dlut_genpy mapping_dlut_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mapping_dlut_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping_dlut)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mapping_dlut
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(mapping_dlut_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping_dlut)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mapping_dlut
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(mapping_dlut_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping_dlut)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping_dlut\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mapping_dlut
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(mapping_dlut_generate_messages_py std_msgs_generate_messages_py)
