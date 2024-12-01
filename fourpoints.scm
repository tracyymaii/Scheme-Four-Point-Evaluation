; Title : Scheme
; Purpose: To specify types of triangles, lines and squares given poonts.
; Author: Tracy Mai
; Date: December 1, 2024

; Pi
; Explicity assigns the value of pi
; @param none
; @return pi as 3.141592653589793
(define pi 3.141592653589793)

; Pi
; Explicity assigns the value of pi
; @param none
; @return pi as 3.141592653589793
(define make-point 
  (lambda (x y)
    (cons x y)))

(define get-x
  (lambda (point)
    (car point)))  

(define get-y
  (lambda (point)
    (cdr point)))  

(define diff-points
  (lambda (a b c)
    (if (or (not (equal? a b))
            (not (equal? c b))  
            (not (equal? a c)))
      #t
      #f)))
        
(define vert-line
  (lambda (a b c)
     (if (and (equal? (get-x a) (get-x b)) 
              (equal? (get-x b) (get-x c)))
        #t
        #f)))

(define triangle-points
  (lambda (a b c)
    (if (not (and (equal? a b)
                  (equal? b c)
                  (equal? b a)))
      #t
      #f)))

(define check-slopes
  (lambda (a b c)
    (let ((x1 (get-x a))
          (x2 (get-x b))
          (x3 (get-x c))
          (y1 (get-y a))
          (y2 (get-y b))
          (y3 (get-y c)))
      (if (or (= x1 x2) (= x2 x3) (= x3 x1)) 
          #f ; Points are collinear or vertical line
          (let ((slope1 (/ (- y1 y2) (- x1 x2)))
                (slope2 (/ (- y2 y3) (- x2 x3)))
                (slope3 (/ (- y3 y1) (- x3 x1))))
            (and (equal? slope1 slope2)
                 (equal? slope2 slope3)))))))


(define is-line
  (lambda (a b c)
    (cond
      ((not (diff-points a b c)) #f)
      ((vert-line a b c) #t)
      ((check-slopes a b c) #t)
      (else #f))))

(define distance 
  (lambda (a b)
    (let ((x1 (get-x a))
          (x2 (get-x b))
          (y1 (get-y a))
          (y2 (get-y b)))
       (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2))))))

(define triangle-perimeter
  (lambda (a b c)
    (if (triangle-points a b c)
      (let ((lenA (distance a b))
            (lenB (distance b c))
            (lenC (distance c a)))
        (+ lenA lenB lenC))
      (display "Not a Triangle")))) 

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


(define triangle-angle
  (lambda (a b c)
    (if (triangle-points a b c)
      (let ((lenA (distance a b))
            (lenB (distance b c))
            (lenC (distance c a)))
       (acos(/ (- (+ (* lenB lenB) (* lenC lenC)) (* lenA lenA)) (* 2 lenB lenC)))))))


    

(define process-triangle
  (lambda (a b c)
    (if (not (triangle-points a b c))
      (begin
        (display "Not a Triangle")
        (newline))
      (begin
        (display "Side 1 = ")
        (display (distance a b))
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
        (display (rounding (triangle-area a b c) 0))
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
        (display (rounding (triangle-angle c b a) 5))
        (display "  ")
        (display (rounding (/ (* (triangle-angle c b a) 180) pi) 5))
        (newline)
        (newline)))))

    ;check triangle, if not then say points do not form triangle
    ; otherwise does
    ; calcualte perim,
    ; area
    ; interiale angles of triangle

; 4 sides are eual and diagonalsa re equal, 
; everytime do siatNXWM YOU add it to the square list

(define is-square 
  (lambda (a b c d)
     (let ((lenA (distance a b))
            (lenB (distance b c))
            (lenC (distance c d))
            (lenD (distance d a))
            (diag1 (distance a c))
            (diag2 (distance b d)))
      (if (and (and (equal? lenA lenB)
                (equal? lenB lenC)
                (equal? lenC lenD)
                (equal? lenD lenA))
               (and (equal? diag1 diag2)))
        #t
        #f))))

(define square-area
  (lambda (a b c d)
    (if (is-square a b c d)
      (let ((lenA (distance a b)))
          (* lenA lenA))
      (begin
        (display "Not a Square")
        (newline)))))

(define square-perimeter
  (lambda (a b c d)
    (if (is-square a b c d)
      (let ((lenA (distance a b)))
          (* lenA 4))
      (begin
        (display "Not a Square")
        (newline)))))  

    
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
        (display (rounding (* (distance a b) (distance a b)) 0))
        (newline)
        (newline))
      (begin 
        (display "Not a Square")
        (newline)))))



(define rounding 
    (lambda (number decimals)
        (let ((factor (expt 10 decimals)))
            (/ (round (* number factor)) factor))))