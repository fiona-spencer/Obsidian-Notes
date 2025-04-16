- [x] [[Principle of Computer Architecture#^b406a8|1. Introduction]]
- [x] [[Principle of Computer Architecture#^5460fa|2. Data Representation]]
- [ ] [[Principle of Computer Architecture#^a1be68 |3. Arithmetic]]
- [ ] [[Principle of Computer Architecture#^5c19a8|4. The Instruction Set Architecture]]
- [ ] [[Principle of Computer Architecture#^6a87bc|5. Language and the Machine]]
- [ ] [[Principle of Computer Architecture#^a5412b|6. Data and Control]]
- [ ] [[Principle of Computer Architecture#^3a11ec|7. Memory]]
- [ ] [[Principle of Computer Architecture#^9d4604|8. Input and Output]]
- [ ] [[Principle of Computer Architecture#^15b6e6|9. Communication]]
- [ ] [[Principle of Computer Architecture#^acc722|10. Trends In Computer Architecture]]

## 1. <font style="color:#0DA2FF">Introduction</font>  
^b406a8

1. <font style="color:#A8A8A8; text-decoration: underline;">Overview</font>  
- Computer architecture is the functional behaviour of a computer system viewed by a programmer
	- Sizes of data types
	- Types of operations
- Computer organization is the structural relationship of a computer
	- Interfaces to peripheral devies
	- Clock frequency
	- Memory
- _Architecture_ refers to both architecture and organization



1.2 <font style="color:#A8A8A8; text-decoration: underline;">A Brief History</font>  
- Blaise Pascal (1623 - 1662) developed a mechanical calculator, "Pascaline"
- Charles Babbage (1791 -1871) referred to as the _grandfather_ of the computer
- Babbage's machines had a mean for reading input data, storing data, and performing calculations, producing output data, and automatically controlling the operating of the machine
	- Difference engine, evaluated polynomials using the method of finite difference
	- Analytical engine; more sophisticated branching (decision making)
	- Jacquard pattern-weaving loom (punch cards)
	- Never built during his time
- ENIGMA; a machine that Germany used to encrypt messages in WWII
- Colossus was a successful codebreaking machine
	- Vacuum tubes store the contents of a paper tape fed into the machine, and computations take place among vacuum tubes and fed to a secondary tape
	- Programming is performed with plugboards
- ENIAC (Electronic Numerical Integrator and Computer)
	- Ballistic trajectory for the US Army
	- Programming and data entry are performed by setting switches and changing cables
	- No central memory unity
- EDVAC
	- Design of a stored program computer
	- After ENIAC, Eckert and Mauchly, joined John von Neuman
	- Working model was designed, EDSAC (1947)

1.3 <font style="color:#A8A8A8; text-decoration: underline;">The Von Neumann Model</font>  
- The von Neumann model consists of five major components
	1) Input unit
	2) Memory unit
	3) Arithmetic and Logic unit (ALU)
	4) Control unit
	5) Output unit
- Referred to collectively as the _central processing unit (CPU)_

![[Pasted image 20250202120201.png]]
- Most commercial computers have these 5 basic units
- The program is stored i the computer's memory along with the data to be processed
- Program could be manipulated as if it is data
- This gave rise to compilers and operating systems

1.3 <font style="color:#A8A8A8; text-decoration: underline;">The System Bus Model</font>  
- Von Neumann model has been streamlined into the system bus model that partitions a computer system into 3 sub-units: CPU, memory, and I/O

![[Pasted image 20250202120548.png|600]]

- Components are shared by the system bus, which has the data, address, and control bus
- There is also a power bus for electrical power to the components
- Buses are made up a collection of wire that are grouped by function
- A 32-bit data bus has 32 individual wires, each wire carries one bit of data
- Some systems have separate data buses to and from the CPU (data-in and data-out bus)
- A single data bus moves data in either direction
- Buses shared among communication entities have distinguished identifies known as addresses
- A memory address identifies a memory location where data is stored
- During a memory read or write operation the address bus contains the address of the memory

1.5 <font style="color:#A8A8A8; text-decoration: underline;">Levels of Machines</font>  
- Highest level => user
- Lowest level => transistors
- Separation of levels has been exploited in the development of upward-compatible machines

_UPWARD COMPATIBILITY_
- Each new computer model has a new architecture, and the old software could not run on the new hardware
- IBM created the concept of a "family of machines" with its 360 series
- More capable machines in the same family could run programs written for less capable machines without modification to those programs
- Upward compatibility allows a user to upgrade to a faster, more capable machine without rewriting the software

_THE LEVELS_
- As level goes down, it becomes "less" abstract and more of the internal structure of the computer

![[Pasted image 20250202122315.png|500]]

_Use or Application-Program Level_
- Interacts with the computer by running programs
	- Word processors
	- Spreadsheet
	- Internet
	- Games

_High Level Language Level_
- Programmer sees only the language
- The compiler maps the data types and instructions from the high-level language to the actual computer hardware
- Programs written in high-level language can be re-compiled for various machines (source code compatibility)

_Assembly Language/Machine Code Level_
- Compiler translates the source code to actual machines instructions (machine language/code)
- Machines design deals with hardware issues such as registers and the transfer of data
- The collection of machine instructions for a given machines is the _instruction set_
- Actual machine code is _machine binary code_
- One of the first computer programs written was the _assembler_, which translates language mnemonics `MOVE Data, Acc`, into corresponding machine language
- This language is known as _assembly language_
- Machine code running on the 360 Model 35 would run unchanged on the 360 Model 50 ("binary compatibility")

_The Control Level_
- The control unit effects the register transfer by control signals that transfer the data from register to register, through logic circuitry
- The control unit interprets the machine instructions one by one, performing a register instruction
- Hardwired control units have the advantage of speed and component count, although recently it has been harder to design and improve efficiency
- A slower, but simpler approach is to implement the instruction as a microprogram
- A microprogram is a small program written in a lower-language, and implemented in the hardware to interpret machine-language instruction
- Microprogram is referred to as _firmware_ because is it both hardware and software
- Firmware is executed by a microcontroller, which executes the actual microinstructions

_Functional Unit Level_
- Register transfer and other operations by the control unit move data in an out of "functional units"
- Functional units include internal CPU registers, ALU, and computer's main memory

_Logic Gates, Transistors, and Wires_
- The lowest level is visible at the logic gate and transistor level
- Transistors create logic gates, and logic gates create functional units

Interaction Between Levels
- The floating point instructions are trapped prior to execution and replaced with a sequence of machine language instructions that emulate the floating point instruction using existing integer instruction
	- Microprocessors that use optional floating point coprocessors
- An emulator is a software that allows one computer to behave like another system
- Enables running applications or entire operating systems that were originally designed for different hardware of software environments
	- VirtualBox
	- Apple Computer (Motorola PowerPc > Motorola 68000)

-> The Programmer's View -- The Instruction Set Architecture
- Assembly programmers are concerned with the assembly language and functional units of the machine
- This collection of instruction set and functional units is the instruction set architecture (ISA) of the machine

-> The Computer Architect's View
- The design proposed by the computer architect must meet the performance goals while staying within the cost contraints
	- Speed of program execution
	- Storage capacity of the machines


1.6 <font style="color:#A8A8A8; text-decoration: underline;">A Typical Computer System</font>  
- A keyboard and mouse are input units
- A video monitor is the output unit
- The ALU and control unit are combined into a single microprocessor that serves as the CPU
- The memory consists of individual memory circuits, and also a hard disk unit, a diskette unit, and a CD-ROM device
- The machine is contained on a single motherboard
- Motherboard contains integrated circuits (IC), plug-in expansion card slots, and the tires that interconnect the ICs and expansion card slots

1.8 <font style="color:#A8A8A8; text-decoration: underline;">Case Study: What Happened To Supercomputers?</font>  
- The price-to-performance ration for desktop computers is favourable due to low costs achieved through mass market sales, compared to supercomputers
- Powerful computers are a used in industrial sectors, such as petroleum, chemistry, medicine, aeronautical, automotive, engineering, governments, and national laboratories
- Moore's law states that the number of transistors on a microchips doubles about every two years, making computers faster and more powerful over time
- Microprocessor designers use storage hierarchies, pipelining, multiple functional units, multiprocessing, out-of-order execution, branch prediction, SIMD processing, speculative, and predicated execution to maximum processing power
- Much of processing performance came from simple speedup of processor clocks and quantitative increase in processor resource some semiconductor technology

## 2. <font style="color:#0DA2FF">Data Representation</font>  
^5460fa

2.1. <font style="color:#A8A8A8; text-decoration: underline;">Introduction</font> 
- Data representation/data encoding refers to the way data is stored, processed, and transmitted in a computer
- Images, auto, mouse clicks must all be encoded in a systematic, agreed-upon manner
- Important encodings
	- Signed and unsigned fixed point numbers
	- Real numbers (floating point numbers)
	- Printing characters
- A crucial issues is deciding how much storage is devoted to each data value
- Some numbers can be too large to represent using 32-bits
- The operand may fit into 32 bits, but the result may not creating an overflow condition

2.2 <font style="color:#A8A8A8; text-decoration: underline;">Fixed Point Number</font>  
- Each number has exactly the same number of digits
	- `0.23` has 3 digits and the decimal point is located two places from the right
- When fixed point numbers are represented in the computer the binary point is not stored anywhere
- Binary point does not exist

   1. <font style="color:#A8A8A8; text-decoration: underline;">Range and Precision in Fixed Point Numbers</font>  
- A fixed point representation is the range and precision of a number
- For a 3 digit and the decimal place 2 from the right `x.xx` the range is from `0.00` to `9.99` inclusive of the endpoints, `[0.00, 9.99]`
- The precision is `.01` and the error is $1/2$ of the difference between the two "adjoining numbers", such as $5.02 - 5.01=0.01/2=0.005$
- We can represent any number within the range `0.00 to 9.99` to within `0.005` of its true or precise value
- With no decimal the range is `[000,999]` and the precision is `1.0`
- With the decimal to the left the range is `[.000, .999]` and a precision of `0.001`
- In either case, there are only $10^3$ different decimal objects ranging from 000 to 999
- And there for 1,000 different items
- Range and precision are important issues in computer architecture because both are finite

   2. <font style="color:#A8A8A8; text-decoration: underline;">The Associative Law of Algebra Does Not Always Hold in Computers</font>  
- Associative law
$a + (b + c)=(a + b) + c$
- Associative law of algebra does not hold for fixed point numbers having a finite representation
- An intermediate number can be outside the range causing an over flow
	- [-9, 9]
	- $(7 + 3)=11$, where 11 is past 9
- The associative law of algebra does not hold for finite-length fixed point numbers
- When an overflow occurs, it is either terminated of notified

   3. <font style="color:#A8A8A8; text-decoration: underline;">Radix Number Systems</font>  
	- base 2 (binary)
	- base 8 (octal)
	- base 16 (hexadecimal)
- The base, or radix of a number system defines the range of possible values that a digit may have
- base 10 (decimal) number system has digits [0 to 9]
- base 2 [0,1]
- The general form for determining the decimal value of a number in the radix $k$ fixed point number system
$$value=\sum_{i=-m}^{n-1}b_ik^i$$
- The value of the digit in position $i$ is given by $b_i$
- There are n digits to the left of the radix point and there are m digits to the right
- This form of a number is the _weighted position_
	- $(541.25)_{10}$, $n=3,m=2, k=10$ 
	- $5(10^2)+4(10^1)+(10^0)+2(10^{-1})+5(10^{-2})$
	- $=(500)_{10}+(40)_{10}+(1)_{10}+(2/10)_{10}+(5/100)_{10}$
	- $= (541.25)_{10}$
- For the base 2 number $(1010.01)_2, n=4, m= 2, k=2$
	- $1(2^3)+0(2^2)+0(2^1)+1(2^0)+0(2^{-1})+1(2^{-2})$
	- $=(8)_{10}+(0)_{10}+(2)_{10}+(0)_{10}+(0/2)_{10}+(1/4)_{10}$
	- $(10.25)_{10}$
- The _polynomial method_ shows how to convert a number from an arbitrary base into a base 10 number
- Each digit is multiplied by the weight assigned to its position and the summed
- The bit that carries the most weight is the most significant bit (MSB) and the bit that has the least weight is the least significant bit (LSB)
- Conventionally the MSB is the left, and LSB is the rightmost bit

   4. <font style="color:#A8A8A8; text-decoration: underline;">Conversions Among Radices</font>  
- $(23.375)_{10} = (23)_{10} + (.375)_{10}$

- A general polynomial form for representing a binary integer is:
$b(2^i)+b_{i-1}(2^{i-1})+...+b_1(2^1)+b_0(2^0)$
- If divided by 2, then
$b(2^{i-1})+b_{i-1}(2^{i-2})+...+b_1(2^0), remander=b_0$

- By dividing an integer by 2, the result if the fist binary coefficient $b_0$
- Repeat this process on the remaining polynomial to determine the value of $b1$
- This process forms the basis of the remainder method of converting integers between bases

_Convert Fixed Point Number to Binary - The Remainder Method_
$(23)_{10}$ to base 2

```math
Integer Remainder

23/2 = 11 1
11/2 = 5  1
5/2 = 2   1
2/2 = 1   0
1/2 = 0   1
```
- Therefore, $(23)_{10}=(10111)_2$

- A binary fraction is represented in the general form
$b_{-1}(2^{-1})+b_{-2}(2^{-2})+b_{-3}(2^{-3})+...$
- If multiplied by 2, then:
$b_{-1}+b_{-2}(2^{-1})+b_{-3}(2^{-2})+...$

_Converting the Fractional Part of a Fixed Point Number - The Multiplication Method_
$(.375)_{10}$ to base 2

```math
.375 x 2 =  0.75
.75 x 2 =   1.5
.5 x 2 =    1.0
```
- Therefore, $(.375)_{10}=(.011)_2$

- Combine the integer and fractional portions of the number
- $(23.375)_{10}=(10111.011)_2$

_Non Terminating Fractions_
- Some precision is lost for non terminating base 10 fraction converted to base 2 form
- $(0.2)_{10}$ to base 2 repeats ad infinitum
- Any non-repeating base 2 fraction can be represented as $i/2^k$ for some integer $i$ and $k$
 $i/2^k= i(5^k)/(2^k5^k)=i(5^k)/10^k = j/10^k$, where $j=i5^k$

- Most computer use base 2 for internal representation and arithmetic
- Although some calculators and business computers use base 10

![[Pasted image 20250203103349.png|400]]

- In general, $k$ bits are needed to represent each digit in base $2^k$, in which $k$ os an integer
- $2^3=8$ uses three bits and base $2^4=16$ uses four bits
- Convert base 2 into base 8
- Split binary into groups of three, and convert each triple to the octal equivalent
$(10110)_2=(010)_2(110)_2=(2)_8(6)_8=(26)_8$
- Converting to base 16, split into groups of 4
$(10110110)_2=(1011)_2(0110)_2=(B)_{16}(6)_{16}=(B6)_16$

- To help perform unnatural conversions, convert to base 10 as an intermediate step

   5. <font style="color:#A8A8A8; text-decoration: underline;">An Early Look at Computer Arithmetic</font>  
- Binary addition is similar to decimal addition
- A and B are added from right to left, creating a sum and a carry in each bit position

![[Pasted image 20250203104252.png|500]]

- The largest number that can be represented using the 8-bit format is $(1111 1111)_2=(255)_{10}$
- Smallest number is $(00000000)_2=(0)_{10}$
- The bit patterns represent a closed interval from [0, 255]
- Although this is only positive numbers
- To represent signed numbers half of the bit patterns is assigned to positive and the other half negative

   6. <font style="color:#A8A8A8; text-decoration: underline;">Signed Fixed Point Number</font>  
- 4 different ways of representing signed numbers that are used
	- Sign-magnitude
	- One's complement
	- Two's complement
	- Excess notation

![[Pasted image 20250203104638.png|500]]

- The signed magnitudes (also referred to as sign and magnitude) represents a positive or negative number
- In base 10, a plus or minus (+/-) is to the left of the number
- In binary, a 0 or 1 at the left most bit represents a positive and negative
$(+12)_{10}=(00001100)_2$
$(-12)_{10}=(10001100)_2$

- There are both positive and negative representations for zero: $(0000)$ and $(1000)$
- For 8 bits, $2^8=256$ possible patterns, although $2^8-1=255$ different numbers can be represented since +0 and -0 are the same

_One's Complement_
- Convert all the 1's to 0's, and 0's to 1's
$(+12)_{10}=(00001100)_2$
$(-12)_{10}=(11110011)_2$

- One's complement is not commonly used
- There are two different representations of 0

_Two's Complement_
- Flip the bits, and add 1
- If the addition results in a carry-out from the most significant bit of the number, discard the carry-out
- Only one representation of 0
$(+0)_{10}=(-0)_{10}=(00000000)_2$

- (00001100) → (11110011) → (11110100) 
$(+12)_{10}=(00001100)_2$
$(-12)_{10}=(11110100)_2$

- Range: [-128, +127]
- +128 cannot be represented since the carry-out converts into into a negative
![[Pasted image 20250203110055.png|250]]
- Two's complement is most commonly used

_Excess Representation_
- Excess or biased representation, the number is treaded as unsigned, but is shifted in value by subtracting the bias from it
- Assign the smallest numerical bit pattern, all zeros, to the negative of the bias, and assign the remaining numbers in sequence as the bit patterns increase in magnitude
- A number is represented as the sum of is two's complement from and another number ("excess")
- To convert $(+12)_{10}$ and $(-12)_{10}$ in an 8-bit format using 128 representation
$(128 + 12 = 140)_{10}=(10001100)_2$
$(128 - 12 = 116)_{10}=(01110100)_2$

- There is only one excess representation for 0
- Excess value has the same bit pattern as the largest negative number, making the numbers appear in numerically sorted order
$(+128)_{10}=(00000000)_2$
$(-127)_{10}=(11111111)_2$

- This is important for representing the exponents of floating point numbers, in which exponents of two number are compared in order to make them equal for addition and subtraction

   7. <font style="color:#A8A8A8; text-decoration: underline;">Binary Coded Decimal</font>  
- Numbers can be represented in the base 10 while still using a binary encoding
- Each 10 digit occupies four bit positions, known as binary corded decimal (BCD)
- Each BCD digit can take on any of 10 values
- There are $2^4=16$ possible bit patterns, therefore 6 bit patterns are unused for each digit

![[Pasted image 20250203111151.png|600]]
- The BCD format is commonly used in calculators and in business applications
- Fewer problems in representing terminating base 10 fractions
- No need to convert data
- In nine's complement, positive numbers are represented as in ordinary BCD, but the left most digit is less than 5 for positive numbers and is 5 or greater for negative numbers
- The nine's complement negative is $(9698)_{10}=(-301)_{10}$, which is obtained by subtracting each digit in $0301$ from 9

- The ten's complement negative is formed by adding 1 to the nine's complement negative, $-301$ is the $9698 + 1=9699$
- The range for ten's complement is [0, 4999] for negative and [5000, 9999] for positive


2.3 <font style="color:#A8A8A8; text-decoration: underline;">Floating Point Numbers</font>  
- Hardware and storage is needs to manipulate numbers with 80 or more bits of precisions
- Fine precision, is generally not needed when large numbers are used
- Large numbers do not generally need to be represented when calculations are made with small number

   1. <font style="color:#A8A8A8; text-decoration: underline;">Range and Precision In Floating Point Numbers</font>  
- A floating point representation allows a large range of expressible number to be represented in a small number of digits by separating the digits used for precision from the digits used for range
$+6.023(10^{23})$
- Range is a power of $10^{23}$
- Precision is $6.023$
- A fixed point is often referred to as the _mantissa_ or _significand_
- Floating point
	- Sign
	- Exponent
	- Significand

![[Pasted image 20250203113020.png|300]]
- If greater range is needed, the exponent can use 3 digits, and the significand reduced to 3
- Although precision is lost, the number of digits for representation remains the same
- An alternative method of increasing the range is to increase the base
- The range/precision trade-off is a major advantage of using floating point representation

   2. <font style="color:#A8A8A8; text-decoration: underline;">Normalization, and The Hidden Bit</font>  
- Floating point numbers can be represented in different ways, which makes comparisons and arithmetic operations difficult
$3584.1(10^0)=3.5841(10^3)=.35841(10^4)$

- To avoid multiple representation, floating point are maintained in _normalized_ form
- The radix point is shifted to the left most of the digits $(.xxxx)$
- The normalization condition is that there is a leading "1" in the mantissa
- The "1" is not stored and is packed and unpacked
- This results in having an additional bit of precision on the right of the number, due to removing the bit on the left
- The missing bit is referred to as the hidden bit (hidden 1)
	- Mantissa: $.11010$
	- the bit pattern is stored at 1010, left-most bit is truncated, or hidden
	- IEEE 754 floating point uses a hidden bit

   3. <font style="color:#A8A8A8; text-decoration: underline;">Representing Floating Point Numbers in the Computer – Preliminaries</font>  
- We can represent the significand in signed magnitude format, with a single bit for the sign bit, and three hexadecimal digits for the magnitude
- The exponent will be a 3-bit excess-4 numbers, with a radix of 16

![[Pasted image 20250203121951.png|400]]
- Represent $(358)_{10}$ in this format
- First step is to convert the fixed point number from its original base into a fixed point number in the target base

```math
358/16 = 22 6
22/16 =  1  6
1/16 =   0  1
```
- Therefore, $(358)_{10}=(166)_{16}$
- Next is to convert the fixed point number into a floating point number
$(166)_{16}=(166.)_{16}(16^0)$

- Normalize the number
$(166)_{16}=(.166)_{16}(16^3)$

- Finally, fill in the bit fields of the number
- The number is positive, therefore the sign is 0
- the exponent is 3, but can be represent in excess 4
$3+4=7$ in base 10, then $(7)_10=(111)_2$
![[Pasted image 20250203122610.png|300]]

- Each of the base 16 digits is represent in binary
	- 1 = 0001
	- 6 = 0110
	- 6 = 0110

![[Pasted image 20250203122711.png|500]]
- Therefore, $(358)_{10}=(0111000101100110)_2$

- We use an excess of 4 exponent instead of two's complement or a signed magnitude exponent simplifies addition and subtraction of floating point numbers
- To add or subtract two normalized floating point numbers, the smaller exponent must first be increased to the larger exponent
- On order to determine which exponent is larger, treat the bit pattern as unsigned numbers and compare
- Using an excess 4 representation, the smallest exponent is $(-4)_{10}=(000)_2$, and largest $(+3)_{10}=(111)_2$,

$(0111000101100110)_2$
- The sign bit is 0
- Exponent in unsigned form is $(7)_{10}=(111)_2$
	- $(+7 - 4 = +3)_{10}$
	- Removing the excess 4, the exponent is 3
- Grouping the four-bit hexadecimal digits we get $(.166)_{16}$
- Therefore, $(+.166 (16^3))_{16}=(358)_{10}$

- If only 10 bits are allowed instead of 12 for the fraction, the last 2 bits are truncated
![[Pasted image 20250203123708.png|500]]

- The missing bits are treated as 0's, and the bit pattern is $(+.164 (16^3))_{16}$
- This method of truncation produces a biased error, since the values of 00, 01, 10, and 11 are in the missing bits
- The errors in the range is $0$ to $(.003)_{16}$
- The bias comes about because the error is not symmetric about 0

   4. <font style="color:#A8A8A8; text-decoration: underline;">Error in Floating Point Representation</font>  
- _Error_ is the distance between two adjacent representable numbers
$b$ - base
$s$ - Number of significant digits (not bits) in the fraction
$M$ - Largest exponent
$m$ - Smallest exponent



   5. <font style="color:#A8A8A8; text-decoration: underline;">The IEEE 754 Floating Point Standard</font>  
- IEEE 754 floating point is that standard for binary numbers (1985)
- Must be supported by a computer system, and not necessarily by the hardware entirely
- 2 primary formats in the IEEE 754 standard
	- Single precision
	- Double precision

![[Pasted image 20250203124550.png|600]]
Exponent
- The 8-bit excess 127 and reserved bit pattern of 00000000 and 11111111
- The 11-bit exponent has an excess or 1023

- To calculate the excess
$2^8/2 - 1 = 256/2 - 1 = 127$
$2^11/2 - 1 = 2048/2 - 1 = 1023$ 

Fraction
- The 23-bit base 2 fraction has a hidden bit to the left of the binary point
	- In single-precision fraction forms a $23 + 1 = 24$-bit significand
	- Form $1.fff...f$ where $fff...f$ pattern represent the 23-bit fractional
- The double-precision format also uses a hidden bit, therefore it forms a $52 + 1 = 53$-bit significand
- For both formates, the number is normalized unless denormalized numbers are supports

- 5 basic types of numbers that can be represented

1) Non-zero normalized number
2) "Clean zero"
3) Zero (+0 or -0)
4) Infinity
5) Not a number (NaN)

![[Pasted image 20250221182705.png]]

- In addition to the single precision and double precision formats, there are also single extended and double extended formats
- The extended formats increase the widths of the exponents and fractions by a number of bits that can vary depending on the implementation

Rounding
- The result of any single operation on floating point numbers must be accurate to within half a bit in the least significant bit of the fraction
- _Guard bits_ are used as addition bits of precision
- 4 rounding modes in IEEE 754 standard
	- Rounds to 0
	- Rounds towards $+∞$
	- Rounds towards $-∞$
	- Default: rounds to nearest representable number

- $1.01101$ rounds to $1.0110$, whereas $1.01111$ rounds to $1.1000$


2.4 <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Patriot Missile Defense Failure Caused by Loss of Precision</font>  
- The conversion from integer time to real time resulted in a loss of precision that increased as the internal clock time increases
- Error introduced by the conversion resulted in an error in the range gate calculation, which is proportional to the target's velocity and the length of time that the system is running


2.5 <font style="color:#A8A8A8; text-decoration: underline;">Character Codes</font>  
- Only finite number of characters
- An entire character set can be represented with a small number of bits per character
- ASCII
- EBCDIC
- Unicode


   1. <font style="color:#A8A8A8; text-decoration: underline;">The ASCII Character Set</font>  
- American Standard Code for Information Interchange
- Representation consists of 7 bits, and $2^7$ possible bit patterns for each character
- Characters in position $00 - 1F$ and position $7F$ are special control characters that are used for transmission, printing control, and other non-textual purposes
- The other characters are all printable, including letters, numbers, punctuation, and a space
- To change character representation of a digit into its numerical value, subtract $(30)_{16}$ from it
	- '5' which is $(35)_{16}$ - $(30)_{16}$ $=5$
- To convert an upper case letter into a lower case letter add $(20)_{16}$
	- 'H' which is $(48)_{16}$ + $(20)_{16}$ $=(68)_{16}$$=5$

![[Pasted image 20250221184844.png|600]]

   2. <font style="color:#A8A8A8; text-decoration: underline;">The EBCDIC Character Set</font>  
- The ASCII code only has 128 representable characters
- The Extended Binary Coded Decimal Interchange Code is an 8-bit code that is used in IBM mainframe computers
- The EBCDIC is able to append a 0 or 1 to the 7-bit pattern of ASCII characters
- Therefore, doe not place a greater demand on the storage of characters in a computer
- For serial transmission, an 8-bit code takes more time

![[Pasted image 20250221185421.png|600]]

   3. <font style="color:#A8A8A8; text-decoration: underline;">The Unicode Set</font>  
- ASCII and EBCDIC do not support Latin character sets
- There are 38885 distinct coded characters in Unicode version 2.0
- Uses a 16-bit code set

![[Pasted image 20250221185637.png|600]]



## 3. <font style="color:#0DA2FF">Arithmetic</font>  
^a1be68

1. <font style="color:#A8A8A8; text-decoration: underline;">Overview</font>  
1) Addition
2) Subtraction
3) Multiplication
4) Division

- For fixed point numbers and floating point numbers

6. <font style="color:#A8A8A8; text-decoration: underline;">Fixed Point Addition and Subtraction</font>  
- Although 2's complement is mostly used, 1's complement and BCD is used for networking and hand-held calculators

   1. <font style="color:#A8A8A8; text-decoration: underline;">Two’s Complement Addition and Subtraction</font>  
- _Subtraction_ is similar to the _addition_ of a negative number
- $a-b = a + (-b)$
- For 3 bits, there will be only 8 possible two's complement values

![[Pasted image 20250221194407.png|400]]
- The carry out of the leftmost bit is discarded because the number system is modular

Overflow
- When two numbers are added have large magnitudes and the same sign, an overflow occurs

![[Pasted image 20250221195101.png|300]]

- If two numbers of opposite signs are added, then an overflow cannot occur
- If the numbers being added are of the same sign and the result is of the opposite sign, then an overflow error occurs

   2. <font style="color:#A8A8A8; text-decoration: underline;">Hardware Implementation of Adders and Subtractors</font>  
Ripple-Carry Addition and Ripple-Borrow Subtraction

![[Pasted image 20250221195931.png|400]]
- Two binary numbers A and B are added from right to left, creating a sum and a carry at the outputs of each full adder for each bit position
- Subtracting digits of the subtrahend $b_i$ from the minuend $a_i$ from right to left

![[Pasted image 20250221201116.png|400]]
![[Pasted image 20250221201130.png|400]]
![[Pasted image 20250221201143.png|400]]

- An alternative method of implementing subtraction is to form the two's complement negative of the subtrahend and _add_ it to the minuend

![[Pasted image 20250221201242.png|500]]

- When the control line is 0, it performs addition with A and B
- When the control line is 1, the B input is XOR creating a one's complement and a 1 is added from the _carry_in_ line from $c_0$

   3. <font style="color:#A8A8A8; text-decoration: underline;">One’s Complement Addition and Subtractors</font>  
- One's complement addition does not discard the leftmost position, but is added back into the least significant position of the integer portion, known as the **end-around carry**
![[Pasted image 20250221201622.png|250]]![[Pasted image 20250221201827.png|250]]

- The need to look for two different representations for zero, and the potential need to perform another addition for the end-around carry is why two's complement arithmetic is preferred

7. <font style="color:#A8A8A8; text-decoration: underline;">Fixed Point Multiplication and Division</font>  
- Multiplication and division of fixed point number can be accomplished with addition, subtraction, and shift operations

   1. <font style="color:#A8A8A8; text-decoration: underline;">Unsigned Multiplication</font>  
![[Pasted image 20250221215535.png|350]]

- A hardware implementation of integer multiplication can take a similar form to the manual method

![[Pasted image 20250221215628.png|400]]

- A 4-bit adder, a control unit, three 4-bit registers

![[Pasted image 20250222111558.png|400]]

- The M and Q hold the multiplicand and multiplier, respectively
- A holds the higher-order bits and Q hold the lower-order bits

   2. <font style="color:#A8A8A8; text-decoration: underline;">Unsigned Division</font>  
- If the remainder is negative then the subtraction must be backed out by adding the divisor back in, referred to as _restoring division_
- Instead of shifting the product to the right like multiplication, we shift the quotient to the left, and subtract instead of adding

![[Pasted image 20250222111825.png|150]]

![[Pasted image 20250222112002.png|400]]

- When restoring division, the result is not negative, and the least significant bit of Q is set to 1, which indicates that the divisor "fits" in the dividend at that point

   3. <font style="color:#A8A8A8; text-decoration: underline;">Signed Multiplication and Division</font>  
![[Pasted image 20250222112303.png|400]]

8. <font style="color:#A8A8A8; text-decoration: underline;">Floating Point Arithmetic</font>  

   1. <font style="color:#A8A8A8; text-decoration: underline;">Floating Point Addition and Subtraction</font>  
- Floating point arithmetic differs from integer arithmetic in that exponents must be handled as well as the magnitudes of the operands
- Adjust the smaller exponent to be equal to the larger exponent

$(.010 + .111) * 2^4=1.001 * 2^4 = .1001 * 2^5$

- The exponent and mantissa must be extracted from the packed bit pattern before an arithmetic operation can be performed
- The result must be renormalized and rounded, and then the bit patterns are re-packed into the requisite format
- Two floating point numbers can be compared without unpacking
- The sign bit is the most important
- Next is comparing the exponent

   2. <font style="color:#A8A8A8; text-decoration: underline;">Floating Point Multiplication and Division</font>  
- Floating point multiplication and division are performed in a manner similar to floating point addition and subtraction, except that the sign, exponent, and fraction of the result can be computed separately

9. <font style="color:#A8A8A8; text-decoration: underline;">High-Performance Arithmetic</font>  
- The speed of arithmetic operations are the bottleneck to performance
- Most supercomputers are "super" because they excel at performing fixed and floating point arithmetic

   1. <font style="color:#A8A8A8; text-decoration: underline;">High-Performance Addition</font>  
- The process of summing the inputs at each bit position is relatively fast, but the carry propagation takes a long time to work its way through the circuit
- Propagation time is proportional to the number of bits in the operands
- _Carry lookahead adder_ is a method of speeding the carry propagations
- Below is the relative position of a full adding in a ripple-carry adder

![[Pasted image 20250222114512.png|300]]
![[Pasted image 20250222114601.png|300]]
![[Pasted image 20250222114847.png|400]]
- $G_i$ and $P_i$ terms are referred to as generate and propagate functions, respectively

   2. <font style="color:#A8A8A8; text-decoration: underline;">High-Performance Multiplication</font>  
Booth Algorithm
- Treats positive and negative numbers uniformly
![[Pasted image 20250222115307.png|400]]

The Modified Booth Algorithm
- One solution to a worst case Booth problems is to group the recoded multiplier bits in pairs, known as bit pair recoding, also known as the modified Booth algorithm

![[Pasted image 20250222115455.png|400]]
![[Pasted image 20250222115536.png|300]]

Array Multipliers
- Form a one-bit product between each multiplier bit and each multiplicand bit, and then sum each row of partial product elements from the top to the bottom in systolic
- The structure of a systolic array multiplier

   3. <font style="color:#A8A8A8; text-decoration: underline;">High-Performance Division</font>  
- A faster method of division makes use of a lookup table and iteration
- An iterative method of finding a root of a polynomial is called _Newton's iteration_
- The goal is to find where the function crosses the x-axis

![[Pasted image 20250222115945.png|400]]
![[Pasted image 20250222120000.png|400]]
![[Pasted image 20250222120036.png|400]]
- Therefore, we only need to perform multiplication and subtraction in order to perform division

![[Pasted image 20250222120230.png|400]]

   4. <font style="color:#A8A8A8; text-decoration: underline;">Residue Arithmetic</font>  
- Addition, subtraction, and multiplication can all be performed in a single, careless step using residue arithmetic
- Based on relatively prime integers called moduli
![[Pasted image 20250222122352.png|400]]

- Although residue arithmetic operations can be fast, there are a number of disadvantages to the system
- Division and sign detection are difficult, and a representation for fractions is hard
- Conversions between the residue number system and weighted number systems are complex, and often require involved methods such as the _Chinese remainder theorem_
- Residue number system may be practical for integer application
- An important application area is matrix-vector multiplication, which is used extensively in signal processing

10. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Calculator Arithmetic Using Binary-Coded Decimal</font>  
- Calculators represent base 10 number in binary corded decimal (BDC) using 4 bits per BCD decimal

   2. <font style="color:#A8A8A8; text-decoration: underline;">Binary Coded Decimal Addition and Subtraction</font>  
![[Pasted image 20250222123046.png|500]]
![[Pasted image 20250222123220.png|500]]

   3. <font style="color:#A8A8A8; text-decoration: underline;">BCD Floating Point Addition and Subtraction</font>  

## 4. <font style="color:#0DA2FF">The Instruction Set Architecture</font>  
^5c19a8

- Machine language is in terms of its assembly language, which is functionally equivalent to the corresponding machine language
- The Instruction Set Architecture (ISA) view corresponds to the Assembly Language/Machine Code level
- Model architecture is the ARC machine, which is a simplification of the SPARC architecture in Sun computers

1. <font style="color:#A8A8A8; text-decoration: underline;">Hardware Components of the Instruction Set Architecture</font>  

   1. <font style="color:#A8A8A8; text-decoration: underline;">The System Bus Model Revisited</font>  
![[Pasted image 20250222123726.png|500]]

- The purpose of the bus is to reduce the number of interconnections between the CPU and its subsystems
- The CPU is interconnected with its memory and I/O systems via a shared system bus
- The memory never generates addresses, and the CPU never receives addresses
- A user write a high level program, which a compiler translates into assembly languages, and an assembler translates into machine code, which is stored on a disk
- Before execution the machine code program is loaded from the disk into the main memory by an operating system
- During execution each instruction is brought into the ALU from the memory, one instruction at a tine
- The output of the program is places on a device such as a video display, or a disk
- Instructions are executed inside of the ALU

   2. <font style="color:#A8A8A8; text-decoration: underline;">Memory</font>  
- Computer memory consists of a collection of consecutively numbered (addresses) registers, each on hold one byte
- A byte is a collection of eight bits; octet
- Each register has an address, referred to a a memory location
- A nibble, is referred to as a collection of four adjacent bits
- A word is a 32-bit or address block
- In byte-addressable machine, the smallest object that can be references in memory is the bytes
- Big-endian: Most significant byte at lowest address
- Little-endian: least significant byte stored at lowest address

![[Pasted image 20250222124628.png|400]]

- Memory locations are arranged linearly in consecutive order
- Each numbered location corresponds to a specific stores word
- The unique number that identifies each word it's address
- The highest address for a $2^{32}$ byte memory is $2^{32}-1$, and the lowest is 0
- The address space is divided into distinct regions which are used for the operating system, I/O, use programs, and systems stack; that make the memory map

![[Pasted image 20250222124939.png|500]]

- Since I/O devices are treated like memory locations, ordinary memory read and write commands can be used for reading and writing devices; this is referred to as memory mapped I/O
- The term address space refers to the numerical range of memory addresses to which the CPU can refer
- A machine having a 32-bit address space will have a maximum capacity of $2^{32}$ (4 GB) of memory

   1. <font style="color:#A8A8A8; text-decoration: underline;">The CPU</font>  
- The CPU consists of a data section that contains registers and an ALU, and a control section which interprets instructions and effects register transfers
- The data section is referred to as the datapath

![[Pasted image 20250222125425.png|400]]

- The control unit of a computer is responsible for executing the program instructions, which are stored in the main memory
- The _program counter (PC)_ and _instruction register (IR)_ form the interface between the control unit and the data unit
- The PC contain the address of the instruction being executed
- The instruction from the PC is stored in the IR where it is interpreted
Fetch-Execute Cycle:
1) Fetch the next instruction to be executed from memory
2) Decode the opcode
3) Read operand(s) from main memory
4) Execute the instruction and store results
5) Go to step 1

- The control unit is responsible for coordinating these different units
- The datapath is made up of a collection of registers known as the register file and the arithmetic and logic unit (ALU)
- The register file is fast memory separate from the system memory, which is used for temporary storage during computation
- Each register in the register file is assigned an address in sequence starting from zero
- The file register is contained within the CPU, and is must faster than the system memory
	- Run 10x faster

![[Pasted image 20250222130343.png|500]]

- Three busses connect the datapath to the system bus
- Three busses allow two operands to be fetched from the register file simultaneously, which are operated on by the ALU, and results returned to the register file

The Instruction Set
- The instruction set is the collection of instructions that a process can execute, and in effect, it defines the processes
- Instructions sets are specific for each processor type
- Programs written in high level languages are re-compiled for the target processor
- Computer systems are identified by the type of CPU

Software for generating machine language programs
- A compiler is a computer program that transforms programs written in a high-level language into machine language
- The process of compiling a program, referred to as the translation process, a high-level source program is transformed into assembly language, and the assembly language is then translates into machine code for target machine by an assembler
- These translations take place at compile time and assembly time
- The resulting object program can be linked with other object program at link time
- The linked program, is loaded to main memory, at load time, and executed by the CPU, at run time


6. <font style="color:#A8A8A8; text-decoration: underline;">ARC, a RISC Computer</font>  
- Scalable Process Architecture (SPARC) processor was developed at Sub Microsystems in the mid-1980's
- A subset of the SPARC, is called "a RISC Computer" (ARC)
- Reduced instruction set computer (RISC)
- The ARC has most of the important features of the SPARCH architecture, but without some of the complexities

   1. <font style="color:#A8A8A8; text-decoration: underline;">ARC Memory</font>  
- The ARC is a 32-bit machine with byte-addressable memory
- Memory regions:
	- $2^{11}=2048$ address of the memory map is reserved for use by the operating system
	- The user space starts from location 2048 until the system stack
	- The stack starts at location $2^31-4$ and grows toward lower addresses
	- $2^{31}$ and $2^{32}-1$ is reserved for I/O devices
- Each integer is stored in memory as a collection of 4 bytes
- ARC is a big-endian architecture, so the highest-order byte is stored at the lowest address

   2. <font style="color:#A8A8A8; text-decoration: underline;">ARC Instruction Set</font>  
  - CPU:
	  - The ARC has 32 32-bit general purpose registers, as well as a PC and IR
	  - The Processor Status Register (PSR) contain information about the state of the processor, including information about the results of arithmetic operations
	  - "Arithmetic flags" in the PSR are called _condition codes_
		  - Zero value (z)
		  - Negative value (n)
		  - Carry out (c)
		  - Overflow (v)
	- All instructions are one word (32-bit)
	- The ARC is a load-store machine
	- Approximately 200 instructions in the SPARC instruction set
	- Each instruction is represented by a mnemonic

Data Movement Instructions
- `ld` and `st` transfer a work between the main memory and one of the ARC registers
- These are the only instructions that can access memory in the ARC
- The `sethi` instruction sets the 22 MSB of a register with a 22-bit constant contained within the instruction

![[Pasted image 20250222140251.png|500]]

Arithmetic and Logic Instructions
- `andcc, orcc, orncc` instructions perform a bit-by-bit AND, OR, or NOR operation, on their operands
- One of the two source operands must be in a register
- The other may be in a register, or be a 13-bit two's complement constant
- The "cc" suffixes specify that after performing the operating, the condition code bit in the PSR are updated to reflect the result of the operation
- The `srl`, shift right logical, instruction shift a register to the right, and copies zeros into the leftmost bit

Control Instructions
- The `call` and `jmpl` instructions form a pair that are used in calling and returning from a subroutine
- `jmpl` is also used to transfer control to another part of the program
- Conditional branch instructions
	- `be, bneg, bcs, bvs, ba`
- They test one or more of the condition code bits in the PSR, and branch if the bits indicate the condition is met
- They are used in implementing high level constructs such as `goto`, `if-then-else`, `do-while`
  
   3. <font style="color:#A8A8A8; text-decoration: underline;">ARC Assembly Language Format</font>  
![[Pasted image 20250222154617.png|500]]

- The language is "free format" where any field can begin in any column, but the relative left-to-right ordering must be maintained
- The ARC architecture contains 32 registers labeled `%r0 - %r31` that each hold 32-bit word
- There is also the Process State Register (PSR) that describes the current state of the processor, `%psr`
- Program counter (PC) that keeps track of the instruction being executed, `%pc`
- Register `%r0` always contains the value 0
- Registers `%r14` and `%r15` have additional uses as a stack pointer and link register, respectively (`[%sp] and [link])
- Operands in an assembly language are separated by commas, and the destination operand always appears in the rightmost position in the operand field
- Below shows adding registers `%r1` and `%r2`, with the result place in `%r3`
- The result is discarded if the destination is `%r0`

![[Pasted image 20250222155711.png|200]]

   4. <font style="color:#A8A8A8; text-decoration: underline;">ARC Instruction Formats</font>  
- The instruction format defines how the various bit fields of an instruction are laid out by the assembler
- 5 formats
	- SETHI
	- Branch
	- Call
	- Arithmetic
	- Memory

![[Pasted image 20250222155950.png|600]]

- The leftmost two bits of each instruction form the `op` (opcode) field
- The 5-bit `rd` field identifies the target register for the SETHI
- The `cond` field identifies the type of branch, based on the condition code bits
- The `imm22` and `disp22` fields each hold 22-bit constant that is used as the operand for the SETHI format or for calculating a displacement for a branch address
- The CALL format contains only the `op` and `disp30` which contains a 30-bit displacement that is used in calculating the address of the called routine
- The Arithmetic and Memory formats use `rd` to identify either a source register for `st`, or a destination register for the remaining instructions
- The `rs1` and `rs2` are the first and second source register, respectively
- The `op3` field identifies the type of instruction
- The `simm13` field is a 13-bit immediate value that is sign extended to 32 bits for the second source when the `i` field is 1
	- The leftmost bit of the `simm13` field is copied to the left into the remaining bits that make up a 32-bit integer
- Arithmetic: two source operands, and a destination operand
- Memory: one address and one data operand
	- `%r0` is used for `rs2`

   5. <font style="color:#A8A8A8; text-decoration: underline;">ARC Data Formats</font>  
- The ARC supports 12 different data formats
- The data formats are grouped into three types: signed integer, unsigned integer, and floating point
- ARC does not differentiate between unsigned and signed integers
- Both are stored and manipulated as two's complement integers
- The `c` bit indicated unsigned integer overflow, and the `v` bit, signed overflow
- Tagged arithmetic operations are used in languages with dynamically typed data, such as Lisp and Smalltalk
- The tags can be used to ensure proper alignment conditions, particularly for pointers
- The floating point formats conform to the IEEE 754 standard

   6. <font style="color:#A8A8A8; text-decoration: underline;">ARC Instruction Description</font>  
- A reference to the contents of a memory location is indicated by square brackets as in `ld [x], %r1`, which copies the contents of location x into `%r1`
- A reference to the address of a memory location is specified directly, without brackets, `call sub_r`, which makes a call to subroutine
- Only `ld` and `st` can access memory, and use brackets
- Registers are always referred to in terms of their contents, and never in terms of an address

ld
- Copy the contents of memory location x into register %r1, x = 2064
```arc
ld [x], %r1
ld [x], %r0, %r1
ld %r0+x, %r1

11 00001 000000 00000 1 0100000010000
```

st
- Copy the contents of register %r1 into memory location x
```arc
st %r1, [x

11 00001 000100 00000 1 0100000010000
```

sethi
- Set the high 22 bits of %r1 to $(304F15)_{16}$, and set the low 10 bits to zero
- If the operand is 0 and the register is %r0, then the instruction is a no-op (NOP)
```arc
sethi 0x304F15, %r1

00 00001 100 1100000100111100010101
```

andcc
- Logically AND %r1 and %r2 and place the result in %r3
```arc
andcc %r1, %r2, %r3

10 00011 010001 00001 0 00000000 00010
```

orcc
- Set the lest significant bit of %r1 to 1
```arc
orcc %r1, 1, %r1

10 00001 010010 00001 1 0000000000001
```

orncc
- Complement %r1
```arc
orncc %r1, %r0, %r1

10000010101100000100000000000000
```

srl
- Shift %r1 right y three bits and store in %r2. Zeros are copied into three most significant bits of %r2
```arc
srl %r1, 3, %r2

10000101001100000110000000000011
```

addcc
- Add 5 to %r1
```arc
addcc %r1, 5, %r1

10000010100000000110000000000101
```

call
- Call a subroutine that begins at location `sub_r`, where `sub_r` is 25 words (100 bytes) father in memory
```arc
call sub_r

01000000000000000000000000011001
```

jmpl
- Return from subroutine
```arc
jmpl %r15 + 4, %r0

10000001110000111110000000000100
```

be
- Branch to `label` if the z condition code is 1
```arc
be label

00000010100000000000000000000101
```

bneg
- Branch to `label` is the n condition code is 1
```arc
bneg label

00001100100000000000000000000101
```

bcs
- Branch to `label` if the C condition code is 1
```arc
bcs label

00001010100000000000000000000101
```

bvs
- Branch to `label` if the v condition code is 1
```arc
bvs label

: 00001110100000000000000000000101
```

ba
- Branch to `label` regardless of of the settings of the condition codes
```arc
ba label

00010000101111111111111111111011
```


3. <font style="color:#A8A8A8; text-decoration: underline;">Pseudo-Ops</font>  
- Pseduo-operations are instructions to the assembler to perform some action at assembly time
![[Pasted image 20250222174310.png|500]]

- Pseudo-ops are specific to a given assembler
- The location counter is moved ahead of the block according to the number of words specified by the argument to `.dwb` multiplied by 4
- The `.global` makes a label available for use in other modules
- The `.extern` identifies a label that is used in the local module and is defined in another module

4. <font style="color:#A8A8A8; text-decoration: underline;">Examples of Assembly Language Programs</font>  

Program: Add Two Integers
```arc
	.begin
	.org 2048
prog1:  ld [x], %r1
		ld [y], %r2
		addcc %r1, %r2, %r3
		st %r3, [z]
		jmpl %r15 + 4, %r0
x:      15
y:      9
z:      0
	.end
```

- The `%r15 + 4, %r0` causes a return to the next instruction in the calling routine, which is the operating system
- The property of launching a new instruction before the previous one has completed is called _pipelining_

Program: Sum an Array of Integers
![[Pasted image 20250222182002.png|600]]

- The value z is tested by making use of the `be` instruction
- If there are no remaining array elements to sum, then the program branches to `done` which returns to the calling routine
- This technique of computing the address of a data value as the sum of a base plus an index uses a special "addressing mode"

```arc
addcc %r1, -4, %r1 ! Point to next element to be added
addcc %r1, %r2, %r4 ! Add it to the base of the array 
ld %r4, %r5 ! Load the next element into %r5

addcc %r1, -4, %r1 ! Point to next element to be added
ld %r1 + %r2, %r5 ! Load the next element into %r5
```

- `ld` performs summation and saves register %r4



   1. <font style="color:#A8A8A8; text-decoration: underline;">Variation in Machine Architectures and Addressing</font>  
- The ARC is typical of a load/store computer
- Programs written for load/store machines generally execute faster
- For CPUs that only have a single register to hold arithmetic values, intermediate results had to be stored in memory

$A=B*C+D$
- Addresses, opcodes, and data words are 16 bits
- Opcodes are 8-bits
- Operands are moved to and from memory one word at a time
- Memory has two components
	- Code must be fetches from memory to the CPU
	- Data values must be moved into the CPU in order to be operated upon

Three-Address Instructions
```arc
mult B, C, A
add  D, A, A
```

- The program size if 8x2 or 16 bytes
- Memory traffic is 16 + 2x2x3 or 28 bytes

Two Address Instructions
```arc
load B, A
mult C, A
add  D, A
```

- The program size if 3x3x2 or 18 bytes
- Memory traffic is 18 + 2x2 + 2x2x3 or 24 bytes


One Address, or Accumulator Instructions
- A one-address instruction employs a single arithmetic register in the CPU, known as the accumulator
- The accumulator hold one arithmetic operand, and servers as the target for the result of an arithmetic operation

```arc
load B
mult C
add  D
store A
```

- The program size 2x2x4 or 16 bytes
- Memory traffic is 16 + 4x2 or 24 bytes

Special Purpose Registers
- Memory index registers
- Floating point registers
- Registers to support time, and timing operations
- Registers in support of the operating system
- Registers that can be accessed only by "privileged instructions"

   2. <font style="color:#A8A8A8; text-decoration: underline;">Performance of Instruction Set Architectures</font>  

5. <font style="color:#A8A8A8; text-decoration: underline;">Accessing Data in Memory – Addressing Modes</font>  
- Four ways of computing the address of a value in memory
	- A constant value, known at assembly time
	- The contents of a register
	- The sum of two registers
	- The sum of a register and a constant

- Immediate addressing allows a reference to a constant that is known at assembly time
- Direct addressing is used to access data items whose address is known at assembly time
- Indirect addressing is used to access a pointer variable whose address is known at compile time
- Register indirect addressing is used when the address of the operand is not known until run time
- Register indexed, register based, and register based indexed addressing are used to access components of arrays in stack frames

6. <font style="color:#A8A8A8; text-decoration: underline;">Subroutine Linkage and Stacks</font>  
- A routine, sometimes called a function or procedure, is a sequence of instructions that is invoked in a manner that makes it appear to be a single instruction in a high level view
- Calling conventions are the methods for passing arguments to and from the called routine
- The process of passing arguments between routines is referred to as subroutine linkage
![[Pasted image 20250223155825.png|400]]
- This method is fast and simple, but it will not work if the number of arguments that are passed between the routines exceeds the number of free registers, or if subroutine calls are deeply nested
- A second calling convention creates a data link area
- The address of the data link area is passed in a predetermined register to the called routine

![[Pasted image 20250223160204.png|400]]

- By using a data link area, large blocks of data can be passed between routines without copying more than a single register during subroutine linkage
- Recursion can create a burdensome bookkeeping overhead
- A third calling convention uses a stack
- Pushes all of its arguments onto a last-in-first-out stack
- The called routine then pops the passed arguments from the stack, and pushes any return values onto the stack
- A register in the CPU, known as the stack pointer, contains the address of the top of the stack

![[Pasted image 20250223160643.png|400]]

- In order to allow nested calls and returns, the current value of %r15 (link register) should be saved on the stack, along with any other registers that need to be restored after the return
- The stack-oriented approach to subroutine linkage is the most popular calling convention
- The compiler is responsible for implementing the calling convention, and so the compiler produces code for pushing parameters and the return address onto the stack, reserving room on the stack for local variables, and then reversing the process as routines return from their calls
![[Pasted image 20250223161244.png|500]]
![[Pasted image 20250223163748.png|500]]
![[Pasted image 20250223164025.png|500]]

7. <font style="color:#A8A8A8; text-decoration: underline;">Input and Output in Assembly Language</font>  
- An alternative method for interacting with I/O devices is through the use of memory mapped I/O, in which devices occupy sections of the address space where no ordinary memory exists
- A touchscreen comes in two forms, photonic and electrical
- A matrix of beams covers the screen in the horizontal and vertical dimensions
- If the beams are interrupted then the position is determined by the interrupted beams

8. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: The Java Virtual Machine ISA</font>  
- Java is a high-level programming language developed by Sun Microsystems that has taken a prominent position in the programming community
- Java binary codes are platform-independent, so compiled code can run without modification on any computer that supports the Java Virtual Machine (JVM)
- The JVM is how Java achieves it platform-independence
- Programs written in fully compiled languages like C, C++, and Fortran are compiled into the native code of the target architecture, and are generally not portable across platforms unless the source code is recompiled for the target machine
- Interpreted languages, like Perl, Tcl, AppleScript, and shell script, are platform independent, but execute 100 to 200 times slower than fully compiled languages
- Java programs are compiled into an intermediate form known as bytecodes, which execute on the order of 10 times more slowly than fully compiled languages
- The JVM is a stack-based machine, which means that the operands are pushed and popped from a stack, instead of being transferred among general purpose registers
- The bytecode file is known as a Java class file

![[Pasted image 20250223165835.png|500]]

- Only a small number of bytes in a class file contain instructions, the rest is overhead that the file must contain in order to run on the JVM
- The number of entries in the constant pool which contains the names of methods, attributes, and other information used by the runtime systems
- JIT compilers take advantages of the fact that most programs spend most of their time in loops and other iterative routines
- As the JIT encounters each line of code for the first time, it compiles it into native code and stores it away in memory for possible later use
- 

## 5. <font style="color:#0DA2FF">Languages and the Machine</font>  
^6a87bc

1. <font style="color:#A8A8A8; text-decoration: underline;">The Compilation Process</font>  


   1. <font style="color:#A8A8A8; text-decoration: underline;">The Steps of Compilation</font>  


   2. <font style="color:#A8A8A8; text-decoration: underline;">The Compiler Mapping Specification</font>  


   3. <font style="color:#A8A8A8; text-decoration: underline;">How the Compiler Maps the Three Instruction Classes into Assembly Code</font>  


   4. <font style="color:#A8A8A8; text-decoration: underline;">Data Movement</font>  


   5. <font style="color:#A8A8A8; text-decoration: underline;">Arithmetic Instructions</font>  


   6. <font style="color:#A8A8A8; text-decoration: underline;">Program Control Flow</font>  


2. <font style="color:#A8A8A8; text-decoration: underline;">The Assembly Process</font>  


3. <font style="color:#A8A8A8; text-decoration: underline;">Linking and Loading</font>  


   1. <font style="color:#A8A8A8; text-decoration: underline;">Linking</font>  
  
  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Loading</font>  


4. <font style="color:#A8A8A8; text-decoration: underline;">Macros</font>  


5. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Extensions to the Instruction Set – Three Intel MMX and Motorola AltiVec SIMD Instructions</font>

  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Background</font>  


   2. <font style="color:#A8A8A8; text-decoration: underline;">The Base Architectures</font>  
  
  
   3. <font style="color:#A8A8A8; text-decoration: underline;">VECTOR Registers</font>  


   4. <font style="color:#A8A8A8; text-decoration: underline;">Vector Arithmetic Operations</font>  


   5. <font style="color:#A8A8A8; text-decoration: underline;">Vector Compare Operations</font>  


   6. <font style="color:#A8A8A8; text-decoration: underline;">Case Study Summary</font>  


## 6. <font style="color:#0DA2FF">Data and Control</font>  
^a5412b

1. <font style="color:#A8A8A8; text-decoration: underline;">Basics of the Microarchitecture</font>  


2. <font style="color:#A8A8A8; text-decoration: underline;">A Microarchitecture for the ARC</font>  


   1. <font style="color:#A8A8A8; text-decoration: underline;">The Datapath</font>  


   2. <font style="color:#A8A8A8; text-decoration: underline;">The Control Section</font>  


   3. <font style="color:#A8A8A8; text-decoration: underline;">Timing</font>  


   4. <font style="color:#A8A8A8; text-decoration: underline;">Developing the Microprogram</font>  


   5. <font style="color:#A8A8A8; text-decoration: underline;">Traps and Interrupts</font>  


   6. <font style="color:#A8A8A8; text-decoration: underline;">Nano programming</font>  


3. <font style="color:#A8A8A8; text-decoration: underline;">Hardwired Control</font>  
   

4. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: The VHDL Hardware Description Language</font>  
   

   1. <font style="color:#A8A8A8; text-decoration: underline;">Background</font>  


   2. <font style="color:#A8A8A8; text-decoration: underline;">What is VHDL</font>  


   3. <font style="color:#A8A8A8; text-decoration: underline;">9-Value Logic System</font>  



## 7. <font style="color:#0DA2FF">Memory</font>  
^3a11ec

1. <font style="color:#A8A8A8; text-decoration: underline;">The Memory Hierarchy</font>  
2. <font style="color:#A8A8A8; text-decoration: underline;">Random Access Memory</font>  
3. <font style="color:#A8A8A8; text-decoration: underline;">Chip Organization</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Constructing Large Rams From Small Rams</font>  
4. <font style="color:#A8A8A8; text-decoration: underline;">Commercial Memory Modules</font>  
5. <font style="color:#A8A8A8; text-decoration: underline;">Read-Only Memory</font>  
6. <font style="color:#A8A8A8; text-decoration: underline;">Cache Memory</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Associative Mapped Cache</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Direct Mapped Cache</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Set Associative Mapped Cache</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Cache Performance</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Hit Ratios and Effective Access Times</font>  
   6. <font style="color:#A8A8A8; text-decoration: underline;">Multilevel Caches</font>  
   7. <font style="color:#A8A8A8; text-decoration: underline;">Cache Management</font>  
7. <font style="color:#A8A8A8; text-decoration: underline;">Virtual Memory</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Overlays</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Paging</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Segmentation</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Fragmentation</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Virtual Memory vs. Cache Memory</font>  
   6. <font style="color:#A8A8A8; text-decoration: underline;">The Translation Lookaside Buffer</font>  
8. <font style="color:#A8A8A8; text-decoration: underline;">Advanced Topics</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Tree Decoders</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Decoders for Large Rams</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Content-Addressable (Associative) Memories</font>  
9. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Rambus Memory</font>  
10. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: The Intel Pentium Memory System</font>  

## 8. <font style="color:#0DA2FF">Input and Output</font>  

^9d4604

1. <font style="color:#A8A8A8; text-decoration: underline;">Simple Bus Architectures</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Bus Structure, Protocol, and Control</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Bus Clocking</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">The Synchronous</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">The Asynchronous</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Bus Arbitration – Master and Slaves</font>  
2. <font style="color:#A8A8A8; text-decoration: underline;">Bridge-Based Bus Architectures</font>  
3. <font style="color:#A8A8A8; text-decoration: underline;">Communication Methodologies</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Programmed I/O</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Interrupt-Driven I/O</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Direct Memory Access (DMA)</font>  
4. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Communication on the Intel Pentium Architecture</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">System Clock, Bus Clock, and Bus Speed</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Address, Data, Memory, and I/O Capabilities</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Data Words have soft-alignment</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Bus Cycles in the Pentium Family</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Memory Read and Write Bus Cycles</font>  
   6. <font style="color:#A8A8A8; text-decoration: underline;">The Burst Read Bus Cycle</font>  
   7. <font style="color:#A8A8A8; text-decoration: underline;">Bus Hold for Request by Bus Master</font>  
   8. <font style="color:#A8A8A8; text-decoration: underline;">Data Transfer Rates</font>  
5. <font style="color:#A8A8A8; text-decoration: underline;">Mass Storage</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Magnetic Disks</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Magnetic Tape</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Magnetic Drums</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Optical Disks</font>  
6. <font style="color:#A8A8A8; text-decoration: underline;">Input Devices</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Keyboards</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Bit Pads</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Mice and Trackballs</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Lightpens and TouchScreen</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Joysticks</font>  
7. <font style="color:#A8A8A8; text-decoration: underline;">Output Devices</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Laser Printer</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Video Displays</font>  

## 9. <font style="color:#0DA2FF">Communication</font>  

^15b6e6

1. <font style="color:#A8A8A8; text-decoration: underline;">Modems</font>  
2. <font style="color:#A8A8A8; text-decoration: underline;">Transmission Media</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Two-Wire Open Lines</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Twisted-Pair Lines</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Coaxial Cable</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Optical Fiber</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Satellites</font>  
   6. <font style="color:#A8A8A8; text-decoration: underline;">Terrestrial Microwave</font>  
   7. <font style="color:#A8A8A8; text-decoration: underline;">Radio</font>  
3. <font style="color:#A8A8A8; text-decoration: underline;">Network Architecture: Local Area Networks</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">The OSI Model</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Topologies</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Data Transmission</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Bridges, Routers, and Gateways</font>  
4. <font style="color:#A8A8A8; text-decoration: underline;">Communication Errors and Error Correcting Codes</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Bit Error Rate Defined</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Error Detection and Correction</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Vertical Redundancy Checking</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Cyclic Redundancy Checking</font>  
5. <font style="color:#A8A8A8; text-decoration: underline;">Networking Architecture: The Internet</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">The Internet Model</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Bridges and Router Revisted, and Switches</font>  
6. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Asynchronous Transfer Mode</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Synchronous vs. Asynchronous Transfer Mode</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">What is ATM?</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">ATM Network Architecture</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Outlook on ATM</font>  

## 10. <font style="color:#0DA2FF">Trends in Computer Architecture</font>  

^acc722

1. <font style="color:#A8A8A8; text-decoration: underline;">Quantitative Analysis of Program Execution</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Quantitative Performance Analysis</font>  
2. <font style="color:#A8A8A8; text-decoration: underline;">From CISC to RISC</font>  
3. <font style="color:#A8A8A8; text-decoration: underline;">Pipelining The Datapath</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Arithmetic, Branch, and Load-Store Instruction</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Pipelining Instructions</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Keeping the Pipeline Filled</font>  
4. <font style="color:#A8A8A8; text-decoration: underline;">Overlapping Register Windows</font>  
5. <font style="color:#A8A8A8; text-decoration: underline;">Multiple Instruction Issue (Superscalar) Machines – The PowerPC</font>  
6. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: The PowerPC 601 as a Superscalar Architecture</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Instruction Set Architecture of the PowerPC</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Hardware Architecture of the PowerPC</font>  
7. <font style="color:#A8A8A8; text-decoration: underline;">VLIW Machines</font>  
8. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: The Intel IA-64 (Merced) Architecture</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">Background – the 80x86 CISC Architecture</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">The Merced: An EPIC Architecture</font>  
9. <font style="color:#A8A8A8; text-decoration: underline;">Parallel Architecture</font>  
   1. <font style="color:#A8A8A8; text-decoration: underline;">The Flynn Taxonomy</font>  
   2. <font style="color:#A8A8A8; text-decoration: underline;">Interconnection Networks</font>  
   3. <font style="color:#A8A8A8; text-decoration: underline;">Mapping an Algorithm onto a Parallel Architecture</font>  
   4. <font style="color:#A8A8A8; text-decoration: underline;">Fine-Grain Parallelism – The Connection Machine CM-1</font>  
   5. <font style="color:#A8A8A8; text-decoration: underline;">Course-Grain Parallelism: The CM-5</font>  
10. <font style="color:#A8A8A8; text-decoration: underline;">Case Study: Parallel Processing in the Sega Genesis</font>  
    1. <font style="color:#A8A8A8; text-decoration: underline;">The SEGA Genesis Architecture</font>  
    2. <font style="color:#A8A8A8; text-decoration: underline;">Sega Genesis Operation</font>  
    3. <font style="color:#A8A8A8; text-decoration: underline;">Sega Genesis Programming</font>  
