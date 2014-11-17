
(cl:in-package :asdf)

(defsystem "transformation-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "VehiclePose" :depends-on ("_package_VehiclePose"))
    (:file "_package_VehiclePose" :depends-on ("_package"))
  ))