
(defun oderer1 (lst)
  (let ((size (list-length lst )))
        (if (<= size 1)
          (return-from oderer1 lst)
          (merge_aux lst size)
        )
  )
)

(defun Fmerge (left right)
  (let* ((sizel (list-length left ))
        (sizer (list-length right))
        (result '()))
        (loop while (and (< sizel 0) (< sizer 0)) do 
          (if (<= (node-f (car left)) (node-f (car right))) 
            (setf result (append (car left) result))
            (setf left (cdr left))
            (setf result (append (car right) result))
            (setf right (cdr right))
          )
        )
        (if (< sizel 0)
          (setf result (append left result))
        )
        (if (< sizer 0)
          (setf result (append right result))
        )
        (return-from Fmerge result)
  )
)

(defun merge_aux (lst size)
    (let* ((middle (/ size 2))
          (left (subseq lst 0 (floor middle)))
          (right (subseq lst (floor middle) size)))
    #|(loop for x from (car lst) to (nth (floor middle) lst) do
          (setf left (append (list x) left)))
    (loop for x from (nth (floor middle) lst) to (nth size lst) do
          (setf right (append (list x) right)))|#
    (setf left (oderer1 left))
    (setf right (oderer1 right))
    (setf result (Fmerge left right))
    (return-from merge_aux result) 
))