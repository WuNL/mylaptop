
(cl:in-package :asdf)

(defsystem "lms1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Lms1Status" :depends-on ("_package_Lms1Status"))
    (:file "_package_Lms1Status" :depends-on ("_package"))
  ))