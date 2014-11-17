; Auto-generated. Do not edit!


(cl:in-package mapping-msg)


;//! \htmlinclude Grid.msg.html

(cl:defclass <Grid> (roslisp-msg-protocol:ros-message)
  ((fMaxElevation
    :reader fMaxElevation
    :initarg :fMaxElevation
    :type cl:float
    :initform 0.0)
   (fMinElevation
    :reader fMinElevation
    :initarg :fMinElevation
    :type cl:float
    :initform 0.0)
   (fAvgElevation
    :reader fAvgElevation
    :initarg :fAvgElevation
    :type cl:float
    :initform 0.0)
   (nPointCount
    :reader nPointCount
    :initarg :nPointCount
    :type cl:integer
    :initform 0)
   (nUpCount
    :reader nUpCount
    :initarg :nUpCount
    :type cl:integer
    :initform 0)
   (nDownCount
    :reader nDownCount
    :initarg :nDownCount
    :type cl:integer
    :initform 0))
)

(cl:defclass Grid (<Grid>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Grid>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Grid)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mapping-msg:<Grid> is deprecated: use mapping-msg:Grid instead.")))

(cl:ensure-generic-function 'fMaxElevation-val :lambda-list '(m))
(cl:defmethod fMaxElevation-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping-msg:fMaxElevation-val is deprecated.  Use mapping-msg:fMaxElevation instead.")
  (fMaxElevation m))

(cl:ensure-generic-function 'fMinElevation-val :lambda-list '(m))
(cl:defmethod fMinElevation-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping-msg:fMinElevation-val is deprecated.  Use mapping-msg:fMinElevation instead.")
  (fMinElevation m))

(cl:ensure-generic-function 'fAvgElevation-val :lambda-list '(m))
(cl:defmethod fAvgElevation-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping-msg:fAvgElevation-val is deprecated.  Use mapping-msg:fAvgElevation instead.")
  (fAvgElevation m))

(cl:ensure-generic-function 'nPointCount-val :lambda-list '(m))
(cl:defmethod nPointCount-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping-msg:nPointCount-val is deprecated.  Use mapping-msg:nPointCount instead.")
  (nPointCount m))

(cl:ensure-generic-function 'nUpCount-val :lambda-list '(m))
(cl:defmethod nUpCount-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping-msg:nUpCount-val is deprecated.  Use mapping-msg:nUpCount instead.")
  (nUpCount m))

(cl:ensure-generic-function 'nDownCount-val :lambda-list '(m))
(cl:defmethod nDownCount-val ((m <Grid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mapping-msg:nDownCount-val is deprecated.  Use mapping-msg:nDownCount instead.")
  (nDownCount m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Grid>) ostream)
  "Serializes a message object of type '<Grid>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fMaxElevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fMinElevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fAvgElevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'nPointCount)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'nUpCount)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'nDownCount)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Grid>) istream)
  "Deserializes a message object of type '<Grid>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fMaxElevation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fMinElevation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fAvgElevation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nPointCount) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nUpCount) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nDownCount) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Grid>)))
  "Returns string type for a message object of type '<Grid>"
  "mapping/Grid")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grid)))
  "Returns string type for a message object of type 'Grid"
  "mapping/Grid")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Grid>)))
  "Returns md5sum for a message object of type '<Grid>"
  "16a892ceaa8023f6e795ed985125d828")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Grid)))
  "Returns md5sum for a message object of type 'Grid"
  "16a892ceaa8023f6e795ed985125d828")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Grid>)))
  "Returns full string definition for message of type '<Grid>"
  (cl:format cl:nil "#maximum elevation in this grid;~%float32 fMaxElevation~%#minimum elevation in this grid;~%float32 fMinElevation~%#average elevation in this grid;~%float32 fAvgElevation~%#points falling in this grid;~%int32 nPointCount~%#up point falling in this grid;~%int32 nUpCount~%#down point falling in this grid;~%int32 nDownCount~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Grid)))
  "Returns full string definition for message of type 'Grid"
  (cl:format cl:nil "#maximum elevation in this grid;~%float32 fMaxElevation~%#minimum elevation in this grid;~%float32 fMinElevation~%#average elevation in this grid;~%float32 fAvgElevation~%#points falling in this grid;~%int32 nPointCount~%#up point falling in this grid;~%int32 nUpCount~%#down point falling in this grid;~%int32 nDownCount~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Grid>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Grid>))
  "Converts a ROS message object to a list"
  (cl:list 'Grid
    (cl:cons ':fMaxElevation (fMaxElevation msg))
    (cl:cons ':fMinElevation (fMinElevation msg))
    (cl:cons ':fAvgElevation (fAvgElevation msg))
    (cl:cons ':nPointCount (nPointCount msg))
    (cl:cons ':nUpCount (nUpCount msg))
    (cl:cons ':nDownCount (nDownCount msg))
))
