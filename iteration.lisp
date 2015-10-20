(defun show-squares (start end)
  (do
    ((i start (+ i 1)))
    ((> i end) 'done)
    (format t "~A ~A ~%" i (* i i))))

(show-squares 2 5)

(defun show-squares (start end)
  (if (> start end)
    'done
    (progn
      (format t "~A ~A~%" start (* start start))
      (show-squares (+ start 1) end))))

(defun our-length (lst)
  (let ((len 0))
    (dolist (obj lst)
      (setf len (+ len 1)))
    len))

(format t "our-length: ~A" (our-length '(a b c d e)))
