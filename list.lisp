(in-package :cl-user)
(defpackage my-test
  (:use :cl
        :prove))
(in-package :my-test)
(setf *default-reporter* :list)

;(plan 8)

;;; 3.1 conses
(subtest "list, cons, car, cdr"
  (let ((l '(a b c)))
    (is '(a) (cons 'a nil))
    (is 'a (car l))
    (is '(b c) (cdr l))
    (is l (list 'a 'b 'c)))

  (let ((l (list 'a (list 'b 'c) 'd)))
    (is '(b c) (car (cdr l)))))

(subtest "our-listp"
  (defun our-listp (x)
    (or (null x) (consp x)))

  (ok (our-listp '(a)))
  (ok (our-listp nil))
  (ok (not (our-listp 'a))))

(subtest "our-atom"
  (defun our-atom (x)
    (not (consp x)))

  (ok (not (our-atom '(a))))
  (ok (our-atom nil))
  (ok (our-atom 'a)))

;;; 3.2 equality
(subtest "eql, equal"
  (ok (equal (cons 'a nil) (cons 'a nil)))
  (ok (not (eql (cons 'a nil) (cons 'a nil))))
  (is (cons 'a nil) (cons 'a nil)))

;;; 3.4 building lists
(subtest "copy list"
  (let ((x '(a b c)))
    (is x (copy-list x))

    (defun our-copy-list (lst)
      (if (atom lst)
        lst
        (cons (car lst) (our-copy-list (cdr lst)))))

    (is x (our-copy-list x))))

(subtest "append"
  (is '(x y a b . c) (append '(x y) '(a b) 'c)))

;;; 3.6 access
(subtest "access"
  (let ((l '(a b c d e)))
    (is 'c (nth 2 l))
    (is l (nthcdr 0 l))
    (is '(d e) (nthcdr 3 l))

    (defun our-nthcdr (n lst)
      (if (zerop n)
        lst
        (our-nthcdr (- n 1) (cdr lst))))
    (is '(d e) (our-nthcdr 3 l))))

;;; 3.7 mapping functions
(subtest "mapping functions"
  (is '((a x) (b y) (c z))
      (mapcar #'list
              '(a b c)
              '(x y z)))
  (is '(1 4 9)
      (mapcar #'(lambda (x) (* x x))
              '(1 2 3)))
  (is '((a b c) (b c) (c))
      (maplist #'(lambda (x) x)
               '(a b c))))

;;; 3.8 trees
(subtest "trees"
  (let ((l '(a b c)))
    (is l (copy-tree l))

    (defun our-copy-tree (tr)
      (if (atom tr)
        tr
        (cons (our-copy-tree (car tr))
              (our-copy-tree (cdr tr)))))
    (is l (our-copy-tree l))))

;;; 3.12 stacks
;;; TODO
(subtest "stacks"
  (let ((lst '(a b c)))
    (is 'a (pop lst))
    (is '(b c) lst))

  (let ((lst '(a b c)))
    (is '(x a b c) (push 'x lst))))

(finalize)
