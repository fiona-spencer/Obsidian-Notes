
## <font style="color:#DD4EAB">Introduction</font>

<font style="color:#A8A8A8; text-decoration: underline;">High Availability</font>
<font style="color:#A8A8A8; text-decoration: underline;">High Availability</font>
<font style="color:#A8A8A8; text-decoration: underline;">High Availability</font>
## <font style="color:#DD4EAB">Transcript</font>

```smalltalk
Transcript clear. "clear to transcript window"
Transcript show: 'Hello World'. "output string in transcript window"
Transcript nextPutAll: 'Hello World'. "output string in transcript window"
Transcript nextPut: $A. "output char in transcript window"
Transcript space. "output space char in transcript window"
Transcript tab. "output tab char in transcript window"
Transcript cr. "carriage return/linefeed"
'Hello' printOn: Transcript. "append print string into the window"
'Hello' storeOn: Transcript. "append store string into the window"
Transcript endEntry. "flush the output buffer"
```

## <font style="color:#DD4EAB">Assignment</font>

```smalltalk
| x y | "variable declaration"
x := 5. "assignment"
X := y := z := 6. "compound assignment"
x := (y := 6) + 1.
"x _ 4." "older assignment style"
x := Object new. "bind to allocated instance of a class"
x := 123 class. "discover the object class"
x := Integer superclass. "discover the superclass of a class"
x := Object allInstances. "get an array or all instances of a class"
x := Integer allSuperclasses. "get all superclasses of a class"
x := 1.2 hash. "hash value for object"
x := x copy. "copy object"
x := x shallowCopy. "copy object (not overridden)"
y := x deepCopy. "copry object and instance vars"
y := x veryDeepCopy. "complete tree cpoy using dictionary"

```
## <font style="color:#DD4EAB">Constants</font>

```smalltalk
| b x |
b := true. "true constant"
b := false. "false constant"
x := nil. "nul object constant"
x := 1. "integer constant"
x := 3.14 "float constant"
x := 2e-2. "fractional constant"
x := 16r0F. "hex constant"
x := -1 "negative constant"
x := 'Hello'. "string constant"
x := 'I''m here'. "single quote escape"
x := $A. "character constant"
x := $ . "character constant (space)"
x := #aSymbol. "symbol constant"
x := #(3 2 1). "array constant"
x := #('abc' 2 $a) "array with mixing types"
```


## <font style="color:#DD4EAB">Boolean</font>

```smalltalk
| b x y |
x := 1. y := 2.
b := (x = y). "equals"
b := (x ~= y). "not equals"
b := ( x == y). "identical"
b := (x ~~ y). "not identical"
b := (x > y). "greater than"
b := (x < y). "less than"
b := (x >= y). "greater than or equal"
b := (x <= y). "less than or equal"
b := b not. "boolean not"
b := (x < 5) & (y > 1). "boolean and"
b := (x < 5) | (y > 1). "boolen or"
b : = (x < 5) and: [y > 1]. "boolean and (short-circuit)"
b := (x < 5) or: [y > 1]. "boolean or (short-circuit)"
b := (x < 5) eqv: (y > 1). "test if one true and other false"
b := (x < 5) xor: (y > 1). "test if one true and other false"
b := 5 between: 3 and: 12. "between (inclusive)"
b := 123 isKindOf: Number. "test if object is class or subclass of"
b := 123 isMemberOf: SmallInteger. "test if object is type of class"
b := 123 respondsTo: sqrt. "test if object responds to message"
b := x isNil. "test if object is nil"
b := x isZero. "test if object is zero"
b := x positive. "test if object is positive"
b := x strictlyPositive. "test if number is greater than zero"
b := x negative. "test if number is negative"
b := x even. "test if number is even"
b := x odd. "test if number is odd"
b := x isLiteral. "test if literal constant"
b := x isInteger. "test if object is integer"
b := x isFloat. "test if object is float"
b := x isNumber. "test if object is number"
b := $A isUppercase. "test if upper case char"
b := $a isLowercase. "test if lower case char"
```

## <font style="color:#DD4EAB">Arithmetic Expressions</font>

```smalltalk
| x |
x := 6 + 3. "addition"
x := 6 -3. "subtraction"
x := 6 * 3. "multiplication"
x := 1 + 2 * 3. "division (always left to right)"
x := 5 / 3. "divison fractional result"
x := 5.0 / 3.0. "division with float result"
x := 5.0 // 3.0. "integer divide"
x := 5.0 \\ 3.0. "integer remainder"
x := -5. "unary minus"
x := 5 sign. "numeric sign (1, -1, or 0)"
x := 5 negated. "negate receiver"
x := 1.2 integerPart. "integer part of number (1.0)"
x := 1.2 fractionPart. "fractional part of a number (0.2)"
x := 5 reciprocal. "recirocal function"
x := 6 * 3.2. "auto convert to float"
x := 5 squared. "square function"
x := 25 sqrt. "square root"
x := 5 raisedTo: 2. "power function"
x := r raisedToInteger: 2. "power function with integer"
x := 5 exp. "exponential"
x := -5 abs. "absolute value"
x := 3.99 rounded. "round"
x := 3.99 truncated "truncate"
x := 3.99 roundTo: 1. "round to specified decimal places"
x := 3.99 truncateTo: 1. "truncate to specified decimal places"
x := 3.99 floor. "truncate"
x := 3.99 ceiling "rount up"
x := 5 factorial "factorial"
x := -5 quo: 3. "integer divide rounded toward zero"
x := -5 rem: 3. "integer remainer rounded toward zero"
x := 28 gcd: 3. "greatest common denominator"
x := 28 lcd: 12. "least common multiple"
x := 100 ln. "natural logarithm"
x := 100 log. "base 10 logarithm"
x := 100 log: 10. "logarithm with specified base"
x := 100 floorLog: 10. "floor of the log"
x := 100 degreesToRadians. "convert degrees to radians"
x := 3.14 radiansToDegrees. "convert radians to degrees"
x := 0.7 sin. "sine"
x := 0.7 cos. "cosine"
x := 0.7 tan. "tangent"
x := 0.7 arcSin. "arcsine"
x := 0.7 arcCos. "arcosine"
x := 0.7 arcTan. "arctangent"
x := 10 max: 20. "get max of two numbers"
x := 10 min: 20. "get min of two numbers"
x := Float pi. "pi"
x := Float e. "exp constant"
x := Float infinity. "infinity"
x := Float nan. "non-a-number"
x := Random new next; yourself. x next. "random number stream (0.0 to 1.0)"
x := 100 atRandom. "quick random number"
```


## <font style="color:#DD4EAB">Bitwise Manipulation</font>

```smalltalk
| b x |
x := 16rFF bitAnd: 16r0F. "and bits"
x := 16rF0 bitOr: 16r0F. "or bits"
x := 16rFF bitXor: 16r0F. "xor bits"
x := 16rFF bit Invert. "invert bits"
x := 16r01 bitShift: 4. "left shift"
x := 16r10 bitShift: -4. "right shift"
x := 16r80 bitAt: 7. "bit at position (0|1)"
x := 16r80 highbit. "position of highest bit set"
b := 16rFF allMask: 16r0F. "test if all bits set in mask set in receiver"
b := 16rFF anyMask: 16r0F. "test if any bits set in mask set in receiver"
b := 16rFF noMask: 16r0F. "test if all bits set in mask clear in receiver"
```


## <font style="color:#DD4EAB">Conversion</font>

```smalltalk
| x |
x := 3.99 asInteger. "convert number to integer (truncates)"
x := 3.99 asFraction. "convert number to fraction"
x := 3 asFloat. "convert number into float"
x := 65 asCharacter "convert integer to character"
x := $A asciiValue. "convert character to integer"
x := 3.99 printString. "convert object to string via printOn:"
x := 3.99 storeString. "convert object to string via storeOn:"
x := 15 radix: 16. "convert to string in given base"
x := 15 printStringBase: 16.
x := 15 storeStringBase: 16.
```


## <font style="color:#DD4EAB">Block</font>
## <font style="color:#DD4EAB">Method Calls</font>
## <font style="color:#DD4EAB">Conditional Experssions</font>
## <font style="color:#DD4EAB">Iteration Statements</font>
## <font style="color:#DD4EAB">Character</font>

```smalltalk
| b x y |
x := $A. "character assignment"
y := x isLowercase. "test if lower case"
y := x isUppercase. "test if upper case"
y := x isLetter. "test if letter"
y := x isDigit. "test if digit"
y := x isAlphaNumeric. "test if alphanumeric"
y := x isSeparator. "test if separator char"
y := x isVowel. "test if vowel"
y := x digitValue. "convert to number digit value"
y := x asLowercase. "convert to lower case"
y := x asUppercase. "convert to upper case"
y := x asciiValue. "convert to numeric ascii value"
y := x asString. "convert to string"
b := $A <= $B. "comparison"
y := $A max: $B.
```


## <font style="color:#DD4EAB">Symbol</font>
## <font style="color:#DD4EAB">String</font>
## <font style="color:#DD4EAB">Array</font>
## <font style="color:#DD4EAB">OrderedCollection</font>
## <font style="color:#DD4EAB">SortedCollection</font>
## <font style="color:#DD4EAB">Bag</font>
## <font style="color:#DD4EAB">Sets</font>
## <font style="color:#DD4EAB">Interval</font>
## <font style="color:#DD4EAB">Associations</font>
## <font style="color:#DD4EAB">Dictionaries</font>
## <font style="color:#DD4EAB">Internal Stream</font>
## <font style="color:#DD4EAB">File Stream</font>
## <font style="color:#DD4EAB">Date</font>
## <font style="color:#DD4EAB">Time</font>
## <font style="color:#DD4EAB">Point</font>
## <font style="color:#DD4EAB">Rectangle</font>
## <font style="color:#DD4EAB">Dynamic Message Calling/Compiling</font>
## <font style="color:#DD4EAB">class/meta-class</font>
## <font style="color:#DD4EAB">Debugging</font>
## <font style="color:#DD4EAB">Misc.</font>
