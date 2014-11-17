
(cl:in-package :asdf)

(defsystem "inertial-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "NCOM" :depends-on ("_package_NCOM"))
    (:file "_package_NCOM" :depends-on ("_package"))
  ))