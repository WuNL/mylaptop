; Auto-generated. Do not edit!


(cl:in-package mapping_dlut-msg)


;//! \htmlinclude Grid.msg.html

(cl:defclass <Grid> (roslisp-msg-protocol:ros-message)
  ((fAvgElevation
    :reader fAvgElevation
    :initarg :fAvgElevation
    :type cl:float
    :initform 0.0)
   (proability
    :reader proability
    :initarg :proability
    :type cl:fixnum
    :initform 0)
   (texture
    :reader texture
    :initarg :texture
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Grid (<Grid>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Grid>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Grid)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mapping_dlut-msg:<Grid> is deprecated: use mapping_dlut-msg:Grid instead.")))

(cl:ensure-generic-function 'fAvgElevation-val :lambda-list '(m))
(cl:defmethod fAvgElevation-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:fAvgElevation-val is deprecated.  Use mapping_dlut-msg:fAvgElevation instead.")
  (fAvgElevation m))

(cl:ensure-generic-function 'proability-val :lambda-list '(m))
(cl:defmethod proability-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:proability-val is deprecated.  Use mapping_dlut-msg:proability instead.")
  (proability m))

(cl:ensure-generic-function 'texture-val :lambda-list '(m))
(cl:defmethod texture-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping_dlut-msg:texture-val is deprecated.  Use mapping_dlut-msg:texture instead.")
  (texture m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Grid>) ostream)
  "Serializes a message object of type '<Grid>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fAvgElevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'proability)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'texture)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Grid>) istream)
  "Deserializes a message object of type '<Grid>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fAvgElevation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'proability) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'texture) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Grid>)))
  "Returns string type for a message object of type '<Grid>"
  "mapping_dlut/Grid")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grid)))
  "Returns string type for a message object of type 'Grid"
  "mapping_dlut/Grid")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Grid>)))
  "Returns md5sum for a message object of type '<Grid>"
  "d1e632170b3f559b23311a8f8cc60632")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Grid)))
  "Returns md5sum for a message object of type 'Grid"
  "d1e632170b3f559b23311a8f8cc60632")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Grid>)))
  "Returns full string definition for message of type '<Grid>"
  (cl:format cl:nil "#Header header~%#maximum elevation in this grid;~%#float32 fMaxElevation~%#minimum elevation in this grid;~%#float32 fMinElevation~%#average elevation in this grid;~%#float32 fAvgElevation~%#points falling in this grid;~%#int32 nPointCount~%#up point falling in this grid;~%#int32 nUpCount~%#down point falling in this grid;~%#int32 nDownCount~%~%~%#average elevation in this grid;~%float32 fAvgElevation~%#proability~%int8 proability~%#texture~%int8 texture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Grid)))
  "Returns full string definition for message of type 'Grid"
  (cl:format cl:nil "#Header header~%#maximum elevation in this grid;~%#float32 fMaxElevation~%#minimum elevation in this grid;~%#float32 fMinElevation~%#average elevation in this grid;~%#float32 fAvgElevation~%#points falling in this grid;~%#int32 nPointCount~%#up point falling in this grid;~%#int32 nUpCount~%#down point falling in this grid;~%#int32 nDownCount~%~%~%#average elevation in this grid;~%float32 fAvgElevation~%#proability~%int8 proability~%#texture~%int8 texture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Grid>))
  (cl:+ 0
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Grid>))
  "Converts a ROS message object to a list"
  (cl:list 'Grid
    (cl:cons ':fAvgElevation (fAvgElevation msg))
    (cl:cons ':proability (proability msg))
    (cl:cons ':texture (texture msg))
))
