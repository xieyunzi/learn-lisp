(let ((x 1) (y 2))
  (print (+ x y)))

; ---
(defun ask-number ()
  (format t "Please enter a number.")
  (let ((val (read)))
    (if (numberp val)
      val
      (ask-number))))

;(print (ask-number))

; ---
(print (defparameter *glob* 99))

(setf *glob* 98)
(print *glob*)

; 2.11 ---
(defparameter x 1)
(defparameter y 2)
(defparameter z 3)

(setf x 'b
      y 'd
      z 'f)

(print x)
(print y)
(print z)

; 2.12 ---
(defparameter lst '(a b c d e))
(print lst)
(print (remove 'c lst))
