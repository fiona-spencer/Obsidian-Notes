# Why Choose Haskell?
- Purely functional programming language
	- First-class and higher-order functions
	- Immutability
	- Pure functions
	- Recursion
	- Function composition
	- Declarative style
- Support for closures or lambda functions
- Haskell offers strict guarantees about immutability across entire program
- Haskell's type system is more expressive than the type system of any other mainstream programming language
	- Keeps track of information about what kind of data a variable holds, where it comes from, and what can be done with it
	- And whether a function might fail
- Larger programs benefit as the type system helps to refactor
- 
# Why This Book
- Haskell is used for high quality software
# How To Read This Book
- This books uses the standard library, `base`
 ---

# 1. Getting Started with Haskell

## <font style="color:#DD4EAB">Formatting Haskell Code</font>

- In between practical applied and research languages
- For reliable and maintainable systems
- Use in web applications, data pipelines, compilers, configuration management tools, etc.
- In Haskell programs, all values are immutable, and all functions have to be free of any side effects
	- Cannot modify in place of change the values of variables
	- Cannot modify any global state
	- Cannot arbitrarily read from files on disk, access the network, or print to the screen
- Haskell uses tools and alternative patterns to write in an impure language
- Haskell is a lazy language
	- Haskell has the powerful ability to avoid running parts of the program until it's sure that it needs the results
- Programs feel more natural, but have negative performance costs in a strict language
- `ghci` is Haskell's REPL
	- An interactive environment that runs commands, calls functions, and debugs programs

```haskell
ghci> [1..10]
[1,2,3,4,5,6,7,8,9,10]

ghci> [2,4..10]
[2,4,6,8,10]
```

- A list can only contain on type of value at a time
- A tuple stores values with the different type
- `fst` and `snd` gets first and second elements from a two-element tuple respectively
- Nest tuples with lists or tuples

```Haskell
fst (2, "tuple")
2
```

- A list of tuples must have the same number of elements, and the types have to all be the same at each position in the tuple

```Haskell
[(​"haskell"​, 7), (​"is"​, 2), (​"fun", 3)]
```

- Print to screen with `putStrLn`
- `show` converts most types into strings
- `print` combines putStrLn and `show`
```Haskell
putStrLn
putStr

ghci> putStrLn(show 12)
12
ghci> putStrLn("hello")
hello
ghci> print("hello")
"hello"
```

- To compile and run executable
`ghc Main`
`./main`
- To run module
`runhaskell Main.hs`
- Load to ghci
`:load Main.hs
ghci> main` 
- Haskell is a whitespace sensitive language
	- Statements are grouped together based on their level of indentation, like Python
- Individual lines are terminated with a newline
- Two spaces of indentation is a common practice

## Creating New Variables

- Variables start wth a lowercase, can contain letters, numbers, underscored, and single quote character
- By convention variables are camelCase
- Variables can be reassigned
- To increment a variable, create a new one using it's prime

```haskell
two = 1
two' = two + 1
two' --2
```

- Double prime variables (`two''`) are common, however exceeding primes are not
- Join strings using `<>` or `++` (only works for lists and plain strings)
- Re-using names inside the same scope is not allowed

## <font style="color:#DD4EAB">Writing Functions</font>

- Syntax for defining functions and variables are similar

```haskell
module Main where

makeGreeting greeting person =
    greeting <> " " <> person


main = print (makeGreeting "Hello" "Fiona") -- "Hello Fiona"
```

- Create anonymous functions using backslash (\) followed by the parameters for the function, and then an arrow (->) followed by the body
`\param1 param2 -> expression`
- Anonymous function are also referred to as "lambda functions/abstractions" or "lambdas"

```haskell
ghci> ((\x y -> x + y) 5 10)
15
```

```haskell
module Main where

main = print ((\greeting person -> greeting <> " " <> person) "Hello" "Fiona") -- "Hello Fiona"
```

- All functions only take a single argument
- Functions that appear to take multiple arguments, are shorthand for functions that are primed, that creates a new function for each parameter
- The process of converting a function that takes multiple arguments into a series of single-argument functions is called _currying_
- Functions are curried by default
- When a function is called with all of its arguments and can return a values that isn't a function, it is called _fully saturated_
- Otherwise, the function is _partially applied_, when only some arguments are passed
- Create a function that partially applies a modified greeting to makeGreeting
- Removing the extra parameter is called _eta reduction or n-reduction_
- Adding a parameter and passing it along is called _eta expansion_

```haskell
module Main where

makeGreeting greeting person =
    greeting <> " " <> person

excitedGreeting greeting name =
    makeGreeting (greeting <> "!") name

main = print (excitedGreeting "Hello" "Fiona") -- "Hello! Fiona"
```

- Operators are just functions that are infix by default
- Partially apply them like any other function with parentheses

```haskell
ghci> half = (/2)
ghci> twoOver = (2/)
ghci> half 10
5.0
ghci> twoOver 2
1.0
ghci> twoOver 8
0.25
```

- Turn regular functions into infix functions by surrounding by backticks

```haskell
ghci> :load Main.hs
ghci> greetGeorge = (`makeGreeting` "George")
ghci> greetGeorge "Hello"
"Hello George"
```

- `flip` function is another way to apply only the second argument of a function
- `flip someFnc arg1 arg2 = someFnc arg2 arg1`

```haskell
ghci> greetGeorge = flip makeGreeting "George"
ghci> greetGeorge "Good Afternoon"
"Good Afternoon George"
```

- Although "George" is the second argument is the same as `(flip makeGreeting) "George"` since functions have precedence

```haskell
ghci> sayThree a b c = (a,b,c)
ghci> sayThree 1 2 3
(1,2,3)
ghci> flip sayThree 1 2 3
(2,1,3)
```

- Function composition is about building functions that bring together two or more smaller functions into a single large function
	- Build abstractions
- Function (`$`)
	- Function application operator
	- Helps to avoid having too many parentheses
- Function (`.`)
	- Function composition operator
	- Helps quickly build new functions by combining existing ones

```haskell
addOne $ timesTwo 2 -- 5
```

- `$` applies the function on the left-hand side to the values on the right
- Right will be evaluated before the function is applied to it

```haskell
ghci> timesTwoPlusOne = timesTwo . addOne
ghci> timesTwoPlusOne 2
6
ghci> addOneTimesTwo = addOne . timesTwo
ghci> addOneTimesTwo 2
5
```

- `.` combines two functions and gives you a new function that accepts an argument to the right, and passes that function's output on as input to the left

`(.) func1 func2 = \arg -> func1 (func2 arg)`

- _Pointfree_ programming, also called _tacit programming_, takes the ideas of n-reduction and function composition to their logical conclusion by writing functions that take no named parameters

```haskell
ghci> makeGreeting' greeting = ((greeting <> " ") <>) -- n-reduction
ghci> makeGreeting' "Hello" "Fiona"
"Hello Fiona"
ghci> makeGreeting' greeting = (<>) (greeting <> " ") -- pointfree
ghci> makeGreeting' "Hello" "Bob"
"Hello Bob"
ghci> makeGreeting' = (<>) . (\greeting -> greeting <> " ") -- anonymous
ghci> makeGreeting' "Hello" "Linda"
"Hello Linda"
ghci> makeGreeting' = (<>) . (<> " ") -- Fully pointfree
ghci> makeGreeting' "Hello" "Lily"
"Hello Lily"
```

- `(<>)` is a prefix function that takes the first argument
- Pointfree functions makes code cleaner and easier to read
- Haskell uses minimal grammar, and punctuation
- Downside is that it relies on implicit rules about parsing, rather than explicit punctuation

## <font style="color:#DD4EAB">Precedence, Operators, and Fixity</font>

- Passing an argument to a function has a higher precedence than passing to an operator
	- Function has higher _binding precedence_
- Functions that may have ambiguity are parsed left to right
	- _Left associative_

```haskell
add add 1 2 add 3 4
((((((add add) 1) 2) add) 3) 4)
(add ((add 1 2) (add 3 4))) -- with parentheses
```

- The combination of properties is called _fixity_, as we declare it using _fixity declaration_

- What are Operators?
	- Infix by default
	- Functions have a higher binding precedence
	- A function can any number of arguments, but a custom operator must always have exactly two (binary operators)
	- Functions can be named using any letters, operators must be named using symbols
	- A function name that starts with an uppercase letter is a _type constructor_
	- Operators start with colon (`:`)


```haskell
-- same operator
(+++) a b = a + b -- prefix form
a +++ b = a + b -- infix form

ghci> 1 +++ 1
2
ghci> (+++) 1 2
3
```

- The new operator has higher precedence than multiplication
	- Fix binding precedence by adding _fixity declaration_
- Fixity declaration
	- `infixl` for left associativity
	- `infixr` for right associativity
	- `infix` if operator is not associative
- Binding precedence is on a scale of 0 (lowest) to 9 (highest)
- Normal addition in Haskell is left associative with a precedence of 6

```haskell
infixl 6 +++ -- changing binding precedence
a +++ b = a + b

ghci> 1 +++ 2 * 3
7
```

- Binding precedence must be unambiguous (include parentheses) for it to parse
- Build larger and more complex functions by building up intermediate computations using _let bindings_
- Anything after `$` is evaluated as a whole before being passed to the function on the left
## <font style="color:DD4EAB">Creating Local Variables Using Let Bindings</font>


```haskell
module Main where

makeGreeting greeting person =
    let message = greeting <> " "
    in message <> person

main = print $ makeGreeting "Hello" "Fiona" -- "Hello Fiona"
```

- `let` var `in` expression
- Let bindings can create multiple local variables

```haskell
module Main where

makeGreeting greeting person =
    let message = greeting <> " "
    in message <> person


extendedGreeting person =
    let goodMorning = makeGreeting "Morning" person
        goodDay = makegreeting "Good evening" person
        goodNight = makeGreeting "Good night" person
    in hello <> " " <> goodDay <> " " <> goodNight


main = print $ extendedGreeting "Fiona
-- "Morning Fiona Good evening Fiona Good night Fiona"
```

- Top level bindings can be defined later in the same let expression

`morningStr = "Morning"`

- Let bindings can be used to define new functions

```haskell
module Main where

makeGreeting greeting person =
    let message = greeting <> " "
    in message <> person

extendedGreeting person =
    let addCR a b = a <> "\n" <> b
        joined = addCR hello goodbye
        hello = makeGreeting "Hello" person
        goodbye = makeGreeting "Goodbye" person
    in joined

main = putStrLn $ extendedGreeting "Fiona"
-- Hello Fiona
-- Goodbye Fiona
```

- Haskell support _recursive bindings_, items inside of let bindings can refer to one another
- Let bindings can be nested and can define intermediate values and functions

```haskell
module Main where

makeGreeting greeting person =
    let message = greeting <> " "
    in message <> person

extendedGreeting person =
    let addCR a b = a <> "\n" <> b
        helloGoodbye hello goodbye =
            let hello' = makeGreeting hello person
                goodbye' = makeGreeting goodbye person
            in addCR hello' goodbye'
        in helloGoodbye "Hello" "Goodbye"

main = putStrLn $ extendedGreeting "Fiona"

```

- _where binding_ follows the same rules as let bindings, but is added to the end
- Any parameters bound to a variable name in a function is available to a where binding, where as not a everything you've defined in let binding 
- Anything defined inside where bindings are available to let bindings

```haskell
module Main where

letLocation name place =
    let
        greeting = "Hello " <> name
        meetingInfo = location "Friday"
    in greeting <> " " <> meetingInfo
    where
        location day = "we met at " <> place <> " on a " <> day

main = print $ letLocation "Fiona" "Balsacs"
-- "Hello Fiona we met at Balsacs on a Friday"
```

- `location` variable `where` clause can access the `place` parameter function, but does not have to explicitly pass in `day` since it does not have access to variable inside `let` binging
- The choice of `let` and `where` bindings is a personal preference
	- `let` bindings are for intermediate values and `where` bindings for ancillary and helper function

## <font style="color:DD4EAB">Running Code Conditionally Using Branches</font>

- `if` expression return one value if a predicate is true
- In Haskell, `if` structures are expressions
	- There must be a true and false branch for every expression
	- Similar to the ternary operator

```haskell
printSmall num =
    if num < 10
    then print num
    else print "number is larger than 10"

main = printSmall 5 -- 5
```

- If expressions always return a value
- Both `then` and `else` clauses of the branch must return the _same type_

```haskell
module Main where

printSmall num =
    let msg = if num < 10
        then show num
        else "number is larger than 10"
    in print msg

main = printSmall 5 -- "5"
```

- Nest `if` expressions

```haskell
module Main where

sizeNum num =
    if num < 3
    then "smaller than 3"
    else
        if num < 10
        then "smaller than 10"
        else "larger than 10"

main = print $ sizeNum 11 -- "larger than 10"
```

- Guard clauses are similar to case statements
	- `fncName arg 1 arg2
		`predicate1 = body1`
		`predicate2 = body2`
			`. . . `
		`otherwise = bodyT`

- `otherwise` is an ordinary value defined from the standard library, always True
- Predicates are evaluated from top to bottom

```haskell
module Main where

wordNum num
    | num == 1 = "one"
    | num == 2 = "two"
    | num == 3 = "three"
    | num == 4 = "four"
    | num == 5 = "five"
    | otherwise = "NaN"


main = print $ wordNum 3 -- "three"
```

- `let` expression are only scoped for the particular branch
- `where` clauses can be used for all branches

```haskell
module Main where

guardSize num
    | num > 0 =
        let size = "positive"
        in exclaim size
    | num < 3 = exclaim "small"
    | num < 100 = exclaim "medium"
    | otherwise = exclaim "large"
    where
        exclaim message = "that's a " <> message <> " number!"

main = print $ guardSize 75 -- "that's a positive number"
```

- `size` variable is only defined inside the first branch, `exclaim` is defined in where clause and is available in all the branches

## <font style="color:DD4EAB">Looping</font>

- `rem` function returns the remainder after dividing two numbers
- Cannot translate _mutable_ and _update_ from procedural algorithms
- _Referential transparency_, refers to the property of expression in a program where any expression can be replaced with its corresponding value without changing the behaviour of the program

- Problem Statement: FizzBuzz
	- Multiples of 3, print “Fizz”
	- Multiples of 5, print “Buzz”
	- Multiples of both 3 and 5, print “FizzBuzz”


```haskell
-- NativeFizzBuzz Code
```


- Fibonacci Numbers

```haskell
module Main where

fib 0 = 0 -- base case
fib 1 = 1 -- base case
fib n = fib (n -1) + fib (n - 1)

-- prints first 11 Fib numbers
main = print $ map fib [0..11] -- [0,1,1,2,3,5,8,13,21,34,55,89]
```

- Map

```haskell
add x y = x + y
main = print (map (add 3)[1, 2, 3])
```

`curry`: Converts a function that takes a tuple into a curried function

`uncurry`: Converts a curried function into a function that takes a tuple

```haskell
main = do
  let f = uncurry (+)  -- Uncurried version of addition
  print (f (3, 4))     -- Outputs 7

  let g = curry (\(x, y) -> x * y) -- Curried version of multiplication
  print (g 3 4)        -- Outputs 12
```

- `\` defines lambda expression, which are anonymous functions

`\parameter1 parameter2 ... -> expression`


# 2. Working With Lists

- Linked lists are a first class data structure
- Higher-order functions with `map` and `foldr`
- _Pattern matching_, for recursive functions
- Deal with streaming data, generators, and long lists

## <font style="color:DD4EAB">Writing Code Using Lists</font>

- In Haskell, strings are lists of characters
`['H', 'i'] == 'Hi' -- True`

- Concatenate lists with (<>) operator
`[1, 2, 3] <> [4, 5] = [1, 2, 3, 4, 5]`

- Get nth element of a list using (!!)
- List indices start at 0

`words = ["one", "two", "three", "four", "five"]`
`words !! 0` -- "one"

- Lists can have nested lists, but same data type

`nums = [[1, 2, 3], [5, 10], [0]]`
`(nums !! 0) !! 1` -- 2

- Lists are immutable
- The process of adding a new element to the beginning of a list is "cons-ing"
- (:) is used to construct, prepend, an element

`1 : [2, 3]` -- [1,2,3]

- Common for list to be build backwards, and reversed at the end with _cons_ before being returned

`head : tail`

```haskell
ghci> head [1,2,3]
1
ghci> tail [1,2,3]
[2,3]
ghci> tail (tail [1,2,3])
[3]
ghci> tail [1]
[]
ghci> tail []
*** Exception
```

- Both `head` and `tail` functions are _partial functions_
- A _partial function_ is a function that does not work for all possible inputs, and might raise a runtime exception
- Use `null` function, which will check if a list is empty


## <font style="color:DD4EAB">Restructuring Values with Pattern Matching</font>

- Base case of a recursive list is an empty list, []
- Elements are added each step

```haskell
countdown n =
    if n <= 0 then [] -- base case
    else n : countdown (n - 1)

main = print $ countdown 10 -- [10,9,8,7,6,5,4,3,2,1]
```

- Factors

```haskell
factors num =
    factors' num 2
    where
        factors' num fact
            | num == 1 = [] -- base case
            | (num `rem` fact) == 0 = fact : factors' (num `div` fact) fact
            | otherwise = factors' num (fact + 1)

main = print $ factors 81 -- [3,3,3,3]
```

- Common to implement most of the algorithm as a helper function in a `let` or `where` binding
- The top level function `factors` will call the help function, `factors'`

- Deconstructing lists, Parentheses Balance

```haskell
isBalanced s =
    0 == isBalanced' 0 s -- helper function
  where
    isBalanced' count s
      | null s = count
      | head s == '(' = isBalanced' (count + 1) (tail s)
      | head s == ')' = isBalanced' (count - 1) (tail s)
      | otherwise = isBalanced' count (tail s)

main = print $ isBalanced "((1)()(()))" -- True
```

- Custom `reduce` function has a _shape_ of a recursive function

```haskell
reduce func carryValue lst =
    if null lst then carryValue
    else
        let intermediateValue = func carryValue (head lst)
        in reduce func intermediateValue (tail lst)

main = print $ reduce (+) 0 [1, 2, 3, 4, 5]
```

- Added to isBalanced function

```haskell
reduce func carryValue lst =
    if null lst then carryValue
    else
        let intermediateValue = func carryValue (head lst)
        in reduce func intermediateValue (tail lst)

isBalanced str = 0 == reduce checkBalance 0 str
  where
    checkBalance count letter
        | letter == '(' = count + 1
        | letter == ')' = count - 1
        | otherwise = count

main = print $ isBalanced "((()()))" -- True
```

- Factoring out recursion without having to manage recursion itself
- The `reduce` function is implemented in Haskells, `foldl and foldr`
- These functions are called _folds_, and accumulated through a value while recursing through a structure
- Hide default versions to preven a collision

```haskell
module Main where
import Prelude hiding (foldl, foldr)

foldl func carryValue lst =
    if null lst
    then carryValue
    else foldl func (func carryValue (head lst))(tail lst)

foldr func carryValue lst =
    if null lst
    then carryValue
    else func (head lst) $ foldr func carryValue (tail lst)
```

```haskell
ghci> foldl (+) 0 [1,2,3]
6
ghci> foldr (+) 0 [1,2,3]
6
ghci> foldr (-) 0 [1,2,3]
2
ghci> foldl (-) 0 [1,2,3]
-6
ghci> foldl (-) 2 [6,8]
-12
ghci> foldr (-) 2 [6,8]
0
```

- The carryValue is the passed directly into the function as prepended
`foldr (-) 0 [1,2,3]`
	`foldl (-) (0   ) (1 : 2 : 3 : [])`
	`foldl (-) (0 - 1) (   2 : 3 : [])`
	`foldl (-) ((0 - 1) - 2) ( 3 : [])`
	`foldl (-) (((0 - 1) - 2) - 3) ([])`
	- result = -6
`foldr (-) 0 [1,2,3]`
	`foldr (-) 0 (1 : 2 : 3 : [])`
	`1 - foldr (-) 0 ([])`
	`1 - 2 - foldr (-) 0 ([])`
	`1 - 2 - 3 - foldr (-) 0 ([])`
	- `1 - 2 - 3 - 0`
	- result = -1

- `foldl` and `foldr` are left and right associative, respectively
- `foldl` the initial value is applied first at the left-hand side
- `foldr` the initial value is applied last at the right-hand side of the unrolled expression

- Transforming List Elements
```haskell
doubleElems :: [Int] -> [Int]
doubleElems nums =
    if null nums
    then []
    else 
        let
            hd = head nums
            tl = tail nums
        in (2 * hd) : doubleElems tl

main = print $ doubleElems [1,2,3] -- [2,3,4]
```

- `map`function is used to apply a function to all the elements in a list "mapping"

```haskell
ghci> let incr x = x + 1 in map incr [1..5]
[2,3,4,5,6
ghci> map ($ 10) [(+ 1), (* 3), (`div` 5)]
[11,30,2]
```

- Refactored `doubleElems`

```haskell
doubleElems = foldr doubleElem []
    where
        doubleElem num lst = (2 * num) : lst

main = print $ doubleElems [1,2,3] -- [2,4,6]
```

- Refactored `doubleElems` using a multiplication function

```haskell
doubleElems' elems = foldr (applyElem (*2))[] elems
    where
        applyElem f elem acc = f elem : acc


main = print $ doubleElems' [1,2,3] -- [2,4,6]
```

- Refactor again making a new `map'` function

```haskell
map' f = foldr (applyElem f)[]
    where
        applyElem f elem acc = (f elem) : acc

doubleElemMap elems = map' (*2) elems

main = print $ doubleElemMap [1,2,3] -- [2,4,6]
```

- Create a readable map function

```haskell
map' f lst =
    if null lst then []
    else f (head lst) : map' f (tail lst)

main = print $ map' (*2) [1,2,3] -- [2,4,6]
```


- Filtering List Elements

- Folding and mapping allow you to work will all the elements in a list
- `filter` function selects elements from a list
- return `True` values, and discards `False` false

```haskell
ghci> (foldr (+) 0 . filter odd) [0..10]
25
```

- Common to combine functions like `map`, `fold`, and `filter` into a data processing pipeline

```haskell
checkGuestList guestList name =
    name `elem` guestList

foodCosts =
    [
        ("Teddy", 10.00),
        ("Mary", 30.00),
        ("Jones", 25.00)
    ]

partyBudget isAttending =
    foldr (+) 0 . map snd . filter (isAttending . fst)

main = do
    print $ partyBudget (checkGuestList ["Teddy", "Jones"]) foodCosts
    -- 35.0
```

- Explanation

```haskell
partyBudget' =
	foldr (+) 0
	. map snd
	. filter (\name -> fst name `elem` ["Teddy", "Jones"])
	$ [("Teddy", 10.00),("Mary", 30.00),("Jones", 25.00)]
```

- `partyBudget'` is read right-to left
- The filter returns True for names that are elements in the guestList
- filteredNames list is passed to `map snd`, which expands snd to each guest tuple
	- `[snd ("Teddy", 10.00), snd ("Jones", 25.00)]`
	- `[10.00, 25.00]`
- `foldr` add all the prices in the list

- Building List with Comprehensions
- List comprehension provides an alternative syntax for building lists with maps and filters

```haskell
ghci> double = [2 * number | number <- [0..10]]
ghci> double
[0,2,4,6,8,10,12,14,16,18,20]
-- list comprehenion
ghci> doubleOdds = [2 * number | number <- [0..10], odd number]
ghci> doubleOdds
[2,6,10,14,18]
-- data pipeline stype
ghci> doubleOdds' = map (\number -> 2 * number) . filter odd $ [0..10]
ghci> doubleOdds'
[2,6,10,14,18]
```

- `|` are used as pips to separate out an expression

```haskell
pairs as bs =
    let as' = filter (`elem` bs) as
        bs' = filter odd bs
        mkParis a = map (\b -> (a,b)) bs'
    in concat $ map mkParis as'

pairsCom as bs = [(a,b)| a <- as, b <- bs, a `elem` bs, odd b]

main = do
    print $ pairs [1..10][2..5]
    print $ pairsCom [1..10][2..5]
-- both[(2,3),(2,5),(3,3),(3,5),(4,3),(4,5),(5,3),(5,5)]
```

- `partyBudget` with list Comprehension

```haskell
module Main where

type Guest = String
type Food = String
type FoodCost = Int

-- Function to calculate the party budget
partyBudget :: (Guest -> Food -> Bool) -> (Guest -> Bool) -> (Food -> FoodCost) -> [(Guest, [Food])] -> Int
partyBudget willEat isAttending foodCost guests =
    foldl (+) 0 $
    [ foodCost food
    | (guest, foods) <- guests,
      food <- foods,
      willEat guest food,
      isAttending guest
    ]

willEat :: Guest -> Food -> Bool
willEat guest food = food == "Pizza"  -- Example condition: guest eats pizza

isAttending :: Guest -> Bool
isAttending guest = guest /= "John"  -- Example condition: John is not attending

foodCost :: Food -> FoodCost
foodCost food = case food of
    "Pizza" -> 10
    "Burger" -> 8
    "Salad" -> 5
    _ -> 0  -- Default for unknown foods

guests :: [(Guest, [Food])]
guests = [("Alice", ["Pizza", "Salad"]),
          ("Bob", ["Burger", "Pizza"]),
          ("John", ["Pizza", "Salad"])]

main = print $ partyBudget willEat isAttending foodCost guests
```

- How to combine lists

```haskell
ghci> [(num,str) | num <- [1,2,3], str <- ["I","II","III"]]
[(1,"I"),(1,"II"),(1,"III"),(2,"I"),(2,"II"),(2,"III"),(3,"I"),(3,"II"),(3,"III")]
```

- List with explicit recursion
- Use `zip` to combine two lists into a list of tuples, first element comes form the first list and second element comes from the second list

```haskell
ghci> zip [1..5] ["I", "II", "III", "IV", "V"]
[(1,"I"),(2,"II"),(3,"III"),(4,"IV"),(5,"V")]
```


## <font style="color:DD4EAB">Destructuring Values with Pattern Matching</font>

- _Pattern matching_ let expression match based on its shape
- A partial function is one that does not handle all of the possible input values, and a _total function_ is one that does
- `::` declares the type of expression or type signature

```haskell
test :: Bool -> String
test True  = "you are true"
test False = "you are false"

ghci> test True
"you are true"
ghci> test False
"you are false"
```

- Destructuring Lists
	- `->` is a an arrow, args -> return
	- `=>` is a class constraint

```haskell
addValues :: Num a => [a] -> a
addValues [] = 0  -- Base case
addValues (first:rest) = first + (addValues rest)  -- Recursive case

ghci> addValues [1..5]
15
```

- To get the original value that has not been destructed is @
- Replaces the first or second case if it matches, otherwise will use the passed in args

```haskell
modifyPair p@(a,b)
    | a == "hello" = "greeting"
    | b == "Fiona" = "how are you?"
    | otherwise = "New:" <> show p <> "!"

main = do
    print $ modifyPair ("hello","Fiona") -- "greeting"
    print $ modifyPair ("Hi","Fiona") -- "how are you?"
    print $ modifyPair ("bye","Simon") -- "New: (\"bye\",\"Simon\")!"
    putStrLn $ modifyPair ("bye","Simon") -- New: ("bye","Simon")!
```

- A wildcard pattern will match any value, like a variable would, without binding the value to a variable in your function
- `_` is the wildcard variable name

```haskell
import Prelude hiding (fst, snd)

fst (x , _, _) = x
snd (_, x, _) = x
thrd (_, _, x) = x

ghci> map ($(1,2,3)) [fst,snd,thrd]
[1,2,3]
```

- Variables with an underscore prefix, `_tail` showing that it is the tail value but is not a value that is being used

```haskell
printHead [] = "Empty!"
printHead lst@(hd:_tail) =
    "the head of " <> (show lst) <> " is " <> show hd

ghci> printHead []
"Empty!"
ghci> printHead [1,2,3]
"the head of [1,2,3] is 1"
```

- A `case` statement allows you to pattern match on a value inside of your function

```haskell
favFood person =
    case person of
        "Ted" -> "Blueberry"
        "Rob" -> "Burgers"
        "Jenna" -> "Pizza"
        "Jerry" -> "Chocolate"
        name -> name <> " does not have a favourite"
ghci> favFood "Jenna"
"Pizza"
```

- Mixing case statements with guards can allow you to write terse code
- A Terse program consists of lines that each contain two columns
- Avoid non-exhaustive patterns
- `error` function causes your program to fail with runtime error

```haskell

partialF 0 = "only 0"
partialF impossibleValue = error $ 
"I can only use 0, but was called with " <> show impossibleValue

ghci> partialF 0
"only 0"
ghci> partialF 1
"*** Exception: I can only use 0, but was called with 1
CallStack (from HasCallStack):
  error, called at Main.hs:4:28 in main:Main
```

- The only way to get warnings about non-exhaustive patterns is to ask for them by passing `-Wincomplete-patterns` option before compiling in `ghc` or loading in `ghci`
- Use `:set -Wno-incomplete-patterns` to toggle pattern warnings

## <font style="color:DD4EAB">Understanding How Programs Are Evaluated</font>

- Haskell is a _lazy_ language, and uses a form called _call by need_
- Expression will be evaluated when it is needed
- The expression that have not been evaluated are called "thunks"
- Haskell list is either empty of non-empty, containing pair of values: head and tail
- The tail is a _thunk_ that will be computed
- The function below generates a type list called a _stream_, or _generator_
`numbersStartingAt n = n : numbersStartingAt (n + 1)`
`numberStartingAt 0 = 0 : <thunk>`
`0 : numbersStartingAt 1`
`0 : 1 : <thunk>

- This technique looks like _recursion_, but it not the same
- Streams do not count down to a base case, instead they start with a _seed value_ and work their way up
- The term for these functions is _co-recursive_
- Use the `cycle` function from Prelude to create in infinitely repeating list
- `cycle` function creates an infinite list by repeating a given finite list over and over

```haskell
radsToDegrees :: Float -> Int
rads to Degrees rad =
	let degrees = cycle [0..359]
		converted = truncate $ (radians * 360) / (2 * pi)
	in degrees !! converted
```

- `myCycle` Function

```haskell
myCylce input =
	input <> myCycle input
```

- Function infinitely repeats by taking the original list and appending a new infinitely repeating version of it

- Fold and Infinite Lists

```haskell
findFirst predicate =
	foldr findHelper []
	where
		findHelper listElement maybeFound
		| predicate listElement = [listElement]
		| otherwise = maybeFound

ghci> findFirst (> 5) [1..100]
[6]
ghci> findFirst (> 50) (cycle [1..100])
[51]
ghci> findFirst (> 20) [1..10]
Interrupt
-- infinite list/error
```

- Only works with `foldr` and if the function is "sufficiently lazy"

```haskell
findFirst predicate (x:xs) =
	if predicate x
	then [x]
	else findFirst predicate xs
```

## <font style="color:DD4EAB">Hands-On with Infinite Fibonacci Numbers</font>

- The Fibonacci sequence is a series of integers starting with [0,1]
- Calculate each number by adding up the two numbers that came before it

```haskell
fib n
	| n == 0 = 0
	| n == 1 = 01
	| otherwise = (fib $ n - 1) + (fib $ n -2)

fibs = map fib [0..] -- rep. infinite fibs sequence

smallFibs =
	takeWhile (< 100) fibs
```

 - Creating lazy streams

```haskell
fibs = 0 : 1 : helper fibs (tail fibs) -- hard-coding 1 and 2
	where
		helper (a:as) (b:bs) =
			a + b : helper as bs
```

- When `tail fibs` is called it is no longer referring to the original definition of `fibs`
- It is instead referring to the current list that is being stepped through

# 3. Getting Started with Types

- `True` and `False` _inhibit_ the type `Bool`, or they are its _inhabitants_

## <font style="color:DD4EAB">Working with Basic Haskell Types</font>

- Integer
- Int
- Word
- Float
- Double
- Bool
- Char
- String
- List
- Tuple
## <font style="color:DD4EAB">Annotating Values with Type Information</font>

- Type annotations, are also referred to as _type signatures_
- Type annotations come after the name of a top-level function, a let or where binding, or after an expression
- A type annotation starts with two colons `::`

```haskell
pi :: Float
pi = 3.14
-- or
pi = 3.14 :: Float

1 :: Integer -- No name
```

## <font style="color:DD4EAB">Looking Up Type Information</font>

- Use `:type` or `:t` and `:info` or `:i` , to get the type annotation or information respectively in ghci

```haskell
ghci> x = 1 :: Int
ghci> :type x
x :: Int
ghci> : type "Hello"
"Hello" :: [Char]
ghci> :type (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
```


## <font style="color:DD4EAB">Writing Type Annotations for Functions</font>

- Functions in Haskell have types just like non-function values do
- Types of Haskell functions are written using an arrow `->`
`addOne :: Int -> Int`
`addOne n = n + 1`
- The type signature accepts an Int and will return an Int
- Variable n must be an Int
- Taking multiple arguments
`addThree :: Int -> (Int -> (Int -> Int))`
`addThree a b c = a + b + c`
- Functions are be _curried_ automatically
`addThree = \a -> \b -> c -> a + b + c`
- When passing a function as an argument to another function, you will need to use parentheses to capture the type of the function that is being passed

```haskell
increment :: Int -> (Int -> String) -> String
increment num formatter = formatter (num + 1)
```

- Function type annotations can improve in readability that have been n-reduced or are written in pointfree style

```haskell
pointful :: [Int] -> Int -> Int
pointful xs n = foldr (+) 0 xs * n
-- n-reduced
etaReduced :: [Int] -> (Int -> Int) -- left-to-right associative
etaReduced xs = (*) (foldr (+) 0 xs)
-- pointfree
pointfree :: [Int] -> Int -> Int
pointfree x = (*) . foldr (+) 0
```

## <font style="color:DD4EAB">Reading Type Errors</font>

- Haskell errors help refactor code and quickly find problems
- The `it` variable is how ghci refers to your current statement in the REPL
- 


```haskell
ghci> "one" :: Int
<interactive>:1:1: error:
	• No instance for (Data.String.IsString Int)
		arising from the literal ‘"one "’
	• In the expression: "one " :: Int
		In an equation for ‘it’: it = "one " :: Int
```


## <font style="color:DD4EAB">Working with Polymorphic Functions</font>

- A value with a single type is called _monomorphic_
- Monomorphic functions are used when the value types are known, but are restrictive
- More general functions using _polymorphism_
- _Parametric polymorphism_, is the most common sort of polymorphisms
- _Ad hoc polymorphism_

- The standard library function`id` will return any values pass into it unmodified

```haskell
identify :: a -> a -- declares a type variable, a
identity val = val

len :: [a] -> Int
identity :: a -> a
uncurry :: (a -> b -> c) -> (a, b) -> c
```

- `a` scope is limited to each individual type annotation

```haskell
apply :: (a -> b) -> a -> b
apply f val = f val
```

- Both `a` and `b` variables must be the same type, respectively
-  But `a` and `b` don't need to be the same

## <font style="color:DD4EAB">Exploring the Type Space of an Application with Undefined</font>

- Prelude includes the `undefined` function, which has the type `undefined :: a`
- Undefined inhibits all type

```haskell
module Main where
import Data.List (intercalate)

combineStrings :: [[String]] -> String
combineStrings strs =
    let flattened = concat strs
    in intercalate "," flattened


main = do
    print $ combineStrings [["apple","banaba"],["blueberry"]]
    -- "apple,banaba,blueberry"
```

- `intercalate` function from `Data.List` to join the strings together with commas and return overall string


## <font style="color:DD4EAB">Getting Help from Type Holes</font>

- Adding explicit type annotations to `let` and `where` is not common style in real application
- Most Haskell code include explicit type-level annotation for top-level bindings
- But it is also common to leave off the annotations inside of a function body and instead rely on type inference
- Omitting type annotations has substantial benefits, 
	- Do not have to update/refactor
	- Do not have to add annotations for intermediate values
- Drawback
	- The compiler is good at doing type inference and figuring out the type of any particular expression, but no clear to reader
- _Type holes_ solve this problem by making Haskell's type inference system a more interactive
- Create a type hold by replacing any expression with an underscore (\_), or a name that starts with an underscore
- The `_` is used to indicate that the argument is ignored
- The `take` function is used to extract the first n elements from a list

`take :: Int -> [a] -> [a]`

`take 3 [1, 2, 3, 4, 5] -- [1, 2, 3]`

```haskell
holeFunction :: Int -> Int -> Int
holeFunction x _ = x + 1

ghci> holeFunction 5 10 -- 6
```

```haskell
showStringPair :: (String, String) -> String
showStringPair (a,b) = "fst: " <> a <> ", snd: " <> b

doubleField :: a -> (a,a)
doubleField a = (a,a)

showValues :: String
showValues = unlines $ map (showStringPair . doubleField . show) [1..10]

main :: IO ()
main = do
    putStrLn $ showValues

{--
fst: 1, snd: 1
fst: 2, snd: 2
fst: 3, snd: 3
fst: 4, snd: 4
fst: 5, snd: 5
fst: 6, snd: 6
fst: 7, snd: 7
fst: 8, snd: 8
fst: 9, snd: 9
fst: 10, snd: 10 --}
```


- An underscore prefix is used to indicate the variable is intended to be ignored and used for internal purposes only


## <font style="color:DD4EAB">Looking at the Type of main</font>

- There should be a single `main` function that has type `main :: IO ()`
- This is called an _IO action_ to run program and interact with screen or reading a file

```haskell
main :: IO ()
main = print $ "Hello world"
-- alternate
main = do
	print $ "hi"
	print $ "there"
```

# 4. Creating New Types
- Creating your own types let you precisely describe the structure and behaviour of the data in your own application

## <font style="color:DD4EAB">Creating Data Types and records</font>
## <font style="color:DD4EAB">Creating Sum Types</font>
## <font style="color:DD4EAB">Creating Inductively Defined Data Structures</font>
## <font style="color:DD4EAB">Building a Calculator</font>
## <font style="color:DD4EAB">Functions as Values</font>
## <font style="color:DD4EAB">Creating Type Aliases</font>


# 5. Creating and Structuring Haskell Projects

## <font style="color:DD4EAB">Creating Haskell Projects</font>
## <font style="color:DD4EAB">Using Code from Other Modules</font>
## <font style="color:DD4EAB">Creating Your Own Modules</font>
## <font style="color:DD4EAB">Choosing What to Export</font>
## <font style="color:DD4EAB">Documenting Modules</font>

# 6. Types Classes

## <font style="color:DD4EAB">Using Ad Hoc Polymorphism with Type Classes</font>
## <font style="color:DD4EAB">Specifying Type Class Instances with Type Applications</font>
## <font style="color:DD4EAB">Wrapping Types with Newtype</font>
## <font style="color:DD4EAB">Understanding Higher Kinded Types and Polymorphism</font>
## <font style="color:DD4EAB">Deriving Instances</font>
## <font style="color:DD4EAB">Deriving More Things</font>

# 7. Understanding IO

## <font style="color:DD4EAB">Talking About IO</font>
## <font style="color:DD4EAB">Performing IO in a Pure, Lazy Language</font>
## <font style="color:DD4EAB">Ordering and Combining IO Actions</font>
## <font style="color:DD4EAB">Independently Sequencing IO Actions</font>
## <font style="color:DD4EAB">Mapping IO Values with fmap</font>
## <font style="color:DD4EAB">Running IO in Real Application</font>

# 8. Working With The Local System

## <font style="color:DD4EAB">Building Applications with IO</font>
## <font style="color:DD4EAB">Procedural Shell, Functional Core</font>
## <font style="color:DD4EAB">Creating a Pager</font>
## <font style="color:DD4EAB">Viewing the Contents of an ASCII of UTF8 Encoded Text File</font>
## <font style="color:DD4EAB">Viewing Text One Page at a Time</font>
## <font style="color:DD4EAB">Adding a Status Line with Metadata</font>

## <font style="color:DD4EAB">Showing the Status Bar and Refactoring runHCat</font>

# 9. Introducing Monads

## <font style="color:DD4EAB">Mapping Functions</font>
## <font style="color:DD4EAB">Applying Applicatives</font>
## <font style="color:DD4EAB">Working with the Monad Type Class</font>
## <font style="color:DD4EAB">Understanding the Laws of Land</font>
## <font style="color:DD4EAB">Using the Functor Laws</font>
## <font style="color:DD4EAB">Using the Monad Laws</font>
## <font style="color:DD4EAB">Using the Applicative Laws</font>

# 10. Mutable Data In The Real World

## <font style="color:DD4EAB">Using Mutable References in a Pure Langauge</font>
## <font style="color:DD4EAB">Working with IORefs</font>
## <font style="color:DD4EAB">Building a Basic Metric System</font>
## <font style="color:DD4EAB">Dealing with Lazyness and IO</font>

# 11. Serializing Heterogenous Data
## <font style="color:DD4EAB">Heterogenous Data in Haskell</font>
## <font style="color:DD4EAB">A First Pass at a File Archiver</font>
## <font style="color:DD4EAB">Serializing with Type Classes</font>
## <font style="color:DD4EAB">Building a List FileData Values</font>

# 12. Deserializing Heterogenous Data

## <font style="color:DD4EAB">Extracting Heterogenous Values from the Archive</font>
## <font style="color:DD4EAB">Deserialization as Parsing</font>
## <font style="color:DD4EAB">Creating a Parsing Function</font>
## <font style="color:DD4EAB">Building a List of Values</font>
## <font style="color:DD4EAB">Adding a Monad Instance</font>
## <font style="color:DD4EAB">Adding a MonadFail Instance</font>


# 13. Building Applications with Many Effects

## <font style="color:DD4EAB">Revisiting the Parsing Problem</font>
## <font style="color:DD4EAB">Handling Errors in Other Computations</font>
## <font style="color:DD4EAB">State, Transformed</font>
## <font style="color:DD4EAB">Stacking Transformers Effectively</font>
## <font style="color:DD4EAB">Building a File Archiver</font>

# 14. Building Efficient Programs

## <font style="color:DD4EAB">Building a Naive Spellchecker</font>
## <font style="color:DD4EAB">Memoizing editDistance</font>
## <font style="color:DD4EAB">Internal Mutability with ST</font>
## <font style="color:DD4EAB">Optimizing Memory Layout with Vectors</font>
## <font style="color:DD4EAB">The Fastest Edit Dstance</font>

# 15. Programming With Types

## <font style="color:DD4EAB">What Is Type Level Programming</font>
## <font style="color:DD4EAB">Types and Kinds</font>
## <font style="color:DD4EAB">Functions from Types to Types</font>
## <font style="color:DD4EAB">GADTs: Functions from Terms to Types</font>
## <font style="color:DD4EAB">Types Classes: Functions from Types to Terms</font>

