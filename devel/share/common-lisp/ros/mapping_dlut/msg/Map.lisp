; Auto-generated. Do not edit!


(cl:in-package mapping_dlut-msg)


;//! \htmlinclude Map.msg.html

(cl:defclass <Map> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (nHalfSize
    :reader nHalfSize
    :initarg :nHalfSize
    :type cl:integer
    :initform 0)
   (fResolution
    :reader fResolution
    :initarg :fResolution
    :type cl:float
    :initform 0.0)
   (fCenterX
    :reader fCenterX
    :initarg :fCenterX
    :type cl:float
    :initform 0.0)
   (fCenterY
    :reader fCenterY
    :initarg :fCenterY
    :type cl:float
    :initform 0.0)
   (fMapMaxElevation
    :reader fMapMaxElevation
    :initarg :fMapMaxElevation
    :type cl:float
    :initform 0.0)
   (fMapMinElevation
    :reader fMapMinElevation
    :initarg :fMapMinElevation
    :type cl:float
    :initform 0.0)
   (fVehicleX
    :reader fVehicleX
    :initarg :fVehicleX
    :type cl:float
    :initform 0.0)
   (fVehicleY
    :reader fVehicleY
    :initarg :fVehicleY
    :type cl:float
    :initform 0.0)
   (fVehicleZ
    :reader fVehicleZ
    :initarg :fVehicleZ
    :type cl:float
    :initform 0.0)
   (fVehicleHeading
    :reader fVehicleHeading
    :initarg :fVehicleHeading
    :type cl:float
    :initform 0.0)
   (map
    :reader map
    :initarg :map
    :type (cl:vector mapping_dlut-msg:Grid)
   :initform (cl:make-array 0 :element-type 'mapping_dlut-msg:Grid :initial-element (cl:make-instance 'mapping_dlut-msg:Grid))))
)

(cl:defclass Map (<Map>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Map>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Map)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mapping_dlut-msg:<Map> is deprecated: use mapping_dlut-msg:Map instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:header-val is deprecated.  Use mapping_dlut-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'nHalfSize-val :lambda-list '(m))
(cl:defmethod nHalfSize-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:nHalfSize-val is deprecated.  Use mapping_dlut-msg:nHalfSize instead.")
  (nHalfSize m))

(cl:ensure-generic-function 'fResolution-val :lambda-list '(m))
(cl:defmethod fResolution-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fResolution-val is deprecated.  Use mapping_dlut-msg:fResolution instead.")
  (fResolution m))

(cl:ensure-generic-function 'fCenterX-val :lambda-list '(m))
(cl:defmethod fCenterX-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fCenterX-val is deprecated.  Use mapping_dlut-msg:fCenterX instead.")
  (fCenterX m))

(cl:ensure-generic-function 'fCenterY-val :lambda-list '(m))
(cl:defmethod fCenterY-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fCenterY-val is deprecated.  Use mapping_dlut-msg:fCenterY instead.")
  (fCenterY m))

(cl:ensure-generic-function 'fMapMaxElevation-val :lambda-list '(m))
(cl:defmethod fMapMaxElevation-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fMapMaxElevation-val is deprecated.  Use mapping_dlut-msg:fMapMaxElevation instead.")
  (fMapMaxElevation m))

(cl:ensure-generic-function 'fMapMinElevation-val :lambda-list '(m))
(cl:defmethod fMapMinElevation-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fMapMinElevation-val is deprecated.  Use mapping_dlut-msg:fMapMinElevation instead.")
  (fMapMinElevation m))

(cl:ensure-generic-function 'fVehicleX-val :lambda-list '(m))
(cl:defmethod fVehicleX-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fVehicleX-val is deprecated.  Use mapping_dlut-msg:fVehicleX instead.")
  (fVehicleX m))

(cl:ensure-generic-function 'fVehicleY-val :lambda-list '(m))
(cl:defmethod fVehicleY-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fVehicleY-val is deprecated.  Use mapping_dlut-msg:fVehicleY instead.")
  (fVehicleY m))

(cl:ensure-generic-function 'fVehicleZ-val :lambda-list '(m))
(cl:defmethod fVehicleZ-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fVehicleZ-val is deprecated.  Use mapping_dlut-msg:fVehicleZ instead.")
  (fVehicleZ m))

(cl:ensure-generic-function 'fVehicleHeading-val :lambda-list '(m))
(cl:defmethod fVehicleHeading-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fVehicleHeading-val is deprecated.  Use mapping_dlut-msg:fVehicleHeading instead.")
  (fVehicleHeading m))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <Map>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:map-val is deprecated.  Use mapping_dlut-msg:map instead.")
  (map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Map>) ostream)
  "Serializes a message object of type '<Map>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'nHalfSize)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fResolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fCenterX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fCenterY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fMapMaxElevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fMapMinElevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fVehicleX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fVehicleY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fVehicleZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fVehicleHeading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'map))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'map))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Map>) istream)
  "Deserializes a message object of type '<Map>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nHalfSize) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fResolution) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fCenterX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fCenterY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fMapMaxElevation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fMapMinElevation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fVehicleX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fVehicleY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fVehicleZ) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fVehicleHeading) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'map) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'map)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mapping_dlut-msg:Grid))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Map>)))
  "Returns string type for a message object of type '<Map>"
  "mapping_dlut/Map")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Map)))
  "Returns string type for a message object of type 'Map"
  "mapping_dlut/Map")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Map>)))
  "Returns md5sum for a message object of type '<Map>"
  "e6ab6c8862bf55f4e1b5fd48f03f1a7d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Map)))
  "Returns md5sum for a message object of type 'Map"
  "e6ab6c8862bf55f4e1b5fd48f03f1a7d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Map>)))
  "Returns full string definition for message of type '<Map>"
  (cl:format cl:nil "Header header~%###########################################################~%#Elevation Map Configuration~%#half size of the map;~%int32 nHalfSize~%#Elevation Grid Resolution, in meter;~%float32 fResolution~%#x coordinate of the center of the map in world frame~%float32 fCenterX~%#y coordinate of the center of the map in world frame~%float32 fCenterY~%#maximum elevation of the map in world frame~%float32 fMapMaxElevation~%#minimum elevation of the map in world frame~%float32 fMapMinElevation~%###########################################################~%~%###########################################################~%#Vehicle Status~%#vehicle x in world frame, in meters~%float32 fVehicleX~%#vehicle y in world frame, in meters~%float32 fVehicleY~%#vehicle z in world frame, in meters~%float32 fVehicleZ~%#vehicle heading angle, in rad~%float32 fVehicleHeading~%###########################################################~%Grid[] map~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: mapping_dlut/Grid~%#Header header~%#maximum elevation in this grid;~%#float32 fMaxElevation~%#minimum elevation in this grid;~%#float32 fMinElevation~%#average elevation in this grid;~%#float32 fAvgElevation~%#points falling in this grid;~%#int32 nPointCount~%#up point falling in this grid;~%#int32 nUpCount~%#down point falling in this grid;~%#int32 nDownCount~%~%~%#average elevation in this grid;~%float32 fAvgElevation~%#proability~%int8 proability~%#texture~%int8 texture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Map)))
  "Returns full string definition for message of type 'Map"
  (cl:format cl:nil "Header header~%###########################################################~%#Elevation Map Configuration~%#half size of the map;~%int32 nHalfSize~%#Elevation Grid Resolution, in meter;~%float32 fResolution~%#x coordinate of the center of the map in world frame~%float32 fCenterX~%#y coordinate of the center of the map in world frame~%float32 fCenterY~%#maximum elevation of the map in world frame~%float32 fMapMaxElevation~%#minimum elevation of the map in world frame~%float32 fMapMinElevation~%###########################################################~%~%###########################################################~%#Vehicle Status~%#vehicle x in world frame, in meters~%float32 fVehicleX~%#vehicle y in world frame, in meters~%float32 fVehicleY~%#vehicle z in world frame, in meters~%float32 fVehicleZ~%#vehicle heading angle, in rad~%float32 fVehicleHeading~%###########################################################~%Grid[] map~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: mapping_dlut/Grid~%#Header header~%#maximum elevation in this grid;~%#float32 fMaxElevation~%#minimum elevation in this grid;~%#float32 fMinElevation~%#average elevation in this grid;~%#float32 fAvgElevation~%#points falling in this grid;~%#int32 nPointCount~%#up point falling in this grid;~%#int32 nUpCount~%#down point falling in this grid;~%#int32 nDownCount~%~%~%#average elevation in this grid;~%float32 fAvgElevation~%#proability~%int8 proability~%#texture~%int8 texture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Map>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Map>))
  "Converts a ROS message object to a list"
  (cl:list 'Map
    (cl:cons ':header (header msg))
    (cl:cons ':nHalfSize (nHalfSize msg))
    (cl:cons ':fResolution (fResolution msg))
    (cl:cons ':fCenterX (fCenterX msg))
    (cl:cons ':fCenterY (fCenterY msg))
    (cl:cons ':fMapMaxElevation (fMapMaxElevation msg))
    (cl:cons ':fMapMinElevation (fMapMinElevation msg))
    (cl:cons ':fVehicleX (fVehicleX msg))
    (cl:cons ':fVehicleY (fVehicleY msg))
    (cl:cons ':fVehicleZ (fVehicleZ msg))
    (cl:cons ':fVehicleHeading (fVehicleHeading msg))
    (cl:cons ':map (map msg))
))
