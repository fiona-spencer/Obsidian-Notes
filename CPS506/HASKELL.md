==SLIDE 1==

# Functional Programming

- Higher-order functions
	- Can return functions or accept them as arguments
- First class function
	- Can be passed as arguments, returned as values
- Pure functions
	- Functions that have no side affects
	- No interaction with world outside of local scope
	- Easier to verify correctness, thread-safe when no data dependency is present

- Strict (eager) vs non-strict (lazy) evaluation
	- Strict
		- Evaluate function arguments before invoking the function
	- Lazy
		- Evaluates arguments if their value is required to invoke the function

- Haskell if functional programming

# History
- Named after logician Haskell Curry
- In the late 80s, interest in lazy functional languages was growing
- There was strong consensus to define an open standard for such languages

# Features
- Purely functional
	- Every function is pure
	- No statements, only expressions
	- Cannot mutate variables (local or global)
	- Supports pattern matching
	- Even side-effect inducing operations are produced by pure code
	- Side effects are handled using _monads_
- Statically types
	- Every expression has a type
		- Determined at compile time
	- Types composing expressions must match
- Type inference
	- Types do not have to be written out explicitly
	- They will be inferred at compile time
- Lazy evaluation
	- Function do not evaluate their arguments
	- Expressions bound to variables do not evaluate unless the result is used
	- Computation never takes place unless a result is used
- Concurrency
	- GHG (Haskell compiler) includes high performance parallel garbage collector
	- Light-weight concurrency library

# Haskell Use in the Industry
- Nvidia
- Facebook
- Google
- Intel
- Microsoft
- Typically, Haskell is used on specialized internal projects or research

- `main()` is the entry point of a Haskell program

# Literals and Arithmetic
- Addition
- Subtraction
- Multiplication
- Division
- No parentheses on function calls (`sqrt 2)
# Tuples
- Do not need to contain same types
- `fst` and `snd` only work on pair tuples

# Lists
- Must be homogeneous
- Elements can be added at the beginning of a list with the cons operator `:`
`0:[1. 2]`
`[0, 1, 2]`

# Lists and Tuples
 - Tuples can be heterogeneous, lists must be homogeneous
# Strings
- Strings are a list of chars
- Concatenate lists and strings using `++` operator
- Cannot concatenate different data types
- `show()` converts number to string
- `read()` converts string to number

# Operations on Lists
- In functional programming, computation is done by operating on lists
- 3 primary list-processing functions
	- Map
	- Filter
	- Foldr/foldl

# Head and Tail
- Head returns the first element
- Tail returns the rest

# Map
- Map operates on lists
- Takes to arguments a functional and list of values to which the function is to be applied

```haskell
map Data.Char.toUpper "Hello, world!"
"HELLO, WORLD!"
```

# Filter
- Removes items from a lists based on some criteria

```Haskell
filter Data.Char.isLower "Hello, World!"
"elloord"
```


# Infix Functions
- Use symbolic operators as functions
- Enclose in parentheses to use non-infix mode

```Haskell
(+) 5 10
15
(*) 5 10
50
```

# Foldr, Foldl
- Replaces the cons operator with some other function

`[1, 2, 3, 4, 5] == 1:2:3:4:5:[]`

- Foldr is right associative
- Foldl is left associative

```Haskell
foldr (-) 0 [1, 2, 3, 4, 5]
foldr (-) 0 1:2:3:4:5:[]

(1 - (2 - (3 - (4 - (5 - 0)))))
3

foldl (-) 0 [1, 2, 3, 4, 5]
((((0 - 1) - 2) - 3) - 4) - 5
-13
```


# List Generation

```Haskell
list = [1, 2, 3, 4, 5]
list = [1..9]
list = [1, 3..9] = [1, 3, 5, 7, 9]
```

- Haskell is lazy
- Displaying a list required evaluation

`take 3 [1..9] => [1, 2, 3`

- `take` grabs the n-elements of a list
- Perform operations on a finite subset of an infinite list

`take 3 (drop 5 x) => [6, 7, 8]`

- `drop` remove n-elements of a list

`zip "cat" x => [('c',1), ('a',2) ('t',3)]`

- `zip` combines two lists together into tuples

# Functions
- Functions are central in Haskell

```Haskell
square x = x*x
square 4
16

sum a b c d = a + b + c + d
sum 1 2 3 4
10
```


# Modules

```
module Test where
```

- Load modules in the GHGi terminal `:load Test.hs`

# Control Structures

- Negative arguments require brackets
- Indentation matters (8 spaces)
- Code that is part of an expression should be intended further than the beginning of that expression
- Use `let` to bind a name
- If there are more than one expression use `do`

```Haskell
f x = if x < 0 then 0 else 1
f (-6)
0
```

```Haskell
module Test where

sign x =
	if x < 0 then -1
	else if x > 0 then 1
	else 0

age x = do
	let AGE = x
	if AGE < 18 then -1
	else if AGE > 18 then 1
	else 0
```

# Let/In Expression
- Use `let/in` for one expression

```Haskell
module Test where

roots a b c =
	let disc = sqrt(b*b - 4*a*c)
	in ((-b + disc)/2(2*a),
		(-b - disc)/(2*a))
```

# Case Expression

- When matching specific values, a case construct is easier to write
- `_` catches everything

```Haskell
module Test where

isNum x =
	case x of
	0 -> 0
	1 -> 1
	2 -> 2
	_ -> -1
```

# Pattern Matching: Case

# Piece Wise Functions

# Functions: Guards

# Recursion

# Tail Recursion

# Recursion: Cons
# Recursion: Filter

# Function Composition

# Lambda Functions

---

# Types in Haskell

# Type Classes

# Type Class: Eq

# Type Class: Num

# Type Class: Show

# Functions and Typeclasses

# Function Type Signatures

# Specific Function Type

# Type vs Type Class

# Type Class: Ord

# Custom Data Types

# Custom Coordinate Types

# Custom Type Usage

# Overloading Constructor

# Deriving Show

# More Advanced Functions

# Addition, Subtraction, Equality

# Custom Types and Type Classes

# Minimal Defintion

# Instance of Num

# Instance of Show


---

# Write to Dispaly

# Haskell and I/O

# Staying Grounded

# `main::IO()`

# IO Actions

# Combining Actions

# More Complicated

# Actions and Functions

# `return()`

# Monads and return

# Monads

# Monad Jargon

# >> vs <<

# Non-main Example


# Calling Pure Code

# Best Practice

# `Maybe` Monad

# Unwrap Nothing

# Using Maybe

# Consider a Lookup Table

# Use `lookup`

# Cascading Failure

# 