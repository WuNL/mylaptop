; Auto-generated. Do not edit!


(cl:in-package velodyne0-msg)


;//! \htmlinclude VelodynePacket.msg.html

(cl:defclass <VelodynePacket> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (packet
    :reader packet
    :initarg :packet
    :type (cl:vector velodyne0-msg:VerticalMeasurements)
   :initform (cl:make-array 0 :element-type 'velodyne0-msg:VerticalMeasurements :initial-element (cl:make-instance 'velodyne0-msg:VerticalMeasurements))))
)

(cl:defclass VelodynePacket (<VelodynePacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelodynePacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelodynePacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name velodyne0-msg:<VelodynePacket> is deprecated: use velodyne0-msg:VelodynePacket instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VelodynePacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader velodyne0-msg:header-val is deprecated.  Use velodyne0-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'packet-val :lambda-list '(m))
(cl:defmethod packet-val ((m <VelodynePacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader velodyne0-msg:packet-val is deprecated.  Use velodyne0-msg:packet instead.")
  (packet m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelodynePacket>) ostream)
  "Serializes a message object of type '<VelodynePacket>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'packet))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'packet))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelodynePacket>) istream)
  "Deserializes a message object of type '<VelodynePacket>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'packet) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'packet)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'velodyne0-msg:VerticalMeasurements))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelodynePacket>)))
  "Returns string type for a message object of type '<VelodynePacket>"
  "velodyne0/VelodynePacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelodynePacket)))
  "Returns string type for a message object of type 'VelodynePacket"
  "velodyne0/VelodynePacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelodynePacket>)))
  "Returns md5sum for a message object of type '<VelodynePacket>"
  "3040701da54f41906f0e4dd4c4c203bc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelodynePacket)))
  "Returns md5sum for a message object of type 'VelodynePacket"
  "3040701da54f41906f0e4dd4c4c203bc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelodynePacket>)))
  "Returns full string definition for message of type '<VelodynePacket>"
  (cl:format cl:nil "Header header~%VerticalMeasurements[] packet~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: velodyne0/VerticalMeasurements~%Header header~%float32 horizontal_angle~%float32[] vertical_angle~%float32[] dist~%float32[] intensity~%float32[] x~%float32[] y~%float32[] z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelodynePacket)))
  "Returns full string definition for message of type 'VelodynePacket"
  (cl:format cl:nil "Header header~%VerticalMeasurements[] packet~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: velodyne0/VerticalMeasurements~%Header header~%float32 horizontal_angle~%float32[] vertical_angle~%float32[] dist~%float32[] intensity~%float32[] x~%float32[] y~%float32[] z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelodynePacket>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'packet) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelodynePacket>))
  "Converts a ROS message object to a list"
  (cl:list 'VelodynePacket
    (cl:cons ':header (header msg))
    (cl:cons ':packet (packet msg))
))
