(defun ask-number
  (from-read)
  (format t "Please enter a number: ")
  (let
    ((val from-read))
    (if
      (numberp val)
      val
      (ask-number (read)))))

(ask-number (read))
