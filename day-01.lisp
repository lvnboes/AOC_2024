(defpackage day-01
    (:use :cl)
    (:export :solve))

(defun read-file (uri)
    (with-open-file (stream uri) 
        (loop for line = (read-line stream nil nil) while line collect (parse-integers line))))

(defun parse-integers (line)
    (format nil line)
    (let ((buffer (make-string-output-stream))
            (last-char #\Space)
            (result '()))
        (loop for char across line do (
            if (digit-char-p char)
                (progn (write-char char buffer)
                    (setf last-char char))
                (if (not (char= last-char #\Space))
                    (progn (cons result (parse-integer (get-output-stream-string buffer)))
                        (setf buffer (make-string-output-stream))))))))

(defun solve () (read-file "input/day-01.txt"))

