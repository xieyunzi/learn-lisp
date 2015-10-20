(setf *glob* 98)

(let
  ((n 10))
  (setf n 2)
  (format t "~A~%" n))

(setf x (list 'a 'b 'c)
      y (cdr x))
(format t "~A, ~A~%" x y)

(setf x 'g
      y 'g)
(format t "~A, ~A~%" x y)
