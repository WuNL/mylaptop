; Auto-generated. Do not edit!


(cl:in-package lms2-msg)


;//! \htmlinclude Lms1Status.msg.html

(cl:defclass <Lms1Status> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (nLms1Status
    :reader nLms1Status
    :initarg :nLms1Status
    :type cl:fixnum
    :initform 0)
   (timeLms1
    :reader timeLms1
    :initarg :timeLms1
    :type cl:real
    :initform 0))
)

(cl:defclass Lms1Status (<Lms1Status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lms1Status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lms1Status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lms2-msg:<Lms1Status> is deprecated: use lms2-msg:Lms1Status instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Lms1Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lms2-msg:header-val is deprecated.  Use lms2-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'nLms1Status-val :lambda-list '(m))
(cl:defmethod nLms1Status-val ((m <Lms1Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lms2-msg:nLms1Status-val is deprecated.  Use lms2-msg:nLms1Status instead.")
  (nLms1Status m))

(cl:ensure-generic-function 'timeLms1-val :lambda-list '(m))
(cl:defmethod timeLms1-val ((m <Lms1Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lms2-msg:timeLms1-val is deprecated.  Use lms2-msg:timeLms1 instead.")
  (timeLms1 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lms1Status>) ostream)
  "Serializes a message object of type '<Lms1Status>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLms1Status)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'timeLms1)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'timeLms1) (cl:floor (cl:slot-value msg 'timeLms1)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lms1Status>) istream)
  "Deserializes a message object of type '<Lms1Status>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'nLms1Status)) (cl:read-byte istream))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeLms1) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lms1Status>)))
  "Returns string type for a message object of type '<Lms1Status>"
  "lms2/Lms1Status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lms1Status)))
  "Returns string type for a message object of type 'Lms1Status"
  "lms2/Lms1Status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lms1Status>)))
  "Returns md5sum for a message object of type '<Lms1Status>"
  "ebc6c9f19b9743c8a2c77db17cb6677b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lms1Status)))
  "Returns md5sum for a message object of type 'Lms1Status"
  "ebc6c9f19b9743c8a2c77db17cb6677b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lms1Status>)))
  "Returns full string definition for message of type '<Lms1Status>"
  (cl:format cl:nil "Header header~%#Lms1 status~%uint8 nLms1Status~%#Lms1 time stamp~%time timeLms1~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lms1Status)))
  "Returns full string definition for message of type 'Lms1Status"
  (cl:format cl:nil "Header header~%#Lms1 status~%uint8 nLms1Status~%#Lms1 time stamp~%time timeLms1~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lms1Status>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lms1Status>))
  "Converts a ROS message object to a list"
  (cl:list 'Lms1Status
    (cl:cons ':header (header msg))
    (cl:cons ':nLms1Status (nLms1Status msg))
    (cl:cons ':timeLms1 (timeLms1 msg))
))
