; Auto-generated. Do not edit!


(cl:in-package inertial-msg)


;//! \htmlinclude NCOM.msg.html

(cl:defclass <NCOM> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (time
    :reader time
    :initarg :time
    :type cl:fixnum
    :initform 0)
   (accelerationX
    :reader accelerationX
    :initarg :accelerationX
    :type cl:float
    :initform 0.0)
   (accelerationY
    :reader accelerationY
    :initarg :accelerationY
    :type cl:float
    :initform 0.0)
   (accelerationZ
    :reader accelerationZ
    :initarg :accelerationZ
    :type cl:float
    :initform 0.0)
   (angularRateX
    :reader angularRateX
    :initarg :angularRateX
    :type cl:float
    :initform 0.0)
   (angularRateY
    :reader angularRateY
    :initarg :angularRateY
    :type cl:float
    :initform 0.0)
   (angularRateZ
    :reader angularRateZ
    :initarg :angularRateZ
    :type cl:float
    :initform 0.0)
   (navStatus
    :reader navStatus
    :initarg :navStatus
    :type cl:fixnum
    :initform 0)
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0)
   (velocityNorth
    :reader velocityNorth
    :initarg :velocityNorth
    :type cl:float
    :initform 0.0)
   (velocityEast
    :reader velocityEast
    :initarg :velocityEast
    :type cl:float
    :initform 0.0)
   (velocityDown
    :reader velocityDown
    :initarg :velocityDown
    :type cl:float
    :initform 0.0)
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0))
)

(cl:defclass NCOM (<NCOM>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NCOM>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NCOM)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inertial-msg:<NCOM> is deprecated: use inertial-msg:NCOM instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:header-val is deprecated.  Use inertial-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:time-val is deprecated.  Use inertial-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'accelerationX-val :lambda-list '(m))
(cl:defmethod accelerationX-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:accelerationX-val is deprecated.  Use inertial-msg:accelerationX instead.")
  (accelerationX m))

(cl:ensure-generic-function 'accelerationY-val :lambda-list '(m))
(cl:defmethod accelerationY-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:accelerationY-val is deprecated.  Use inertial-msg:accelerationY instead.")
  (accelerationY m))

(cl:ensure-generic-function 'accelerationZ-val :lambda-list '(m))
(cl:defmethod accelerationZ-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:accelerationZ-val is deprecated.  Use inertial-msg:accelerationZ instead.")
  (accelerationZ m))

(cl:ensure-generic-function 'angularRateX-val :lambda-list '(m))
(cl:defmethod angularRateX-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:angularRateX-val is deprecated.  Use inertial-msg:angularRateX instead.")
  (angularRateX m))

(cl:ensure-generic-function 'angularRateY-val :lambda-list '(m))
(cl:defmethod angularRateY-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:angularRateY-val is deprecated.  Use inertial-msg:angularRateY instead.")
  (angularRateY m))

(cl:ensure-generic-function 'angularRateZ-val :lambda-list '(m))
(cl:defmethod angularRateZ-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:angularRateZ-val is deprecated.  Use inertial-msg:angularRateZ instead.")
  (angularRateZ m))

(cl:ensure-generic-function 'navStatus-val :lambda-list '(m))
(cl:defmethod navStatus-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:navStatus-val is deprecated.  Use inertial-msg:navStatus instead.")
  (navStatus m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:latitude-val is deprecated.  Use inertial-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:longitude-val is deprecated.  Use inertial-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:altitude-val is deprecated.  Use inertial-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'velocityNorth-val :lambda-list '(m))
(cl:defmethod velocityNorth-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:velocityNorth-val is deprecated.  Use inertial-msg:velocityNorth instead.")
  (velocityNorth m))

(cl:ensure-generic-function 'velocityEast-val :lambda-list '(m))
(cl:defmethod velocityEast-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:velocityEast-val is deprecated.  Use inertial-msg:velocityEast instead.")
  (velocityEast m))

(cl:ensure-generic-function 'velocityDown-val :lambda-list '(m))
(cl:defmethod velocityDown-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:velocityDown-val is deprecated.  Use inertial-msg:velocityDown instead.")
  (velocityDown m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:heading-val is deprecated.  Use inertial-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:pitch-val is deprecated.  Use inertial-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <NCOM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inertial-msg:roll-val is deprecated.  Use inertial-msg:roll instead.")
  (roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NCOM>) ostream)
  "Serializes a message object of type '<NCOM>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accelerationZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angularRateX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angularRateY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angularRateZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'navStatus)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocityNorth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocityEast))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'velocityDown))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NCOM>) istream)
  "Deserializes a message object of type '<NCOM>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accelerationZ) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angularRateX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angularRateY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angularRateZ) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'navStatus)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocityNorth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocityEast) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocityDown) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NCOM>)))
  "Returns string type for a message object of type '<NCOM>"
  "inertial/NCOM")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NCOM)))
  "Returns string type for a message object of type 'NCOM"
  "inertial/NCOM")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NCOM>)))
  "Returns md5sum for a message object of type '<NCOM>"
  "61d8ee5f52d2961d53ecbc0a568e7bdd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NCOM)))
  "Returns md5sum for a message object of type 'NCOM"
  "61d8ee5f52d2961d53ecbc0a568e7bdd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NCOM>)))
  "Returns full string definition for message of type '<NCOM>"
  (cl:format cl:nil "Header header~%#batch1~%uint16 time~%float32 accelerationX~%float32 accelerationY~%float32 accelerationZ~%float32 angularRateX~%float32 angularRateY~%float32 angularRateZ~%uint8 navStatus~%#bath2~%float64 latitude~%float64 longitude~%float32 altitude~%float32 velocityNorth~%float32 velocityEast~%float32 velocityDown~%float32 heading~%float32 pitch~%float32 roll~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NCOM)))
  "Returns full string definition for message of type 'NCOM"
  (cl:format cl:nil "Header header~%#batch1~%uint16 time~%float32 accelerationX~%float32 accelerationY~%float32 accelerationZ~%float32 angularRateX~%float32 angularRateY~%float32 angularRateZ~%uint8 navStatus~%#bath2~%float64 latitude~%float64 longitude~%float32 altitude~%float32 velocityNorth~%float32 velocityEast~%float32 velocityDown~%float32 heading~%float32 pitch~%float32 roll~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NCOM>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     4
     4
     4
     4
     4
     4
     1
     8
     8
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NCOM>))
  "Converts a ROS message object to a list"
  (cl:list 'NCOM
    (cl:cons ':header (header msg))
    (cl:cons ':time (time msg))
    (cl:cons ':accelerationX (accelerationX msg))
    (cl:cons ':accelerationY (accelerationY msg))
    (cl:cons ':accelerationZ (accelerationZ msg))
    (cl:cons ':angularRateX (angularRateX msg))
    (cl:cons ':angularRateY (angularRateY msg))
    (cl:cons ':angularRateZ (angularRateZ msg))
    (cl:cons ':navStatus (navStatus msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':velocityNorth (velocityNorth msg))
    (cl:cons ':velocityEast (velocityEast msg))
    (cl:cons ':velocityDown (velocityDown msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
))
