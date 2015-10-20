(in-package :cl-user)
(defpackage my-test
  (:use :cl
        :prove))
(in-package :my-test)
(setf *default-reporter* :list)

(plan 1)

(defun our-member (obj lst)
  (if (null lst)
    nil
    (if (eql (car lst) obj)
      lst
      (our-member obj (cdr lst)))))

(is '(a b c) (our-member 'a '(a b c)))

(finalize)
