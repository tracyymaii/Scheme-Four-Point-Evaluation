# Scheme Programming 
## Motivation
Around 1930’s one mathematical model of computation was created called the Lambda Calculus, with time it was proven to be equivalent to the Turing Machine model, meaning that both models have the same computational capability. Functional programming is an elaboration based on Lambda Calculus, where programming is declarative as opposed to imperative as most programming languages students have been exposed so far. At a point in the development of Computer Science, functional programming was thought to be applicable to solve AI problems. Besides, being an academic type of programming, industry also uses functional programming, for instance [Erlang](https://www.erlang.org/) is used in the telecommunications industry. There are modern functional programming languages like [Scala](https://www.scala-lang.org/) and [F#](https://fsharp.org/). Some imperative languages also include functional capabilities, some of those are [Java](https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html) and JavaScript.

I developed a simple program in Scheme in order to practice this language and expose them to a completely different paradigm of programming. Up to this moment, I have been working and coding with imperative and object-oriented languages, and a declarative language should pose a new challenge, as it requires a different way to think.

## Description
A Scheme program that implements the following functions:
- `(make-point x-cor y-cor)`. This function creates a “list” that will have two elements: `x-cor` and `y-cor`.
- `(is-line point1 point2 point3)`. Using the created points (using `make-point`) this function returns true (`#t`) if the three points form a line or false (`#f`) if they form a triangle.
- `(distance point1 point2)`. Calculates the distance between two points
- `(triangle-perimeter point1 point2 point3)`. Calculates the perimeter of a triangle defined by the three points
- `(triangle-area point1 point2 point3)`. Calculates the area of a triangle defined by the three points
- `(square-perimeter point1 point2 point3 point4)`. Calculates the perimeter of a square defined by the four points
- `(square-area point1 point2 point3 point4)`. Calculates the area of a square defined by the four points
- `(is-square point1 point2 point3 point4)`. This function returns true (`#t`) if the four points actually represent a square, it returns false (`#f`) otherwise. Remember the sides of the square may not be parallel with x and y. 
- `(process-square point1 point2 point3 point4)`. This function takes in four points, it will check if these points form a square, if they do, then it calculates the length of the side, the area and perimeter of the square. If it is not a square, just output a message indicating the points don't form a square.
- `(process-triangle point1 point2 point3)`. This function takes in three points, it will check if these points form a triangle, if they do, then it calculates the perimeter, area and interior angles of the triangle formed by the three points. If it is not a triangle, just output a message indicating the points don't form a triangle.

## Sample Output
```
/development/CSC3310/scheme-fourpoints# scheme --load fourpoints.scm
MIT/GNU Scheme running under GNU/Linux
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2019 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO warranty; not even
for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Thursday September 5, 2019 at 11:51:46 AM
  Release 10.1.10 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/x86-64 4.118
;Loading "fourpoints.scm"... done

1 ]=> (make-point 2 3)

;Value: (2 . 3)

1 ]=> (is-line (make-point 1 3) (make-point 2 6) (make-point 3 9))

;Value: #t

1 ]=> (is-line (make-point 1 3) (make-point 0 6) (make-point 3 9))

;Value: #f

1 ]=> (distance (make-point 1 3) (make-point 2 6))

;Value: 3.1622776601683795

1 ]=> (triangle-perimeter (make-point 2 2) (make-point 5 2) (make-point 3.5 -2))

;Value: 11.54400374531753

1 ]=> (triangle-area (make-point 2 2) (make-point 5 2) (make-point 3.5 -2))

;Value: 5.999999999999999

1 ]=> (process-triangle (make-point 2 2) (make-point 5 2) (make-point 3.5 -2))
Side 1 = 3
Side 2 = 4.272
Side 3 = 4.272
Perimeter = 11.544
Area = 6.
Angle 1 = .71754   41.11209
Angle 2 = 1.21203   69.44395
Angle 3 = 1.21203   69.44395

;Unspecified return value

1 ]=> (process-triangle (make-point 2 2) (make-point 3 3) (make-point 4 4))
Not a Triangle
;Unspecified return value

1 ]=> (is-square (make-point 2 4) (make-point 5 7) (make-point 8 4) (make-point 5 1))

;Value: #t

1 ]=> (is-square (make-point 2 4) (make-point 5 7) (make-point 8 4) (make-point 5 0))

;Value: #f

1 ]=> (square-area (make-point 2 4) (make-point 5 7) (make-point 8 4) (make-point 5 0))
Not a Square
;Unspecified return value

1 ]=> (square-area (make-point 2 4) (make-point 5 7) (make-point 8 4) (make-point 5 1))

;Value: 17.999999999999996

1 ]=> (square-perimeter (make-point 2 4) (make-point 5 7) (make-point 8 4) (make-point 5 1))

;Value: 16.97056274847714

1 ]=> (process-square (make-point 2 4) (make-point 5 7) (make-point 8 4) (make-point 5 1))
Side = 4.24264
Perimeter = 16.97056
Area = 18.

;Unspecified return value

1 ]=>
```

## Instructions for Testing
`scheme --load full.scm > your-output.txt`




`(square-perimeter point1 point2 point3 point4)` | 10
`(square-area point1 point2 point3 point4)` | 10
`(process-square point1 point2 point3 point4)` | 15
`(process-triangle point1 point2 point3)` | 15

**Note:** Check out the sample output and test provided to see the likely test cases that your code is going to be graded on.
