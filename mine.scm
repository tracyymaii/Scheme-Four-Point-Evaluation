(display "Hello, World!")
(newline)

;(define (double x)
;    (* x 2))
(+ 1 2 3)



; user input: just string, val = string
; define saying string, then call sayign in term = string
; / 10 2 = 10 / 2 = 5
; / 2 3 = 2/3 

; define add +
; add 1 2 
; same as + 1 2

; * | - 8 | / 30 5 | | 21 |
; = 30 / 5 = 6
; 8 - 6 = 2
; 2 * 21 = 42

; / 2 3 = 2/3
; / 2 3.0 = 0.6666666
; -2/3 = -2/3

; hashtag t = true
; hashtag f = false
; `foo = symbol

; |list 1 2| = 1 2 in a single
; `1 2 = ``

; `| + 1 2| = |+ 1 2|

; procedure w no name = lambda
; | lambda |x| |* x 2||

; (define double (lambda (x) (* x 2)))
; literally anything afer ' makes  program into DATA

; (string-append "my name is " name "!")

(define greet
    (lambda (name)
    (string-append "Hello " name "!")))

(define (greetings name)
    (string-append "Hello " name "!"))

(define (circle-area radius)
  (let ((pi 3.14159))  ; Bind `pi` locally
    (* pi radius radius)))  ; Use `pi` in the calculation

(define x 10)
(define y 20)
(define z 30)

(define double
    (lambda (x)
        (* x 2)))

; LIsts
(define list1 (list 'x 'y 'z))
(define list2 (list x y 'z))
'(x y z)
;quote(x y z)


(define a 10)
(define b 20)

(* 3 a)
(lambda (a) (* 3 a))
((lambda (a) (* 3 a)) 5)
(define trp (lambda (a) (* 3 a)))

; define predicate to check if a val is an atom

(define atom?
    (lambda (x)
        (and (not (pair? x)) (not (null? x)))))

; atom = 3, "atom", 'atom | !atom = cons 1 2, list 1 2 3

; defone a procedure with 2 params
(define addem
    (lambda (a b)
        (+ a b)))
; (addem 10 (addem 20 30)) = 60

; increment function, adds one to param
(define increment
    (lambda (x) 
        (+ x 1)))
; (increment (increment (increment (increment 0)))) = 4

;function as a parameter
(define do
    (lambda (this that)
        (this that)))
; (do increment 10) where this = increment, that = 10, so it calls increment, then send 10 to that, returning 11
; (do - 20) = -20
; (do trp 27) = this = trp, that = 27 | sends 27 to trip so then 3 * 27 = 81
; (do (lambda (x) (* x (+ x 1))) 3) = do = lambda (x) (* x (+ x 1))) , that = 3 | so does 3 + 1 = 4 * 3 = 12
; (do 10 20) = ERROR, bc in this case, THIS has to be a procedure, and 10 != procedure
; (do addem 1) = airity mismatch bc addem takes 2 params
; (do addem 1 2) = airity mismatch bc do takes 2 params
; also !do (do (addem 1 2)) and (do addem (1 2)))
; to do addem:
    ; (do lambda (x) (addem x 100) 1)
    ; so then this = lambda(x) (addem x 100), that = 1 === 101

; tru = first thing, false = second thing

(newline)
; conditionals
(display (if (> 3 2) 'bigger 'smaller))
(display (if (< 3 2) 'bigger 'smaller))

(define c 30)

(display (if (= c 10) (+ c 5) (do trp z))) = 15
(display (if (= c 12) (+ c 5) (do trp z))) = 30

; switch statementss
(define director
    (lambda (k)
        (cond
            ((equal? k "Goodfellas") "Martin s")
            ((equal? k "inception") "christ")
            ((equal? k "rear window") "alfread")
            ((equal? k  "aliens") "james")
            (else "alan"))))
; ask for first word get second


;  (null? '()), null? null = t, (null? '(1 2 3)), 2, 0, f = f
; null? (), invalid schme form so error
; empty list = () = null

(+ 1 2) ; evals so 3
' (+ 1 2) ; adds everything in paren to list so: + 1 2
(quote (+ 1 2)); same here so: + 1 2
(list + 1 2); evals each then adds to list so: #<procedure:+> 1 2 
;(1 2 3); = error bc 1 is not a procedure, must start w procedure

; list operations
(define lst (list a b c))


; earlier defined a = 10, b = 20, c = 30

(newline)
(display lst)
(newline)
(display (car lst)) ; 10 ; first elem
(newline)
(display (cdr lst)) ; (20, 30) ; list minus first elem, always in list dorm

(newline)

(display (car (cdr lst))) ; 20
(newline)
(display (cdr (cdr lst))) ; 30
(newline)
(display (cdr (cdr (cdr lst)))) ; () empty list bc look at 165
(newline)

(cdr '(1)) ; cdr of a list with one item = empty list
(display (car '(1))) ; 1 bc its the first elem of the list is 1
(car '((4 5 6))) ; 4 5 6 bc the only element in this list is this list, aka list inside a list
(cdr '((4 5 6))) ; ()
(newline)
(display (car (car'((4    5 6))))) ; 4 SOLID we dont need to care about white space
(newline)
(display (cdr (car'((4 5    6))))) ; (5 6)

(car (cdr '(a b c))) ; b
(cadr '(a b c)) ; b shortcut to the one above
(cddr '(a b c)) ; (c)

; list with size 1
(car '(1)) ; 1
(cdr '(1)) ; ()

(newline)
(newline)

; fun with car & cdr

(define lst4 '((1 2) (3 4 (5 6)) (7 8)))
(car lst4) ; (1 2)
(cdr lst4)  ;((3 4 (5 6)) (7 8))
(car (car lst4)) ; 1
(cdr (car lst4)) ; (2)
(car (cdr lst4)) ; (3 4 (5 6))
(cdr (cdr lst4)) ; ((7 8)) -- double paren bc of ENTIRE list

; can do list with ops if u wanna


(newline)
(newline)


;list procedures
(define lisp '(0 2 3 4))
(car lisp); 0
(cdr lisp); (2 3 4)
(display (cons -1 lisp)) ;almost like a constructor, so adds -1 --> -1 0 2 3 4
(newline)

(car (cons -1 lisp)) ; -1
(cdr (cons -1 lisp)) ; (0 2 3 4). just og lisp

(display lisp) ; og still 0 2 3 4 
(newline)
(define lisps (cons -1 lisp)) ; now made it into a new list = lisps
(display lisps) 
(newline)

(display (cons '(a b c) lisp)) ; ((a b c) 0 2 3 4), weird bc now this list has 5 elems when we want it to have 7 so
(newline)
(display (append '(a b c) lisp)) ; (a b c 0 2 3 4)
;; can append list with itself, but again cons list with itself will still be weird
(append lisp (cons lisp lisp)) ; (0 2 3 4 (0 2 3 4) 0 2 3 4) 


(cons lisp 5) ; ((0 2 3 4) . 5) ;  PAIR 
(append lisp 5) ; (0 2 3 4 . 5) singular element

(cons lisp (list 5)) ; adding 2 lists tgt ((0 2 3 4) 5) 
(append lisp (list 5)) ; (0 2 3 4 5)
(newline)
(newline)
(newline)

;creating a list
(define exlist1 (+ 2 3)) ;without quote wll evaluate first so = 5
(define exlist2 '(+ 2 3)) ; actual list
; ((car exlist2( 10 20) will not work bc + is not a procedure rn j an element so
(define exlist3 (list + 2 3)) ; bc this puts them all ina list as ops or their own nums
(display ((car exlist3) 10 20)) ; ADDS YAY so 30

(define exlist4 (cons '+ (cons 2 '(3)))) ; + 2 3
(define exlist5 (cons '+ (cons 2 (cons 3 '())))) ; + 2 3 
;(define exlist6 (cons '+ (cons 2 (cons 3 null)))) ; + 2 3

; each adds + as elem, not procedure, if we want procedure
(define exlist7 (cons + (cons 2 (cons 3 '())))) ; #<procedure:+> 2 3 

; (length '(0 1 2)) = 3
(length '(1 2 (3 4) (5 6 (7 8) 9) 10 11)); = 6
