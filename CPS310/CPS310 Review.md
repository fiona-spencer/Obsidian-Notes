# 1. Intro, History, and Data Representations

---

## Definitions

- Computer architecture
	- Refers to the functional behaviour of a computer system as viewed by the programmer
- Computer organization
	- Refers to the structural relationship that are not visible to the programmer

- Levels
	- A concept in computer organization and architecture
	- The computer system can be considered at many levels
	- High level of executing programs
	- Low level of transistors, wires, traces

## History
- Wolf radius bone
- Tally sticks
- Chinese abacus
- Pascal's calculating machine
- Jacquard pattern weaving loom
- Babbage different engine
- Loog up tables
- Ada Lovelace
- Enigma
- Colossus
- ENIAC

## Computability
- To study computability, Alan Turing developed a simple and basic but surprisingly powerful symbol manipulating device
	- a-machine
	- Renames the _Turning machine_
	- First described in 1936

## Turing Machine
1) An arbitrary-length tape
2) A head
3) A state
4) A transition table

- Turing-Church Hypothesis
	- For any algorithm which can be calculated given arbitrary amounts of time and storage, there is an equivalent Turing machine for that algorithm
- Turing Completeness
	- A computational system is Turning Complete if it can be used to emulate a Turing machine
	- Machine code is Turning Complete if it can compute every function computable on a Turing machine

<img src="/images/Pasted%20image%2020250421201126.png" width="400px"/>

## von Neumann Model
- 5 major components
	1. Memory unit
	2. Input unit
	3. Output unit
	4. Arithmetic and Logic Unit (ALU)
	5. Control unit

- Execution of a stored program
	- Programs can be manipulated as if it were data
	- Gave rise to modern compilers and operating systems

## The System Bus Model

- Communication between components is streamlined
- Buses are shared between components
- If CPU is using data bus, memory must wait

<img src="/images/Pasted%20image%2020250421212135.png" width="400px"/>
![]()
- A Bus is a collection of wires or traces
- 64-bit bus = 64 parallel wires carrying one bit each
- Every communication entity will have an address
- Address bus might refer to an IO device, or a specific location in main memory

## Levels
1) User Level: Application Programs
2) High Level Language
3) Assembly Language/Machine Code
4) Microprogrammed/Hardwired Control
5) Functional Units (Memory, ALU)
6) Logic gate
7) Transistors and wires

- Signal propagation delay
	- Time it takes the signal to travel the circuit
	- The reason CPU cannot just get larger
	- Transistors can only get so small before quantum tunnelling is a risk

## Binary Numbers
- A bytes is 8 bits

`1 0 1 0 1 1 1 1`

- In base 10 (decimal system), each number represents $10^n$, where $n = 1,2,3...$

- In base 2 (binary), the base is 2

Convert Binary to Decimal 

```
100101

2^5 2^4 2^3 2^2 2^1 2^0
1   0   0   1   0   1
32          4       1
= 37
```

- Hexadecimal uses base 16
	- 0 to 9 => 0 to 9
	- 10 to 15 => A to F
	- 

Hexadecimal to Decimal

```
0xABC123 = 0d11256099
```

Hexadecimal <> Binary
- Group into 4's

```
0xABC123
0x1010 1011 1100 0001 0010 0011
```

## Two's Complement
- The magnitude in binary, if positive stop
- If negative, invert the bits
- Add 1

```
Write -9 in two's complement

0d9 = 0b0001001
invert = 0b11110110
add 1 = 0b11110111
```


## Real (Floating Point) Numbers

- Real numbers are represented using a
	- Sign bit
	- Mantissa
	- Exponent

## Floating Point: IEEE-754

<img src="/images/Pasted%20image%2020250421213550.png" width="400px"/>

- Integers are precise, floating-point numbers are almost never
- Floating point values exist on an infinite continuum
- Between two floating point values are an infinite number of additional floating-point values
- Integers are discrete, between are finite number of integers
- A 64-bit float can represent $2^{64}$ numbers
- A 32-bit integers has a range of $[-2,147,483,648, 2,147,483,647]$


## Representation Consideration
- The range is the interval between lowest and highest numbers
- The precision is the distance between successive numbers
- The maximum error, is the difference between the value of a real number and closest representable number

## Radix Number Systems
- Mathematic way of representing conversion to decimal from arbitrary radix

![](Pasted%20image%2020250421214127.png)

## Base Conversion: Remainder Method

```
Convert 0d23.375 to binary
--Integer
23/2 = 11 1
11/2 = 5 1
5/2 = 2 1
2/2 = 1 0
1/2 = 0 1

0d23 = 0b10111

--Decimal
0.375 * 2 = 0.75
0.75 * 2 = 1.5
0.5 * 2 = 1.0

0d0.375 = 0b0.011

--Total

0d23.375 = 0b10111.011

```


## Signed Fixed Point Numbers
- For an 8-bit number, there are $2^8 = 256$ possible bit patterns

4 Representations
1. Signed magnitude
2. One's complement
3. Two's complement
4. Excess (biased)

### Signed Magnitude
- Left most bit represent sign
- Two ways of representing zero
- Only represent 7 unique values instead of 8

### One's Complement
- Write normal if positive
- If negative flip the bits
- Left most bit is the sign
- Two representations of zero

### Two's Complement
- Write normal if positive
- If negative flip bits and add 1
- Only one representation of zero
- Range $[-128, 127]$
- Most commonly used technique for integer arithmetic

### Excess (biased)
- Bit pattern is shifted by subtracting bias from it
- Smallest bit pattern represent the negative bias

![](Pasted%20image%2020250421215138.png)


## Floating Point Representation
- Floating point numbers are usually normalized
- In IEEE-754 representation, a leading 1 is assumed to the left of the point

![](Pasted%20image%2020250421215934.png)

```
Represent 0d358 in hexidecimal using floating point form

0d358 = 0x166
0x166 = (166.) x 16^0
(.166) x 16^0 = 16^3

3 + 4 (bias) = 7

0b0 111 0001 01110 0110

+ 16^3 x (.166)
```

- Precision is only ever lost in one direction

## Error in Floating Point Representation
- 0.0 cannot be represented uniquely
- In IEEE--754, it cannot be represented at all

## IEEE-754

![](Pasted%20image%2020250421220526.png)

- Exponent for a 32-bit floating point has a 127-bias

Example

```
Convert 0d-12.625 to single precision IEEE-754 format

0d12 = 0b1100
0d0.625 = 0b0.101

0b-1100.101

--Normalize
0b-1100.101 = 0b-1.100101 x 2^3

3 + 127 = 130 = 0b1000 0010

--Total
0b1 1000 0010 1001 0100 ....

```


## IEEE-754: Special Bit Patterns

![](Pasted%20image%2020250421220656.png)

# 2. Intro to ISA

---

## Instruction Set Architecture (ISA)
- The ISA view of a machine corresponds to the machine code and assembly language level
- A compiler translates a High-Level Language (HLL), which is architecture independent, into assembly language
- Assembly and machine code are architecture dependent
- An assembler translates assembly language programs into executable binary programs

## ISA Level: System Bus Model
- User writes program in HLL
- Compiler translates into assembly
- Assembler translates into machine code, stored on disk
- Before execution, program is loaded into memory
- During execution
	- Instructions loaded into CPU from memory one at a time
	- CPU executes instructions, may generate address
	- Address placed on address bus, received by memory
	- Memory writes data at that address to the data bus

## ISA Level: Memory
- A collection of consecutively numbered cells
- Each cell is typically one byte
- We address at the byte level
- Manipulate bits using bit shifting, masking

![](Pasted%20image%2020250421222053.png)

![](Pasted%20image%2020250421222109.png)

- Memory is byte-addressable, but most data types are larger than one byte

## ISA Level: Big/Little Endian
- Big-endian
	- MSB stored at lowest address
- Little-endian
	- LSB stores at lowest address
- Multi-byte words are always accessed by their lowest address

Advantages
- Big-endian
	- Matches reading, left to right
	- Atmel AVR32
	- IBM
- Little-endian
	- Can grow and allocate an extra byte if needed
	- Intel x86
	- AMD64


## ISA Level: Memory Map
- A memory map is a drawing that shows how various regions of memory are allocated

![](Pasted%20image%2020250421222430.png)

- Map includes both RAN and IO
- IO devices are treated like memory location

Flat Address Space
- Address space refers to the numerical range of memory addresses to which the CPU can refer
- A flat address space means a single address for everything
- Size of the address space is bounded by the size of the address bus
- 32-bit address space can have a max of 4GB memory

## Address vs Data
- An address is a pointer to a location in memory
- Data is the value at that memory location


## ISA Level: CPU
- CPU
	- Data section with registers and ALU
	- Control unit for interpreting and executing instructions
	- Interface between control and data units formed by two registers
- Program Counter (PC)
	- Holds address of next instructions to be fetches
- Instruction Register (IR)
	- Holds next instruction to be executed

## Fetch-Execute Cycle
1. Fetch next instruction to be executed
	1. Indicated by the PC
2. Decode the opcode
	2. Depends on instruction set
3. Read operands from memory
4. Execute instruction and store results
5. Repeat from 1

- Fetching refers to the retrieval of the next instruction, as pointed to by the program counter
- Execution involved decoding the instruction and performing whatever is required as indicated by the opcode
- Opcode specifies what the instruction does
	- Add two registers, load a register from memory


## CPU: Control Unit
- The control unit coordinates all other units in the process of executing an instruction
- Thought of as a "computer within a computer"
- Tells the ALU what to do with what registers

## CPU: Data Path
- Register File
	- Collection of registers
	- Managed by control unit
	- Register sizes correspond to word sizes
	- Registers are addressable

## CPU: ALU
- ALU updates status register
- Indicate overflow, divide by 0, parity of result
- ALU implements a variety of binary (2-operands) and unary (1-operands)
- Binary
	- Addition, bit-wise AND, bit-shift
- Unary
	- Arithmetic negation


## Instruction Set
- A collection of instructions that a process can execute
- A process is defined by its instruction set

3 Main Categories
1. Data movement
2. Arithmetic and logic
3. Control


## Model Instruction Set: ARC
- ARC (a RISC computer) is based on the Scalable Processor Architecture (SPARC)
- CISC: complex instruction set computer
	- Large set of highly specific instructions
	- Can accomplish several things at once


## ARC ISA

### Memory
- 32-bit address space
- Lowest 2048 i $(2^{11})$ is reserved for OS
- 2048 is where user assembled program is loaded until it meets system stack
- System stack starts at word $2^{31}-4$ downwards
- IO device is $2^31$ to $2^{32}-1$
- Each IO device has some address range assigned to it
- Memory mapped IO

### CPU Registers

![](Pasted%20image%2020250421223924.png)

- Registers are always programmer accessible
- IR is not
- %r0 always contains 0
- %r1 to %r31 are general purpose
- %r14 doubles as stack pointer
- %r15 doubles as link register
- %psr (process status register)
	- Contains info about CPU stat
- Traps are a mechanism for interrupting normal processing
- Result of exception or interrupt
- Exception
	- Condition making it impossible for CPU to continue executing without software intervention
- Interrupt
	- Request for CPU attention by external device

### Instruction Set
- SPARC has ~200 instructions, ARC is a subset
- All ARCH instructions are 32-bit long (1 word)
- ARC and SPARC are two's complement


## Assembly Program

```c
		.begin
		.org 2048
prog1:  ld [x], %r1
		ld [y], %r2
		addcc %r1, %r2, %r3
		st %r3, [z]
		halt
x: 15
y: 9
z: 0
		.end
```


## ARC Assembly: Numbers
- Immediate constants are limited to 13 bits
- Numbers are treated as being in base-10
- The [] around a source operand indicates loading from the address contained in register


## ARC Assembly
![](Pasted%20image%2020250421224825.png)

![](Pasted%20image%2020250421224914.png)


## ARC Pseudo-Ops

![](Pasted%20image%2020250421224946.png)

## ARC Instructions Examples

Load - LD
```c
0xc2002810 = ld [2048], %r1
0b 1100 0010 0000 0000 0010 1000 0001 000
0b 11 00001 000000 00000 1 0100 0000 1000
--Memory ld
rd = 1
rs1 = 0
simm13 = 2064
i = 1
Address = rs1 + simm13
```


Add with Code - addcc
```c
0x86804002 = addcc %r2, %r2, %r3
0b 1000 0110 1000 0000 0100 0000 0000 0010
0b 10 00011 010000 00001 0 00000000 00010
--Arithmetic addcc
rd = 3
rs1 = 1
rs2 = 2
```


# 3. Branching

---
![](Pasted%20image%2020250421225740.png)

![](Pasted%20image%2020250421225751.png)

![](Pasted%20image%2020250421225759.png)









# 4. Subroutines

---
# 5. Memory Mapped IO

---
# 6. Multiprocessing

---
# 7. Intro to Arduino

---
# 8. AVR - Branching

---

# 9. AVR - Analog Input

---
# 10. AVR - Analog Output

---
# 11. AVR - Review

---
