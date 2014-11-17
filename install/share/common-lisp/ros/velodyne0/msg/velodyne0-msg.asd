
(cl:in-package :asdf)

(defsystem "velodyne0-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "VerticalMeasurements" :depends-on ("_package_VerticalMeasurements"))
    (:file "_package_VerticalMeasurements" :depends-on ("_package"))
    (:file "VelodynePacket" :depends-on ("_package_VelodynePacket"))
    (:file "_package_VelodynePacket" :depends-on ("_package"))
  ))