; Title : Scheme
; Purpose: To specify types of triangles, lines and squares given poonts.
; Author: Tracy Mai
; Date: December 1, 2024

; Pi
; Explicity assigns the value of pi
; @param none
; @return pi as 3.141592653589793
(define pi 3.141592653589793)

; Infinity
; Explicity assigns the value of infinity
; @param none
; @return infinity as +inf.0
(define infinity +inf.0)

; Make Point 
; Makes the two values to a list
; @param x and y coordinates
; @return the pairing of x and y
(define make-point 
  (lambda (x y)
    (cons x y)))

; Get X 
; Uses car to retrieve the value of x from the coordinate pair
; @param xy coordinate
; @return x coordinate
(define get-x
  (lambda (point)
    (car point)))  

; Get Y
; Uses cdr to retrieve the value of y from the coordinate pair
; @param xy coordinate
; @return y coordinate
(define get-y
  (lambda (point)
    (cdr point)))  

; Diff Points
; Checks to make sure that the points are different
; @param 3 coordinate points
; @return false if all the points are the same, and true otherwise
(define diff-points
  (lambda (a b c)
    (if (or (not (equal? a b))
            (not (equal? c b))  
            (not (equal? a c)))
      #t
      #f)))

; Check Slopes
; Calculates and compares 2 slopes between the 3 given coordinates
; @param 3 coordinate points
; @return true if the slopes are equivalent, and false if they are not
(define check-slopes
  (lambda (a b c)
    (let ((x1 (get-x a))
          (x2 (get-x b))
          (x3 (get-x c))
          (y1 (get-y a))
          (y2 (get-y b))
          (y3 (get-y c)))
      
      ; Sets the slope to infinity if they have the same x-values becauser
      ; that means that it is a vertical line
      (let ((slope1 (if (= x1 x2) infinity (/ (- y1 y2) (- x1 x2))))
            (slope2 (if (= x2 x3) infinity (/ (- y2 y3) (- x2 x3)))))
        (if (equal-to slope1 slope2)
          #t 
          #f)))))

; Is Line
; Checks to see if the 3 points make a line, by making sure that
; the points are different and have the same slope
; @param 3 coordinate points
; @return true if the points make a line, and false otherwise
(define is-line
  (lambda (a b c)
    (cond
      ((not (diff-points a b c)) #f)
      ((check-slopes a b c) #t)
      (else #f))))

; Triangle-Points
; Check if 3 points make a triangle, by making sure they do 
; not make a line
; @param 3 coordinate points
; @return true if the points make a triangle, and false otherwise
(define triangle-points
  (lambda (a b c)
    (not (is-line a b c))))

; Distance
; Calculates the distance between two points
; @param 2 coordinate points
; @return the distance
(define distance 
  (lambda (a b)
    (let ((x1 (get-x a))
          (x2 (get-x b))
          (y1 (get-y a))
          (y2 (get-y b)))
       (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2))))))

; Triangle Perimeter
; Calculates the perimeter of a triangle
; Outputs a message if the given points do not create a triangle
; @param 3 coordinate points
; @return the perimeter or error message
(define triangle-perimeter
  (lambda (a b c)
    (if (triangle-points a b c)
      (let ((lenA (distance a b))
            (lenB (distance b c))
            (lenC (distance c a)))
        (+ lenA lenB lenC))
      (display "Not a Triangle")))) 

; Triangle Area
; Calculates the area of a triangle
; Outputs a message if the given points do not create a triangle
; @param 3 coordinate points
; @return the area or error message
(define triangle-area
  (lambda (a b c)
    (if (triangle-points a b c)
      (let ((x1 (get-x a))
            (x2 (get-x b))
            (x3 (get-x c))
            (y1 (get-y a))
            (y2 (get-y b))
            (y3 (get-y c)))
        (/ (abs (+ (* x1 (- y2 y3)) (* x2 (- y3 y1)) (* x3 (- y1 y2)))) 2.0))
      (display "Not a Triangle"))))

; Triangle Angle
; Calculates an angle of a triangle
; @param 3 coordinate points
; @return the angle or error message
(define triangle-angle
  (lambda (a b c)
    (if (triangle-points a b c)
      (let ((lenA (distance a b))
            (lenB (distance b c))
            (lenC (distance c a)))
       (acos(/ (- (+ (* lenB lenB) (* lenC lenC)) (* lenA lenA)) (* 2 lenB lenC))))
      (display "Not a Triangle"))))

; Process Triangle 
; Outputs the side lengths, perimeter, area, and angle measurements
; in degrees and radians if the 3 coordinate points create a triangle.
; Output an error message if the points do not make a triangle.
; @param 3 coordinate points
; @return the information or an error message
(define process-triangle
  (lambda (a b c)
    (if (not (triangle-points a b c))
      (begin
        (display "Not a Triangle")
        (newline))
      (begin
        (display "Side 1 = ")
        (display (rounding (distance a b) 3))
        (newline)
        (display "Side 2 = ")
        (display (rounding (distance b c) 3))
        (newline)
        (display "Side 3 = ")
        (display (rounding (distance c a) 3))
        (newline)
        (display "Perimeter = ")
        (display (rounding (triangle-perimeter a b c) 3))
        (newline)
        (display "Area = ")
        (display (rounding (triangle-area a b c) 3))
        (newline)
        (display "Angle 1 = ")
        (display (rounding (triangle-angle a b c) 5)) 
        (display "  ")
        (display (rounding (/ (* (triangle-angle a b c) 180) pi) 5))
        (newline)
        (display "Angle 2 = ")
        (display (rounding (triangle-angle b c a) 5))
        (display "  ")
        (display (rounding (/ (* (triangle-angle b c a) 180) pi) 5))
        (newline)
        (display "Angle 3 = ")
        (display (rounding (triangle-angle c a b) 5))
        (display "  ")
        (display (rounding (/ (* (triangle-angle c a b) 180) pi) 5))
        (newline)
        (newline)))))


; Is Square
; Determines if the four coordinte points create a square
; @param 4 coordinate points
; @return true if it creates a square and false otherwise
(define is-square 
  (lambda (a b c d)
     (let ((lenA (distance a b))
            (lenB (distance b c))
            (lenC (distance c d))
            (lenD (distance d a))
            (diag1 (distance a c))
            (diag2 (distance b d)))
      (if (and (and (equal-to lenA lenB)
                (equal-to lenB lenC)
                (equal-to lenC lenD)
                (equal-to lenD lenA))
               (and (equal-to diag1 diag2)))
        #t
        #f))))

; Square Area
; Calculates the area of a square
; Outputs an error message if the points do not create a square
; @param 4 coordinate points
; @return the area or error message
(define square-area
  (lambda (a b c d)
    (if (is-square a b c d)
      (let ((lenA (distance a b)))
          (* lenA lenA))
      (begin
        (display "Not a Square")
        (newline)))))

; Square Perimeter
; Calculates the perimeter of a square
; Outputs an error message if the points do not create a square
; @param 4 coordinate points
; @return the perimeter or error message
(define square-perimeter
  (lambda (a b c d)
    (if (is-square a b c d)
      (let ((lenA (distance a b)))
          (* lenA 4))
      (begin
        (display "Not a Square")
        (newline)))))  

; Process Square 
; Outputs the side lengths, perimeter, and area if the 
; 4 coordinate points create a square.
; Output an error message if the points do not make a square.
; @param 4 coordinate points
; @return the information or an error message
(define process-square
  (lambda (a b c d)
    (if (is-square a b c d)
      (begin 
        (display "Side = ")
        (display (rounding (distance a b) 5))
        (newline)
        (display "Perimeter = ")
        (display (rounding (* (distance a b) 4) 5))
        (newline)
        (display "Area = ")
        (display (rounding (* (distance a b) (distance a b)) 5))
        (newline)
        (newline))
      (begin 
        (display "Not a Square")
        (newline)))))

; Rounding 
; Rounds numbers to certain decimal places.
; @param the number and how many decimals places it should be rounded to.
; @return the rounded number
(define rounding 
    (lambda (number decimals)
        (let ((factor (expt 10 decimals)))
            (/ (round (* number factor)) factor))))

; Equal To 
; Compares two numbers and declares them eqeual if they are within the margin.
; @param the two numbers
; @return true if the numbers are equal, and false otherwise
(define equal-to
  (lambda (x y)
    (let ((factor (expt 10 5)))
      (= (round (* x factor)) (round (* y factor))))))