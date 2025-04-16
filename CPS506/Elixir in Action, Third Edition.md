Part 1 - Functional Elixir

- [x] [[#^ebf1e5|1. First Steps]]
- [x] [[#^12f90b|2. Building Blocks]]
- [x] [[#^890f05|3. Control Flow ]]
- [x] [[#^6778a2|4. Data Abstractions]]

Part 2 - Concurrent Elixir

- [x] [[#^38fceb|5. Concurrency Primitives]]
- [x] [[#^9809d1|6. Generic Server Processes]]
- [x] [[#^51ef9b|7. Building a Concurrent System ]]
- [x] [[#^175da6|8. Fault Tolerance Basics]]
- [x] [[#^ad28fe|9. Isolating Error Effects]]
- [x] [[#^a532a0|10. Beyond GenServer]]

Part -3 Production

- [ ] [[#^f7afd7|11. Working with Components]]
- [ ] [[#^7908a4|12. Building a Distributed System]]
- [ ] [[#^888528|13. Running the System]]



- Erlang co-inventors, Joe Armstrong, Robert Virding, and Mike Williams set out to efficiently build and maintain scalable, fault-tolerant systems
- Erlang is used in major infrastructure projects at Cisco, Ericsson, Klarna, Goldman Sachs, T-Mobile, WhatsApp, Amazon, etc.
- Erlang's Open Telecom Platform (OTP) is a set of libraries and design principles for building concurrent, distributed, and fault-tolerant applications
- Elixir is a modern functional programming language for building large-scale, distributed, fault-tolerant, scalable systems for the Erlang Virtual machine (VM)
- Production wan intended for developing telecommunication systems, today it is used as collaboration tools, online payment systems, real-time bidding systems, database servers, and multiplayer online games, etc
- The language combines Erlang, Clojure, and Ruby
- Elixir ships with a toolset that simplifies project management, testing, packaging, and documentation building
- Elixir-based systems are able to use all the libraries from the Erlang ecosystem, including the battle-tested OTP framework that ships with Erlang
- Concurrent programming helps bring scalability, fault tolerance, distribution, and availability to systems

# 1. First Steps
^ebf1e5
## 1.1 <font style="color:#40E0D0">About Erlang</font>
- Erlang is a development platform for building scalable and reliable systems
- Erlang was mad in the mid-1980s by Ericsson
- Erlang is a general-purpose development platform that provides support for technical, non-functional challenges, such as concurrency, scalability, fault tolerance, distribution, and high availability
- Today population systems are about communication and collaboration
	- Social networks
	- content-management systems
	- Multimedia

1. <font style="color:#A8A8A8; text-decoration: underline;">High Availability</font>
- Development of highly available systems
- Technical challenges:
	- Fault tolerance
		- System keeps working after an unexpected error
			- Bug
			- Failed component
			- Network connection drop
			- System crash
	- Scalability
		- Handle any possible load by adding more hardware resource without software intervention
	- Distribution
		- System runs on multiple machines
		- Scale horizontally
	- Responsiveness
		- Fast and responsive
	- Live update
		- Update or push new version software without distributing the live server


2. <font style="color:#A8A8A8; text-decoration: underline;">Erlang Concurrency</font>
- Almost every non-trivial Erlang-based production system is highly concurrent
- The programming language is referred to as a _concurrency-oriented language_
- Instead of relying on heavyweight threads and OS processes, Erlang takes concurrency into its own hands
![[Pasted image 20250204101337.png|500]]

- The concurrency primitive is called _Erlang process_, and typical Erlang system runs millions of processes
- The Erlang virtual machines, _Bogdan Erlang Abstract Machine (BEAM)_ uses it own scheduler to distribute the execution of processes over the available CPU cores, parallelizing execution

FAULT TOLERANCE
- Erlang processes are isolated from each other
- Processes do not share memory, and a crash of one process is isolates
- An error results in a local effect
- A process that has been crashed can be replaced

SCALABILITY
- Processes communicate via asynchronous messages
- No complex synchronization mechanisms
	- locks, mutexes, or semaphores
- Erlang systems are divided into a large number of concurrent processes, the work together
- The VM can parallelize the processes
- Erlang systems are scalable since it can take advantage of available CPU cores

DISTRIBUTION
- Communication processes reside in the same BEAM instance or on two different instances on two separate, remote computers
- Highly concurrent, Erlang-based systems is automatically ready to be distributed over multiple machines
- Run a cluster of machines that share the total system load

REPSONSIVENESS
- Erlang dedicates schedulers that interchangeably execute Erlang processes
- A scheduler is preemptive
	- Gives a small execution window to each process and then pauses it and runs another process
- A single long-running process can't block the rest of the system
- I/O operations are internally delegates to separate threads, or a kernel-poll service is used
- Per-process garbage collection reduces system blocks


3. <font style="color:#A8A8A8; text-decoration: underline;">Server-side Systems</font>
- Erlang is used in desktop application and embedded environments
- Although best used in server-side systems
	- Systems that run on one or more servers and must server many client simultaneously
- The term _server-side system_ indicates that it's more than a simple server that processes requests
![[Pasted image 20250204102458.png|400]]

- Server-side systems are distributed on multiple machines
- Different components can be on different machines, some components may be deployed on multiple servers to achieve load balancing or support failover scenarios

Ex. Development of two web servers
- Serving a multitude of clients
- Handling long-running request
- Managing server-wide in-memory state
- Persisting data that must survive OS processes and machines restarts
- Running background jobs

![[Pasted image 20250204102812.png|500]]
Server A
- Uses various technology
- Components are deployed separately
Server B
- Accomplished the same technical requirements while relying no a single technology, using platform features
- Entire server is a single project that runs inside a single BEAM instance
- Run inside only one OS process, using multiple OS threads
- Concurrency is handled completely by the Erlang scheduler

- Erlang are not always alternatives to mainstream solutions
	- NGINX
		- Web server
	- MongoDB
		- Database server
	- Redis
		- In-memory key-value storage
- Erlang system is more homogenous, and easier to develop and maintain
- Erlang can run languages such as C, C++, and RUST

4. <font style="color:#A8A8A8; text-decoration: underline;">The Development Platform</font>

4 Parts of Erlang:
1) Language
2) Virtual machine
3) Framework
4) Tools

- Erlang language is the primary way of writing code
- Source code written in Erlang is compiled into bytecode that is executed in the BEAM
- VM parallelized concurrent Erlang programs and takes care of process isolation, distribution, and responsiveness
- The standard part of the release is a framework, _Open Telecom Platform (OTP)_

OTP Framework:
- Concurrency and distribution patterns
- Error detection and recovery in concurrent systems
- Packaging code into libraries
- Systems development
- Live code updates

- OTP is battle tested in many production systems and is a integral part of Erlang
- Tools
	- Compiling Erlang code
	- Starting a BEAM instance
	- Creating deployable releases
	- Running the interactive shell
	- Connecting to the running BEAM instance
- BEAM and tool are cross-platform; can run on UNIX, Linux, and Windows
- Erlang distribution is open source
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Relationship to Microservices</font>
- Erlang is sometimes compared to microservices
- A service is a part of the system running in a separate OS process
- Splitting the system into multiple services can improve system fault tolerance and scalability
- Services can be spread out across multiple machines, which makes the system more resilient against hardware failures
- Multiple instances of services makes the system horizontally scalable
- Erlang concurrency is more fine-grained, compared to microservices
- For a multiplayer game, Erlang can have at least one process per each player as well as per game session
	- Improve responsiveness, provide vertical scalability, and increase fault tolerance
- This cannot be simulated with microservices, since it would require too many OS processes
- On the other hand, microservices such as Docker and Kubernetes simplifies the operational tasks, such as deployment, horizontal scaling, and coarse-grained fault tolerance
- BEAM concurrency and microservices complement each other
- Packaging a BEAM-powered sercies into a Docker container is possible
- Once service is containerized, is can by deployed to a managed environment, such as a Kubernetes cluster
- Erlang has flexible architecture
	- Coarser-grained split, using only a few services aligned with the organization structure
	- In many cases, a plain monolith deployed to a Paas, such as Heroku, Fly.io, or Gigalixir
	- The system can grow in size and complexity, to a microservice architecture


## 1.2 <font style="color:#40E0D0">About Elixir</font>
- _Elixir_ is an alternative language of the Erlang virtual machine
- Cleaner, more compact code
- Open source project started by Jose Valim
- Unlike Erlang, Elixir is more collaborative
- The result of compiling the Elixir source code is BEAM-compliant bytecode files that can run in a BEAM instance and can normally cooperate with pure Erlang code
- Elixir is semantically close to Erlang
	- Many of its constructs map directly to Erlang
- Elixir provides addition constructs that reduce boilerplate and duplication
- Everything in Erlang is possible in Elixir, and vice versa

1. <font style="color:#A8A8A8; text-decoration: underline;">Code Simplification</font>
- A frequently used building block in Erlang concurrent systems is the server process
	- Embed private state and can interact with other processes via messages

_Erlang Code - Add Two Numbers_

```Erlang
-module(sum_server).
-behaviour(gen_server).
 
-export([
  start/0, sum/3,
  init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
  code_change/3
]).
 
start() -> gen_server:start(?MODULE, [], []).
sum(Server, A, B) -> gen_server:call(Server, {sum, A, B}).
 
init(_) -> {ok, undefined}.
handle_call({sum, A, B}, _From, State) -> {reply, A + B, State}.
handle_cast(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, _Extra) -> {ok, State}.
```

_Elixir Code - Add Two Numbers_
```Elixir
defmodule SumServer do
	use GenServer

	def start do
		GenServer.start(__MODULE__,nil)
	end

	def sum(server, a, b) do
		GenServer.call(server, {:sum, a, b})
	end

	def handle_call({:sum, a, b}, _from, state) do
		{:replay, a + b, state}
	end
end
```

- _ExActor_, a Elixir library can further eliminate noise and duplication

```Elixir/ExActor
defmodule SumServer do
	use ExActor.GenServer

	defstart start

	defcall sum(a, b) do
		replay(a + b)
	end
end
```

- A _macro_ is Elixir code that runs at compile time
- Macros take an internal representation of source code as input and can create alternative output
- Inspired by Lisp, not to be confused with C-style macros
- Elixir macros work on an _abstract syntax tree (AST)_ structure, opposed to pure text
	- Easier to perform nontrivial manipulations of input

`def call` is a custom macro that translate to the following:

```Elixir/ExActor
def sum(server, a, b) do
	GenServer.call(server, {:sum, a, b})
end

def handle_call({:sum, a, b}, _from, state) do
	{:reply, a + b, state}
end
```

- Most of Elixir is written in Elixir
- Language constructs like `if` and `unless` are implemented via Elixir macros
- A small core is done in Erlang

2. <font style="color:#A8A8A8; text-decoration: underline;">Composing Functions</font>
- Both Erlang and Elixir are functional languages
- Rely on immutable data and functions that transform data
- Code is divided into many small, reusable, composable functions

Ex. An in-memory model that received XML modules
- Apply the XML to the in-memory module
- Process the resulting changes
- Persist the model

```Erlang
process_xml(Model, Xml) ->
	Model1 = update(Model, Xml),
	Model2 = process_changes(Model1),
	persist(Model2).
```

- Code is not composable, and is error prone
- `Model1` and `Model2` are temporary variables used for the next feed
- To eliminate the temporary variables and inline the calls:

```Erlang
process_xml(Model, Xml) ->
	persist(
		process_changes(
			update(Model, Xml)
		)
	).
```

- This style is know as _staircasing_, and it free of temporary variables, but is difficult to read
- Elixir gives another way to chain multiple function calls together:

```Elixir
def process_xml(model, xml) do
	model
	|> update(xml)
	|> process_changes()
	|> persist()
end
```

- The `|>` pipe operator takes the result of the previous expression and feeds it to the next one as the first argument
- Code is clean, uses no temporary variables, and reads like prose (top to bottom, left to right)
- Functions are treated as data transformations and then combine them in different ways to get the desired effect

3. <font style="color:#A8A8A8; text-decoration: underline;">The Big Picture</font>
- The API for standard libraries is cleaned up and follows some defined convention in Elixir
- Elixir provides syntactic sugar to simplify typical idioms
- Has explicit support for Unicode manipulation
- Elixir provides a tool called _Mix_ that simplifies common tasks, such as creating applications and libraries, managing dependencies, and compiling and testing code
- Package managers, _Hex_, makes is simple to package, distribute, and reuse dependencies
   

## 1.3 <font style="color:#40E0D0">Disadvantages</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Speed</font>
- Erlang programs that run on BEAM, can't achieve the speed of machine-compiled languages, such as C and C++
- The goal is to squeeze out as many requests per second as possible, but to keep performance as predictable and within limits as possible
- Long-running BEAM processes don't block the rest of the system
- A load increases, BEAM can use hardware resources as are available
- If hardware capacity isn't enough, there is system degradation
	- Request take longer to process, but won't be paralyzed
- This is due to the preemptive BEAM scheduler, which performs frequent context switches that keep the system ticking and favours short-running processes
- Intensive CPU computation aren't as performant as C/C++ counterparts
	- May want to implement tasks in C and then integrate component in Erlang system
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Ecosystem</font>
- Erlang is a technology for developing highly available systems that constantly provide service with little or no downtime
	- Battle tested in diverse, large systems for three decades
- Elixir is a modern language that makes development for the Erlang platform much more pleasant
	- Organize code more efficiently and abstracts away boilerplate, noise, and duplications
   
---

# 2. Building Blocks

^12f90b

- Building blocks of the Elixir are modules, functions, and the type system

## 2.1 <font style="color:#40E0D0">The Interactive Shell</font>
- Elixir interactive shell is ran by `iex`
- Running `iex` starts an instance of BEAM and then an interactive Elixir shell inside if
- Runtime information is printed

```shell
iex(1)> 1 + 2 -- Expression
3 -- Result
```

- Everything in Elixir is an expression that has a return value
- Multiline expressions
```Shell
iex(2)> 2 * (
...(2)> 3 + 1
...(2)> ) / 4
2.0
```

- No special characters to indicate the end of an expression
- A line break indicates the end of an expression
- Terminate an active shell by `System.stop` or exiting with `Ctrl-C` twice
- `iex(1)> h` command is used to get basic help
- `iex(1)> h IEx` looks for the documentation of the `IEx` module

## 2.2 <font style="color:#40E0D0">Working with Variables</font>
- Elixir is a dynamic programming language
	- A variable or its type if not explicitly declared
	- When a variable is initialized, the variable is bound to that value

```Shell
iex(1)> monthly_salary = 10000 -- Binds variable
10000
iex(2)> monthly_salary -- Refernce variable
10000
```

- Variable names always starts with a lowercase alphabetic character or an underscore

`valid_variable_name
`also_valid_1
`validButNotRecommended
`NotValid

- Variable names cal also end with the question mark (?) or exclamation mark (!) characters
- Variables can also be rebound to different values

```Shell
iex(3)> monthly_salary = 50000 -- Rebinds variable
50000
```

- Rebinding does not mutate the existing memory location
- It reverses new memory and reassigned the symbolic name to the new location
- Data is immutable
	- One a memory location is occupied with data, is can't be modified until released
- Variables can be rebound
	- Points to a different memory location
- Therefore, variables are mutable, but the data they point to is immutable
- Elixir is a garbage-collected language, which mean memory is released automatically
- When a variable is out of scope, the corresponding memory is eligible for garbage collection and will be released sometime in the future, when the garbage collector cleans up the memory

## 2.3 <font style="color:#40E0D0">Organizing your code</font>
- As a function language, Elixir relies heavily on functions
- A program consists of many small functions that can be organized into modules

1. <font style="color:#A8A8A8; text-decoration: underline;">Modules</font>
- A _module_ is a collection of functions
- Every Elixir function must be defined inside a module
- Elixir comes with a standard library that provides useful modules
	- `IO` module can be used to complete various I/O operations
	- `puts` function from the `IO` module can be used to print a message

```Shell
iex(1)> IO.puts("Hello World!")
Hello World!
:ok
```

- To call a function of a module this syntax is used:
`ModuleName.function_name(args`
- `defmodule` defines your own module and `def` create your own functions

```Elixir
defmodule Geometry do
	def rectangle_area(a, b) do
		a * b
	end
end
```

```shell
$ iex geometry.ex
iex(1)> Geometry.rectangle_area(6, 7)
42
```

- In the source code, a module must be defined in a single file
- A single file may contain server module definitions

```Elixir
defmodule Module1 do
  ...
end
 
defmodule Module2 do
  ...
end
```

- A module starts with an uppercase letter and is written in camel case style
- A module name can consist of alphanumeric characters, underscores, and the dot (.) character

```Elixir
defmodule Geometry.Rectangle do
  ...
end
 
defmodule Geometry.Circle do
  ...
end
```

- Modules can also be nested

```Elixir
defmodule Geometry do
  defmodule Rectangle do
    ...
  end
  ...
end
```

- The inner module can be references with `Geometry.Rectangle`
- The compiled version doesn't record any hierarchical relations between the modules
- Informal scoping can eliminate possible name clashes

2. <font style="color:#A8A8A8; text-decoration: underline;">Functions</font>
- A function must always be part of a module
- Function names follow the same conventions as variables
	- Start with a lowercase letter or underscore character and followed by a combination of alphanumerics and underscores
- The `?` at the end of a name indicates a function that return either `true` or `false`
- The `!` at the end of a name indicates a function that may raise a runtime error
- Functions can be defined using the `def` macro

```Elixir
defmodule Geometry do
  def rectangle_area(a, b) do -- function declaration
    ...
  end
end
```

- A function includes a name, argument list, and body enclosed in `do...end`
- There is no type specification for arguments since its a dynamic language
- `defmodule` and `def` aren't referred to as keywords, instead they are Elixir _macros_
- If a function has no arguments, paretheses can be omited

```Elixir
defmodule Program do
  def run do
    ...
  end
end
```

- The return value of a function is the return value of its last expression
- There is no explicit return in Elixir
- Complex functions use branching and conditional logic
- Functions should be keep short and simple

```Elixir
defmodule Geometry do
  def rectangle_area(a, b), do: a * b
end
```

- Parentheses are optional

```Shell
iex(3)> Geometry.rectangle_area(3, 2)
6
iex(4)> Geometry.rectangle_area 3, 2
6
```

_Using a Code Formatter_

- Elixir ships with a code formatter starting v.1.6, which can format code in consistent style and avoid lower-level style decisions, such as layout or parentheses usage
	- `mix format`
- If a function being called resides in the same module, the module prefix can be omitted

```Elixir
defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end
 
  def square_area(a) do
    rectangle_area(a, a)
  end
end
```

- To combine functions, use _pipe operator_ to pass the result of one function as the argument to the next

```Shell
iex(5)> -5 |> abs() |> Integer.to_string() |> IO.puts()
5
```

- The code above is transformed at compile time

```Shell
iex(6)> IO.puts(Integer.to_string(abs(-5)))
5
```

`prev(arg1, arg2) |> next(arg3, arg4)` -> `next(prev(arg1, arg2), arg3, arg4)`

3. <font style="color:#A8A8A8; text-decoration: underline;">Function Arity</font>
- _Arity_ described the number of arguments a function receives
- A function is uniquely identified by its containing module, name, and arity
`Rectangle.area/2` has an arity of 2

- Function with the same name but different arity are different functions

```Elixir
defmodule Rectangle do
  def area(a), do: area(a, a) 
 
  def area(a, b), do: a * b  
end
```

- A lower-arity function delegates to a higher-arity function, provding some default arguments

```Elikir
defmodule Calculator do
  def add(a), do: add(a, 0)
  def add(a, b), do: a + b
end
```

- `Calculator.add/1 `delegates to `Calculator.add/2`
- This pattern is so frequent that Elixir allows you to specify defaults for arguments by using the `\\` operator followed by the argument's default value
- Defining a default value for argument `b`

```Elixir
defmodule Calculator do
  def add(a, b \\ 0), do: a + b
end
```

- To set default for arguments

```Elixir
defmodule MyModule do
  def fun(a, b \\ 1, c, d \\ 2) do
    a + b + c + d
  end
end
```

- The default values generate multiple functions of the same name with different arities
`MyModule.fun/2
`MyModule.fun/3
`MyModule.fun/4

```Elixir
def fun(a, c), do: fun(a, 1, c, 2)
def fun(a, b, c), do: fun(a, b, c, 2)
def fun(a, b, c, d), do: a + b + c + d
```

- Not acceptable to have a function accept a variable number of arguments
- There is no counterpart of C's `...` or JavaScript's `arguments`

4. <font style="color:#A8A8A8; text-decoration: underline;">Function Visibility</font>
- `def` macro, defines a public function
- In Elixir terms, the function is _exported_
- `defp` macro creates a private function
	- A private function can be used only inside the module it's defined in

```Elixir
defmodule TestPrivate do
  def double(a) do
    sum(a, a)
  end
 
  defp sum(a, b) do 
    a + b
  end
end
---
iex(2)> TestPrivate.sum(3, 4)
** (UndefinedFunctionError) function TestPrivate.sum/2
```

- The private function `sum` cannot be invoked outside the module

5. <font style="color:#A8A8A8; text-decoration: underline;">Imports and Aliases</font>
- Calling functions from another module is achieved by referencing the module name
- The module can also be imported into another module
- Importing a module allows you to call its public functions without prefixing them with the module name

```Elixir
defmodule MyModule do
  import IO 
 
  def my_function do
    puts "Calling imported function."
  end
end
```
   
- Import multiple modules
	- `Kernel` is a standard library module automatically imported into every module
- `alias` makes it possible to reference a module under a different name

```Elixir
defmodule MyModule do
  alias IO, as: MyIO
 
  def my_function do
    MyIO.puts("Calling imported function.")
  end
end
```

- If the alias is the last part of the function, the `as` can be removed

```Elixir
defmodule MyModule do
  alias Geometry.Rectangle
 
  def my_function do
    Rectangle.area(...)
  end
end
```

6. <font style="color:#A8A8A8; text-decoration: underline;">Module Attributes</font>
- Used as compile-time constants
- Register any attribute that can be queried at run time

```Shell
iex(1)> defmodule Circle do
          @pi 3.14159
 
          def area(r), do: r*r*@pi
          def circumference(r), do: 2*r*@pi
        end
 
iex(2)> Circle.area(1)
3.14159
 
iex(3)> Circle.circumference(1)
6.28318
```

- `@pi` defines a module attribute; constant exists only during the compilation of the module, when the references to it are inlined
- Attribute can be registered, stored in the generated binary and can be access at run time
	- `@moduledoc` and `@doc` can be used to provide documentation for modules and functions

```Elixir
defmodule Circle do
  @moduledoc "Implements basic circle functions"
  @pi 3.14159
 
  @doc "Computes the area of a circle"
  def area(r), do: r*r*@pi
 
  @doc "Computes the circumference of a circle"
  def circumference(r), do: 2*r*@pi
end
```

- To compile a file: `elicirc circile.exs`
- Creates a BEAM file: `Elixir.Circle.beam`
- Retrieve the attribute at run time in an interactive shell

```Shell
iex(1)> Code.fetch_docs(Circle)
{:docs_v1, 2, :elixir, "text/markdown",
 %{"en" => "Implements basic circle functions"},
 %{
   behaviours: [],
   source_annos: [{1, 1}],
   source_path: ~c"/Users/fiona_spencer/Desk/LANGUAGES/ELIXIR/circle.exs"
 },
 [
   {{:function, :area, 1}, 5, ["area(r)"],
    %{"en" => "Computes the area of a circle"}, %{source_annos: [{6, 7}]}},
   {{:function, :circumference, 1}, 8, ["circumference(r)"],
    %{"en" => "Computes the circumference of a circle"},
    %{source_annos: [{9, 7}]}}
 ]}
```

- Module documentation: `h Circle`
- Function documentation: `h Circle.area`
- Use `ex_doc toll to generate HTML documentation`
- Registered attributed can be used to attach meta in formation to a module, when can then be used by other Elixir tools
- _Type specification (typespecs)_ are another important feature based on attributes
- This provides information for your functions, which can later be analyzed with a static analysis tool called _dialyzer_

Here is how to extend the `Circle` module to include typespecs

```Elixir
defmodule Circle do
  @pi 3.14159
 
  @spec area(number) :: number -- typespec for area/1
  def area(r), do: r*r*@pi
 
  @spec circumference(number) :: number -- typespec for circumference/1
  def circumference(r), do: 2*r*@pi
end
```

- `@spec` attribute indicates that both functions accept and return a number
- Typespecs provide a way to compensate for the lack of a static type system
- Typespec allow for better documentation of function

Typespec of the function `List.insert_at/3`:
`@spec insert_at(list, integer, any) :: list`

7. <font style="color:#A8A8A8; text-decoration: underline;">Comments</font>
- Comment in Elixir start with the `#` character, which indicates the rest of the line in a comment

```Elixir
# This is a comment
a = 3.14 # so is this
```
   
- Block comments are not supported

## 2.4 <font style="color:#40E0D0">Understanding the Type System</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Numbers</font>
   - Numbers can be integers of floats
   - The division operation return a float value
   - Auto-import `Kernel` functions `div` and `rem`
   - Use underscore characters as visual delimiters
   - No upper limit on integer size
   - An integer takes up as mush space as needed, a float occupies either 32 or 62 bits, depending on the VM
   - Floats are internally represented in the IEEE 754-1985 (binary precision) format

```Elixir
iex(1)> 3
3
iex(2)> 0xFF
255
iex(3)> 3.14
3.14
iex(4)> 1.0e-2
0.01
iex(5)> 1 + 2 * 3
7
iex(6)> 4/2
2.0
iex(7)> 3/2
1.5
iex(8)> div(5,2)
2
iex(9)> rem(5,2)
1
iex(10)> 1_000_000
1000000
```
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Atoms</font>
 - _Atoms_ are literally named constants
 - Atom constants start with a colon character
```Elixir
:an_atom
:another_atom
```

- An atom consists of two parts: the _text_ and the _value_
- The text is characters after the colon and is kept in the _atom table_
- The value is the data that goes into the variable, and is a reference to the atom table

`varaiable = :some_atom`

- Atoms are efficient in both memory and performance
- An _alias_, can be made by omitting the colon and changing the start with an uppercase character

`AnAtom`

- At compile time, the alias is transformed into `:"Elixir.AnAtom`
- The compiler implicitly adds `Elixir.` prefix to the text and generates the atom
- If the alias already contains the prefix, it is not added

```Shell
iex(2)> AnAtom == Elixir.AnAtom
true
```

- Aliases also give alternative names to modules:

```Shell
iex(3)> alias IO, as: MyIO
 
iex(4)> MyIO.puts("Hello!")
Hello!
```

- When an alias is written, the compiler transforms `MyIO` into `IO`
- The final result emitted in the generated binary is `:Elixir.IO`
- Aliases support the proper resolution of modules
- Elixir does not have a dedicated Boolean type, instead uses `:true` and `:false`
- Reference without the starting colon character

```Shell
iex(1)> :true == true
true
iex(2)> :false == false
true
```

- The term _Boolean_ is still used in Elixir to denote an atom that has a value of either the true or false atom
- Standard logical operators: `and, or, not`

```Shell
iex(1)> true and false
false
iex(2)> false or true
true
iex(3)> not false
true
iex(4)> not :an_atom_other_than_true_or_false
** (ArgumentError) argument error
```

- Another special atom is `:nil`, which is similar to `null`
- The atom plays a role in additional support for _truthiness_; which refers to whether a value is considered "true" or "false"
- The atoms `nil` and `false` are treated as _falsy_ values, whereas everything else is a _truthy_ value
- Short-circuit operators: `||, &&, !`

```Shell
iex(1)> nil || false || 5 || true
5
iex(1)> true && 5
5
iex(2)> false && 5
false
iex(3)> nil && 5
nil
```

- The `&&` operator returns the second expression, but only if the first expression is truthy
- Short-circuiting can be used for elegant operation chaining
	- Fetch a value from cache, a local disk, or a remote database
`read_cached() || read_from_disk() || read_from_database()`

- Use `&&` to ensure certain conditions are met
`database_value = connection && read_data(connection)`

3. <font style="color:#A8A8A8; text-decoration: underline;">Tuples</font>
- _Tuples_ are an untyped structures, or records, and they are most used to group a fixed number of elements together

```Shell
iex(1)> person = {"Bob", 25}
{"Bob", 25}
```

- To extract element from the tuple, the `Kernel.elem/2` function, which accepts a tuple and the zero-based index of an element is used

```Shell
iex(2)> age = elem(person, 1)
25
```

- To modify an element of the tuple, the `Kernel.put_elem/3` function is used: tuple, zero-based index, and the new value of the field in the given position

```Shell
iex(3)> put_elem(person, 1, 26)
{"Bob", 26}
```

- The `put_elem` does not modify the tuple, it returns the new version, keeping the old on intact
- Data is immutable, an there is no in-memory modification of a value

```Shell
iex(4)> person
{"Bob", 25}
```

- When a function is called is needs to be stored in another variable

```Shell
iex(5)> older_person = put_elem(person, 1, 26)
{"Bob", 26}
iex(6)> older_person
{"Bob", 26}
```

- Variable can be rebound

```Shell
iex(7)> person = put_elem(person, 1, 26)
{"Bob", 26}
```

- When `person` variable is rebound to the new memory location, the old location is not referenced by any other variable, so it is eligible for garbage collection
- Tuples are used for grouping a small, fixed number of elements together
- When a dynamically sized collection is needed, lists are used

4. <font style="color:#A8A8A8; text-decoration: underline;">Lists</font>
- _Lists_ are used to manage dynamic, variable-sized collections of data
- Resembles an array from other languages

```Shell
iex(1)> prime_numbers = [2, 3, 5, 7]
[2, 3, 5, 7]
```

- Work similar to singly linked lists
- To do something the list must be traversed
- Most operations on lists have an O(n) complexity, including the `Kernel.length/1`

```Shell
iex(2)> length(prime_numbers)
4
```

- The `Enum` modules deals with many different enumerable structures and is not limited to lists
- To get an element of a list, `Enum.at/2` is used

```Shell
iex(3)> Enum.at(prime_numbers, 3)
7
```

- `Enum.at` is a O(n) opertions
	- Iterated from the beginning of the list to the desired element
- For direct access, tuples, maps, or higher-level data structures are used
- To check if a list contains an element use the `in` operator

```Shell
iex(4)> 5 in prime_numbers
true
iex(5)> 4 in prime_numbers
false
```

- To manipulate lists, use functions from the `List` module
	- `List.replace_at/3`

```Shell
iex(6)> List.replace_at(prime_numbers, 0, 11)
[11, 3, 5, 7]
iex(7)> new_primes = List.replace_at(prime_numbers, 0, 11) #store to another variable
[11, 3, 5, 7]
iex(8)> prime_numbers = List.replace_at(prime_numbers, 0, 11) #rebound
[11, 3, 5, 7]
```

- `List.insert_at/3` 

```Shell
iex(9)> List.insert_at(prime_numbers, 3, 13)
[11, 3, 5, 13, 7]
iex(10)> List.insert_at(prime_numbers, -1, 13)      ❶
[11, 3, 5, 7, 13]
```

- To append to the end `-1` index is used
- Modifying an arbitrary element has a complexitu of $O(n)$
- Appending to the end is expensive since it always takes $n$ steps, with $n$ being the length
- `++` concatenates two lists

```Shell
iex(11)> [1, 2, 3] ++ [4, 5]
[1, 2, 3, 4, 5]
```

- Complexity if $O(n)$, with $n$ being the length of the left list
- Avoid adding element to the end
- Lists are most efficient when new elements are pushed to or popped from the top
- A list can be represent as a recursive structure with a _(head, tail)_
	- _Head_ is the first element
	- _Tail_ points to the _(head, tail)_ of the remaining elements
`a_list = [head | tail]`
- `head` can by any type of data, whereas `tail` is a list
- The end of the list is when `tail` is an empty list

```Shell
iex(1)> [1 | []]
[1]
iex(2)> [1 | [2 | []]]
[1, 2]
iex(3)> [1 | [2]]
[1, 2]
iex(4)> [1 | [2, 3, 4]]
[1, 2, 3, 4]
```

- Use functions `hd` and `tl`, to get the head and tail, respectively

```Shell
iex(1)> hd([1, 2, 3, 4])
1
iex(2)> tl([1, 2, 3, 4])
[2, 3, 4]
```

- Both operations are $O(n)$ because they amount to reading one or the other value from the _(head, tail)_ pair
- Tail can be any type
	- A non-list tail is a improper list that has special use cases

```Shell
iex(1)> a_list = [5, :value, true]
[5, :value, true]
 
iex(2)> new_list = [:new_element | a_list]
[:new_element, 5, :value, true]
```

- Construction of a `new_list` is an _O(1)_ operation, and no memory copying occurs

5. <font style="color:#A8A8A8; text-decoration: underline;">Immutability</font>
- Every function return the new, modified version of the input data
- The new version is either rebind or assigned to another variable

Modifying Tuples
- The modification of the input will result in some data copying, but generally, most of the memory will be shared between the old and new versions
- A modified tuple is always a complete, shallow copy of the old version

```Shell
a_tuple = {a, b, c}
new_tuple = put_elem(a_tuple, 1, b2)
```

![[Pasted image 20250205111229.png|250]]![[Pasted image 20250205111450.png|320]]

- Both tuples reference variables `a` and `c`, that are shared (and not duplicated) between both tuples
- After rebinding the variable, the old location of `a_tuple` is not accessible and is available for garbage collection
	- This is the same for variable `b`

Modifying Lists
- When the $n$-th element of a list is modified, the new version will contain shallow copies of the first $n - 1$ element followed by the modified element
- After the modified element, the tails are completely shared
- Appending a new element to the tail is expensive, since it iterated and (shallow) copies the entire list
- In contrast, pushing an element does not copy anything

![[Pasted image 20250205111951.png|330]]![[Pasted image 20250205112004.png|300]]

- Best to push consecutive element to the top, and then, after a list is constructed, reverse the entire list in a single pass

Benefits
1) Side-effect-free functions
	1) Well defined inputs and outputs
	2) Easier to analyze, understand, and test
	3) No implicit variable change
2) Data consistency

- Elixir is not a pure function language, and may still have side effects
	- Writing to a file and issue a database or network call may cause an error
	- Although it is certain a function won't modify the value of any variable

- More complicated programs are written by combining simpler transformations

```Shell
def complex_transformation(data) do
  data
  |> transformation_1(...)
  |> transformation_2(...)
  ...
  |> transformation_n(...)
end
```

- The advantage of atomic in-memory operations is that transformations can be rolled back, and return a value in it original state

```Shell
def complex_transformation(original_data) do
  original_data
  |> transformation_1(...)
  |> transformation_2(...)
  ...
end
```

6. <font style="color:#A8A8A8; text-decoration: underline;">Maps</font>
- A _map_ is a key-value store, where keys and values can be any term
- Maps have dual usage in Elixir
	- Dynamically sized key-value structures
	- Manage simple records

Dynamically Sized Maps
- An empty map can be created with the `%{}` expression

`iex(1)> empty_map = %{}`

- Values are created by:

`iex(2)> squares = %{1 => 1, 2 => 4, 3 => 9}`

- Pre-populate a map with the `Map.new/1` function that takes an enumerable where each element is a tuple of size 2 (a pair)

```Shell
iex(3)> squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
%{1 => 1, 2 => 4, 3 => 9}
```

- To fetch a value at the given key

```Shell
iex(4)> squares[2]
4
iex(5)> squares[4]
nil
```

- `Map.get/3` will also return the value, given a map, key, and specify default value if key is not found

```Shell
iex(6)> Map.get(squares, 2)
4
iex(7)> Map.get(squares, 4)
nil
iex(8)> Map.get(squares, 4, :not_found)
:not_found
```

- To precisely check if there is a value under the given key or value: `Map.fetch/2`

```Shell
iex(9)> Map.fetch(squares, 2)
{:ok, 4}
iex(10)> Map.fetch(squares, 4)
:error
```

- To raise an exception when a key is not found: `Map.fetch!/2`

```Shell
iex(11)> Map.fetch!(squares, 2)
4
 
iex(12)> Map.fetch!(squares, 4)
** (KeyError) key 4 not found in: %{1 => 1, 2 => 4, 3 => 9}
    (stdlib) :maps.get(4, %{1 => 1, 2 => 4, 3 => 9})
```

- To store a new element to the map: `Map.put/3`

```Shell
iex(13)> squares = Map.put(squares, 4, 16)
%{1 => 1, 2 => 4, 3 => 9, 4 => 16}
iex(14)> squares[4]
16
```

- A map is also enumerable, which means all the functions from the `Enum` modules can work with maps

Structured Data
- Maps are used for managing key-value data structures of an arbitrary size
- They are also used to combine a couple of fields into a single structure
- Similar to tuples, but provides the advantage of allowing you to access field by names
`iex(1)> bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}`

- If keys are atoms, then:
`iex(2)> bob = %{name: "Bob", age: 25, works_at: "Initech"}`

- To retrieve a field, use the `[]` operator

```Shell
iex(3)> bob[:works_at]
"Initech"
iex(4)> bob[:non_existent_field]
nil
```

- Atom keys can fetch there value
`iex(5)> bob.age #5`

- To change a field value:
```Shell
iex(7)> next_years_bob = %{bob | age: 26}
%{age: 26, name: "Bob", works_at: "Initech"}
```

- This syntax can be used to change multiple attributes

```Shell
iex(8)> %{bob | age: 26, works_at: "Initrode"}
%{age: 26, name: "Bob", works_at: "Initrode"}
```

- Only modify values that already exist in the male
- This makes the update syntax a perfect choice for powering maps that represent structures
- An runtime error occurs, if the key is worg
- Using maps to hold structued data is a frequence pattern
- The common pattern is to provide all fields while creating the map, using atoms as keys
- If the values is not available it is set to `nil`
- Modify the map with update expression `{a_map|key: value}` and fetch a desired field with the `a_map.some_field` expression
   
7. <font style="color:#A8A8A8; text-decoration: underline;">Binaries and Bitstrings</font>
- A binary is a chunk of bytes
- Elixir uses 8-bit bytes
- Create binaries by enclosing the byte sequence between `<<>>` 

```Elixir
iex(1)> <<1, 2, 3>> #Three bit binary
<<1, 2, 3>>
```

- Each number represents the value corresponding byte
- A value greater than 255, is truncated
- Elixir only keeps the least significant 8 bits (rightmost part)

```Shell
iex(2)> <<256>>
<<0>> #1 0000 0000
 
iex(3)> <<257>>
<<1>> #1 0000 0001
 
iex(4)> <<512>>
<<0>> #10 0000 0000
```

 - Specify the size of each value by telling the compiler how many bits to use for that particular value
`
```Shell
iex(5)> <<257::16>>
<<1, 1>>
```

- $257$ is placed into a 16-bit consecutive memory space
- The output indicates that you use 2 bytes, both with a value of 1
- This is due to the binary representation of 257, which in 16-bit form is 0000 0001 0000 0001
- The size specifier is in bits and need not be a multiplier of 8
- The following creates a binary by combining two 4-bit values

```Shell
iex(6)> <<1::4, 15::4>>
<<31>>
```

- The resulting `<<31>>` has 1 byte and is represented in the output using normalized form $(0001 1111)_2$
- The total size of all the values isn't a multiple of 8, the binary is called the _bitstring_
- A sequence of bits

```Shell
iex(7)> <<1::1, 0::1, 1::1>>
<<5::size(3)>> #111
```

- Concatenate two binaries or bitstring with the `<>` operator

```Shell
iex(8)> <<1, 2>> <> <<3, 4>>
<<1, 2, 3, 4>>
```

- Binaries are consecutive sequences of bytes
- Binaries play an important role in support for strings

8. <font style="color:#A8A8A8; text-decoration: underline;">Strings</font>
- Elixir does not have a dedicated string type
- Instead, strings are represented using either a binary or a list type

Binary Strings
- The most common way to use strings is to specify them with the familiar double quote syntax

```Shell
iex(1)> "This is a string"
"This is a string"
```
  
- The result is printed as a string, but is binary underneath
- Embed string expressions: `#{}` to place an expression in a string constant
- Expression is immediately evaluated, and the string representation is placed in the corresponding locations

```Shell
iex(2)> "Embedded expression: #{3 + 0.14}"
"Embedded expression: 3.14"
```

- `\` escape sequencing and multiline strings

```Shell
iex(3)> "\r \n \" \\"
iex(4)> "
        This is
        a multiline string
        "
```

- _Sigils_, are another way for declaring strings: `~s()`
	- Used for strings that use quotes
	- Uppercase version `~S` does not handle interpolation of escape characters

```Shell
iex(5)> ~s(This is also a string)
"This is also a string"
iex(6)> ~s("Do... or do not. There is no try." -Master Yoda)
"\"Do... or do not. There is no try.\" -Master Yoda"
iex(7)> ~S(Not interpolated #{3 + 0.14})
"Not interpolated \#{3 + 0.14}"
iex(8)> ~S(Not escaped \n)
"Not escaped \\n"
```

- _Heredocs_ syntax supports better formatting for multiline strings
- Starts and ends with triple double-quote on its own line

```Shell
iex(9)> """
        Heredoc must end on its own line """
        """
"Heredoc must end on its own line \"\"\"\n"
```

- Since strings are binaries, they are concatenated with the `<>` operator

```Shell
iex(10)> "String" <> " " <> "concatenation"
"String concatenation"
```

- Helper functions are found in the `String` module

Character Lists
- A _character list (charlsit)_ is a list in which each element is an integer code point of the corresponding character
- `[ABC]` is represented as `[65, 66, 67]`
- Also created by a `~c` sigil, or single quotes

```Shell
iex(1)> IO.puts([65, 66, 67])
ABC
iex(2)> IO.puts(~c"ABC")
ABC
iex(3)> IO.puts('ABC')
ABC
```

- Character lists are printed in the shell using the `~c` syntax

```Shell
iex(4)> ~c"ABC"
~c"ABC"
iex(5)> [65, 66, 67]
~c"ABC"
iex(6)> 'ABC'
~c"ABC"
```

- Character lists are not compatible with binary string
- Most operations from the `String` module don't work with character lists
- In general, prefer binary strings over character lists
- Convert a binary string to a character list version: `String.to_charlist/1`

```Shell
iex(7)> String.to_charlist("ABC")
~c"ABC"
```

- Conversely, convert a character list to a binary string: `List.to_string/1`

```Shell
iex(8)> List.to_string(~c"ABC")
"ABC"
```

9. <font style="color:#A8A8A8; text-decoration: underline;">First-Class Functions</font>
- A function is a first-class citizen, which means it can be assigned to a variable
- Function definition itself is assigned, and can use the variable to call the function

```Shell
iex(1)> square = fn x ->
          x * x
        end
```

- Create a function variable by using the `fn` expression
- The variable `square` contains a function that computes the square of a number
- The function is an _anonymous/lambda_ function, since it is not bound to a global name
- Convention is to omit parentheses for argument list
- A list of arguments to a names function should be enclosed in parentheses
- Call this function by specifying the variable name followed by a dot `(.)` and arguments

`iex(2)> square.(5) #25`

- In contrast, `square(5)` is invoking a names function defined somewhere else in the module
- Since functions can be stored as variable, they can be passed as arguments to other functions
- This is used to allow client to parameterize generic logic
	- `Enum.each/2` implements the generic iteration, iterate over anything enumerable, such as lists
	- The function takes two arg: an enumerable and a one-arity lambda
	- Iterates through the enumerable and calls the lambda function for each element
	- `fn x -> IO.puts(x) end`, can further be simplified to `&IO.puts/1`

```Shell
iex(3)> print_element = fn x -> IO.puts(x) end  
iex(4)> Enum.each(
          [1, 2, 3],
          print_element                        
        )
 
1
2
3
 
:ok
# with no temp variable
iex(5)> Enum.each(
          [1, 2, 3],
          fn x -> IO.puts(x) end
        )
 
1
2
3
# Capture operator
iex(6)> Enum.each(
          [1, 2, 3],
          &IO.puts/1    ❶
        )
```

- The `&` operator, known as the _capture_ operator, takes the full function qualifier and turns into a lambda
	- Module name, function name, and an arity
- The capture operator can be used to shorten lambda definition, omitting explicit argument naming

`iex(7)> lambda = fn x, y, z -> x * y + z end`
- to a more compact form:
`iex(8)> lambda = &(&1 * &2 + &3)`

- Creates a 3-arity lambda, each argument is referred to via the `&n` placeholder, which identifies the $n$-th argument

`iex(9)> lambda.(2, 3, 4) #10`

Closures
- A lambda can reference any variable from the outside scope

```Shell
iex(1)> outside_var = 5
5
 
iex(2)> my_lambda = fn ->
  IO.puts(outside_var)
end
 
iex(3)> my_lambda.()
5
```

- _Closure_; by holding a reference to the lambda, you indirectly hold a reference to all variables it uses, even if those variable are from external scope
- A closure always captures a specific memory location
- Rebinding a variable does not affect the previously defined lambda is referenced

```Shell
iex(1)> outside_var = 5
iex(2)> lambda = fn -> IO.puts(outside_var) end 
iex(3)> outside_var = 6                         
iex(4)> lambda.()                                 
5
```

- The original memory location is not eligible for garbage collection since the `lambda function` captures it's location and is still referencing it

10. <font style="color:#A8A8A8; text-decoration: underline;">Other Built-In Types</font>
- A _reference_ is an almost unique piece of information BEAM instance
	- Generated by calling `Kernel.make_ref/0` or `make_ref`
	- A reference will reoccur after approximately $2^{82}$ calls
- A _process identifier (PID)_ is used to identify an Erlang process
	- Used when cooperating between concurrent tasks
- The _port identifier_ is important when using ports
	- Mechanism used in Erlang to talk to the outside world
	- File I/O communication with external programs

11. <font style="color:#A8A8A8; text-decoration: underline;">Higher-Level Types</font>
- The built-in types are inherited fro the Erlang world
- Elixir provides some high-level abstraction
	- `Range, Keyword, MapSet, Date, Time, NaiveDateTime, DateTime`

Range
- A _range_ is an abstraction that allows you to represent a range of numbers
- Use `in` operator within a range

```Shell
iex(1)> range = 1..2
iex(2)> 2 in range
true
iex(3)> -1 in range
false
```

- Ranges are enumerable
- `Enum.each/2`, iterates through an enum

```Shell
iex(4)> Enum.each(
          1..3,
          &IO.puts/1
        )
 
1
2
3
```

- Internally, range is represented as a map that contains range boundaries
- Range memory footprint is small and constant, regardless of the number of elements it represents

Keyword Lists
- A _keyword_ list is a special case of a list, where each element is a 2-element tuple, and the first element is an atom
- Second element can be any tupe

`iex(1)> days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]`

- Shorter syntax

`iex(2)> days = [monday: 1, tuesday: 2, wednesday: 3]`

- Keyword lists are used for small-size key-value structures, where keys are atoms
- Function are available in the `Keyword` module
- Use `Keyword.get/2` or `[]`to fetch a value for a key 

```Shell
iex(3)> Keyword.get(days, :monday)
1
iex(4)> Keyword.get(days, :noday)
nil
iex(5)> days[:tuesday]
2
```

- Complexity lookup is $O(n)$
- Keyword lists are more useful for allowing clients to pass an arbitrary number of optional arguments
- `IO.inspect`, prints a string representation of a term to the console

```Shell
iex(6)> IO.inspect([100, 200, 300]) 
[100, 200, 300]                                 
 
iex(7)> IO.inspect([100, 200, 300], [width: 3])  #passes addition options
[100,                                            
 200,                                            
 300]
```

- Pattern is so frequent the square brackets can be omitted if the last argument is a keyword list

```Shell
iex(8)> IO.inspect([100, 200, 300], width: 3, limit: 1)
[100,
 ...]
```

- Although `IO.inspect/2` has a arity of 2, it can simulate optional arguments
- To create a function, after the keyword list as the last argument, make a argument default to an empty list

```Shell
def my_fun(arg1, arg2, opts \\ []) do
  ...
end
```

- Therefore, clients can pass options via the last argument
- A keyword list can contain multiple values for the same key
- Control the ordering of keyword list elements, not possible with maps
- Functions in standard libraries of Elixir and Erlang take their options as keyword lists

MapSet
- A `MapSet` is the implementation of a set, a store of unique values, where a value can be of any type

```Shell
iex(1)> days = MapSet.new([:monday, :tuesday, :wednesday])  ❶
MapSet.new([:monday, :tuesday, :wednesday])
 
iex(2)> MapSet.member?(days, :monday)                       ❷
true     
 
iex(3)> MapSet.member?(days, :noday)                        ❸
false     
 
iex(4)> days = MapSet.put(days, :thursday)                  ❹
MapSet.new([:monday, :tuesday, :wednesday, :thursday])
```

❶ Creates a MapSet instance

❷ Verifies the presence of the existing element

❸ Verifies the presence of a nonexisting element

❹ Puts a new element in the MapSet

- `MapSet` is also enumerable, but does not preseve ordering

```Shell
iex(5)> Enum.each(days, &IO.puts/1)
monday
thursday
tuesday
wednesday
```


Times and Dates
- `Date, Time, DateTime, NaiveDateTime`
- Date is create with the `~D` sigil

```Shell
iex(1)> date = ~D[2023-01-31] #January 31, 2023
~D[2023-01-31]
```

- Retrieve individual fields

```Shell
iex(2)> date.year
2023
iex(3)> date.month
1
```

- `~T` sigil, represents time, by providing hours, minutes, seconds, and milliseconds

```Shell
iex(1)> time = ~T[11:59:12.00007] #HH:MM:SS:MS
iex(2)> time.hour
11
iex(3)> time.minute
59
```

- Use `Date` and `Time` modules
- `~N` sigil and `~U` sigil for `NaiveDateTime` and `DateTime` modules, respectively

```Shell
iex(1)> naive_datetime = ~N[2023-01-31 11:59:12.000007]
iex(2)> naive_datetime.year
2023
iex(3)> naive_datetime.hour
11
iex(1)> datetime = ~U[2023-01-31 11:59:12.000007Z]
iex(2)> datetime.year
2023
iex(3)> datetime.hour
11
iex(4)> datetime.time_zone
"Etc/UTC"
```


12. <font style="color:#A8A8A8; text-decoration: underline;">IO Lists</font>
- An IO list is a special sort of list that's useful for incrementally building output that be displayed on an I/O devices (network or file)
- Each element of an IO List has:
	- An integer in the range of 0 to 255
	- A binary
	- An IO list
- IO lists are deeply nested structures in which leaf elements are plain bytes

`iex(1)> iolist = [[[~c"He"], "llo,"], " worl", "d!"] #"Hello, world!"`

- Under the hood, the structure is flattened, and is human-readable
- Same effect if you send an IO list to a file or a network socket
- IO lists are useful when you need to incrementally build a stream of bytes
- Appending to an IO list is $O(n)$ because nesting use used

```Shell
iex(3)> iolist = []                            
iolist = [iolist, "This"]                       
iolist = [iolist, " is"]                       
iolist = [iolist, " an"]                        
iolist = [iolist, " IO list."]                  
 
[[[[[], "This"], " is"], " an"], " IO list."]
```

## 2.5 <font style="color:#40E0D0">Operators</font>
- Most of the operators are defined in the `Kernel`
	- Arithmetic: `+, -, \*, and /`
- Comparison opeartors
	- Division always returns a float
	- Strict equality/inequality: `\=\==, !==`
	- Weak equality/inequality: `=\=, !=`
	- Less than, greater than, less than or equal, greater than or equal: `<, >, >=, <=`

- Strict and weak equality

```Shell
iex(1)> 1 == 1.0    ❶
true
iex(2)> 1 === 1.0   ❷
false
```

- Logical operators: `and, or, not`
- `&&` returns the first expression if it's falsy
- `||` operator returns the first expression if it's truthy
- The unary operator `!` return `false` if the value is truthy

- Many operators are functions
- `a+b` can be called using `Kernel.+(a,b)`
- Create a two-arity lambda that sums two numbers by calling `&Kernel.+1/2` or `&+/2`

## 2.6 <font style="color:#40E0D0">Macros</font>
- Macros are one of the most important features in Elixir, and not in Erlang
- Powerful code transformations at compile time, reducing boilerplate and providing elegant, mini-DSL expressions
- A _macro_ consists of code that can change the semantics of the input code
- A macro is always called at compile time, it receives the parsed representation of the input, and returns an alternative version
- `unless` is a simple macro

```Elixir
unless some_expression do
  block_1
else
  block_2
end
```

- Macros has access to the expression and both blocks in separate variables, since you are already working on a parsed source representation
- `if`, `defmodule`, and `def` are all macros
- Macros are compile-time code transformers that produce alternative code

Special Forms
- Constructs are called _special forms_
	- Capture `&(...)`, `for` comprehension, `receive` expression, and `tey` blocks

## 2.7 <font style="color:#40E0D0">Understanding the Runtime</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Modules and Functions in the Runtime</font>
- The Elixir runtime is a BEAM instance
- Once the compiling is done and the system is started, Erlang takes control
- OS process for the BEAM instance is started, and everything runs inside that process
- Look up OS process under `beam`
- When system is started, functions are called from modules
- VM track of all modules loaded in-memory
- When a function is called from a module, BEAM first checks whether the module is loaded
- If it is, the code of the corresponding function is executed
- If not, VM finds the compiled module file (bytecode) and loads from disk to execute the function
- Each compiled module resides in a separate file and has the extension `.beam`
- If multiple modules are defined in a single source file, the compiler will produce multiple `.beam` files
- To call the Elixir compiler and produce executable: `elixirc source.exs`
- In runtime, module names are aliases, and aliases are atoms
- To compile and run the in-memory bytecode: `iex source.exs`

Pure Erlang Modules
- Calls the get_path function os the pure Erlang :code module `code.get_path`
- Modules correspond to atoms
- On the disk a file named `code.beam` contains the compiled code of the `:code` modules
- To create modules with simple names in Elikir

```Shell
defmodule :my_module do
  ...
end
```

- At run time, module names are atoms

Dynamically Calling Functions
- `Kernel.apply/3`

```Shell
iex(1)> apply(IO, :puts, ["Dynamic function call."])
Dynamic function call.
```

- Receives three arguments: module atom, function atom, and list of arguments
- _Module, function, arguments (MGA)_ contains all the information needed to call an exported (public) function

2. <font style="color:#A8A8A8; text-decoration: underline;">Starting the Runtime</font>
- Many ways to start BEAM

Interactive Shell
- When a shell is started `iex`, the BEAM instance is started underneath, and the Elixir shell takes control
- The shell takes the input, interprets it, and prints the result
- Modules are always compiles and loaded in-memory

Running Scripts
- `elixir` command runs a single Elixir source file

When this starts
1) The BEAM instance is started
2) The file source.ex is compiled in-memory, and the resulting modules are loaded to the VM, no .beam file is generated
3) Code the resides outside of a module is interpreted
4) Once finished, BEAM is stopped

- Elixir scripts are often have a trailing $s$ in `.exs` to indicate it's a script

```Elixir
defmodule MyModule do
  def run do
    IO.puts("Called MyModule.run")
  end
end
 
MyModule.run #outside code is executed immediately
```

- Using `--no-halt` option keeps the entire system alive and running
- The `mix` tool is used to manage projects made up of multiple source file
- `mix new project_name`
- This creates a new folder, containing a few subfolders and files
- `mix compile` compiles the project
- The compilation goes through all the files from the lib folder and places the resulting .beam files in the ebin folder
- Invoke a single function: `mix run -e "IO.puts(MyProject.hello()) #world"`
- Generator also create a couple of tests with `mix test`

```Shell
$ mix test
..
 
Finished in 0.03 seconds
2 tests, 0 failures
```

- The Mix project ensures the ebin folder is in the load path, so the VM can find modules
- 

---

# 3. Control Flow
^890f05

- Conditionals and loops are low-level idioms of the language
- Classical conditional constructs, such as `if` and `case` are often replaced with multi-clause functions, and there are no loop statements, `while`

## 3.1 <font style="color:#40E0D0">Pattern Matching</font>
- The `=` operator is a _match operator_, and the assignment-like expression is an example of _pattern matching_
- Pattern matching makes manipulations with complex variables (eg. tuples, and lists) a lot easier

1. <font style="color:#A8A8A8; text-decoration: underline;">The Match Operating</font>
- At run time, the left side of the `=` operator is matched to the right side
- The left side is called a _pattern_, whereas on the right side, there is an expression that evaluates to an Elixir term

`iex(1)> person = {"Bob", 25}`

- A variable always matches the right-side term, and it becomes _bound_ to the value of that term

2. <font style="color:#A8A8A8; text-decoration: underline;">Matching Tuples</font>

`iex(1)> {name, age} = {"Bob", 25}`
- This expression assumes that the right-side term is a tuple of two elements
- Variables `name` and `age` are bound to the corresponding elements in the tuple

```Shell
iex(2)> name
"Bob"
 
iex(3)> age
25
```
   
- Used to bind individual elements of that tuple to separate values
- The date and time can be decomposed

```Shell
iex(4)> {date, time} = :calendar.local_time()
iex(5)> {year, month, day} = date
iex(6)> {hour, minute, second} = time
iex(7)> {name, age} = "can't match"
** (MatchError) no match of right hand side value: "can't match"
```

- When an error is raised, control is immediately transferred to code somewhere up the call chain, which catches the error
- Match expression also returns a value
- The result of a match expression is always the right-side term

```Shell
iex(8)> {name, age} = {"Bob", 25} 
{"Bob", 25}  
```

3. <font style="color:#A8A8A8; text-decoration: underline;">Matching Constants</font>
- Constants can be placed to the left of `=`, which proves `=` is not an assignment operator
`iex(2)> person = {:person, "Bob", 25}`

- The first element is a constant atom `:person`, which you use to denote that this tuple represents a person
- After the match, the remaining elements of the tuple are bound to the variables `name` and `age`

```Shell
iex(3)> {:person, name, age} = person
{:person, "Bob", 25}
iex(4)> name
"Bob"
iex(5)> age
25
```

- A common idiom in Elixir is returning either `{:ok, result}` or `{:error, reason}`
`{:ok, contents} = File.read("my_app.config")`

1) An attempt to open and read the file takes place
2) If the attempt succeeds, the file contents are extracts to the variable `contents`
3) If the attempt fails, an error is raised
	1) The result of `File.read` is a tuple in the form `{:error, reason}`

4. <font style="color:#A8A8A8; text-decoration: underline;">Variables in Patterns</font>
 - A variable on the left matches and is bound to the term on the right side
- An _anonymous variable ( \_ )_ is used to match terms, but not bound the term to a variable

```Shell
iex(1)> {_, time} = :calendar.local_time()
iex(2)> time
 
{20, 44, 18}
```

- A descriptive names can also be used

`iex(1)> {_date, time} = :calendar.local_time()`

- The `_date` is an anonymous variable, that can be used, but the compiler will emit a warning
- Patterns cab be arbitrarily nested

```Shell
iex(3)> {_, {hour, _, _}} = :calendar.local_time()
 
iex(4)> hour
20
```

- A variable can be referenced multiple times in the same pattern

```Shell
iex(5)> {amount, amount, amount} = {127, 127, 127}
{127, 127, 127}
 
iex(6)> {amount, amount, amount} = {127, 127, 1}
** (MatchError) no match of right hand side value: {127, 127, 1}
```

- A _pin operator (^)_ is used to match against the contents of the variable

```Shell
iex(7)> expected_name = "Bob"                   
"Bob"
 
iex(8)> {^expected_name, _} = {"Bob", 25}        
{"Bob", 25}
 
iex(9)> {^expected_name, _} = {"Alice", 30}      
** (MatchError) no match of right hand side value: {"Alice", 30}
```

- Using `^expected_name` in patterns indicates you expect the value of the variable _expected_name_ to be in the position on the right-side term
- Same as hardcoding the pattern `{"Bob", _}`
- The bin operator does not bind the variable, variable is already bound to a value, and it is being matched against a value

5. <font style="color:#A8A8A8; text-decoration: underline;">Matching Lists</font>
- The following decomposes a three-element list

```Shell
iex(1)> [first, second, third] = [1, 2, 3]
[1, 2, 3]
```

- Matching lists is more often done by relying on their recursive nature
- Each non-empty list is a recursive structure (head, tail)
- Pattern matching can separate these two element into variables

```Shell
iex(3)> [head | tail] = [1, 2, 3]
[1, 2, 3]
iex(4)> head
1
iex(5)> tail
[2, 3]
```

- Calculating the smallest element

```Shell
iex(6)> [min | _] = Enum.sort([3,2,1])
iex(7)> min
1
```

6. <font style="color:#A8A8A8; text-decoration: underline;">Matching Maps</font>
- To match a map, the following syntax can be used

```Shell
iex(1)> %{name: name, age: age} = %{name: "Bob", age: 25}
%{age: 25, name: "Bob"}
iex(2)> name
"Bob"
iex(3)> age
25
```

- Left-side pattern does not need to contain all the keys from the right

```Shell
iex(4)> %{age: age} = %{name: "Bob", age: 25}
iex(5)> age
25
```

- Partial-matching rule is used to represent structured data
- Although, a match will fail if the pattern contains a key that is not in the matched term

7. <font style="color:#A8A8A8; text-decoration: underline;">Mathcing Bitstrings and Binaries</font>
- _Bitstring_ is a chuck of bits, and a _binary_ is a special case of a bitstring that always aligned to the byte size

```Shell
iex(1)> binary = <<1, 2, 3>>
<<1, 2, 3>>
iex(2)> <<b1, b2, b3>> = binary    
<<1, 2, 3>>
iex(3)> b1
1
iex(4)> b2
2
iex(5)> b3
3
```

- The following takes the binary apart by taking its first byte into one variable and the rest of the binary into another

```Shell
iex(6)> <<b1, rest :: binary>> = binary
<<1, 2, 3>>
iex(7)> b1
1
iex(8)> rest
<<2, 3>>
```

- `rest::binary` states that an arbitrarily sized binary is expected
- The following splits an single byte into two 4-bit values

```Shell
iex(9)> <<a :: 4, b :: 4>> = << 155 >> #1001 1011
<< 155 >>
 
iex(10)> a #1001
9
 
iex(11)> b #1011
11
```

- Matching bitstrings and binaries is useful to parse binary content that comes form a file, an external device, or a network
- Binary matching is used to extract separate bits and bytes

Matching Binary Strings

- Strings are binaries and can extract individual bits

```Shell
iex(13)> <<b1, b2, b3>> = "ABC"
"ABC"
iex(13)> b1
65
iex(14)> b2
66
iex(15)> b3
67
```

- A more useful pattern is to match the beginning of the string

```Shell
iex(16)> command = "ping www.example.com"
"ping www.example.com"
 
iex(17)> "ping " <> url = command    
"ping www.example.com"
 
iex(18)> url
"www.example.com"
```

- Construct a string that holds `ping`
- The command is deconstructed, and the command variable is a binary string starting with `"ping "`
- The rest of the string is bound to `url`


8. <font style="color:#A8A8A8; text-decoration: underline;">Compound Matches</font>
- Patterns cab be arbitrarily nested

`iex(1)> [_, {name, _}, _] = [{"Bob", 25}, {"Alice", 30}, {"John", 35}]
`
- A match expression has this general form

`pattern = expression`

1) The expression on the right side is evaluated
2) The resulting value is matched against the left-side pattern
3) Variables from the pattern are bound
4) The result of the match expression is the result of the right-side term

- Match expressions can be chained:

```Shell
iex(3)> a = (b = 1 + 3)
4
```

1) The expression `1 + 3` is evaluated
2) The result is matched against the pattern `b`
3) The result of the inner match is matched against the pattern `a`

- Both `a` and `b` have the value `4`
- The result is the same because the `=` operator is right-associative

```Shell
iex(5)> :calendar.local_time()
{{2023, 11, 11}, {21, 28, 41}}
iex(6)> date_time = {_, {hour, _, _}} = :calendar.local_time()
iex(7)> {_, {hour, _, _}} = date_time = :calendar.local_time()
iex(8)> date_time
{{2023, 11, 11}, {21, 32, 34}}
iex(9)> hour
21
```

- This works because the result of a pattern match is always the result of the term being matched
- Successively match against the result of the term and extract different parts of interest
   
9. <font style="color:#A8A8A8; text-decoration: underline;">General Behavior</font>
- The pattern-matching expression consists of two parts
	- The pattern
	- And term
- In match expression, there is an attempt to match the term to the pattern
- If match succeed, all variables in the pattern are bound
	- The result of the entire expression is the entire term
- If match fails, an error is raised

- 2 tasks of pattern-expression
	- Assert your expectations about the right-side term
	- Bind some parts of the term to variables from the pattern
- The match operator `=` is one example in which pattern matching can be used
   
## 3.2 <font style="color:#40E0D0">Matching with Functions</font>
- The pattern-matching mechanism is used in the specification of function arguments

```Elixir
def my_fun(arg1, arg2) do
  ...
end
```

- The arguments specifiers are patterns
- If geometry manipulation is done, it represents a rectangle with a tuple, `{a, b}`, containing the rectangle's sides

```Elixir
defmodule Rectangle do
  def area({a, b}) do
    a * b
  end
end
```

- The function `Rectangle.area/1` expects the argument is a two-element tuple
- Then binds corresponding tuple elements into variables and returns the result
- Pattern matching function arguments is used in one of the most important features: _multiclause functions_

1. <font style="color:#A8A8A8; text-decoration: underline;">Multiclause Functions</font>
- Elixir allows you to overload a function by specifying multiple causes
- A _clause_ is a function definition specified by the `def` expression
- A function with multiple clauses is the same function with multiple definitions and the same arity

```Elixir
rectangle = {:rectangle, 4, 5}
square = {:square, 5}
circle = {:circle, 4}
```

```Elixir
defmodule Geometry do
  def area({:rectangle, a, b}) do     
    a * b
  end
 
  def area({:square, a}) do          
    a * a
  end
 
  def area({:circle, r}) do          
    r * r * 3.14
  end
end
```

```Shell
iex(1)> Geometry.area({:rectangle, 4, 5})
20
 
iex(2)> Geometry.area({:square, 5})
25
 
iex(3)> Geometry.area({:circle, 4})
50.24
```

- When a function is called, the runtime goes through each of its clauses in order, and matched the provided arguments
- A multiclause function is a single function
- Create a function value with the capture operator, `&`, used to capture named functions from modules

```Shell
iex(4)> fun = &Geometry.area/1    
 
iex(5)> fun.({:circle, 4})
50.24
 
iex(6)> fun.({:square, 5})
25
```

- A function is treated as a while, even if it consists of multiple clauses
- Introduce _default_ clause that always matches

```Shell
defmodule Geometry do
  def area({:rectangle, a, b}) do
    a * b
  end
 
  def area({:square, a}) do
    a * a
  end
 
  def area({:circle, r}) do
    r * r * 3.14
  end
 
  def area(unknown) do                  
    {:error, {:unknown_shape, unknown}}
  end
end
```

```Shell
iex(1)> Geometry.area({:square, 5})
25
iex(2)> Geometry.area({:triangle, 1, 2, 3})
{:error, {:unknown_shape, {:triangle, 1, 2, 3}}}
```

- Important to place clauses in appropriate order
- The runtime select the clauses, using the order in the source code
- The `area(unknown)` clause should be the last
- Always group clauses of the same function together, instead of scattering them in various places in the module
- If a multiclause function is spread all over the file, it becomes increasingly difficult to analyze the function's complete behaviour

2. <font style="color:#A8A8A8; text-decoration: underline;">Guards</font>
- _Gaurds_ are an extension of the basic pattern-matching mechanism
- Allow you to state additional broader expectations that must satisfied for the entire pattern to match
- A guard can be specified by proving the `when` clause after the arguments list

```Elixir
defmodule TestNum do
  def test(x) when x < 0 do
    :negative
  end
 
  def test(x) when x == 0 do
    :zero
  end
 
  def test(x) when x > 0 do
    :positive
  end
end
```

- The guard is a logical expression that adds further conditions to the pattern

```Shell
iex(1)> TestNum.test(-1)
:negative
 
iex(2)> TestNum.test(0)
:zero
 
iex(3)> TestNum.test(1)
:positive

iex(4)> TestNum.test(:not_a_number)
:positive
```

- Elixir terms can be compared with the operators `<` and `>`, even if they are not the same type
- The type ordering determines the result

```
number < atom < reference < fun < port < pid <
  tuple < map < list < bitstring (binary)
```

- A number is smaller than any other type, which is why `TestNum.test/1` always returns `:positive` if you provide a non-number

```Elixir
defmodule TestNum do
  def test(x) when is_number(x) and x < 0 do
    :negative
  end
 
  def test(x) when x == 0 do
    :zero
  end
 
  def test(x) when is_number(x) and x > 0 do
    :positive
  end
```

```Shell
iex(2)> TestNum.test(:not_a_number)
** (FunctionClauseError) no function clause matching in TestNum.test/1
```

- Comparison operators 
	- `==, !=, ===, @==, >, <, <=, >=`
- Boolean operators
	- `and, or, not, !`
- Arithmetic operators
	- `+, -, *, /`
- Type-check functions from the `Kernel` module
	- `is_number/1, is_atom/1`

- Function used in a guard may cause an error to be raised

```Elixir
defmodule ListHelper do
  def smallest(list) when length(list) > 0 do
    Enum.min(list)
  end
 
  def smallest(_), do: {:error, :invalid_argument}
end
```

- If an error is raised from inside the guard, it won't be propagated, and the guard expression with return `false`
- An error in the guard expression is internally handled


3. <font style="color:#A8A8A8; text-decoration: underline;">Multiclause Lambdas</font>
- Anonymous functions (lambdas) may also consist of multiple clauses

```Shell
iex(1)> double = fn x -> x * 2 end    
iex(2)> double.(3)                    
6
```
   
- General lambda syntax shape:

```Elixir
fn
  pattern_1, pattern_2 ->
    ...                     
 
  pattern_3, pattern_4 ->
    ...                     
 
  ...
end
```

```Shell
iex(3)> test_num =
          fn
            x when is_number(x) and x < 0 -> :negative
            x when x == 0 -> :zero
            x when is_number(x) and x > 0 -> :positive
          end
```

- There is no special ending terminator for a lambda clause
- The clause ends when the new clause is started or the lambda definition is finished with `end`

```Shell
iex(4)> test_num.(-1)
:negative
iex(5)> test_num.(0)
:zero
iex(6)> test_num.(1)
:positive
```

- Multiclause lambdas are used in higher-order function, and conditional runtime branching

## 3.3 <font style="color:#40E0D0">Conditionals</font>
- Elixir provides some standard ways of doing condition branching, with expressions such as `if` and `case`

1. <font style="color:#A8A8A8; text-decoration: underline;">Branching with Multiclause Functions</font>
```Elixir
defmodule TestNum do
  def test(x) when x < 0, do: :negative
  def test(0), do: :zero
  def test(x), do: :positive
end
```
   
- In a typical imperative language, such as JavaScript three conditional branches:

```JavaScript
function test(x){
  if (x < 0) return "negative";
  if (x == 0) return "zero";
  return "positive";
}
```

- A multiclause can use pattern matching

```Elixir
defmodule TestList do
  def empty?([]), do: true
  def empty?([_|_]), do: false
end
```

- First clause, matches the empty list
- Second clause, relies on the (head | tail) representation of a nonempty list
- Implement polymorphic functions that do different thing depending on input

```Shell
iex(1)> defmodule Polymorphic do
          def double(x) when is_number(x), do: 2 * x
          def double(x) when is_binary(x), do: x <> x
        end
 
iex(2)> Polymorphic.double(3)
6
 
iex(3)> Polymorphic.double("Jar")
"JarJar"
```

- Here is a recursive implementation of a factorial, based on multiclauses

```Shell
iex(4)> defmodule Fact do
          def fact(0), do: 1
          def fact(n), do: n * fact(n - 1)
        end
 
iex(5)> Fact.fact(1)
1
 
iex(6)> Fact.fact(3)
6
```

- Function that sums all the elements of a list

```Shell
iex(7)> defmodule ListHelper do
          def sum([]), do: 0
          def sum([head | tail]), do: head + sum(tail)
        end
 
iex(8)> ListHelper.sum([])
0
 
iex(9)> ListHelper.sum([1, 2, 3])
6
```

- Everything done with classical branching expression can be accomplished with multi-clauses
- Although pattern-matching can be more expressive

2. <font style="color:#A8A8A8; text-decoration: underline;">Classical Branching Expressions</font>
- In classical branching the expression `if, undless, cond, and case`

If and Unless

```Elixir
if condition do
  ...
else
  ...
end
```

- Depending on the condition truthiness, it will call main or else branch
- Can be condensed into a one-liner
`if condition, do: something, else: another_thing`

- The `if` expression returns the result of the executed block
- If the condition is not met and the `else` clause is not specified, the return value is the atom `nil`

```Shell
iex(1)> if 5 > 3, do: :one
:one
iex(2)> if 5 < 3, do: :one
nil
iex(3)> if 5 < 3, do: :one, else: :two
:two
```

```Elixir
def max(a, b) do
  if a >= b, do: a, else: b
end
```

- The `unless` expression is equivalent of `if not...`

`if result != :error, do: send_notification(...)`

- Is the same as

`unless result == :error, do: send_notification(...)`

Cond
- The `cond` expression is equivalent to an `if-else-if` pattern

```Elixir
cond do
  expression_1 ->
    ...
 
  expression_2 ->
    ...
 
  ...
end
```

- The result of `cond` is the result of the corresponding execute block
- If none of the conditions are met, `cond` raises an error

```Elixir
def call_status(call) do
  cond do
    call.ended_at != nil -> :ended
    call.started_at != nil -> :started
    true -> :pending                    ❶
  end
end
```

- The final clause `true -> :pending` is the default clause

Case
- General syntax of `case`

```Elixir
case expression do
  pattern_1 ->
    ...
 
  pattern_2 ->
    ...
 
  ...
end
```

- The term _pattern_ here indicates that it deals with pattern matching
- The expression is evaluates, and then the result is matched against the given clauses

```Elixir
def max(a,b) do
  case a >= b do
    true -> a
    false -> b
  end
end
```

- The `case` expression is most suitable when you don'w want to define a separate multiclause function

```Elixir
defp fun(pattern_1), do: ...
defp fun(pattern_2), do: ...
...
```

- Specify the default clause by using the anonymous variable to match

```Elixir
  pattern_1 -> ...
  pattern_2 -> ...
  ...
 
  _ -> ...      
end
```

- Multiclauses offer a more declarative feel to branching, but require separate function and arguments
- Classical expressions seem more imperative, but often prove simpler than the multicause approach


3. <font style="color:#A8A8A8; text-decoration: underline;">The With Expression</font>
- The final branching expression is the `with` expression, used to chain a couple of expressions and return the error of the first expression that fails
- The following is a map that represents process registration data

```Elixir
%{
  "login" => "alice",
  "email" => "some_email",
  "password" => "password",
  "other_field" => "some_value",
  "yet_another_field" => "...",
  ...
}
```
   
- Normalized this map into a map that contains only the fields, `login, email, password`

`%{login: "alice", email: "some_email", password: "password"}`

- Function will either return normalized user map or an error
- An idiomatic approach is to make the function return
	- `{:ok, some_result}`
	- `{:error, error_reason}`

```Elixir
defp extract_login(%{"login" => login}), do: {:ok, login}
defp extract_login(_), do: {:error, "login missing"}
 
defp extract_email(%{"email" => email}), do: {:ok, email}
defp extract_email(_), do: {:error, "email missing"}
 
defp extract_password(%{"password" => password}), do: {:ok, password}
defp extract_password(_), do: {:error, "password missing"}
```

- A top-level `extract_user/1` function can combine these three function

```Elixir
def extract_user(user) do
  case extract_login(user) do
    {:error, reason} ->
      {:error, reason}
 
    {:ok, login} ->
      case extract_email(user) do
        {:error, reason} ->
          {:error, reason}
 
        {:ok, email} ->
          case extract_password(user) do
            {:error, reason} ->
              {:error, reason}
 
            {:ok, password} ->
              %{login: login, email: email, password: password}
          end
      end
  end
end
```

- Each time something is fetches, you end up with three nested cases
- `with` special form allows you to use pattern patching to chain multiple expression, verify that the result of each conforms to the desired pattern, and return the resust unexpected result

- Simplest form, `with` shape

```Elixir
with pattern_1 <- expression_1,
     pattern_2 <- expression_2,
     ...
 
do
  ...
end
```

- If the match succeed, you move to the next epxression
- If all the expressions are successfully matches, you end in the `do` blocks
- If any expressions fail, it will return that result

```Shell
iex(1)> with {:ok, login} <- {:ok, "alice"},
             {:ok, email} <- {:ok, "some_email"} do
          %{login: login, email: email}
        end
 
%{email: "some_email", login: "alice"}
```

- `with` returns the first term that fails to be matched

```Shell
iex(2)> with {:ok, login} <- {:error, "login missing"},
             {:ok, email} <- {:ok, "email"} do
          %{login: login, email: email}
        end
 
{:error, "login missing"}
```

- Final implementation

```Elixir
def extract_user(user) do
  with {:ok, login} <- extract_login(user),
       {:ok, email} <- extract_email(user),
       {:ok, password} <- extract_password(user) do
    {:ok, %{login: login, email: email, password: password}}
  end
end
```

```Shell
$ iex user_extraction.ex
 
iex(1)> UserExtraction.extract_user(%{})
{:error, "login missing"}
 
iex(2)> UserExtraction.extract_user(%{"login" => "some_login"})
{:error, "email missing"}
 
iex(3)> UserExtraction.extract_user(%{
          "login" => "some_login",
          "email" => "some_email"
        })
{:error, "password missing"}
 
iex(4)> UserExtraction.extract_user(%{
          "login" => "some_login",
          "email" => "some_email",
          "password" => "some_password"
        })
{:ok, %{email: "some_email", login: "some_login",
  password: "some_password"}}
```

## 3.4 <font style="color:#40E0D0">Loops and Iterations</font>
- Constructs such as `while` and `do...while` are not provided
- The principal tool is _recursion_

1. <font style="color:#A8A8A8; text-decoration: underline;">Iterating with Recursion</font>
- Printing the first $n$ natural numbers (positive integers)

```Elixir
defmodule NaturalNums do
  def print(1), do: IO.puts(1)
 
  def print(n) do
    print(n - 1)
    IO.puts(n)
  end
end
```

- Code used recursion, pattern matching, and multiclause function

```Shell
iex(1)> NaturalNums.print(3)
1
2
3
```

- Calculating the sum of a list

```Elixir
defmodule ListHelper do
  def sum([]), do: 0
 
  def sum([head | tail]) do
    head + sum(tail)
  end
end
```

- Code looks declarative
	- Sum of all the elements is an empty list, initialized to 0
	- The sum of all the elements of a nonempty list equals teh list's head plus the sum of the list's tail
- Deep recursion might lead to a stack overflow and crash the entire program
	- No a problem if _tail-call_ optimized
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Tail Function Calls</font>
- A _tail call_ is the last thing a function calls
- Calling a function does not result in a usual stack push
- Instead, something more like a goto or jump statement happed
- You don't allocate additional stack space before calling the function, which, in turn, mean the tail function call consumes no additional memory
- The final result of a function is is tail call function, therefore no additional memory allocation is needed
- When tail call function finished, it return to the original function
- A tail-recursive function is a function that calls itself at the end, forever without consuming additional memory

- Endless loop

```Elixir
def loop_forever(...) do
  ...
  loop_forever(...)
end
```

- Tail-recursive sum of the first $n$ natural numbers

```Elixir
defmodule ListHelper do
  def sum(list) do
    do_sum(0, list)
  end
 
  defp do_sum(current_sum, []) do
    current_sum
  end
 
  defp do_sum(current_sum, [head | tail]) do
    new_sum = head + current_sum
    do_sum(new_sum, tail)
  end
end
```

- The exported function `sum/1` is called by the module clients on the surface
- The recursion takes place in the private `do_sum/2`

- The second clause of `do_sum` computes the new value of the sum, and calls a tail-recursive function
- The first `do_sum` clause is responsible for stopping the recursion
	- Matches on an empty list, which is the last step of the iteration
- The function `sum/1` is used by clients and is responsible for initializing the values and calling the `do_sum` function
- The `curren_sum` is the accumulator

```Shell
iex(1)> ListHelper.sum([1, 2, 3])
6
 
iex(2)> ListHelper.sum([])
0
```

Tail vs. Non-tail Recursion
- Non-tail recursion can often produce more elegant and concise code that sometimes performs better than its tail-recursive counterpast

Recognizing Tail Calls
- Tail calls can take different shapes

```Elixir
def fun(...) do
  ...
  if something do
    ...
    another_fun(...)     
  end
end
```

- Recursion is the basic looping technique, and no loop can be done without it
- Many typical tasks can be performed using higher-order functions

1. <font style="color:#A8A8A8; text-decoration: underline;">Higher-Order Functions</font>
- A _higher-order function_ is a type of function thtat takes one or more functions as its input or returns one or more function
- _Function_ refers to the function value

Enumerables
- Enumerable is a data structure for which a certain contract is implemented that makes that data structure suitable to be used by function from the `Enum` model
	- Lists, ranges, maps, and Mapset
- One manipulation often used is a one-to-one tranformation of a list to another list
- This uses `Enum.map/2`, which takes an enumerable and a lambda that maps each element to another element
- Use the capture operator `&` to make the lambda definition denser

```Shell
iex(2)> Enum.map(
          [1, 2, 3],
          &(2 * &1)
        )
```

- The `&(...)` denotes a simplified lambda definition, where $\&n$ is a placeholder for the $n$-th argument
- Following returns all old numbers from a list

```Shell
iex(3)> Enum.filter(
          [1, 2, 3],
          fn x -> rem(x, 2) == 1 end
        )
[1, 3]
```

- Using the capture syntax

```Shell
iex(3)> Enum.filter(
          [1, 2, 3],
          &(rem(&1, 2) == 1)
        )
[1, 3]
```

- Using `Map.has_key?/2` for reporting all missing fields

```Elixir
case Enum.filter(                        
        ["login", "email", "password"],  
        &(not Map.has_key?(user, &1))     
     ) do
  [] ->                                   
    ...
 
  missing_fields ->                       
    ...
end
```

Reduce
- The most versatile function from the `Enum` is `Enum.reduce/3`, can be used to transform an enumerable into anything
- `reduce` is known as _inject_ or _fold_

```JS
var sum = 0;                          
[1, 2, 3].forEach(function(element) {
  sum += element;                     
})
```

- Reduce function shape

```Elixir
Enum.reduce(
  enumerable,
  initial_acc,
  fn element, acc ->
    ...
  end
)
```

- Reduce takes in: first argument, initial value for the accumulator, and a lambda that is called for each element

```Shell
iex(4)> Enum.reduce(
          [1, 2, 3],
          0,                                      ❶
          fn element, sum -> sum + element end    ❷
        )
6
```

- Can be compacted: `Enum.reduce([1,2,3], 0, &+/2)`
- `&+/2` is the function that takes two arguments and adds them together
- The following sums a list of non-exclusive number

```Shell
iex(6)> Enum.reduce(
          [1, "not a number", 2, :x, 3],
          0,
          fn                                           
            element, sum when is_number(element) -> sum + element
 
            _, sum ->
              sum                                      
          end
        )
```

- Using distinct functions

```Elixir
defmodule NumHelper do
  def sum_nums(enumerable) do
    Enum.reduce(enumerable, 0, &add_num/2)                    
  end
 
  defp add_num(num, sum) when is_number(num), do: sum + num   
  defp add_num(_, sum), do: sum
end
```


4. <font style="color:#A8A8A8; text-decoration: underline;">Comprehensions</font>
- The cryptic _comprehensions_ name denotes another expression that can help iterate and transform enumerables

```Shell
iex(1)> for x <- [1, 2, 3] do
          x*x
        end
```

- the `<-` operator is used in comprehension and pattern matching
- Iterates over the list, assigning each value to x one at a time
- On this form `for` is the same as `Enum.map/2`
- Nested iterations over multiple collections

```Shell
iex(2)> for x <- [1, 2, 3], y <- [1, 2, 3], do: {x, y, x*y}
[
  {1, 1, 1}, {1, 2, 2}, {1, 3, 3},
  {2, 1, 2}, {2, 2, 4}, {2, 3, 6},
  {3, 1, 3}, {3, 2, 6}, {3, 3, 9}
]
```

- Use ranges to compute a multiplication table for single-digit numbres

`iex(3)> for x <- 1..9, y <- 1..9, do: {x, y, x*y}`

- The result of the comprehension has been a list, but comprehension can return anything that's collectable
- _Collectable_ is an abstract term for a functional data type that can collect values
	- Lists, maps, MapSet, file streams
- Comprehension iterates through enumerables, calling the provided block for each value and storing the result in some collectable structure
- Makes a map that holds a multiplication table, keys are tuples of factor

```Shell
iex(4)> multiplication_table =
          for x <- 1..9,
              y <- 1..9,
              into: %{} do     #specifies collectable
            {{x, y}, x*y}
          end
 
iex(5)> Map.get(multiplication_table, {7, 6})
42
```

- `into` specifies what to collect, in this case it is an empty map that will be populated
- the first element is a key, and second is the value `{factors, product}`
- Enables to skip element from into
- The following computes a non-symmetrical multiplication table for numbers `x` and `y,` where `x <= y`

```Shell
iex(6)> multiplication_table =
          for x <- 1..9,
              y <- 1..9,
              x <= y,        
              into: %{} do
            {{x, y}, x*y}
          end
 
iex(7)> Map.get(multiplication_table, {6, 7})
42
 
iex(8)> Map.get(multiplication_table, {7, 6})
nil
```

- Comprehension filter is evaluated for each element of the input enumerable prior to block execution
- Comprehensions enables elegant transformations for the input enumerable
	- Perform a Cartesian product of multiple enumberables
	- Transverse a nested collection to produce a flat result

5. <font style="color:#A8A8A8; text-decoration: underline;">Streams</font>
- A _stream_ is a special kind of enumerable that can be used for doing lazy composable operations over anything enumerable
- List of employees

```Text
1. Alice
2. Bob
3. John
...
```
   
```Shell
iex(1)> employees = ["Alice", "Bob", "John"]
["Alice", "Bob", "John"]
 
iex(2)> Enum.with_index(employees)
[{"Alice", 0}, {"Bob", 1}, {"John", 2}]

iex(3)> employees
        |> Enum.with_index()
        |> Enum.each(fn {employee, index} ->
             IO.puts("#{index + 1}. #{employee}")
           end)
 
1. Alice
2. Bob
3. John
```
   
- A pipe operator is chained with function calls
- This removes intermediate variables and makes the code cleaner
- Both pipes iterates through the entire list, better to have a single pass without building another list
- Streams are implemented in the `Stream` module
- `map, filter, take` are function that take enumerable as an input and give back a stream
	- An enumerables with some special powers
- A _stream_ is a lazy enumerable, producing the actual result on demand

```Shell
iex(4)> stream = Stream.map([1, 2, 3], fn x -> 2 * x end)  
 
#Stream<[enum: [1, 2, 3],                                  
  funs: [#Function<44.45151713/1 in Stream.map/2>]]>
```

- The iteration over the input list and the corresponding transformation does not happed, the result is the structure that describes the computation

- To make iteration, pass the stream to an `Enum` function such as `each, map, filter`
- The laziness of streams goes beyond iterating the list on demand
- Values are produced one by one

```Shell
iex(6)> Enum.take(stream, 1)
[2]
```

- Using stream allow you to print employees in a single pass

```Shell
iex(7)> employees
        |> Stream.with_index()                   
        |> Enum.each(fn {employee, index} ->
             IO.puts("#{index + 1}. #{employee}")
           end)
 
1. Alice
2. Bob
3. John
```

- Stream is useful for multiple transformations

```Shell
iex(1)> [9, -1, "foo", 25, 49]
        |> Stream.filter(&(is_number(&1) and &1 > 0))
        |> Stream.map(&{&1, :math.sqrt(&1)})
        |> Stream.with_index()
        |> Enum.each(fn {{input, result}, index} ->
             IO.puts("#{index + 1}. sqrt(#{input}) = #{result}")
           end)
 
1. sqrt(9) = 3.0
2. sqrt(25) = 5.0
3. sqrt(49) = 7.0
```

- Used when you need to parse each line of a file

```Elixir
def large_lines!(path) do
  File.stream!(path)
  |> Stream.map(&String.trim_trailing(&1, "\n"))
  |> Enum.filter(&(String.length(&1) > 80))
end
```

- `File.stream!/1`, takes the path of the file a returns a stream of its lines
- To make a lazy computation, you need to return a lambda that performs the computation
- Therefore the description is returns, instead of its results

Infinite Streams
- `Stream.iterate/2` can be used to produce an infinite collection, where each element is calculated based on the previous one

```Shell
iex(1)> natural_numbers = Stream.iterate(
          1,
          fn previous -> previous + 1 end
        )
iex(2)> Enum.take(natural_numbers, 10)
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

- `Stean.repeatedly/1`, repeatedly invokes the provided lambda to generate an element

```Shell
iex(3)> Stream.repeatedly(fn -> IO.gets("> ") end)
        |> Stream.map(&String.trim_trailing(&1, "\n"))
        |> Enum.take_while(&(&1 != ""))
 
> Hello
> World
>
["Hello", "World"]
```

- The `Stream` module uses `Stream.undfold/2` or `Stream.resource/3` to produce infinite stream

---

# 4. Data Abstractions
^6778a2

- This chapter discusses building higher-level data structure
- Abstractions are implemented with pure, stateless modules
- In object-oriented language, the basic abstraction building blocks are classes and object
	- `String` class
	- Each string is an instance of that class and can be manipulated by calling methods

```Ruby
"a string".upcase
```

- Elixir promotes decoupling of data from the code
- Instead of classes, modules are used and are collections of functions
- Instead of calling method on objects, module function are explicitly called and provided input data via arguments

```Elixir
String.upcase(" a string)
```

- To modify immutable data, the result of the function is stored into a variable

```Shell
iex(1)> list = []
[]
 
iex(2)> list = List.insert_at(list, -1, :a)
[:a]
 
iex(3)> list = List.insert_at(list, -1, :b)
[:a, :b]
 
iex(4)> list = List.insert_at(list, -1, :c)
[:a, :b, :c]
```

- The module is used as the abstraction over the data type
- `String` and `List` are modules that are dedicated to a specific data type
- _Modifier functions_ return data of the same type
- `String.upcase/1` returns a binary string, whereas `List.insert_at/3` returns a list
- A module also contains _query functions_ that that return some piece of information from the data, such as `String.length/1` and `List.first/1`
- These function expect an instance of the abstraction as the first argument, but return another type of information

- Principles of abstraction
	- A module is in change of abstracting some behaviour
	- A module's functions usually expect an instance of the abstraction as the first argument
	- Modifier functions return a modified version of the abstraction
	- Query functions return some other type of data

## 4.1 <font style="color:#40E0D0">Abstracting with Modules</font>
- Lists and strings are lower-level types, but higher-level abstraction are based on the principles above
- `MapSet` module implements a set

```Shell
iex(1)> days =
          MapSet.new() |>                
          MapSet.put(:monday) |>         
          MapSet.put(:tuesday)           
 
iex(2)> MapSet.member?(days, :monday)    
true
```

- Module-based abstraction are not proper data type, instead they implement by composing built-in data types
- `MapSet` instance is a map

1. <font style="color:#A8A8A8; text-decoration: underline;">Basic Abstractions</font>
- To Do List Application
	- Creating a new to-do list
	- Adding new entries to the list
	- Querying the list

```Shell
$ iex simple_todo.ex
 
iex(1)> todo_list =
          TodoList.new() |>
          TodoList.add_entry(~D[2023-12-19], "Dentist") |>
          TodoList.add_entry(~D[2023-12-20], "Shopping") |>
          TodoList.add_entry(~D[2023-12-19], "Movies")
 
iex(2)> TodoList.entries(todo_list, ~D[2023-12-19])
["Movies", "Dentist"]
 
iex(3)> TodoList.entries(todo_list, ~D[2023-12-18])
[]
```

- Initializing a new to-do list

```Elixir
defmodule TodoList do
  def new(), do: %{}
  ...
end
```

- Implement a `new()` and `add_entry/3` function
- This function expects a to do list and adds the entry to the list given a key (date)
- `Map.update/4` function receives a map, a key, an initial value, and an updater function
- If no value exists for a key, the initial value is used, otherwise the updater function is called

```Elixir
defmodule TodoList do
  ...
  def add_entry(todo_list, date, title) do
    Map.update(
      todo_list,
      date,
      [title],                            
      fn titles -> [title | titles] end   
    )
  end
  ...
end
```

- The new entry is pushed on top of the list
- `entries/2` function returns all entries for a given date, or an empty list
- Querying to do list

```Elixir
defmodule TodoList do
  ...
  def entries(todo_list, date) do
    Map.get(todo_list, date, [])
  end
end
```
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Composing Abstractions</font>
- Abstractions can be created on top of one another

```Elixir
defmodule MultDict do
	def new(), do: %{}

	def add(dict, key, value) do
		Map.update(dict, key, [value], &[value | &1])
	end

	def get(dict, key) do
		Map.get(dict, key, [])
	end
end
```

- The capture operator is used to shorten the updater lambda definition
- With the abstraction of `MultDict`, the `TodoList` module becomes more simple

```Elixir
defmodule TodoList do
	def new(), do: MultiDict.new()

	def add_entry(todo_list, date, title) do
		MultiDict.add(todo_list, date, title)
	end

	def entries(todo_list, date) do
		MultDict.get(todo_list, date)
	end
end
```

- Now, the `MultDict` is available to use
- The `TodoList` can be extended with additional function, therefore does not belong to `MultDict`
- Refactoring code is similar to OO approach
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Structuring Data with Maps</font>
- To add a new entry, each field must be a separate argument
- If you want to extend an entry with another attribute the signature of the function must change, which will break all the clients
- To change the function, every implementation must also be changes
- To resolve this, we can combine all entry fields as a single abstraction

```Shell
iex(1)> entry = %{date: ~D[2023-12-19], title: "Dentist"}
 
iex(2)> entry.date
~D[2023-12-19]
 
iex(3)> entry.title
"Dentist"
```

- Representing entries with maps

```Elixir
defmodule TodoList do
	...
	def add_entry(todo_list, entry) do
		MultDict.add(todo_list, entry.date, entry)
	end
	...
end
```

```Shell
iex(1)> todo_list = TodoList.new() |>
TodoList.add_entry(%{date: ~D[2023-12-19], title: "Dentist"})
```

- To add entries, clients must use a map
- Although it must contain its field names, the return is the complete entries
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Abstracting with Structs</font>
- A _fraction_ is a part of a whole, represented in the form of $a/b$ where $a$ and $b$ are integers called _numerator_ and _denominator_

```Shell
$ iex fraction.ex
 
iex(1)> Fraction.new(1, 2)
        |> Fraction.add(Fraction.new(1, 4))
        |> Fraction.value()
0.75 #sum of the two fractions
```

- Elixir uses _structs_, which allows you to specify the abstraction structure up front and bind it to a module
- Each module can define only one struct, which can then be used to create new instance and pattern-match on them
- A fraction has a well-defined structure, therefore structs can enforce data shape

```Defining a structure
defmodule Fraction do
	defstruct a: nil, b: nil
	...
end
```

- A keyword `defstruct` defines the struct's fields and initial values

```Shell
iex(1)> one_half = %Fraction{a: 1, b: 2}
%Fraction{a: 1, b: 2}
```
   
- A struct may exist only in a module, and a single module cam define only one struct
- Internally a struct is a special kind of map

```Shell
iex(2)> one_half.a
1
iex(3)> one_half.b
2
iex(4)> %Fraction{a: a, b: b} = one_half
%Fraction{a: 1, b: 2}
iex(5)> a
1
iex(6)> b
2
iex(6)> %Fraction{} = one_half                                    
%Fraction{a: 1, b: 2}                                             
iex(7)> %Fraction{} = %{a: 1, b: 2}                               
** (MatchError) no match of right hand side value: %{a: 1, b: 2} 
```

- Updating a struct; creates a new struct instance based on the original `one_half`, changing the values of `b` to `4`

```Shell
iex(8)> one_quarter = %Fraction{one_half | b: 4}
%Fraction{a: 1, b: 4}
```

- The shape of the struct is defined at compile time and errors can be caught

```Shell
iex(9)> %Fraction{a: 1, d: 2}
** (KeyError) key :d not found
```

- Instantiating a fraction

```Elixir
defmodule Fraction do
	...
	def new(a, b) do
		%Fraction{a: a, b: b}
	end
	...
end
```

- The `new(a, b)` is a simple wrapper around the `%Fraction{}` syntax
- Makes the client code clearer and less coupled with structs
- Calculating the fraction values

```Elixir
defmodule Fraction do
	...
	def value(%Fraction{a: a, b: b}) do
		a / b
	end
	...
end
```

 - The `value/1` function now has enforces input type with pattern matching
 - Use do notation do decompose fields into variables

```Elixir
def value(fraction) do
	fraction.a / fraction.b
end
```

- Adding two fractions

```Elixir
defmodule Fraction
  ...
 
  def add(%Fraction{a: a1, b: b1}, %Fraction{a: a2, b: b2}) do
    new(
      a1 * b2 + a2 * b1,
      b2 * b1
    )
  end
 
  ...
end
```

```Shell
iex(1)> Fraction.new(1, 2)
        |> Fraction.add(Fraction.new(1, 4))
        |> Fraction.value()
0.75
```

Structs vs. Maps
- Structs are simply maps, by also instance receives special treatment
- Cannot call `Enum` functions on a struct

```Shell
iex(1)> one_half = Fraction.new(1, 2)
 
iex(2)> Enum.to_list(one_half)
** (Protocol.UndefinedError) protocol Enumerable not implemented for
  %Fraction{a: 1, b: 2}
```

- Structs are functional abstraction and behave according to the implementation fo the module where defined
- You can define if `Fraction` is enumerable or not
- A plain map is an enumerable and can be converted to a lost

```Shell
iex(3)> Enum.to_list(%{a: 1, b: 2})
[a: 1, b: 2]
```

- Although map functions work on structs since they are map themselves

```Shell
iex(4)> Map.to_list(one_half)
[__struct__: Fraction, a: 1, b: 2]
```

- `__struct__: Fraction` is a key-value pair automatically included in each struct
- `__struct__` field has an important consequence for pattern matching
	- A struct pattern can't match a plain map

```Shell
iex(5)> %Fraction{a: a, b: b} = %{a: 1, b: 2}
** (MatchError) no match of right hand side value: %{a: 1, b: 2}
```

- However, a plain map pattern can match a struct

```Shell
iex(5)> %{a: a, b: b} = %Fraction{a: 1, b: 2}
%Fraction{a: 1, b: 2}
iex(6)> a
1
iex(7)> b
2
```

Records
- _Records_ can be defined using the `defrecord` and `defrecordp` macros from the `Record` module
- This is a feature that uses tuples and is able to access individual elements by name
- Records using tuples should be faster than using maps
- Before maps, records where one of the main tools for structuring data
- Many libraries from the Erlang ecosystem use records as their interface
- To import a record into Elixir and define is `Record.extract/2` function and `defrecord` macro are used

5. <font style="color:#A8A8A8; text-decoration: underline;">Data Transparency</font>
-    Data in Elixir is always transparent
- Clients can read any information from structs (or other data type), and there is no easy way of preventing it
- Encapsulation work different than typical OO languages
- Modules are in charge of abstracting the data and providing operations to manipulate and query that data, but the data is never hidden 
   
```Shell
$ iex todo_entry_map.ex
 
iex(1)> todo_list = TodoList.new() |>
          TodoList.add_entry(%{date: ~D[2023-12-19], title: "Dentist"})
 
%{~D[2023-12-19] => [%{date: ~D[2023-12-19], title: "Dentist"}]}  

iex(1)> mapset = MapSet.new([:monday, :tuesday])
MapSet.new([:monday, :tuesday])
```

- The return uses `MapSet.new(...)` due to the inspection mechanism in Elixir
- When a result is printed in the shell, the function `Kernel.inspect/1`is called to transform the structure into an inspected string
- For each abstraction, is can be overridden by the default behaviour and provide your own inspected format
- Use `inspect` function to see the pure data structure without decorated output
	- Debugging, analyzing, or reverse engineering code

```Shell
iex(2)> IO.puts(inspect(mapset, structs: false))
%{__struct__: MapSet, map: %{monday: [], tuesday: []}, version: 2}
```

- The benefit of data transparency is that data can be easily inspected, for debugging
- The only guarantee is that the module's functions will work if you send them a properly structured instance that you already received from the same module
- The `IO.inspect/1` function prints the inspected representation of a structure to the screen and returns the structure itself
	- Debugging a piece of code

```Shell
iex(1)> Fraction.new(1, 4) |>
          Fraction.add(Fraction.new(1, 4)) |>
          Fraction.add(Fraction.new(1, 2)) |>
          Fraction.value()
1.0
```

```Shell
iex(2)> Fraction.new(1, 4) |>
          IO.inspect() |>
          Fraction.add(Fraction.new(1, 4)) |>
          IO.inspect() |>
          Fraction.add(Fraction.new(1, 2)) |>
          IO.inspect() |>
          Fraction.value()
 
%Fraction{a: 1, b: 4}     
%Fraction{a: 8, b: 16}    
%Fraction{a: 32, b: 32}   
```

- `dbg` macro provides similar features to `IO.inspect/1`

## 4.2 <font style="color:#40E0D0">Working with Hierarchical Data</font>
- Extend the `TodoList` abstraction to provide basic CRUD support
- To update and delete entries, unique IDs are needed for each entry

1. <font style="color:#A8A8A8; text-decoration: underline;">Generating IDs</font>
- When adding a new entry, autogenerate its ID value, using incremental integers for ID
	- _Represent the to-do list as a struct_
		- Todo list contains two pieces of informations: entries, and ID value for the next entry
	- _Use the entry's ID as the key_
		- Use entry's date as the key
		- There is now one value per each key, the `MultiDict` abstraction is not needed

```Elixir
defmodule TodoList do
	defstruct next_id: 1, entries: %{}

	def new(), do: %TodoList{}
	...
end
```

- The todo list is a struct with two fields
	- Id value of next entry
	- Collection of entries
- Reimplement `add_entry/2` functions
	- Set the ID for the entry being added
	- Add the new entry to the collection
	- Increment the `next_id` field

Autogenerating ID values for new entries

```Elixir
defmodule TodoList do
	...

	def add_entry(todo_list, entry) do
		entry = Map.put(entry, :id, todo_list.next_id)

		new_entries = Map.put(
			todo_list.entries,
			todo_list.next_id,
			entry
		)
	%TodoList{todo_list |
		entries: new_entries,
		next_id: todo_list.next_id + 1
	}
```

- The new to-do list will share as much memory as possible with the input to-do list
- Entries are stored using `id` as the key
- Filtering entries for a given data

```Elixir
defmodule TodoList do
	...

	def entries(todo_list, date) do
		todo_list.entries
		|> Map.values()
		|> Enum.filter(fn entry -> entry.date = date end)
	end
	...
end
```

```Shell
$ iex todo_crud.ex
 
iex(1)> todo_list = TodoList.new() |>
          TodoList.add_entry(%{date: ~D[2023-12-19], title: "Dentist"}) |>
          TodoList.add_entry(%{date: ~D[2023-12-20], title: "Shopping"}) |>
          TodoList.add_entry(%{date: ~D[2023-12-19], title: "Movies"})
 
iex(2)> TodoList.entries(todo_list, ~D[2023-12-19])
[
  %{date: ~D[2023-12-19], id: 1, title: "Dentist"},
  %{date: ~D[2023-12-19], id: 3, title: "Movies"}
]
```

- This demonstrates the internal modification of the `TodoList` module
- Construct and reason about higher-level types when working with stateless modules and immutable data

2. <font style="color:#A8A8A8; text-decoration: underline;">Updating Entries</font>
- To modify a single entry will accept an entry ID, and an updater lambda, which will be invoked to update the entry
- Lambda will receive the original entry and return its modified version

```Shell
iex(1)> TodoList.update_entry(
          todo_list,
          1,                                    
          &Map.put(&1, :date, ~D[2023-12-20])    
        )
```

```Elixir
defmodule TodoList do
	...
	def update_entry(todo_list, entry_id, updater_fun) do
		case Map.fetch(todo_list,entries, entry_id) do
			:error ->
				todo_list

			{:ok, old_entry} ->
				new_entry = updater_fun.(old_entry)
				new_entries = Map.put(todo_list.entries, new_entry.id,
				%TodoList{todo_list | entries: new_entries})
		end
	end
	...
end
```

- Entry is looked up given ID, using `Map.fetch/2`
- If entry does not exist, the original list is returned
- Otherwise, call the updater lambda function to modify entry
- Store the modified entry into the entries collection
- Store the modified entries collection to the `TodoList` instance and return that instance

3. <font style="color:#A8A8A8; text-decoration: underline;">Immutable Hierarchical Updates</font>
- The code previous preformed a deep update of an immutable hierarchy

`TodoList.update_entry(todo_list, id, updater_lambda`
1) Take the target entry into a separate variable
2) Call the updater that returns the modifier version of the entry
3) Call `Map.put` to put the modified entry into the entries collection
4) Return the new version of the to-do list, which contains the new entries collection

- Steps 2 to 4 transform data, in each subsequent step, data is stored and container updated
- Walk down the tree to the particular part that needs to be modified and then transform it and all of its ancestors

Provided Helpers
- For the given list, the original structure can be modified using `Kernel.put_in/2` macro

```Shell
iex(1)> todo_list = %{
  1 => %{date: ~D[2023-12-19], title: "Dentist"},
  2 => %{date: ~D[2023-12-20], title: "Shopping"},
  3 => %{date: ~D[2023-12-19], title: "Movies"}
}
iex(2)> put_in(todo_list[3].title, "Theater")      
 
%{
  1 => %{date: ~D[2023-12-19], title: "Dentist"},
  2 => %{date: ~D[2023-12-20], title: "Shopping"},
  3 => %{date: ~D[2023-12-19], title: "Theater"}    
}
```

- `put_in/2` walks recursively to the desired element, transforms it, and then updates all the parents
- Other data retrieval and updates: `get_in/2`, `update_in/2`, and `get_and_up-date_in/2` macros
- These macros are compiled at runtime and cannot be built dynamically
- To construct a path a runtime uses the `Access` module, which works with key-value structures, such as maps

```Shell
iex(3)> path = [3, :title]
 
iex(4)> put_in(todo_list, path, "Theater")
```

Deleting an Entry
- Create: `add_entry/2`
- Retrieve: `entries/2`
- Update: `update_entry/2`
- Delete: `delete_entry/2`

4. <font style="color:#A8A8A8; text-decoration: underline;">Iterative Updates</font>
- Iteratively building the to-do list

```Shell
$ iex todo_builder.ex
 
iex(1)> entries = [
          %{date: ~D[2023-12-19], title: "Dentist"},
          %{date: ~D[2023-12-20], title: "Shopping"},
          %{date: ~D[2023-12-19], title: "Movies"}
        ]
iex(2)> todo_list = TodoList.new(entries)
```

```Elixir
defmodule TodoList do
  ...
 
  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},                       
      fn entry, todo_list_acc ->         
        add_entry(todo_list_acc, entry)
      end
    )
  end
 
  ...
end
```

- To build the to-do list iteratively the function `Enum.reduce/3` is used
- `reduce` transforms something enumerable to anything else
- Transforms a raw list of `Entry` instances into an instance of the `TodoList` struct
- The input list of the first argument, the new structure instance (initial accumulator), and lambda is called in each `recuce` step
- The `add_entry` arguments are revered since `reduce` calls the lambda, passing the iterated element (entry) and acc struct
- Use the capture operator to compact and lambda definition

```Elixir
def new(entries \\ []) do
	Enum.reduce(
	entries,
	%TodoList(),
	&add_entry(&2, &1)
	)
end
```


5. <font style="color:#A8A8A8; text-decoration: underline;">Exercise: Importing from a File</font>
- Create a `TodoList` from a CSV(Comma-Separated Values) file
- Create an module, `TodoList.CsvImporter` that can be used to create a `TodoList` instance from the file contents

`iex(1)> todo_list = TodoList.CsvImporter.import("todos.csv")`

```csv
2023-12-19,Dentist
2023-12-20,Shopping
2023-12-19,Movies
```

```Elixir
defmodule TodoList do
	...
end

defmodule TodoList.CsvImporter do
	...
end
```

- Implement parts of the calculation and then print result using `IO.inspect/1`
- General steps
	- Open a file, remove `\n` from each line
		- `File.stream!/1
		- `Stream.map/2
		- `String.trim_trailing/2
	- Using `Stream.mao` transform each line into a to-do list entry
		- Convert line into `[date_string, title]` using `String.split/2`
		- Convert the date string into a date, using `Date.from_iso8601!`
		- Create the to-do list entry
			- A map in the shape of `%{date: date, title: title}`
- Enumerate each input, and transform resulting in the final enumerable passed to `TodoList.new/1`
- `Stream` functions are lazy and composable, which can reduce the amount of intermediate memory required for the operation

```Elixir
defmodule TodoList do
  def parse_file(file_path) do
    file_path
    |> File.stream!() #open file as a stream
    |> Stream.map(&String.trim_trailing(&1, "\n")) #remove newlines from each lien
    |> Stream.map(&parse_line(&1)) #process each line to create an entry
    |> Enum.to_list() #collect results
    |> IO.inspect(label: "TO-DO List")
  end

  defp parse_line(line) do
    [date_string, title] = String.split(line, ",") #split line
    date = Date.from_iso8601!(date_string)
    %{date: date, title: title}
  end
end

TodoList.parse_file("todo.txt")
---
TO-DO List: [
  %{date: ~D[2023-12-19], title: "Dentist"},
  %{date: ~D[2023-12-20], title: "Shopping"},
  %{date: ~D[2023-12-19], title: "Movies"}
]
```


## 4.3 <font style="color:#40E0D0">Polymorphism with Protocols</font>
_Polymorphism_ is a runtime decision about which code to execute, based on the input data
- Basic way of doing this is by using _protocols_

```Elixir
Enum.each([1, 2, 3], &IO.inspect/1)
Enum.each(1..3, &IO.inspect/1)
Enum.each(%{a: 1, b: 2}, &IO.inspect/1)
```

- Sending different data structures to `Enum`: list, range, map
- This contract, called a _protocol_, is implemented for each data type

1. <font style="color:#A8A8A8; text-decoration: underline;">Protocol Basics</font>
- A _protocol_ is a module in which you declare functions without implementing them
- The protocol `String.Chars` is used to convert data to a binary string

```Elixir
defprotocol String.Chars do
	def to_string(term) #declaration of protocol function
end
```

- Elixir implements the protocol for atoms, numbers, and some other data types

```Shell
iex(1)> String.Chars.to_string(1)
"1"
 
iex(2)> String.Chars.to_string(:an_atom)
"an_atom"
```

- If not implemented

```Shell
ex(3)> String.Chars.to_string(TodoList.new())
** (Protocol.UndefinedError) protocol String.Chars not implemented
```

- `String.Chars` is the auto-imported function from `Kernel.to_string/1`
- 

```Shell
iex(7)> IO.puts(1)
1
 
iex(8)> IO.puts(:an_atom)
an_atom
 
iex(9)> IO.puts(TodoList.new())
** (Protocol.UndefinedError) protocol String.Chars not implemented
```


2. <font style="color:#A8A8A8; text-decoration: underline;">Implementing a Protocol</font>
- To implement a protocol for a specific type

```Elixir
defimpl String.Chars, for: Integer do
	def to_string(term) do
		Integer.to_string(term)
	end
end
```

- Start the implementation by calling the `defimpl` macro
- Then specify which protocol to implement and the corresponding data type
- the `do/end` block contains the implementation of each protocol function
	- Implementation delegates to the existing standard library function `Integer.to_string/1`
- The `for: Type` is an atom and can be for following aliases:
	- Tuple
	- Atom
	- List
	- Map
	- BitString
	- Integer
	- Float
	- Function
	- PID
	- Port
	- Reference
- The alias `Any` is allowed, which makes it possible to specify a fallback implementation
- The type can be any other arbitrary alias (other than a simple atom)

```Elixir
defimpl String.Chars, for: SomeAlias do
	...
end
```

```Shell
iex> defimpl String.Chars, for: TodoList do
		def to_string(_) do
			"#TodoList"
		end
	end

iex> IO.puts(ToDoList.new())
#TodoList
```

- Protocol implementation does not need to be part of a module
- Implement a protocol for a type, even if you can't modify the type's source code


3. <font style="color:#A8A8A8; text-decoration: underline;">Built-in Protocols</font>
- Elixir comes with some predefined protocols
- `List.Chars` protocol, converts input data to a character string
- `Inspect` protocol changes the structure of printed in the debug output via `inspect` function
- `Enumberable` protocol help make your own data structure _enumerable_
- Therefore functions from `Enum` and `Stream` modules are available to use
- `Collebtable` protocol helps change the collectable structure
- Define your own protocols and implement them for any available data structure with `Kernel.defprotocol/2`

Collectable To-Do List

```Elixir
defimpl Collectable, for: TodoList do
	def into(original) do
		{original, &into_callback/2}
	end

	defp into_callback(todo_list, {:cont, entry}) do
		TodoList.add_entry(todo_list, entry)
	end

	defp into_callback(todo_list, :done), do: todo_list
	defp into_callback(_todo_list, :halt), do: :ok
end
```

- The `into()` function returns the appender lambda
	- Called by the generic code
- The `into_callback()` functions is the appender implementation
	- Repeatedly invoked by the generic code to append each element to your data structure
	- Receives a to-do list and an instruction hint

```Shell
iex(1)> entries = [
          %{date: ~D[2023-12-19], title: "Dentist"},
          %{date: ~D[2023-12-20], title: "Shopping"},
          %{date: ~D[2023-12-19], title: "Movies"}
        ]
 
iex(2)> Enum.into(entries, TodoList.new())    
%TodoList{...}
```

- By implementing the `Collectable` protocol, the `TodoList` abstraction is adapted to any generic code that relies on that protocol, such as `Enum.into/2` or `for` comprehension


---

# PART 2 - Concurrent Elixir
- Elixir is both a functional and a concurrent language
	- Functional helps structures code
	- Concurrent helps organize runtime to improve the availability of the system
- OTP (Open Telecom Platform) provides a robust framework for building scalable and fault-tolerant applications
## 5. Concurrency Primitives
^38fceb

- BEAM concurrency supports scalability, fault tolerance, and distribution

## 5.1 <font style="color:#40E0D0">Concurrency in BEAM</font>
- Erlang is about writing highly available systems
	- Run forever and are always able to respond to client requests
- Challenges of highly available systems:
	- Fault tolerance
	- Scalability
	- Distribution
- In BEAM, the unit of concurrency is a _process_
	- A basic building block that makes it possible to build highly available systems
- BEAM processes are might lighter and cheaper than OS processes
- In production, a typical server system must handle many simultaneous request from different clients, maintain shared state (caches, user session data, and server-wide data), and run additional background processing jobs
- The CPU resources are used efficiently to execute tasks in parallel
- Tasks should be as isolated from each other as possible
- Processor parallelization helps achieve scalability
- Processor isolation helps with fault tolerance
- In BEAM, a process is a concurrent thread of execution, two processes run concurrently and may run in parallel if two CPU cores are available
- Unlike OS processes or threads, BEAM processes are lightweight, concurrent entities handled by the VM, which has its own scheduler

![[Pasted image 20250207190020.png|500]]

- Each scheduler runs in its own thread, and the entire VM runs on a single OS process
- Each process get an execution time slot, when time is done, running process is preempted, and the next one begins
- Processes are light executing in microseconds and containing few kilobytes
- OS threads usually use megabytes just for the stack
- This feature is used in server-side systems to manage tasks
- Running tasks in different processes improves the server's reliability and fault tolerance
- BEAM processes are completely isolates, they share no memory
- BEAM provides a means to detect a process crash and do something about it
	- Restarting process
	- Systems are more stable
- Each process can manage some state and receive messages from other processes to manipulate or retrieve that state
- To keep data alive, it is constantly passing the result of one function to another
- A process is a container of this data

## 5.2 <font style="color:#40E0D0">Working with Processes</font>
- Used to run concurrent and parallel processes
	- Long-running database queries

Concurrency vs. Parallelism
- Parallel execution cannot happen with only one CPU core

```Shell
iex(1)> run_query =
		fn query_def ->
			Process.sleep(2000)
			"#{query_def} result"
		end

iex(2)> run_query.("query 1")
 
"query 1 result"
```

- Code sleeps for 2 seconds to simulate a long-running operation
- The shell is blocks until the lambda is done
- If 5 queries are ran, it will take 10 seconds

```Shell
iex(3)> Enum.map(
          1..5,
          fn index ->
            query_def = "query #{index}"
            run_query.(query_def)
          end
        )
 
["query 1 result", "query 2 result", "query 3 result"    
 "query 4 result", "query 5 result"]
```

- To run concurrently, a separate process is made

1.  <font style="color:#A8A8A8; text-decoration: underline;">Creating Processes</font>
- To create a process, `spawn/1` function is created

```Elixir
spawn(fn ->
	expression_1
	...
	expression_n
end)
```

- The function create a new process
- The provided zero-arity lambda will run concurrently in the spawned processes
- After finished, the spawned process is stopped, returns and the caller process can continue its execution

```Shell
iex(4)> spawn(fn ->
			query_result = run_query.("query 1")
			IO.puts(query_restul)
			end)
#PID<0.48.0>

query 1 result
```

- `spawn/1` is returned immediately, to do something else in the shell, then the result is printed on the screen
- The PID is the identifier of the created process

```Shell
iex(5)> async_query =
			fn query_def ->
				spawn(fn ->
					query_result = run_query.(query_def)
					IO.puts(query_result)
				end)
			end
iex(6)> async_query.("query 1")
#PID<0.52.0>
 
query 1 result
```

- Passing data to the created process
- `async_query` takes one argument and binds it to the `query_def` variable
- The data is then passed to the newly created process via the closure mechanism
	- The inner lambda references the variable `query_def` from the outer scope
- This result in cross-process data passing, from main to new
- When is passed to another process, the data is deep copied because two process cannot share any memory

```Shell
iex(7)> Enum.each(1..5, &async_query.("query #{&1}"))
:ok                 
 
query 1 result      
query 2 result      
query 3 result      
query 4 result      
query 5 result
```

- All results are returned in 2 seconds, compared to 10
- The order of execution isn't deterministic
	- Results are printed in any order
- "Fire-and-forget" concurrent execution, where the caller process does not receive any notification from the spawned one, will suffice
- If you want to return the result of the concurrent operation to the caller process, _message-passing_ is used

2. <font style="color:#A8A8A8; text-decoration: underline;">Message Passing</font>  
- Being isolated, processes can't use shared data structures to exchange knowledge
- Instead, processes communication via messages are used

![[Pasted image 20250207192637.png|500]]

- When process A want process B to do something, it sends an asynchronous message to B
- The content of the message is anything you can stores in a variable
- Sending a message amounts to storing it into the receiver's mailbox
- The caller then continues with its execution, and the receiver can pull the message in at any time and process it
- A message is deep copied when sent
- The mailbox is a FIFO queue limited only by the available memory
- Messages are removes only when consumed
- Send a message using the PID
	- Created during `spawn/1` or called with `self/0` function
- Send it using `Kernel.send/2`

`send(pid, {:an, :arbitrary, :term})`

- To pull a message use the `receive` expression

```Elixir
recieve do
	pattern_1 -> do_something
	pattern_2 -> do_something_else
end
```

- `receive` works similar to `case` expression, where it will match each message and run the corresponding code

```Shell
iex(1)> send(self(), "a message")          
 
iex(2)> receive do                        
          message -> IO.inspect(message)   
        end                               
 
"a message"
```

```Shell
iex(3)> send(self(), {:message, 1})
 
iex(4)> receive do
          {:message, id} ->                  
            IO.puts("received message #{id}")
        end
 
received message 1
```

- If there are no messages or no matched message, and `receive` is called it will wait indefinitely for a new message and shell is blocked
- Use `after` clause, which is executed if a message is not received in a five time frame

```Shell
iex(1)> receive do
          message -> IO.inspect(message)
        after
          5000 -> IO.puts("message not received")
        end
 
message not received   
```

Receive Behaviour
- `recieve` expression does not have an error when there is no pattern-match
- When message is not matched, it is put back into the process mailbox
- `receive` expression
	- Take the first message
	- Try to match
	- If pattern matches the message, run the code
	- If no pattern matches, take the next message
	- If there are no more messages in the queue, wait for a new one to arrive
	- If the `after` clause is specified and no message is match, run the code

```Shell
iex(1)> send(self(), {:message, 1})
 
iex(2)> receive_result =
          receive do
            {:message, x} ->
              x + 2            
          end
 
iex(3)> IO.inspect(receive_result)
3
```

Synchronous Sending
- The basic message-passing mechanism is the asynchronous "fire-and-forget" kind
- A process sends a message, an is oblivious to the receiver
- Use asynchronous messaging facility to support caller responses from the receiver
- The caller must include its own PID in the message contents and when wait for a response

```Elixir
send(pid, {self(), some_message}) #includes caller PID

receive do
	{:response, response} -> ...
end
```

- Receiver uses the caller's PID to send a response

```Elixir
receive do
	{caller_pid, message} ->
		response = ...
		send(caller_pid, {:response, response})
end
```

Collecting Query Results
```Shell
iex(1)> run_query =
          fn query_def ->
            Process.sleep(2000)
            "#{query_def} result"
          end
 
iex(2)> async_query =
          fn query_def ->
            spawn(fn ->
              query_result = run_query.(query_def)
              IO.puts(query_result)
            end)
          end
```

- Instead of printing the results to the screen, collect in the main process

```Shell
iex(3)> async_query =
          fn query_def ->
            caller = self()          #stores the PID of calling process
 
            spawn(fn ->
              query_result = run_query.(query_def)
              send(caller, {:query_result, query_result})  #response
            end)
          end
```

- Store the PID of the calling process to `caller`
- The worker process uses the `caller` variable to return the result of the calculation

`iex(4)> Enum.each(1..5, &async_query.("query #{&1}"))`

- This runs all the queries concurrently, the result is stores in the mailbox of the caller process, in this case the shell (iex)
- Caller is neither blocked or interrupted
- Messages remain in the mailbox until they are consumed or the process terminates
- Create a lambda that pulls one message from the mailbox and extracts the query result from it

```Shell
iex(5)> get_result =
          fn ->
            receive do
              {:query_result, result} -> result
            end
          end

iex(6)> results = Enum.map(1..5, fn _ -> get_result.() end)
["query 3 result", "query 2 result", "query 1 result",
 "query 5 result", "query 4 result"]
```

- Results are nondeterministic since computations are run concurrently
- This implementation of parallel map can be used to process a large amount of work in parallel and then collect the result into a list

```Shell
iex(7)> 1..5
        |> Enum.map(&async_query.("query #{&1}"))  #starts concurrency
        |> Enum.map(fn _ -> get_result.() end) #Collects results
```

## 5.3 <font style="color:#40E0D0">Stateful server processes</font>
- Common to create long-running processes that can serve various requests, send in the form of message
- Processes may maintain some internal state, an arbitrary piece of data that may change over time
- _Stateful server processes_ is a server than maintains client-specific state information across multiple requests

   
1. <font style="color:#A8A8A8; text-decoration: underline;">Server Processes</font>
  - A _server process_ is an informal name for a process that runs for a long time and can handle various message
  - Endless tail recursion is used to make process run forever
  - Run a endless loop and wait for a message, when received handle it and continue

- Long-running server process
```Elixir
defmodule DatabaseServer do
	def start do
		spawn(&loop/0)
	end

	defp loop do
		receive do
			...
		end

		loop()
	end

	...
end
```

- `start/0` is the _interface function_ used by clients to start the server
- When called it spawns the process that runs `loop/0`
- The function powers the infinite loop
- Process is mostly idle, waiting, and is note CPU intensive
- Waiting for a message puts the process in a suspended state and doesn't waste CPU cycles
- Function `start/0` is called by clients and runs in a client process, and private function `loop/0` runs in the server process
- When implementing a server process it is usually in a single module
	- Interface
		- _Interface functions_ are public and are executed in the caller process
	- Implementation
		- _Implementation functions_ are private and run the server process

- A standard abstraction is the `GenServer`, which simplifies the development of stateful server processes
- The abstraction relies on recursion

- Database server loop

```Elixir
defmodule DatabaseServer do
	...

	defp loop do
		receive do
			{:run_query, caller, query_def} ->
				query_restul = run_query(query_def)
				send(caller, {:query_result, query_result})
		end

		loop()
	end

	defp run_query(query_def) do
		Process.sleep(2000)
		"#{query_def} result"
	end

	...
end
```

- The caller sends a message in the format `{:run_query, caller, query_def}
- The server processes the message and sends the query result back to the caller process
- These details are hidden from the client
- `run_sync` use used by clients to request the operation from the server
- This makes the client unaware of message-passing detail

```Elixir
defmodule DatabaseServer do
	...

	def run_async(server_pid, query_def) fo
		send(server_pid, {:run_query, self(), query_def})
	end
	...
end
```

- `run_async/2` function receives the pUD of the database server and a query to execute
- It send the message to the server
- Calling `run_async/2` from the client requests the server process to run the query while the caller continues
- When query is executes, the server sends a message to the caller process, and is received with `get_result/0`

```Elixir
defmodule DatabaseSever do
	...

	def get_result do
		receive do
			{:query_result, result} -> result
		after
			5000 -> {:error, :timeout}
		end
	end

	...
end
```

- `get_result/0` is called when the client wants to get the query result
- `receive` gets the message, and `after` returns to client after a set time if no response is received

```Shell
iex(1)> server_pid = DatabaseServer.start()
iex(2)> DatabaseServer.run_async(server_pid, "query 1")
iex(3)> DatabaseServer.get_result()
"query 1 result"

iex(3)> DatabaseServer.run_async(server_pid, "query 2")
iex(3)> DatabaseServer.get_result()
"query 1 result"
```

- Server process is continuously running

Server Processes are Sequential
- A server process is internally sequential
- A server process can be considered a synchronization point
- Start a pool of server processes, and then for each query, choose one of the processes from the pool

`pool = Enum.map(1..100, fn _ -> DatabaseServer.start()`

- 100 database-server processes are created and their PID are stored in a list
	- Only take about 2 KB of memory
- `rand:uniform/1` that takes a positive integer $n$ and returns a random number in `1...n`

```Shell
iex(2)> Enum.each(
          1..5,
          fn query_def ->
            server_pid = Enum.at(pool, :rand.uniform(100) - 1)    
            DatabaseServer.run_async(server_pid, query_def)       
          end
        )
```

- 5 random queries are ran, and responses are collected

```Shell
iex(3)> Enum.map(1..5, fn _ -> DatabaseServer.get_result() end)
["5 result", "3 result", "1 result", "4 result", "2 result"]
```

- Results are faster since queries are executed concurrently

2. <font style="color:#A8A8A8; text-decoration: underline;">Keeping a Process State</font>
  - Server processes open the possibility of keeping a process-specific state
	  - Maintain connection when talking to a database

```Elixir
def start do
	spawn(fn ->
		initial_state = ...
		loop(initial_state)
		end)
	end

defp loop(state) do
	...
	loop(state)
end
```
  
- Initializing the process state

```Elixir
defmodule DatabaseServer do
	...

	def start do
		spawn(fn ->
			connection = :rand.uniform(1000)
			loop(connection)
		end)
	end
	...
end
```

- A connection is opened and passed to the `loop` function
- Instead of generating a random number, a database client library (ODBC) is used to open the connection
- Using the connection while querying

```Elixir
defmodule DatabaseServer do
	...

	defp loop(connection) do
		receive do
			{:run_query, from_pid, query_def} ->
				query_result = run_query(connection, query_def)
				send(from_pid, {:query_result, query_result})
			end

		loop(connection)
	end

	defp run_query(connection, query_def) do
		Process.sleep(2000)
		"Connection #{connection}: #{query_def} result"
	end

	...
end
```

- The `loop` function takes the state (connection) as the first argument
- Each time the loop is resumed, the function passes on the state to itself, so its available in the next step
- The `run_query` is extended to use the connection while querying the database
- The connection handle (a number) is included in the query result

```Shell
iex(1)> server_pid = DatabaseServer.start()
iex(2)> DatabaseServer.run_async(server_pid, "query 1")
iex(3)> DatabaseServer.get_result()
"Connection 753: query 1 result"
iex(4)> DatabaseServer.run_async(server_pid, "query 2")
iex(5)> DatabaseServer.get_result()
"Connection 753: query 2 result"
```

- The different queries are executed using the same connection handle, kept internally
  
  
3. <font style="color:#A8A8A8; text-decoration: underline;">Mutable State</font>
  - Compute the new state based on a message

```Elixir
defp loop(state) do
	new_state =
		receive do
			msg1 ->
				...

			msg2 ->
				...
		end

	loop(new_state)
end
```

- This is standard for stateful server technique in Elixir
- The process determines the new state while handling the message
- The loop function calls itself with the new state, which changes the state
- The next received message operates on the new state
- From the outside, stateful processes are mutable
- Sending messages to a process, a caller can affect its state and the outcome of requests handled in that server
- Server relies on immutable data structures

- Create a stateful process that keeps a number as its state
	- Initially, state is 0
	- Manipulate with request: `add, sub, mul, div`
	- Retrieve the process state with the `value` request

```Shell
iex> cal_pid = Calculator.start()

iex> Calculator.value(cal_pid)
0
iex> Calculator.add(cal_pid, 10)
iex> Calculator.sub(cal_pid, 5)
iex> Calculator.mul(cal_pid, 3)
iex> Calculator.div(cal_pid, 5)

iex> Calculator.value(cal_pid)
3.0
```

$(((0 + 10) - 5) * 3) / 5=3.0$

- Concurent stateful calculator

```Elixir
defmodule Calculator do
	...

	defp loop(current_value) do
		new_value =
			receive do
				{:value, caller} ->
					send(caller, {:response, current_value})
					current_value
					
			{:add, value} -> current_value + value
			{:sub, value} -> current_value - value
			{:mul, value} -> current_value * value
			{:div, value} -> current_value / value

			invalid_request ->
				IO.puts("invalid request #{inspect invalid_request}")
				current_value
			end

		loop(new_value)
	end
	...
end
```

- The calculator sets getter requests, arithmetic operations requests, and unsupported requests

Getter requests
- The `:value` message is used to retrieve the server's state
- The `current_value` is needed because the `receive` is stored in `new_value`, which is then used as the server's new state
- By returning `current_value`, you specify that the `:value` request does not change the process state

Arithmetic requests
- Operations compute the new state based on the current value and the argument received in the message
- Do not send responses back to the called, and can be run asynchronously

Unsupported requests
- Log and return `current_value` leaving the state unchanged

- Calculator interface function used by clients

```Elixir
defmodule Calculator do
	def start do
		spawn(fn -> loop(0) end)
	end

	def value(server_pid) do
		send(server_pid, {:value, self()})

		receive do
			{:response, value} ->
				value
			end
		end

		def add(server_pid, value), do: send(server_pid, {:add, value})
		def sub(server_pid, value), do: send(server_pid, {:sub, value})
		def mul(server_pid, value), do: send(server_pid, {:mul, value})
		def div(server_pid, value), do: send(server_pid, {:div, value})
	...
end
```

- This code starts the server and initializes the state, the value is requests, and arithmetic operation for each request
- The interface follow the protocol specified in `loop/1`
- The caller sends a message and waits for the response
- The caller is blocked until the response comes back, which makes the request handling synchronous
- The arithmetic operations run asynchronously, the caller is not waiting for a response
	- Caller can issue multiple requests and continue to do its own work
- Server handles messages in order received, so requests are handled in the proper order

Refactoring the Loop
- The `loop` function becomes more complex with more requests to the server
- Too many requests will result in a `switch/case` like expression
- Refactor by relying on pattern matching and moving the message handling to a separate multi-clause function

```Elixir
defp loop(current_value) do
	new_value =
		receive do
			message -> process_message(current_value, mesage)
		end

	loop(new_value)
end
```

- A message is received and then processed
- Message processing generally amounts to computing the new state based on the current state and the message received
- Loop with the new state, effectively setting it in place of the old

```Elixir
defp process_message(current_value, {:value, caller}) do
	send(caller, {:response, current_value})
end

defp process_message(current_value, {:add, value}) do
	current_value + value
end

...
```

- This re-organizes the server process loop
- Allows you to loop code compact and move the message-handling details to a separate multi-clause function, with each clause handing a specific message
  
4. <font style="color:#A8A8A8; text-decoration: underline;">Complex States</font>
  - Keep the mutable state using the private `loop` function
  - As the state becomes more complex, the code of the server process can become more complicated
  - Extract the state manipulation to a separate module and keep the server process focused only on passing messages and keeping the state

- TodoList abstraction structure

```Shell
iex(1)> todo_list =
          TodoList.new() |>
          TodoList.add_entry(%{date: ~D[2023-12-19], title: "Dentist"}) |>
          TodoList.add_entry(%{date: ~D[2023-12-20], title: "Shopping"}) |>
          TodoList.add_entry(%{date: ~D[2023-12-19], title: "Movies"})
 
iex(2)> TodoList.entries(todo_list, ~D[2023-12-19])
[
  %{date: ~D[2023-12-19], id: 1, title: "Dentist"},
  %{date: ~D[2023-12-19], id: 3, title: "Movies"}
]
```

- `TodoList` is a pure functional abstraction
- To keep the structure alive, constantly hold on the result of the last operation performed on the structure
- `TodoServer` module keeps this abstraction in the private state

```Shell
iex(1)> todo_server = TodoServer.start()
 
iex(2)> TodoServer.add_entry(
          todo_server,
          %{date: ~D[2023-12-19], title: "Dentist"}
        )
 
iex(3)> TodoServer.add_entry(
          todo_server,
          %{date: ~D[2023-12-20], title: "Shopping"}
        )
 
iex(4)> TodoServer.add_entry(
          todo_server,
          %{date: ~D[2023-12-19], title: "Movies"}
        )
 
iex(5)> TodoServer.entries(todo_server, ~D[2023-12-19])
[
  %{date: ~D[2023-12-19], id: 3, title: "Movies"},
  %{date: ~D[2023-12-19], id: 1, title: "Dentist"}
]
```

- Start the server and then interact with it via `TodoServer` API
- In contrast, to the pure functional approach, the modified result does not need to be passed
- Instead, the `todo_server` variable does the same thing

```Elixir
defmodule TodoServer do
	...
end

defmodule TodoList do
	...
end
```

- Basic structure of the to-do server process

```Elixir
defmodule TodoServer do
	def start do
		spawn(fn -> loop(TodoList.new()) end)
	end

	defp loop(todo_list) do
		new_todo_list =
			receive do
				message -> process_message(todo_list, message)
			end

		loop(new_todo_list)
	end
	...
end
```

- The `TodoList` abstraction is initialized at the starting state
- In the loop, receive messages by calling `process_message/2`, which returns the new state
- Loop with the new state
- For each request, add a dedicated clause in the process_message/2 function
- A corresponding interface function is introduced

```Elixir
defmodule TodoServer do
	...

	def add_entry(todo_server, new_entry) do
		send(todo_server, {:add_entry, new_entry})
	end

	...

	defp process_message(todo_list, {:add_entry, new_entry}) do
		TodoList.add_entry(todo_list, new_entry)
	end

	...
end
```

- The `add_entry` is the interface function
- The `process_message` is the message-handler clause

- The interface sends the new entry data to the server
- This message will be handles by the `process_message/2`
- The `TodoList.add_entry/2` returns the modified instance, and is used as the new server's state
- Implementing the `entries` request

```Elixir
defmodule TodoServer do
	...

	def entries(todo_server, date) do
		send(todo_server, {:entries, self(), date})

		receive do
			{:todo_entries, entries} -> entries
		after
			5000 -> {:error, :timeout}
		end
	end

	...

	defp process_message(todo_list, {:entries, caller, date}) do
		send(caller, {:todo_entries, TodoList.entries(todo_list, date)})
		todo_list
	end

	...
end
```

Concurrent vs. Functional Approach
- A process that maintains mutable state can be a kind of mutable data structure
- The data should be modeled using pure function abstraction, like `TodoList`
- A pure functional data structure provides integrity, atomicity, reusability, and testability

- A stateful process servers as a container of a mutable data structure
- The process keeps the state alive and allows other processes in the system to interact via the exposed AIP
- For a web server that manages multiple to-do lists, one server process can run for each
- While handling an HTTP request, find the corresponding to-do server and preform a request operation
- Each to-do list runs concurrently, making it scalable and more performant
- No synchronization issues because each to-do list is managed in a dedicated process


5. <font style="color:#A8A8A8; text-decoration: underline;">Registered Processes</font>
- For a process to cooperate with other processes, it must know their whereabouts
- In BEAM, a process is identifies by it corresponding PID
- Give a process a _local name_ and use that name to send messages to the process
- The name is local because it only has meaning in the currently running BEAM instance
- Register a process with `Process.register(pid, name)`, where name is an atom

```Shell
iex> Process.register(self(), :some_name)
iex> send(:some_name, :msg)
iex> receive do
		msg -> IO.puts("received #{msg}")
	end

received msg
```

- Registered name contraints
	- Atom
	- single process only have one name
	- Two processes can't have the same name

```Shell
iex(1)> TodoServer.start()
 
iex(2)> TodoServer.add_entry(%{date: ~D[2023-12-19], title: "Dentist"})
iex(3)> TodoServer.add_entry(%{date: ~D[2023-12-20], title: "Shopping"})
iex(4)> TodoServer.add_entry(%{date: ~D[2023-12-19], title: "Movies"})
 
iex(5)> TodoServer.entries(~D[2023-12-19])
[%{date: ~D[2023-12-19], id: 3, title: "Movies"},
 %{date: ~D[2023-12-19], id: 1, title: "Dentist"}]
```

- A server process is registered under a name `:todo_server`
- The interface functions are changes to use the registered name when sending message
- Using a registered server is simpler since the server's PID does not need to be stored or passed
- Local registration are a way to communicate without knowing PID
	- Used in restarting processes and distributed systems


## 5.4 <font style="color:#40E0D0">Runtime considerations</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">A Process is Sequential</font>
- A single process is a sequential program
- Multiple processes run concurrently
- But if many processes send messages to a single process, that single process may experience bottleneck, which affects overall throughput
- Demonstration of a process bottleneck

```Elixir
defmodule Server do
	def start do
		spawn(fn -> loop() end)
	end

	def send_msg(server, message) do
		send(server, {self(), message})

	receive do
		{:response, response} -> response
		end
	end

	defp loop do
		receive do
			{caller, msg} ->
				Process.sleep(1000)
				send(caller, {:response, msg})
		end

		loop()
	end
end
```

- When receiving a message, the server sends the message back to the caller
- Before, it sleeps for a second to simulate a long-running request
- To test the behaviour in a concurrent setting, start the server and 5 concurrent clients

```Shell
iex(1)> server = Server.start()
 
iex(2)> Enum.each(
          1..5,
          fn i ->
            spawn(fn ->                               
              IO.puts("Sending msg ##{i}")
              response = Server.send_msg(server, i)   
              IO.puts("Response: #{response}")
           end)
         end
        )
---
Sending msg #1
Sending msg #2
Sending msg #3
Sending msg #4
Sending msg #

Response: 1        
Response: 2        
Response: 3        
Response: 4        
Response: 5
```

- Although sending is concurrent, the response are delayed by 1 seconds each
- The echo server can handle only one message per second
- Since all other processes depend on the echo server, they are constrained hy its throughput
- A server process receives and handles messages one by one
- If message handling cannot match the speed of the server requests from the `receive`, is can be split into multiple processes, parallelizing the original work in a multicore system
  
2. <font style="color:#A8A8A8; text-decoration: underline;">Unlimited Process Mailboxes</font>
  - Theoretically, a process mailbox has unlimited size, although it is limited by available memory
  - Messages arrive faster than the process can handle
  - Mailbox will constantly grow and increase memory usage

```Elixir
defp loop
	receive do
		{:message, msg} -> do_something(msg)
	end

	loop()
end
```

- A server powered by this loop only handles messages in the following form
	- `{:message, something}`
- All other messages remain in the process mailbox forever, taking up space

- Overgrown mailbox content can affect performance
	- Pressure on the garbage collector
	- Slow pattern matches in `receive`
- Introduce a _match_all_ receive clause that deals with unexpected kinds of messages

```Elixir
defp loop
	receive
		{:message, msg} -> do_something(msg)
		other -> warn_about_unknown_message(other)
	end

	loop()
end
```

3. <font style="color:#A8A8A8; text-decoration: underline;">Share-Nothing Concurrency</font>
  - Sending a message to another process result in a deep copy of the message

`send(target_pid, data)`

- A variable closure is spawned element also results in deep copying the close variable

```Elixir
data = ...

spawn(fn ->
	...
	some_fun(data)
	...
end)
```

- Deep copying is an in-memory operation, should be reasonably fast and not cause errors
- Special cases when data is copied by reference with binaries (including strings) larger than 64 bytes, hardcoded constants (_literals_), and terms created via the `:persistent_term` API
- Shared-nothing concurrency ensures complete isolation between processes
- Garbage collection can take place on a process level
- Each process get an initial small chunk of heap memory (~2 KB on 64-bit BEAM)
- When more memory is needed, garbage collection for that process takes place
- Garbage collection is concurrent and distributed
  
4. <font style="color:#A8A8A8; text-decoration: underline;">Scheduler Inner Workings</font>
  - There are $n$ schedulers that run $m$ processes, with $m$ most often being larger than $n$
  - This is called $m:n$ threading, and it reflects the fact that you run a larger number of logical micro-threads using smaller number of OS threads

![[Pasted image 20250208173905.png|500]]

- Each BEAM scheduler is an OS thread that manages the execution of BEAM processes
- BEAM uses only as many schedulers as there are logical processors available
- This can be changed via Erlang emulator flags

`iex --erl "put Erlang emulator flags here"`

- Use only one scheduler thread, use `+S 1`

```Shell
$ iex --erl "+S 1"
Erlang/OTP 26 [erts-14.0] [source] [64-bit] [smp:1:1] [ds:1:1:10]
iex(1)> System.schedulers()
1
```

- `smp:1:1` informs that only one scheduler thread is used
	- Also shown with `System.schedulers()`

- Each scheduler picks one process, runs it for a while, and then picks another process
- When in the scheduler, the process gets a small execution window of ~2,000 function calls, after which it's preempted
- Long-running CPU-bound work or a larger garbage collection might be performed on another thread (_dirty scheduler_)
- A single process is in the scheduler for less than 1 ms
- Start a session with one scheduler thread, and spawn a process that runs an infinite CPU-bound loop

```Shell
$ iex --erl "+S 1"
iex(1)> spawn(fn ->
          Stream.repeatedly(fn -> :rand.uniform() end)
          |> Stream.run()
        end)
```

- The `Stream.repeadedly/1` creates a lazy infinite stream of random numbers
- The `Stream/run/1` function will run an infinite CPU-bound loop
- The work is done in a separate process, to avoid blocking `iex` shell
- If a current job is ran in the `iex` shell it will return immediately
- This is due to frequent context switching, which will ensure that an occasional long-running job will not significantly affect the responsiveness of the entire system

---

# 6. Generic Server Processes
^9809d1

- Stateful server processes
	- Long-running processes that react to messages and maintain state
- Reduce boilerplate with server processes, infinite recursion, state management, and message passing
- OTP framework provides patterns and abstractions for tasks such as:
	- Creating componenets
	- Building releases
	- Developing server processes
	- Handling and recovering from runtime errors
	- Logging
	- Event handling
	- Upgrading code
- `GenServer`, the module that simplifies the implementation of server processes

## 6.1 <font style="color:#40E0D0">Building a Generic Server Process</font>
- All server processes:
	- Spawn a separate process
	- Run an infinite loop in the process
	- Maintain the process state
	- React to messages
	- Send a response back to the caller
   
1. <font style="color:#A8A8A8; text-decoration: underline;">Plugging in with Modules</font>
- Generic code will spawn a process, but the concrete implementation must determine the initial state
- Generic code drive the entire process, and the specific implementation must fill in the missing pieces
- A module name is an atom
- An atom can be stores in a variable and later invoked on the module

```Shell
iex> some_module = IO
iex> some_module.puts("Hello") #dynatmic invocation
Hello
```

- Use this feature to provide callback hooks from the generic code

1) Make the generic code accept a plug-in module as the argument
	1) _Callback module_
2) Maintain the module atom as part of the process state
3) Invoke callback-module functions when needed
  
2. <font style="color:#A8A8A8; text-decoration: underline;">Implementing the Generic Code</font>
  - Starting a generic server process

```Elixir
defmodule ServerProcess do
	def start(callback_module) do
		spawn(fn ->
			initial_state = callback_module.init()
			loop(callback_module, initial_state)
		end)
	end
	...
end
```

- `ServerProcess.start/1` takes a module atom as the argument and then spawns the process
- In the spawned process, the callback function `init/0` is invoked to create the initial state
- The loop powers the server process and maintain this state
- The return value of `ServerProcess.start/1` is a `pid`, which can send messages to the request process
- Now, implement the loop code that powers the process, waits for messages, and handles them
- Below is a synchronous send-and-respond communication pattern
- The server process must receive a message, handle it, send the response message back to the caller, and change the process state

- Handling messages in the server process

```Elixir
defmodule ServerProcess do
	...

	defp loop(callback_module, current_state) do
		receive do
			{request, caller} ->
				{response, new_state} =
					callback_module.handle_call)
						request,
						current_state
						)
				send(caller, {:response, response})

				loop(callback_module, new_state)
			end
		end
	...
end
```

-  A message comes in the form of a `{request, caller}` tuple
- The `request` is data that identifies the request and used to specify implementation
- The callback function`handle_call/2` takes the request payload and current state, and returns `{response, new_state}` tuple
- Helper for issuing requests to the server process

```Elixir
defmodule ServerProcess do
	...

	def call(server_pid, request) do
		send(server_pid, {request, self()}) #sends the message

	receive do
		{:response, response} -> #waits for the response
			response #returns the response
		end
	end
end
```

3. <font style="color:#A8A8A8; text-decoration: underline;">Using the Generic Abstraction</font>
  - To test the server process, implement a key-value store
  - Process than can store mapping between arbitrary items
  - `init/0` which creates the initial state, and `handle_call/2` handles specific requests

```Elixir
defmodule KeyValueStore do
	def init do
		%{}
	end

	def handle_call({:put, key, value}, state) do
		{:ok, Map.put(state, key, value)}
	end

	def handle_call({:get, key}, state) do
		{Map.get(state, key), state}
	end
end
```

- To create a specific server process:
	- Initialize process state
	- handle put requests
	- handle get requests
- The `ServerProcess` module is generic code that forwards request form client processes to the callback module

```Shell
iex(1)> pid = ServerProcess.start(KeyValueStore)
 
iex(2)> ServerProcess.call(pid, {:put, :some_key, :some_value})
:ok
 
iex(3)> ServerProcess.call(pid, {:get, :some_key})
:some_value
```

- The `KeyValueStore` is the process that will be sending and receiving messages
- Where `KeyValueStore.handle_call/2` to perform the handling
- Abstract the `ServerProcess` by wrapping it with function calls

```Elixir
defmodule KeyValueStore do
	def start do
		ServerProcess.start(KeyValueStore)
	end

	def put(pid, key, value) do
		ServerProcess.call(pid, {:put, key, value})
	end

	def get(pid, key) do
		ServerProcess.call(pid, {:get, key})
	end

	...
end
```

- Clients use `start/0`, `put/3`, and `get/2` to manipulate the key-value store
- These functions are _interface functions_
- Clients use the interface functions of `KeyValueStore` to start and interact with the process
- In contrast, `init/0` and `handle_call/2` are callback functions used internally by the generic code
- Interface functions run in client processes, whereas callback functions are always invoked in the server process

4. <font style="color:#A8A8A8; text-decoration: underline;">Supporting Asynchronous Requests</font>
  - The current implementation of `ServerProcess` only support asynchronous requests
  - "Fire-and-forget" requests are asynchronous, in which a client sends a message and does not wait for a response
  - In the current code, the _call_ is for asynchronous requests
  - _Cast_ is used for asynchronous requests
  - Including the request type in the message

```Elixir
defmodule ServerProcess do
	...

	def call(server_pid, request) do
		send(server_pid, {:call, request, self()}) 
		#tags request message as call
		...
	end

	defp loop(callback_module, current_state) do
		receive do
			{:call, request, caller} -> #handles call request
				...
		end
	end
	...
end
```

- For `cast` requests, when a new message arrives it is handled and returns the new state, but no response is sent to the caller

```Elixir
defmodule ServerProcess do
	...

	def cast(server_pid, request) do
		send(server_pid, {:cast, request})
	end

	defp loop(callback_modue, current_state) do
		receive do
			{:call, request, caller} ->
				...

			{:cast, request} ->
				new_state =
					callback_module.handle_cast(
						request,
						current_state
					)

				loop(callback_module, new_state)
			end
		end
	...
end
```

- To handle a cast request, you need the callback function `handle_cast/2`
- This function handles the message and returns the new state
- The server loop invokes this function and loop with the new state
- A fire-and-forget type of request is not suitable for all requests
- `get` request must be a _call_ because the server process need to response with the value associated with a given key
- `put` request can be implemented as a cast because the client do not get a response

```Elixir
defmodule KeyValueStore do
	...

	def put(pid, key, value) do
		ServerProcess.cast(pid, {:put, key, value}) #issues request as cadt
	end

	...

	def handle_cast({:put, key, value}, state) do #handles put request
		Map.put(state, key, value)
	end
	...
end
```

- In the server process

```Shell
iex(1)> pid = KeyValueStore.start()
 
iex(2)> KeyValueStore.put(pid, :some_key, :some_value)
 
iex(3)> KeyValueStore.get(pid, :some_key)
:some_value
```

  - 
  
5. <font style="color:#A8A8A8; text-decoration: underline;">Exercise: Refactoring the To-do Server</font>
  - It is clumsy to place multiple modules in a single file and maintain multiple copies of the `ServerProcess` code in different files
  - A better approach to code organization is with the `mix` tool
  
## 6.2 <font style="color:#40E0D0">Using GenServer</font>
  - `GenServer` handles server edge cases and it battle tested in production in complex concurrent systems

`GenServer` features:
- Support for calls and casts
- Customizable timeouts for call requests
- Propagation of server process crashes to client processes waiting for a response
- Support for distributed systems

1. <font style="color:#A8A8A8; text-decoration: underline;">OTP Behaviors</font>
- A _behaviour_ is generic code that implements a common pattern
- The genetic logic is exposed through the behaviour module, and can plug into by implementing a corresponding callback module
- The callback module must satisfy a contract defined by the behaviour, meaning it must implement and export a set of function

OTP Behaviours in Erlang Standard Library
- `gen_server` - generic implementation of a stateful server process
- `supervisor` - provides error handling and recovery in concurrent systems
- `application` - generic implementation of components and libraries
- `gen_event` - provides event-handling support
- `gen_statem` - runs a finite state machine in a stateful server process

- Elixir provides its own wrappers for the most frequently used behaviours via the modules `GenServer`, `Supervisor`, `Application`

2. <font style="color:#A8A8A8; text-decoration: underline;">Plugging into GenServer</font>
  - `GenServer` behaviours defines eight callback functions

```Shell
iex(1)> defmodule KeyValueStore do
		use GenServer
	end
iex(2)> KeyValueStore.__info__(:functions)
[child_spec: 1, code_change: 3, handle_call: 3, handle_cast: 2,
 handle_info: 2, init: 1, terminate: 2]
```

- `use` macro is a language feature, that injects several functions into the calling module
- `__info__/1` lists all exported functions of a module
- These are all callback function that need to be implemented for you to plug into the `GenServer` behaviour
- Override the default implementation of each function

```Shell
iex(3)> GenServer.start(KeyValueStore, nil)
{:ok, #PID<0.51.0>}
```
  
3. <font style="color:#A8A8A8; text-decoration: underline;">Handling Requests</font>
  - Implement three callbacks: `init/1`, `handle_cast/1`, and `handle_call/3`

```Elixir
defmodule KeyValueStore do
	use GenServer

	def init(_) do
		{:ok, %{}}
	end

	def handle_cast({:put, key, value}, state) do
		{:noreply, Map.put(state, key, value)}
	end

	def handle_call({:get, key}, _, state) do
		{:reply, Map.get(state, key), state}
	end
end
```

- `init/1` accepts one argument, since the second is passed to the `GenServer.start/2` at client call
- The result of `init/1` must be in the format `{:ok, initial_state}`
- `handle_cast/2` accepts the request and the state, returns the result in the format `{:noreply, new_state}`
- `handle_call/3` takes the request, caller information, and state; returns the result in the format `{:reply, response, new_state}`
- Adding interface functions

```Elixir
defmodule KeyValueStore do
	use GenServer

	def start do
		GenServer.start(KeyValueStore, nil)
	end

	def put(pid, key, value) do
		GenServer.cast(pid, {:put, key, value})
	end

	def get(pid, key) do
		GenServer.call(pid, {:get, key})
	end
	...
end
```

- Test the server

```Shell
iex(1)> {:ok, pid} = KeyValueStore.start()
 
iex(2)> KeyValueStore.put(pid, :some_key, :some_value)
 
iex(3)> KeyValueStore.get(pid, :some_key)
:some_value
```

- If the response message does not arrive in 5 seconds, an error is raise in the client process for `GenServer.call/2`
- Alter this by using `GenServer.call(pid, request, timeout)`
	- Timeout in milliseconds
  
4. <font style="color:#A8A8A8; text-decoration: underline;">Handling Plain Messages</font>
  - Messages send to the server process contain more than a request payload
  - Function include additional data in the message

```Elixir
defmodule ServerProcess do
	...

	def call(server_pid, request) do
		send(server_pid, {:call, request, self()})
		...
	end

	def cast(server_pid, request) do
		send(server_pid, {:cast, request})
	end

	...

	defp loop(callback_module, current_state) do
		receive do
			{:call, request, caller} ->
				...

			{:cast, request} ->
				...

			end
		end
	...
end
```

- Do not send the plain `request` payload to the server process, you include additional data, such as the request type and the caller, for call requests
- `GenServer` uses `:$gen_cast` and `:$gen_call` atoms to decorate cast and call messages
- For a plain message use `handle_info/2` callback, to do something with the message

```Shell
iex(1)> defmodule KeyValueStore do
          use GenServer
 
          def init(_) do
            :timer.send_interval(5000, :cleanup)  #sets up periodic msg
            {:ok, %{}}
          end
 
          def handle_info(:cleanup, state) do   #handles plain :cleanup
            IO.puts "performing cleanup..."
            {:noreply, state}
          end
        end
 
iex(2)> GenServer.start(KeyValueStore, nil)
 
performing cleanup...          #prints every 5 secs
performing cleanup...
performing cleanup...
```

- `:cleanup message` is send to the process every 5 seconds and returns the result as `{:noreply, new_state}`

5. <font style="color:#A8A8A8; text-decoration: underline;">Other GenServer Features</font>
  Compile-Time Checking
  - Mistake when defining a callback function

```Shell
iex(1)> defmodule EchoServer do
          use GenServer
 
          def handle_call(some_request, server_state) do
            {:reply, some_request, server_state}
          end
        end
```

- Simple echo server, which handles every call request by sending the request back to the client

```Shell
iex(2)> {:ok, pid} = GenServer.start(EchoServer, nil)
{:ok, #PID<0.96.0>}
 
iex(3)> GenServer.call(pid, :some_call)
** (exit) exited in: GenServer.call(#PID<0.96.0>, :some_call, 5000)
   ** (EXIT) an exception was raised:
      ** (RuntimeError) attempted to call GenServer #PID<0.96.0> but
                        no handle_call/3 clause was provided
```

- Issuing a call crashes the server with an error that there is no `handle_call/3` clause
	- You defined `handle_call/2`, while `GenServer` request `handle_call/3`
- To get a compile-time warning, tell the compiler a function has to satisfy some behaviour with `@impl` module before the first clause of the callback function

```Shell
iex(1)> defmodule EchoServer do
          use GenServer
 
          @impl GenServer                                 
          def handle_call(some_request, server_state) do
            {:reply, some_request, server_state}
          end
        end
```

- `@impl GenServer` tells the compiler that the function about to be defines is a callback function for the `GenServer` behaviour

```Shell
warning: got "@impl GenServer" for function handle_call/2 but this
behaviour does not specify such callback.
```

Name Registration
- Local registration is an important feature because it supports patterns of fault tolerance and distributed systems

```Elixir
GenServer.start(
	CallbackModule,
	init_param,
	name: :some_name #register the process under a name
)
```
  
- Issue calls and casts using the name

```Elixir
GenServer.call(:some_name, ...)
GenServer.cast(:some_name, ...)
```

```Elixir
defmodule KeyValueStore do
	def start() do
		GenServer.start(KeyValueStore, nil, name: KeyValueStore)
	end

	def put(key, value) od
		GenServer.cast(KeyValueStore, {:put, key, value})
	end

	...
end
```
  
  - Replace `KeyValueStore` with the special form `__MODULE__`
  - During compilation, `__MODULE__` is replaced with the names of the module where the code resides

```Elixir
defmodule KeyValueStore do
	def start() do
		GenServer.start(__MODULE__, nil, name: __MODULE__)
	end

	def put(key, value) do
		GenServer.cast(__MODULE__, {:put, key, value})
	end

	...
end
```
  
  - Rename `KeyValueStore` as `KeyValue .store`, you only need to do it in one place in the module
  
  Stopping the Server

- Callback responses
	- `{:ok, initial_state}` from `init/1`
	- `{:reply, response, new_state}` from `handle_call/3`
	- `{:noreplay, new_state}` from `handle_cast/2` and `handle_cast/3`
  
- In `init/1`, you can return `{:stop/ignore, reason}`
	- In both cases there server will terminate
	- The stop will return `:error` for an error, and ignore will return `:ignore` for a normal course of action
- Returning `{:stop, reason, new_state}` from `handle_*` callbacks causes `GenServer` to stop the server process
	- For `handle_call/3`, return `{:stop, reason, resposne, new_state}`
- Before termination `GenServer` calls the callback function `terminate/2`, sending it the termination reason and the final state
- Stop the server by invoking `GenServer.stop/3` from the client process

6. <font style="color:#A8A8A8; text-decoration: underline;">Process Life Cycle</font>
  - Life cycle of a typical server process

![[Pasted image 20250208191314.png|600]]

- The client create the server and provides the callback module (1)
- Requests can be issued by the client with `send`
- When a message is received, invoked callback functions to handle it
	- Callback functions are always executed in the server process
- `init/1` defines the initial state that when passed to the subsequent `handle_*` callbacks (2)
- Each of these callbacks receive the current state and returns the new version use by the loop

The Actor Model
- Erlang is an accidental implementation of the actor module, originally described by Carl Hewitt
- An _actor_ is a concurrent computational entity that encapsulates state and can communicate with other actors
  
7. <font style="color:#A8A8A8; text-decoration: underline;">OTP-Compliant Processes</font>
  - When building production systems, avoid using plain processes started with `spawn`
  - Instead, all of the processes should be _OTP-compliant processes_
	  - Adhere to OTP conventions
	  - Used in supervision trees
	  - Errors in processes are logged with more details
- `Task` module is perfect to run one-off jobs that process some input and then stop
- `Agent` module is simpler alternative to `GenServer`-based processes and is used to manage and expose state
- Third party libraries, `GenStage`, can be used for back pressure and load control
  
8. <font style="color:#A8A8A8; text-decoration: underline;">Exercise: GenServer-Powered To-do Server</font>
  - 


---

# 7. Building a Concurrent System
^51ef9b

## 7.1 <font style="color:#40E0D0">Working Multiple To-Do Lists</font>
- The past concurrent systems have relied on a single server process instance
- In typical Elixir and Erlang systems are powered by a multitude of processes, may are stateful server processes
- Useful to run different tasks in separate processes
- Improve scalability and reliability of your systems
- Build a distributed HTTP server that can handle many end users who are simultaneously using to-do lists
- Develop infrastructure for handling multiple to-do lists and persisting them to disk


1. <font style="color:#A8A8A8; text-decoration: underline;">Working with the Mix Project</font>
- `mix` is a tool that helps create, build, and run projects as well as manage their dependencies, run tests, and create custom project-based tasks
- Create a `mix` project

`mix new todo`

- This creates the todo folder and a project structure under it
- The result is a folder that contains only a handful of files

```Shell
/todo
├── README.md
├── /lib
├── mix.exs
└── /test
```

- Use `mix help` or `mix help command` to learn more
- Compile the project with `mix compile` or run test with `mix test`
- Compile and run in shell `iex -S mix`
	- Modules can be referenced
- Place .ex files under the lib folder, and they will be included in the next build
- Conventions
	- Place modules under a common top-level alias
		- Modules might be called `Todo.List`, `Todo.server`, or similar
		- This reduced module names conflict
	- One file should contain one module
	- A filename should be an underscore-case (_snake_case_) version of the main module name it implements
		- `TodoServer` module would reside in a `todo_server.ex` file in the lib folder
	- The folder structure should correspond to multipart module names
		- A module called `Todo.Server` should reside in the `lib/todo/server/ex` file

- Add code to modules in the `todo` project
1) Remove the file `todo/lib/todo.ex`
2) Remove the file `todo/test/todo.exs`
3) Place the `TodoList` code in the `todo/lib/todo/list.ex` file
	1) Rename the module `Todo.List`
4) Place the `TodoServer` do in the `todo/lib/todo/server.ex` file
	1) Rename `Todo.Server`
5) Replace all reference to `TodoServer` with `Todo.Server` and all references to `TodoList` with `Todo.List`

- Start the system with `iex -S mix`

7. <font style="color:#A8A8A8; text-decoration: underline;">Managing Multiple To-do Lists</font>
- A pure functional `Todo.List` abstraction
- A to-do server process that can be used to manage one to-do list for a long time

2 Approaches to extending the above code:
- Implement a pure function abstraction to work with multiple to-do lists
	- Modify `Todo.Server` to use the new abstraction as its internal state
- Run one instance of the existing to-do server for each to-do list

- Create a process for each to-do list
	- Each list is managed concurrently, and the system is more responsive and scalable
- Create another entity to create `Todo.Server` instances or fetch existing ones
- A key-value structure that contains the to-do list names with the server's PID
- Create a to-do cache
	- Only run one instance of this process
	- Module will export only 2 functions
		- `start/0`
		- `server_process/2`
   
1. <font style="color:#A8A8A8; text-decoration: underline;">Implementing a Cache</font>
  - Copy the entire Mix project to the todo_cache folder
  - Add the new todo_cache/lib/todo/cache.ex file, where the code for `Todo.Cache` will reside
  - Cache initialization

```Elixir
defmodule Todo.Cache do
	use GenServer

	def init(_) do
		{:ok, %{}}
	end
	...
end
```

- Create a `server_process` request

```Elixir
defmodule Todo.Cache do
	...
	def handle_call({:server_process, todo_list_name}, _, todo_servers) do
		case Map.fetch(todo_servers, todo_list_name) do
			{:ok, todo_server} -> #server exists
				{:reply, todo_server, todo_servers}

			:error -> #server DNE
				{:ok, new_server} = Todo.Server.start()

			{ #start new server
				:reply,
				new_server,
				Map.put(todo_servers, todo_list_name, new_server)
			}
		end
	end
	...
end
```

- Interface functions

```Elixir
defmodule Todo.Cache do
	...
	def start do
		GenServer.start(__MODULE__, nil)
	end

	def server_process(cache_pid, todo_list_name) do
		GenServer.call(cache_pid, {:server_process, todo_list_name})
	end
	...
end
```

- `__MODULE__` is replaced with the current module, which is `Todo.Cache`
- Implement with `iex -S mix`

```Shell
iex> {:ok, cache} = Todo.Cache.start()
iex> Todo.Cache.server_process(cache, "List 1")
#PID<0.69.0>
iex> Todo.Cache.server_process(cache, "List 1")
#PID<0.69.0>
iex> Todo.Cache.server_process(cache, "List 2")
#PID<0.72.0>
iex> list_1 = Todo.Cache.server_process(cache, "List 1")
iex> Todo.Server.add_entry(
		list_1,
		%{date: ~D[2023-12-19], title: "Dentist"}
	)

iex> Todo.Server.entries(list_1, ~D[2023-12-19]))
[%{date: ~D[2023-12-19], id: 1, title: "Dentist"}]
iex(8)> Todo.Cache.server_process(cache, "List 2") |>
          Todo.Server.entries(~D[2023-12-19])
[]
```

- Cache makes it possible for you to manage many to-do lists independently
- The following session created 100,000 to-do list servers and verifies that they are running

```Shell
iex(1)> {:ok, cache} = Todo.Cache.start()
 
iex(2)> length(Process.list())
65
 
iex(3)> Enum.each(
          1..100_000,
          fn index ->
            Todo.Cache.server_process(cache, "to-do list #{index}")
          end
        )
 
iex(4)> length(Process.list())
100065
```

- `Process.list/0` returns the list of currently running processes

2. <font style="color:#A8A8A8; text-decoration: underline;">Writing Test</font>
- Write automated test
- The testing framework for Elixir is `ex_unit`
- Running test through `mix test`
- `cache_test.exs` file

```Elixir
defmodule Todo.CacheTest do
	use ExUnit.cast
	...
end
```

- A test file must be inside the test folder: `.../test/todo/cache_test.exs`
- And the name must end with `_test.exs` to be included in the test execution
- .exs are _Elixir script_, used to indicate a file is not compiled to disk
	- Therefore will run every time `mix` is executed
- Script file must define the test module that contains the test
- `test` macro, can be used to define test

```Elixir
defmodule Todo.CacheTest do
	use ExUnit.case

	test "server_process" do
		{:ok, cache} = Todo.Cache.start()
		list_1_pid = Todo.Cache.server_process(cache, "List 1")

		assert list_1_pid != Todo.Cache.server_process(cache, "List 2")
		assert list_1_pid == Todo.Cache.server_process(cache, "List 1")
	end
	...
end
```

- To define a test, `test test_description do ... end`
- The `test` macro is an example of meta-programming capabilities
	- Generate a function that combines boilerplate and code provided in the `do` block
- `assert` macro, takes an expression and verifies it outcome
	- Raises an error when expression fails
- Approximation of the generated code by the macros: `test` and `assert`

```Elixir
left_value = list_1_pid
right_value = Todo.Cache.server_process(cache, "List 2")

if left_value == right_value do
	#raise an error
end
```

- `assert` generates the code that will fail if the expression

`list_1_pid != Todo.Cache.server_process(cache, "List 2")` - returns false

- Use assert on standard comparisons, such as `==, !=, >, <` 
- Assert that a pattern-matching expression succeeded
- Testing to-do server operations

```Elixir
defmodule Todo.CacheTest do
	use ExUnit.Case
	...
	test "to-do operations" do
		{:ok, cache} = Todo.Cache.start()

		list_2 = Todo.Cache.server_process(cache, "List 2")
		Todo.Server.add_entry(list_2, %{date: ~D[2023-12-19], title: "Dentist"})

		entries = Todo.Server(list_2, ~D[2023-12-19])
		assert [%{date: ~D[2023-12-19], title: "Dentist"}] = entries
	end
end
```

- The test script creates one to-do server, adds a single entry, and then fetches the entires for the give date
- Pattern matching assert that the list of entries has exactly one element, with the proper value
- Result after `mix test`

```Shell
Running ExUnit with seed: 35374, max_cases: 24

......
Finished in 0.02 seconds (0.02s async, 0.00s sync)
6 tests, 0 failures
```

3. <font style="color:#A8A8A8; text-decoration: underline;">Analyzing Process Dependencies</font>
- In Elixir, HTTP servers typically use a separate process for each request
- For many simultaneous end users, you can expect many BEAM processes to access your to-do cache and to-do servers

![[Pasted image 20250209002429.png|500]]

- The client boxes are arbitrary clients, such as HTTP request-handler processes
	- Server clients issue request o the the single to-do cache process
	- Several clients communicate with multiple to-do server processes
- Only process one to-do cache at a time
- To-do cache
	- A map lookup followed by an optional process creation and map update
	- 5 ms to start a new server and put it in the map
	- 1.5 ms to fetch existing processes
- A client process does not use CPU while it waits for a to-do server to finish since its in idle
- A single list cannot be modified by two simultaneous clients
- Race conditions in a single process are impossible

## 7.1 <font style="color:#40E0D0">Persisting Data</font>
- Organize system into various server processes, analyze dependencies, and identify and address bottlenecks
- _Date persistence_ is when data can outlive server restarts
- For data persistence, use disk-based persistence, encoding the date into the Erlang external term format

1. <font style="color:#A8A8A8; text-decoration: underline;">Encoding and Persisting</font>
- Encode an Elixir/Erlang term `:erlang.term_to_binary/1`
- Accepts an Erlang term and returns an encoded byte sequence as a binary value
- Input term can be of any complexity, including deep hierarchies of nested lists and tuples
- Result can be stores to disk, retrieved at a later point, and decoded to an Erlang term with the inverse function `:erlang.binary_to_term/1`
- Create another process for a database: `TodoDatabase`
- This server supports two requests: `store` and `get`
- When storing data, clients will provide a key and the corresponding date
- The date will be stores in the file that bears the same name

```Elixir
defmodule Todo.Database do
	use GenServer

	@db_folder "./persist"

	def start do
		GenServer.start(__MODULE__, nil,
		name: __MODULE__
		)
	end

	def store(key, data) do
		GenServer.cast(__MODULE__, {:store, key, data})
	end

	def get(key) do
		GenServer.call(__MODULE__, {:get, key})
	end

	def inti(_) do
		File.mkdir_p!(@db_folder)
		{:ok, nil}
	end

	def handle_cast({:store, key, date}, state) do
		key
		|> file_name()
		|> File.write!(:erlang.term_to_binary(data))

		{:noreply, state}
	end

	def handle_call({:get, key}, _, state) do
		data = case File.read(file_name(key)) do
			{:ok, contents} -> :erlang.binary_to_term(contents)
			_ -> nil
		end

		{:reply, data, state}
	end

	defp file_name(key) do
		Path.join(@db_fodler, to_string(key))
	end
end
```

- The database server is locally registered under a name
- Only one instance of the database process
- `store` requests a case, whereas `get` is a call
- During initialization, `File.mkdir_p!/1` create a specified folder if it does not exist
- Data fetching is the inverse of storing

2. <font style="color:#A8A8A8; text-decoration: underline;">Using the Database</font>
- Database process
	- Ensure that a database process is started
	- Persist the list on every modification
	- Try to fetch the list from disk during the first retrieval
- To start the server, ply into the `Todo.Cache.init/1`

```Elixir
defmodule Todo.Cache do
	...
	def init(_) do
		Todo.Database.start()
		{:ok, %{}}
	end
	...
end
```

- Use the persist subfolder of the current folder as the place to store data

Storing the Datastore Request
- Persist the list after modification
- Propagate the to-do list name to the to-do server: `{list_name, todo_list}`
	- `Todo.Server.start` - accepts the to-do list name and passes it to `GenServer.start/2`
	- `Todo.Server.init/1` - keep the list name in the process state
	- `Todo.Server.handle` - callbacks are updated to work with the new state format
- Cache process passes the list name
- After modification, the to-do server knowns its own name
- Persisting the data

```Elixir
defmodule Todo.Server do
	...

	def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
		new_lsit = Todo.List.add_entry(todo_list, new_entry)
		Todo.Databse.store(name, new_list) #persists the data
		{:noreply, {name, new_list}}
	end
	...
end
```

- Test, there should be a new file named `persist/list_1` on the disk

```Shell
iex> {:ok, cache} = Todo.Cache.start()
iex> list_1 = Todo.Cache.server_process(cache, "List 1")
iex()> Todo.Server.add_entry(
          bobs_list,
          %{date: ~D[2023-12-19], title: "Dentist"}
        )
```

Reading the Data
- Read the data from the disk when the server is started

```Elixir
def init(name) do
	todo_list = Todo.Database.get(name) || Todo.List.new()
	{:ok, {name, todo_list}}
end
```

- Fetch data form the database, or go to an empty list if not on disk
- A long initialization of a to-do server will block the cache process
- This can block larger parts of the system and affect the cache
- `GenServer` allows you to split the initialization into phases
	- Blocks the client process
	- Performed after the `GenServer.start` invocation
- `init/1` returns the result in the shape of `{:ok, initial_state, {:continue, some_arg}}`
	- The initial state of the server process is set
	- The `GenServer.start` invocation in the caller process is unblocked
	- The `handle_continue` callback is invoked in the server process
		- The callback received the provided argument from the `{:continue, some_arg}` tuple and the server state
- `handle_continue/2` is invoked right after the `init/1`, therefore can be used as the second phase of the process initialization
- When this happens the `GenServer.start` is in the client process has already finished
- Therefore, this phase of the initialization doe not block the client anymore, and longer running work can be done (such as reading from the database)
- Two-phase initialization

```Elixir
defmodule Todo.Server do
	...

	def init(name) do
		{:ok, {name, nil}, {:continue, :init}} #schedules the post-init
	end

	def handle_continue(:init, {name, nil}) do
		todo_list = Todo.Database.get(name) || Todo.List.new() #long-running
		{:noreply, {name, todo_list}}
	end
	...
end
```

- The `init/1` is kept as short as possible, and the to-do list is set to `nil`
- To to-do server now read data from the database on creation

3. <font style="color:#A8A8A8; text-decoration: underline;">Analyzing the System</font>
- Database performs term encoding/decoding, and disk I/O operations
- Depending on the load and list size, this can negatively affect performance

![[Pasted image 20250209012720.png|500]]

```Elixir
defmodule Todo.Server do
	...
	def_continue(:init, {name, nil}) do
		todo_list = Todo.Database.get(name) || Todo.List.new() #sync
		...
	end
	...
	def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
		...
		Todo.Database.store(name, todo_list) #asynch request
		...
	end
	...
end
```

- A client issues a `store` request and then goes about its business
- If requests to the database come in faster than they can be handled, the process mailbox will grow and increasingly consume memory
- The `get` request can cause additional problems
- While waiting for response server cannot handle new messages
- `GenServer.call` has a timeout of 5 seconds
- A request is a message placed in the receiver's mailbox
  
4. <font style="color:#A8A8A8; text-decoration: underline;">Addressing the Process Bottleneck</font>
- Simplest way to eliminate the process bottleneck is to bypass the process
- Reasons to run a piece of code in a dedicated server process:
	- The code must manage a long-living state
	- The code handles a kind of resouece that can and should be reused between multple invocations, such as a TCP connection, database connection, file handle
	- A critical section of the code must be synchronized
		- Only one instance of this coed may be running in any moment

- If none of these conditions are met you can run the code in client process as a plain module
- Helps with parallelism and scalability
- Sore to the file directly from the to-do server process
- All operations on the same list are serialized in the same process, so there is no race condition

Handling Requests Concurrently
- Another option is to keep the database process and make it handle database operations concurrently
- Useful when requests depend on a common state but can be handled independently

![[Pasted image 20250209013615.png|500]]
- Requests are serialized through the central server process, but this server process spawns one-off worker processes that perform the request handling
- Each database operation is a spawned, one-off process

```Elixir
def handle_cast({:store, key, data}, state) do
	spawn(fn ->
		key
		|> file_name()
		|> File.write!(:erlang.term_to_binary(data))
	end)

	{:noreply, state}
end
```

- The handler functions spawns the new worker process and immediately returns
- While worker is running, the database process can accept new requests
- For synchronous calls, must return the response from the spawned worker process

```Elixir
def handle_call({:get, key}, caller, state) do
	spawn(fn ->
		data = case File.read(file_name(key)) do
			{:ok, contents} -> :erlang.binary_to_term(contents)
			_ -> nil
		end

		GenServer.reply(caller, data)
	end)

	{:noreply, state}
end
```

- The server process spawns another worker process and then returns
- The caller PID and the unique ID of the request is used in the spawned process to send the response message to the caller
- This keeps the processing in the database process short, while still allowing concurrency execution of database operation
- Concurrency is still unbound, so too many clients might overload the disk I/O

Limiting Concurrency with Pooling
- _Pooling_ with concurrency refers to managing a collection of resources while allowing multiple tasks to execute simultaneously
- Database process might create 3 worker processes and keep their PIDs in their internal state
- When request arrives, it's delegated to one of the worker processes, perhaps in a round-robin fashion or with some other load-distribution strategy

![[Pasted image 20250209014457.png|500]]
- All requests arrive at the database process, but are forwarded to one of the workers
- Keeps the concurrency level under control, and it works best when dealing with resources that cannot handle unbound concurrency
- Always keep in mind that multiple processes run concurrently, whereas a single process handles requests sequentially

Database Connection Pool
- Increasing the number of concurrent disk-based operation does not create significant improvements
- Optimizations server more as a didactic example than a solution
  
5. <font style="color:#A8A8A8; text-decoration: underline;">Exercise: Pooling and Synchronizing</font>
- 


### [[todo_cache_pooling - Elixir Project]]


## 7.1 <font style="color:#40E0D0">Reasoning with Processes</font>
- 




---

# 8. Fault Tolerance Basics
^175da6
- This chapter covers run-time errors, errors in concurrent systems, supervisors

- Fault tolerance is a first-class concept in BEAM
- The aim of fault tolerance is to use the failure, to minimize their impacts, and recover without human intervention
- Instead of reducing the number or errors, prioritize minimizing their effects and recover from them automatically
- Better to experience isolated errors then encounter a single error that takes the entire system
- The core tool for error handing is concurency
- Two concurrent processes are completely separated, they share no memory
- Process isolation allows you to confine the negative effects of an error to a single process

## 8.1 <font style="color:#40E0D0">Run-Time Errors</font>
- Types of runtime errors
	- Division by zero
	- Null pointer exception
	- Index out of bounds
	- Type mismatch
	- Stack overflow
	- Memory leaks
	- Segmentation fault
	- Invalid cast exception
	- File not found
	- Out of memory error
	- Arithmetic overflow
	- Deadlock
	- Uncaught exception
	- Illegal argument exception
	- Timeout error
- When a run-time error happens, execution control is transferred up the call stack to the error-handling code


1. <font style="color:#A8A8A8; text-decoration: underline;">Error Types</font>
- BEAM has 3 types of run-time errors
	- Error
	- Exit
	- Throws

```Shell
iex(1)> 1/0                                         
** (ArithmeticError) bad argument in arithmetic expression
 
iex(1)> Module.nonexistent_function()               
** (UndefinedFunctionError) function Module.nonexistent_function/0 is
   undefined or private
 
iex(1)> List.first({1,2,3})                         
** (FunctionClauseError) no function clause matching in List.first/2
```

- You can also _raise_ your own error using `raise/1` macro, passing an error

```Shell
iex(1)> raise("Something went wrong")
** (RuntimeError) Something went wrong
```

- Use `!` at the end of a function to show it explicitly raises an eroor

```Shell
iex(1)> File.open!("nonexistent_file")
** (File.Error) could not open non_existing_file: no such file or directory
```

- The lack of `!` returns the information that the file cannot be opened

```Shell
iex(1)> File.open("nonexistent_file")
{:error, :enoent}
```

- `exit/1` is used to terminate a process and passes a reason

```Shell
iex(2)> spawn(fn ->
          exit("I'm done")                  
          IO.puts("This doesn't happen")
        end)
```

- The final run-time error is a `throw/1`

```Shell
iex(3)> throw(:thrown_value)
** (throw) :thrown_value
```

- Throws are use to allow nonlocal returns
	- Elixir does not have `break`, `continue`, or `return`
- You can throw a value and catch it up the call stack
- Although `throws` are no usually used

2. <font style="color:#A8A8A8; text-decoration: underline;">Handling Errors</font>
- To intercept a run-time error (error, exit, or throw) the `try` expression is used

```Elixir
try do
	...
catch error_type, error_value ->
	...
end
```

- Code in the `do` block is executed and if an error occurs, execution is transferred to the `catch` block
- `error_type` will contain an atom `:error`, `:exit`, or `:throw`, indicating the type of error that occurred
- The `error_value` will contain error-specific information

```Shell
iex(1)> try_helper = fn fun ->
          try do
            fun.()
            IO.puts("No error.")
 
          catch type, value ->
            IO.puts("""
              Error
                #{inspect(type)}
                #{inspect(value)}
              """)
          end
        end

iex(2)> try_helper.(fn -> raise("Something went wrong") end)
Error
  :error                    #error type                        
  %RuntimeError{message: "Something went wrong"}    #error value
```

- String message is wrapped in a `RuntimeError` struct
- This is an Elixir-specific decoration done by `raise/1` macro
- To raise a plain, undecorated error, use `:erlang.error/1` and provide an arbitrary term

```Shell
iex(3)> try_helper.(fn -> throw("Thrown value") end)
Error
  :throw
  "Thrown value"

iex(4)> try_helper.(fn -> exit("I'm done") end)
Error
  :exit
  "I'm done"

iex(5)> result =
          try do
            throw("Thrown value")
          catch type, value -> {type, value}
          end
 
iex(6)> result
{:throw, "Thrown value"}
```

- The return value of `try` is the result of the last executed expression from the `do` block or `catch` block
- `type` and `value` are specified in the `catch` block as patterns
- To immediately return a value from inside a deep nested loop

`throw({:result, some_result})`

- In the call stack

```Elixir
try do
	...
catch
	:throw, (:result, x) -> x
end
```

- `catch` pattern matches, therefore multiple clauses can be specified

```Elixir
try do
	...
catch
	type_pattern_1, error_value_1 ->
		...

	type_pattern_2, error_value_2 ->
		...
	...
end
```
   
- To catch the remaining patterns, `type, value` pattern can be set to `_, _`

```Shell
iex(7)> try do
          raise("Something went wrong")
        catch
          _,_ -> IO.puts("Error caught")
        after
          IO.puts("Cleanup code")    #always executed
        end
 
Error caught
Cleanup code
```

- `after` block is used to clean up resources and does not affect the result of the entire `try` expression
	- Close an open file

Try and Tail Calls
- Tail-call optimization is not possible if the function resides in a `try` expression
- Define custom errors via a `defexpection` macro and handle them in slightly more elegant fashion
- A run-time error has a type, which can be `:error`, `:exit`, `'throw`
- A run-time error also has a value, which can be an arbitrary term
- If a run-time error is not handled, the corresponding process with terminate
- After fixing bugs in the testing phase, the remaining are _Heisenbug category_ - unpredictable errors that occur irregularly in special circumstances and are difficult to reproduce
- A way to fix errors is to let the process crash and start another one
- This helps the process by starting with a clean state as is known as _letting it crash_

## 8.2 <font style="color:#40E0D0">Errors in Concurrent Systems</font>
- Concurrency plays a central role in building a fault-tolerant, BEAM-based system
- Due to the total isolation and independence of individual processes

```Shell
iex(1)> spawn(fn ->                       #start process 1
          spawn(fn ->                     #start process 2
            Process.sleep(1000)
            IO.puts("Process 2 finished")
          end)
 
          raise("Something went wrong")   #raise an error in process 1
        end)

17:36:20.546 [error] Process #PID<0.116.0> raised an exception    
...
Process 2 finished
```

![[Pasted image 20250209153542.png|500]]

- A crash in a single to-do server does not affect other to-do list operations
- A crash in `Todo.Database` does not block cached reads that take place in to-do server processes
- If the database process goes down, the to-do server cannot query it
- Modifications to the to-do list will not be persisted

1. <font style="color:#A8A8A8; text-decoration: underline;">Linking Processes</font>
- A basic primitive for detecting a process crash is the concept of _links_
- If two processes are linked, and one of them terminates, the other process receives an _exit signal_ (a notification that a process has crashed)
- An exit signal contains the PID of the crashed process and the _exit reason_
- In a normal termination the exit reason is the atom `:normal`
- When a process receives a signal from another that is not `:normal` it terminates as well
- One link connects exactly two processes and is always bidirectional
- Create a link with `Process.link/1`, which connects the current process with another
- A link is created when you start a process, `spawn_link/1`, which spawns a process and links it to the current one

```Shell
iex(1)> spawn(fn ->
          spawn_link(fn ->  #starts process 2 and links it to process 1
            Process.sleep(1000)
            IO.puts("Process 2 finished")
          end)
 
          raise("Something went wrong")
        end)

17:36:20.546 [error] Process #PID<0.116.0> raised an exception
```

![[Pasted image 20250209154256.png|350]]

- The entire tree of link processes with be taken down from one process failure

Trapping Exits
- Links break isolation and propagate errors over process boundaries
- _Trapping exits_ is a way to not take down linked processes, but to send their exit signal message
- A trapping process can receive this message and do something about the crash
- To set up an exit trap, `Process.flag(:trap_exit, true)`, which makes the current process trap exit signals

```Shell
iex(1)> spawn(fn ->
          Process.flag(:trap_exit, true)    #traps exits in the current p
 
          spawn_link(fn -> raise("Something went wrong") end) #spawns link
 
          receive do                #receives and prints the message
            msg -> IO.inspect(msg)                             
          end                                                   
        end)

{:EXIT, #PID<0.118.0>,
 {%RuntimeError{message: "Something went wrong"},
  [{:elixir_eval, :__FILE__, 1 [file: ~c”iex”, line: 4]}]}}
```

- A trap exits in the parent process, and then spawns a linked process that will crash
- The receive prints a message to the screen
- The general format of the exit signal message is `{:EXIT, from_pid, exit_reason}`
	- Where `from_pid` is the `pid` of the crashed process
	- `exit_reason` is an arbitrary term
- If a process is terminated due to a throw or an error, the exit reason is a tuple in the form `{reaons, where}`
	- `where` containing the stack trace
- Otherwise, if a process is terminated due to an exit, the reason is a term provided to `exit/1`
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Monitors</font>
- Links are always bidirectional
- Use a _monitor_, to create a unidirectional propagation of processes
- To monitor a process, use `Process.monitor`

`monitor_ref = Process.monitor(target_pid)`

- This makes the current process monitor the target process
- The result is a unique reference that identifies the monitor
- A single process can create multiple monitors
- If the monitored process dies, your process receives a message in the `{:DOWN, monitor_ref, :process, from_pid, exit_reason}` format
- Stop the monitor: `Process.demonitor(monitor_ref)`

```Shell
iex(1)> target_pid = spawn(fn ->   #spawns a process that term after 1 sec
          Process.sleep(1000)             
        end)                                
 
iex(2)> Process.monitor(target_pid)     #monitors the spawned process
 
iex(3)> receive do                             #waits for a monitor msg
          msg -> IO.inspect(msg)                                
        end                                                     
 
{:DOWN, #Reference<0.1398266903.3291480065.256365>, :process,   
  #PID<0.111.0>, :noproc} 
```

- Monitors are unidirectional
	- Only the process that creates a monitor receives notifications
- Unlike a link, the observer process won't crash when the monitored process terminates
- A messages is sent, which is handled or ignored
- Exits are propagated through `GenServer` calls
- When a synchronous request via `GenServer.call` is issues, if a server process crashes, an exit signal will occur in your client process
	- Way for cross-process error propagation
- Internally, `GenServer` sets up a temporary monitor that targets the server proess
- While waiting for a response from the server, if a `:DOWN` message is received, `GenServer` can detect that a process has crashed and raise a corresponding exit singal in the client process
- Links, exit traps, and monitors make it possible to detect errors in a concurrent system
- _Supervisors_ are the primary tool of error recovery in concurrent systems

## 8.3 <font style="color:#40E0D0">Supervisors</font>
- A _supervisor_ is a generic process that manages the life cycle of other processes in a system
- Can start other processes, which are the children
- Using links, and exit traps, a supervisor detects possible terminations of any child, and can restart them if needed
- Process that aren't supervisors are called _workers_
	- These are the processes that provide the actual services of the system
	- The to-do cache and server processes are workers
- At least one supervisor process in the system, `Supervisor` module
- By invoking `Supervisor.start_link/2`, you can start the supervisor process
	- The supervisor process traps exits and then starts the child processes
	- When a child terminates, the supervisor process received a exit message and performs corrective actions
		- Restarting the crashed process
	- If the supervisor process terminates, its children are also taken down
- First approach, invoke `Supervisor.start_link`, passing it a lsit that described each child to be started under the supervisor, together with some additional supervisor options
- Second approach, pass a module defining a callback function that returns this information
![[Pasted image 20250209164010.png|500]]
- Supervisor in the to-do system
	- `Todo.Server` - Allows multiple clients to work on a single to-do list
	- `Todo.Cache` - Maintains a collection of to-do servers and is responsible for their creation and discovery
	- `Todo.DatabaseWorker` - Performs read-write operations on the database
	- `Todo.Database` - Manages a pool of database workers and forwards database requests to them
- Cache is considered the root of the system

1. <font style="color:#A8A8A8; text-decoration: underline;">Preparing the Existing Code</font>
- Register the cache process, to interact with the process without needing to know its PID
- Create a link while starting the to-do cache process, to run supervisor
- Links work in both directions, so the termination of a supervisor mean all its children will be taken down
	- Also properly terminates a system
- Creating a link to the caller process uses `GenServer.start_link` is place of `GenServer_start`
- Rename the `Todo.Cache` interface function as `start_link`
- Make the `start_link` function take one argument and ignore it
- Changes in the to-do cache

```Elixir
defmodule Todo.Cache do
	use GenServer

	def start_link(_) do #renames interface function
		GenServer.start_link(__MODULE__, nil, name: __MODULE__) #register
	end

	def server_process(todo_list_name) do
		GenServer.call(__MODULE__, {:server_process, todo_list_name})
	end

	def init(_) do
		IO.puts("Starting to-do cache") #debug message
		...
	end
	...
end
```

   
2. <font style="color:#A8A8A8; text-decoration: underline;">Starting the Supervisor Process</font>
- Start the supervisor process with to-do cache as its only child

```Shell
iex(1)> Supervisor.start_link([Todo.Cache], strategy: :one_for_one)   
 
Starting to-do cache.
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
```

```Elixir
Supervisor.start_link(
	[Todo.Cache], #list of child specifications
	strategy: one_for_one #supervisor strategy
)
```

- This starts a supervisor process and links it to the caller
- The supervisor will invoke `Todo.Cache.start_link/1`
- Once all the children are started, `Supervisor.start_link/2` returns `{:ok, supervisor_pid}`
- The `Supervisor.start_link/2` is the list of supervisor specific options
	- `:strategy` is the _restart strategy_, it mandatory
	- `one_for_one` strategy states that if a child terminates, another child should be started in its place
- To "_restart_" is a process is is terminates, and other process by the same module takes it place
- The new process has a different PID and does not share the same state

```Shell
iex(2)> bobs_list = Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list.
#PID<0.161.0>
iex(3)> cache_pid = Process.whereis(Todo.Cache)
#PID<0.155.0>
iex(4)> Process.exit(cache_pid, :kill)
Starting to-do cache.
iex(5)> Process.whereis(Todo.Cache)
#PID<0.164.0>
iex(6)> bobs_list = Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list.
#PID<0.167.0>
```

- Start a process that is now supervised
- Get the process PID by `Process.whereis/1`
- To test kill the process with `Process.exit(cache_pid, :kill)/2`
- The process immediately restarts, but is under a different PID

Names Allow Process Discovery
- Important to register the to-do cache under a local name since PID are constantly changing from terminating or crashing processes
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Child Specification</font>
- To manage a child process:
	- How should the child be started
	- What should be done if the child terminates
	- What term should be used to uniquely identify each child
- This information is called the _child specification_
- A specification is a map with a couple of fields configuring the properties of the child

```Elixir
%{
	id: Todo.Cache,
	start: {Todo.Cache, :start_link, [nil]}
}
```

- The `:id` field is an arbitrary term that is used to distinguish this child from any other child
- The `:start` field is a template in the shape of `{module, start_function, list_of_ arguments}
- To pass the specification map directly to `Supervisor.start_link`

```Elixir
Supervisor.start_link(
	[
		%{
			id: Todo.Cache,
			start: {Todo.Cache, :start_link, [nil]}
		}
	],
	strategy: :one_for_one
)
```

- This will instruct the supervisor to invoke `Todo.Cache.start_link(nil)` to start the child
- `Supervisor` allows you to pass a tuple `{module_name, arg}` in the child specification list
	- Will first invoke `module_name .child_spec(arg)` to get the actual specification
	- This function must return the specification map
- The supervisor then proceed to start the child according the returned specification
- The `Todo.Cache` module already has `child_spec/1` defined

```Elixir
Supervisor.start_link(
	[{Todo.Cache, nil}],
	strategy: :one_for_one
)

iex(1)> Todo.Cache.child_spec(nil)
%{id: Todo.Cache, start: {Todo.Cache, :start_link, [nil]}}
```

- `child_spec/1` returns a specification that invokes the module's `start_link/1` function with the argument passed to `child_spec/1`
- This is why `Todo.Cache.start_link` takes one argument, even though the argument is ignored

```Elixir
defmodule Todo.Cache do
	use GenServer #generates the default child_spec/1

	def start_link(_) do #conforms to the default child_spec/1
		...
	end
	...
end
```

- Now `Todo.Cache` is compatible with the generated `child_spec/1` which means you can include `Todo.Cache` in the list of children without needing to do any extra work
- You can also pass an empty list to `child_spec/1`

```Elixir
Supervisor.start_link(
	[Todo.Cache],
	strategy: :one_for_one
)
```

- When `Supervisor.start_link(child_specs, options)` is invoked:
	- The new process is started
	- The supervisor process goes through the list of child specification and starts each child, one by one
	- Each specification is resolves, if needed, by invoking `child_spec/1` from the corresponding module
	- The supervisor starts the child process according to the `:start` field of the child specification
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Wrapping the Supervisor</font>
- In real life, you want to work with supervisor in the code by wrapping the `Supervisor` in a module
- To-do System supervisor

```Elixir
defmodule Todo.System do
	def start_link do
		Supervisor.start_link(
			[Todo.Cache],
			strategy: :one_for_one
		)
	end
end
```

```Shell
iex(1)> Todo.System.start_link()
 
Starting to-do cache.
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
```

- The entire to-do system is started, such as the cache and database
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Using a Callback Module</font>
- Another way of starting a supervisor is by providing a callback module
- This function must return the list of child specifications and additional supervisor options

```Elixir
defmodule Todo.System do
	use Supervisor

	def start_link do
		Supervisor.start_link(__MODULE__, nil)
	end

	def init(_) do
		Supervisor.init([Todo.Cache], strategy: :one_for_one)
	end
end
```

- Start with `use Supervisor` to get some boilerplate in the module
- For `Supervisor.start_link/2`, instead of the list of child specifications, the callback module is passed
- The supervisor process with invoke `init/1` function to provide the supervisor specification
- For `Supervisor.init/2`, pass the list of children and the supervisor options
   
6. <font style="color:#A8A8A8; text-decoration: underline;">Linking All Processes</font>
- When the supervisor restarts the to-do cache a completely separate process hierarchy will be produces that are not related to the previous to-do servers
- The previous to-do servers will be unused garbage that's still running and consuming both memory and CPU resources

```Shell
iex(1)> Todo.System.start_link()
 
iex(2)> Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list.
#PID<0.159.0>
iex(3)> Todo.Cache.server_process("Bob's list")
#PID<0.159.0>
iex(4)> length(Process.list())
71
iex(5)> Process.exit(Process.whereis(Todo.Cache), :kill)
Starting to-do cache.
iex(6)> Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob's list.
#PID<0.165.0>
```

- After restarting a to-do cache, retrieving a previously fetched server creates a new process
- When a process terminates, its state is release, and the new process starts with the fresh state
- The old cache structure is not cleaned up

```Shell
iex(7)> length(Process.list())
72
```

- Each to-do server must be lined to the cache
- Database server must be linked to the to-do cache and the database workers to the database servers

![[Pasted image 20250210081139.png|500]]

- By linking a group of interdependent processes, you can ensure that the crash of one process takes down its dependencies as well
- Switch from `start` to `start_link` for all the processes in the project

```Elixir
def start(...) do
	GenServer.start(...)
end
```

- The above code is changed to:
`
```Elixir
def start_link(...) do
	GenServer.start_link(...)
end
```

- Every `module.start` invocation must be replaced with `module.start_link`

```Shell
iex(1)> Todo.System.start_link()
 
iex(2)> Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list.
 
iex(3)> length(Process.list())
71
 
iex(4)> Process.exit(Process.whereis(Todo.Cache), :kill)  #terminates
 
iex(5)> bobs_list = Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list.
 
iex(6)> length(Process.list())
71
```

- When a process is crashes, the entire structure is terminates, and a new process starts in its place
- Links ensure the dependent processes are terminated

7. <font style="color:#A8A8A8; text-decoration: underline;">Restart Frequency</font>
- The supervisor relies on the _maximum_ restart frequency, which defines how many restarts are allowed in a given time period
- The maximum restart frequency is three restarts in 5 seconds
- Change the parameters `:max_restarts` and `:max_seconds` option to `Supervisor.start_link/2`
- If the frequency exceeded, the supervisor gives up and terminates itself with all of its children

```Shell
iex(1)> Todo.System.start_link()
Starting the to-do cache.
iex(1)> for _ <- 1..4 do
          Process.exit(Process.whereis(Todo.Cache), :kill)
          Process.sleep(200)
        end

Starting the to-do cache.                 #repeated 3 times
Starting database server.                 # ^
...                                       
 
** (EXIT from #PID<0.149.0>) :shutdown
```

- The supervisor terminates since the default maximum restart frequency is exceeded
- This mechanism plays an important role in _supervision trees_, where supervisors and workers are organized in a deeper hierarchy that allows you to control how the system recovers from errors


---

# 9. Isolating Error Effects
^ad28fe
- Providing basic error detection and recovery, supervisors play an important role in isolating error effects
- By placing individuals workers directly under a supervisor, you can confine an error's impact to a single worker
- This makes the system more available to its clients
- A database error should not stop the cache from working
- The cached data continues to work providing partial service
- An error in an individual database worker should not affect other database operations
- To isolate errors and minimize their effects, each worker is ran under a supervisor, which makes it possible to restart each worker individually

## 9.1 <font style="color:#40E0D0">Supervision Trees</font>
- The basic tools are processes, links, and supervisors, and the general approach is fairly simple

1. <font style="color:#A8A8A8; text-decoration: underline;">Separating Loosely Dependent Parts</font>

![[Pasted image 20250210092205.png|500]]

- The exit signal will be propagates to its linked processes
- When there is an error, it will crash the to-do cache, which will be notified by the system to restart
- This coarse-grained error recovery is due to the fact that you're starting worker processes from within other workers
	- A database server is started from the to-do cache
- To reduce error effects, start individual workers from the supervisor
- Move the database server so that it's started directly from the supervisor
- Move the call to `Todo.Database.start_link` form `Todo.Cache.init/1`
- Then add another child specification when invoking `Supervisor.start_link/2`

```Elixir
defmodule Todo.System do
	def start_link do
		Supervisor.start_link(
			[
				Todo.Database,
				Todo.Cache
			],
			strategy: :one_for_one
		)
	end
end
```

- Similar to `Todo.Cache`, adapt `Todo.Database.start_link` to take exactly one argument and ignore it
- This will make it possible to rely on the autogenerated `Todo.Database.child_spec/1`, obtained by `use GenServer`

```Elixir
defmodule Todo.Databse do
	...
	def start_link(_) do
		...
	end
	...
end
```

- These changes ensure that the cache and the database are separated
- Running database and cache under the supervisor makes is possible to restart them individually

![[Screenshot 2025-02-10 at 9.30.00 AM.png|500]]

```Shell
iex(1)> Todo.System.start_link()
 
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
Starting to-do cache.

iex(2)> Process.exit(Process.whereis(Todo.Database), :kill)
 
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
```

- These processes are isolated and indirectly linked via the supervisor
- The supervisor is trapping exit signals, thus preventing further propagation
- This is a property of `one_for_one` supervisors in particular: they confine an error's impact to a single worker and take the corrective measure (restart) only on that process
- The supervisor starts two child processes, that are synchronous
- When the worker is a `GenServer`, the next child is started only after the `init/1` callback function for the current child is finished
	- Always make sure the `init/1` functions run quickly (post-initialization continuation via the `handle_continue/2`) when you need more complex initialization

2. <font style="color:#A8A8A8; text-decoration: underline;">Rich Process Discovery</font>
- An error is one database worker will crash the entire database structure and terminate all running database operation
- Confine a database error to a single worker, therefore each worker must be directly supervised
- When a process is restarted, the successor will register itself under the same name, which will allow you to reach the right process even after multiple restarts
	- Name can only be atoms
- Process registry that maintains a key-value map, where the keys are names and the values are PIDs
- A process registry differs from standard local registration in that names can be arbitrarily complex
- Every time a process is creates, it can register itself to the registry under a name
- If a process is terminated and restarted, the new process will register itself
- Discovering processes through registry

![[Pasted image 20250210102948.png|600]]

- Worker process registers itself, during initialization
- The client process will query the registry for the PID of the desired worker
- The client can then issue a request to the server process
- Elixir includes `Registry` module that allows you to associate a process with one or more arbitrary complex keys and then finds the process by performing a key-based lookup

`iex(1)> Registry.start_link(name: :my_registry, keys: :unique)`

- `:name` is an atom, that specifies the name of the registry process
- `:keys` can be `:unique` or `:duplicate`
	- In a unique registry, names are unique
	- Duplicate registry, several processes can have the same name
		- Single process needs to send notifications to a dynamic number of subscriber processes that tend to come and go over time

```Shell
iex(2)> spawn(fn ->
          Registry.register(:my_registry, {:database_worker, 1}, nil)     
 
          receive do
            msg -> IO.puts("got message #{inspect(msg)}")
          end
        end)
```

- `Registry.register/3` takes the name of the registry, name of spawned process, and an arbitrary value
- The `Registry` will store a mapping of the name and the PID of the caller process
- Get the PID by invoking `Registry.lookup/2`, that takes the name of the registry and the key (process name), and returns a list of `{pid, value}` tuples

```Shell
iex(3)> [{db_worker_pid, _value}] =
          Registry.lookup(
            :my_registry,
            {:database_worker, 1}
          )
iex(4)> send(db_worker_pid, :some_message)
got message :some_message
```

- When the registry is unique, this list is either empty of can have one element
- For duplicate registry, the list can have any number of entries
- The `value` is the value provided to `Registry.register/3`
- A message is sent, and a value is returned
- `Registry` links to all the registered processes
- This allows the registry to notice the termination of these processes and remove certain ones from its internal structure
- The database worker mock was a one-off process

```Shell
iex(5)> Registry.lookup(:my_registry, {:database_worker, 1})
[]
```

- No entry is found under the give key because the database worker terminated
- The implementation of `Registry` relies on the ETA table features
- ETS tables allow `Registry` to be very efficient and scalable
- Lookups and writes are very fast, and won't block each other, meaning multiple operations on the same registry may run in parallel
- An important feature of OTP processes is _via tuples_

3. <font style="color:#A8A8A8; text-decoration: underline;">Via Tuples</font>
- A _via tuple_ is a mechanism that allows you to use an arbitrary third-party registry to register OTP-compliant processes, such as `GenServer` and supervisors

`GenServer.start_link(callback_module, some_arg, name: some_name)`

- `:name` option can be provided in the shape of `{:via, some_module, some_arg}`
- If a via tuple is provided it will invoke a well-defined function `some_module` to register the process
- You can also pass via tuple as the first argument to `GenServer.cast` and `GenServer.call`, and `GenServer` will discover the PID using `some_module`
- `some_module` acts like a custom third-party registry, and the via tuple is a way of connecting such registry with `GenServer` and similar OTP abstractions
- `some_arg` is a piece of data that is passed to functions of `some_module`
- The piece of data must contain the name under which the process should be registered and looked up
- Therefore, the third argument is `registry_name, process_key`
- The final via tuple is: `{:via, Registry, {registry_name, process_key}`
- The `EchoServer` is a simple `GenServer` that handles a call request by returning the request payload

```Elixir
defmodule EchoServer do
	use GenServer

	def start_link(id) do
		GenServer.start_link(__MODULE__, nil, name: via_tuple(id))
	end

	def init(_) do: {:ok, nil}

	def call(id, some_request) do
		GenServer.call(via_tuple(id), some_request)
	end

	defp via_tuple(id) do
		{:via, Registry, {:my_registry, {__MODULE__, id}}}
	end

	def handle_call(some_request, _, state) do
		{:reply, some_request, state}
	end
end
```

- The `via_tuple/1` is a consolidated helper function
- The registered name of the process with be `{__MODULE__, id}` or `{EchoServer, id}`

```Shell
iex(1)> defmodule EchoServer do ... end
 
iex(2)> Registry.start_link(name: :my_registry, keys: :unique)
```

- Interact with multiple echo servers without needing to keep track of their PIDs

```Shell
iex(3)> EchoServer.start_link("server one")
iex(4)> EchoServer.start_link("server two")
 
iex(5)> EchoServer.call("server one", :some_request)
:some_request
 
iex(6)> EchoServer.call("server two", :another_request)
:another_request
```

- IDs here are strings
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Registering Database Workers</font>
- Implement registration and discovery of database workers
- To-do Process registry

```Elixir
defmodule Todo.ProcessRegistry do
	def start_link do
		Registry.start_link(keys: :unique, namel __MODULE__)
	end

	def via_tuple(key) do
		{:Via, Registry, {__MODLUE__, key}}
	end

	def child_spec(_) do
		Supervisor.child_spec(
			Registry,
			id: __MODULE__,
			start {__MODULE__, :start_link, [])}
		)
	end
end
```

- The `Supervisor.child_spec/2` module is the default specification from the `Registry` module
- This state that for every child specification provided you do not need internals of `Registry` implementation, such as whether the registry process is a worker or a supervisor
- Supervising registry

```Elixir
defmodule Todo.System do
	def start_link do
		Supervisor.start_link(
			[
				Todo.ProcessRegistry,
				Todo.Database,
				Todo.Cache
			],
			strategy: :one_for_one
		)
	end
end
```

- The order of the child specification list matters since they are synchronous
- A child must always be specified after its dependencies
- Start the registry first because database workers depend on it
- Registering workers

```Elixir
defmodule Todo.DatabaseWoker do
	use GenServer

	def start_link({db_foler, worker_id}) do
		GenServer.start_link(
			__MODULE__
			db_folder,
			name: via_tuple(worker_id) #registration
		)
	end

	def store(worker_id, key, data) do
		GenServer.cast(via_tuple(worker_id), {:sotre, key, data})
	end

	def get(worker_id, key) do
		GenServer.call(via_tuple(worker_id), {:gey, key}) #discover
	end

	defp via_tuple(worker_id) do
		Todo.ProcessRegistry.via_tuple({__MODULE__, worker_id})
	end
	...
end
```

- This code uses `worker_id`, which is an interger in the rang `1..pool_size`
- The `start_link` takes this parameter together with `db_folder`
- The `start_link(db_folder, worker_id)` takes the arguments to conform to the autogenerated `child_spec/1`, which forwards to `start_link/1`
- To manage a worker under a supervisor, use `{Todo.DatabaseWorker, {db_folder, worker_id}}` child specification
- When invoking `GenServer.start_link`, you provide the via tuple as the name option
- The `via_tuple/1` takes in the worker ID and returns the corresponding via tuple
- This delegates to `Todo.ProcessRegistry`, passing the desired name in the form `{__MODULE__, worker_id}`
- This eliminates registered name clashes
- `via_tuple/1` helper can be used to discover the processes when invoking `GenServer.call` and `GenServer.cast`
- `store/3` and `get/2` function now receive a worker ID as the first argument, and their clients don't keep track of PIDs anymore
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Supervising Database Workers</font>
- Create a supervisor that will manage the pool of workers
- The server starts a pool of worker processes and manages the mapping of a worker ID to PID
- The workers are started by the supervisors; and the mapping is handled by the registry
	- There is no need for `GenServer`
- Implement a supervisor of database worker processes and retain the same interface function

```Elixir
defmodule Todo.Database do
	@pool_size 3
	@db_folder "./persist"

	def start_link do
		File.mkdir_p!(@db_folder)

		children = Enum.map(1..@pool_size, &worker_spec/1)
		Supervisor.start_link(children , strategy: :one_for_one)
	end

	defp worker_spec(worker_id) do
		default_worker_spec = {Todo.DatabaseWorker, {@db_folder, worker_id}}
		Supervisor.child_spec(default_worker_spec, id: worker_id)
	end
	...
end
```

- Create a list of three child specifications, each that describe one database worker
- The `Supervisor.child_spec/2` sets the unique ID for the worker
	- Without children will have the same ID
- Implement `Todo.Database.child_spec/1` that converts the database into a supervisor, do the module can by pass `use GenServer`, meaning `child_spce/1` is not autogenerated

```Elixir
defmodule Todo.Database do
	...

	def child_spec(_) do
		%{
			id: __MODULE__,
			start: {__MODULE__, :start_link, []},
			type: :supervisor
		}
	end
	...
end
```

- The specification contains `:type`, used to indicate the type of the started process
- The valid values are `:supervisor` or `:worker` as the default
- Now the `Todo.Database.start_link/0`
- Adapt the `store/2` and `get/1` functions

```defmodule Todo.Database do
	...
	def store(key, data) do
		key
		|> choose_worker()
		|> Todo.DatabaseWorker.store(key, data)
	end

	def get(key) do
		key
		|> choose_worker()
		|> Todo.DatabaseWorker.get(key)
	end

	defp choose_worker(key) do
		:erlang.phase2(key, @pool_size) + 1
	end
	...
end
```

- Previously the `choose_worker` function issues a call to the database server, now it selects the worker ID in the range `1..@pool_size`
- This ID is passed to the `Todo.DatabaseWoker` functions, which will perform a registry lookup and forward the request to the corresponding database worker

```Shell
iex(1)> Todo.System.start_link()
 
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
Starting to-do cache.

iex(2)> [{worker_pid, _}] =
          Registry.lookup(
            Todo.ProcessRegistry,
            {Todo.DatabaseWorker, 2}
          )
 
iex(3)> Process.exit(worker_pid, :kill)
Starting database worker.
```

- The above code terminates a worker process by its PID
- The worker is restarted, and the rest of the system is undistrubed
- When a worker is restarted, the new process has different PID, but by owing to the registry, the client does does not care
- The look up is done right before the database worker request, and will pass the proper process
- In some cases, the discovery of the database worker is invalid
	- Database worker crashes after the client process found its PID, but before the request is send
	- The client process has a stale PID, so the request will fail
	- A client want to find a database worker that has just crashed
	- Restarting the registration run concurrently wth the client, so the client might not find the worker PID in the registry
   
6. <font style="color:#A8A8A8; text-decoration: underline;">Organizing the Supervision Tree</font>
- A simple _supervision tree_ is a nested structure of supervisors and workers

![[Pasted image 20250210113516.png|600]]
- The tree describes how the system is organized into hierarchy of services
- The system consists of 3 services
	- The process registry
	- The database
	- and the cache
- Each services can be subdivided into sub-services
	- Database is composed of several workers
	- Cache is composed of multiple to-do servers
	- Also the registry is subdivided into multiple processes
- A more granular tree allows you to take down an arbitrary part of the system, without touching anything else
- Stopping the database service requires a request from the parent `Todo.System`
- To stop the `Supervisor.terminate_child/2` function is used
- If worker processes are small services in a system, supervisors are managers
- They are responsible for the life cycles of services they directly manage
- If a database worker crashes, the database supervisor will restart it
- If that does not help, it will exceed the maximum restart frequency, and the database supervisor will terminate all the database workers and them itself
- By restarting the entire group of workers, it terminates all pending database operation and begins clean
- If there is still an error, it propagates the error up the tree
- Try to recover from a error locally, affecting a few processes, and then moves up to a wider part of the system

OTP-Compliant Processes

- All processes that are started directly from a supervisor should be _OTP compliant_
- To implement an OTP-compliant process, OTP-specific messages are handled in a particular way
- Use `GenServer`, `Supervisor`, and `Registru`
- The process started with these modules will be OTP-compliant
- Plain processes started by `spawn_link` are not OTP-compliant, so such processes should not be started directly from a supervisor
- Start plain processes from workers, such as `GenServer`, but better to use OTP-compliant processes

Shutting Down Processes
- A supervisor process will instruct its children to terminate gracefully, giving them time to do final cleanup
- If some of those children are, themselves, supervisors, they will take down their own trees in the same way
- Graceful termination of a `GenServer` worker involves invoking `terminate/2` callback, but only if the worker process is trapping exits
- To do cleanup from a `GenServer` process, set up an exit rap from an `init/1` callback
- The `:shutdown` option in a child specification lets you control the time the supervisor will wait for the child to terminate gracefully
- If the child does not terminate, it will be forcefully terminates
- Choose the shutdown time `shutdown: shutdown_strategy` in `child_spec/1` and passing an integer representing a time in milliseconds
- Pass `:infinity`, which instructs the supervisor to wait indefinitely for the child to terminate
- Pass `:brutal_kill`, telling the supervisor to immediately terminate the child in a forceful way
- The forceful termination is done by sending a `:kill` exit signal to the process
- The default value of `:shutdown` option is `5_000` for a worker or `:infinity` for a supervisor process

Avoiding Process Restarting
- By default, a supervisor restarts a terminated process regardless of the exit reason
- A process that handles an HTTP request or a TCP connection
	- If a process fails, the socket will be closed, and there is no point in restarting the process
	- Set up a _temporary_ worker by providing `restart: :temporary` in `child_spec/1`
	- A temporary worker is not restarted on termination
- Another option is a _transient_ worker, which is restarted only if it terminates abnormally
- Transient workers can be used for processes that may terminate normally as part of the standard system workflow
	- One-off jobs that are executed when system starts, `Task` module
	- Specified by `restart: :transient` in `child_spec/1`

Restart Strategies
- `one_for_one`
	- Starts a new process in place of the old one
- `:one_for_all`
	- supervisor terminates all other children and then starts all children
- `:rest_for_one`
	- supervisor terminates all younger siblings of the crashed child
	- Starts new child process in place of the old one
- These strategies are useful when there is tight coupling between siblings
	- Process keeps the PID of some sibling in its own state
- `:one_for_all` or `:rest_for_one`, the former is useful when there is tight dependency in all directions, the latter us used if younger siblings depend on the older one
- Use `:rest_for_one` to take down database workers if the registry process terminates

## 9.2 <font style="color:#40E0D0">Starting Processes Dynamically</font>
- The impact of a database worker error is confined to a single worker
- Running each to-do server under a supervisor and registering the servers in the process registry

1. <font style="color:#A8A8A8; text-decoration: underline;">Registering To-do Servers</font>

```Elixir
defmodule Todo.Server do
	use GenServer, restart: :temporary

	def start_link(name) do
		GenServer.start_link(__MODULE__, name, name: via_tuple(name))
	end

	defp via_tuple(name) do
		Todo.ProcessRegistry.via_tuple({__MODLUE__, name})
	end
	...
end
```

- Same technique yes with database workers
- Pass the via tuple as the name option
- The functions `add_entry/2` and `entires/2` are unchanged, and still take the PID as the first argument
- A client process first obtains the PID of the to-do server by invoking `Todo.Cache.server_process/1`, and then `Todo.Server` function

2. <font style="color:#A8A8A8; text-decoration: underline;">Dynamic Supervision</font>
- To supervise the to-do server, unlike the database workers, to-do servers are created dynamically when needed
- Each to-do server is create on demand when `Todo.Cache.server_process/1` is called
- Cannot specify supervisor children up front since the number children are unknown
- A dynamic supervisor start the children on demand, `DynamicSupervisor` module
- `Supervisor` is used to start a predefined list of children
- `DynamicSupervisor` is used to start children on demand
- A dynamic supervisor process does not need a list of child specifications, so only the supervisor process is started
- Start a supervised child using `DynamicSupervisor.start_child/2`
- Convert `Todo.Cache` into a dynamic supervisor

```Elixir
defmodule Todo.Cache do
	def start_link() do
		IO.puts("starting to-do cache")

		DynamicSupervisor.start_link(
			name: __MODULE__,
			strategy: :one_for_one
		)
	end
	...
end
```

- A supervisor process is started, but no children are specified
- A `:name` option is passed to cause the supervisor to be registered under a local name

```Elixir
defmodule Todo.Cache do
	...

	defp start_child(todo_list_name) do
		DynamicSupervisor.start_child(
			__MODULE__,
			{Todo.Server, todo_list_name}	
		)
	end
	...
end
```

- The `{Todo.Server, todo_list_name}` will lead to the invocation of `Todo.Server.start_link(todo_list_name)`
- The to-do server will be started as the child of the `Todo.Cache` supervisor
- The `DynamicSupervisor.start_child/2` is a cross-process synchronous call
- A request is sent to the supervisor process, which then starts the child
- If several client processes simultaneously try to start a child under the same supervisor, the requests will be serialized

```Elixir
defmodule Todo.Cache do
	...

	def child_spec(_arg) do
		%{
			id: __MODULE__,
			start: {__MODULE__, :start_link, []},
			type: :supervisor
		}
	end
	...
end
```

3. <font style="color:#A8A8A8; text-decoration: underline;">Finding To-do Servers</font>
- Change the discovery `Todo.Cache.server_process/1` function that takes the name and returns the PID

```Elixir
defmodule Todo.Cache do
	...

	def server_process(todo_list_name) do
		case start_child(todo_list_name) do
			{:ok, pid} -> pid                 #new server
			{:error, {:already_started, pid}} -> pid   #server is alreay running
		end
	end

	defp start_child(todo_list_name) do
		DynamicaSupervisor.start_child(
			__MODULE__,
			{Todo.Server, todo_list_name}
		)
	end
end
```

- The `{:error, {:already_started, pid}} -> pid` returns the PID
- Uses the inner workings of `GenServer` registration, when the `:name` option is provided in the `GenServer.start_link`, the registration is performed before the `init/1`
- It will fail if already registered, and returns the PID
- This result is then returned by `DynamicSupervisor.start_child`
- If there are two `DynamicSupervisor.start_child/2`, then there are two simultaneous executions of `start_child` on the same supervisor
- The invocations of `start_child` are serialized and `server_process/1` does not suffer from race conditions
- `start_child` is not very efficient
- The supervisor process becomes bottlenecked
  
4. <font style="color:#A8A8A8; text-decoration: underline;">Using the Temporary Restart Strategy</font>
- If a `:temporary` server crashed, it won't be restarted
- Servers are started on demand, but if a to-do list server crashes it will be restarted when called again and does not need to be restarted automatically
- Changing the restart strategy is done by providing `:restart` option to `use GenServer`

```Elixir
defmodule Todo.Server do
	use GenServer, restart: :temporary
	...
end
```

- The parent supervisor will treat the child as temporary
- This structure ensures that the failure of a single to-do server doe not affect any other process in the system
- To stop all to-do servers, the `Todo.Cache` supervisor is stopped
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Testing the System</font>
- The `Todo.Cache` was already listed as a child, and only its internals are cahnges

```Shell
iex(1)> Todo.System.start_link()
 
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
Starting to-do cache.

iex(2)> bobs_list = Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list
#PID<0.118.0>

iex(3)> bobs_list = Todo.Cache.server_process("Bob's list")
#PID<0.118.0>

iex(4)> alices_list = Todo.Cache.server_process("Alice's list")
Starting to-do server for Alice\'s list
#PID<0.121.0>

iex(5)> Process.exit(bobs_list, :kill)

iex(6)> Todo.Cache.server_process("Bob's list")
Starting to-do server for Bob\'s list
#PID<0.124.0>
```

![[Pasted image 20250210125453.png|600]]

- The system is fault tolerant

## 9.3 <font style="color:#40E0D0">“Let It Crash”</font>
- When developing complex systems, you should employ supervisors to do error handling and recovery
- With properly designed supervision trees, you can limit the impact of unexpected errors, and the system will recover
- OTP provides logging facilities, so process crashes are logged and you can see the specific error
- You can also get an event handler that will be triggered on every process crash, thus allowing you to perform custom actions, such as sending an email or reporting to an external system
- Worker code is liberated from paranoid, defensive `try/catch` constructs
	- _Making reliable distributed systems in the presence of software errors as intentional programming_
- This style is known as _let it crash_
- The code is shorter and more focused, and promotes clean-slate recovery
- When a new process starts, it has a new state
- The message queue of the old process is thrown away
- Explicitly handle an error:
	- In critical processes that should not crash
	- When you expect an error that can be dealt with in a meaningful way

1. <font style="color:#A8A8A8; text-decoration: underline;">Processes that Shouldn’t Crash</font>
- Processes that should not crash are informally called a system's _error kernel_
- These are critical systems whose state can't be restored in a simple and consistent way
- If the code of the error-kernel process is complex, consider splitting it into two processes
	- One that holds state
	- Another that does the actual work
- Therefore, the worker process can be replaces
- Include defensive `try/catch` expressions in each `handle_*` callback of a critical process, to prevent a process from crashing

```Elixir
def handle_call(message, _, state) do
	try
		new_state =
			state
			|> transformation_1()
			|> transformation_2()
			...

		{:reply, response, new_state}

	catch _, _ ->
		{:reply, {:error, reason}, state} #catches all errors
	end
end
```

- Immutable data structures allow you to implement a fault-tolerant server
- If there are any errors in the transformations, the initial state is used, performing a rollback of all changes
- This does not completely guard against a process crash
	- Always kill a process by `Process.exit(pid, :kill)` because exit reason can't be intercepted
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Handling Expected Errors</font>
- When an error is predicted you can handle it without crashing the server

```Elixir
def handle_call({:get, key}, _, db_folder) do
	data =
		case File.read(file_name(db_folder, key)) do
			{:ok, contents} -> :erlang.binary_to_term(contents)
			_ -> nil
		end

	{:reply, data, db_folder}
end
```

- When handling a `get` request, you read from a file, covering the case when this read fails
- If it does not succeed, it returns `nil`
- You can also pass `nil` when there is an error

```Elixir
case File.read(...) do
	{::ok, contents} -> do_something_with(contents)
	{:error, :enoent} -> nil
end
```

- The above code uses pattern matching
- If neither of these two expected situations occur, the process will fail
- When storing data `File.write!/2`, may throw an exception and crash the process
- If an error has an expected outcome, it should be handled
- For anything unexpected, the process crashes and ensures proper error isolation and recovery via supervisors
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Preserving the State</font>
- State is not preserved when a process is restarted
- The memory that it occupied is reclaimed, and the new process starts with new state
- In some cases, process state should survive the crash, instead of being terminated
- When the to-do server is restarted, it should first restore the data from the database
- A typical change in function data abstraction goes through chained transformations

```Elixir
new_state =
	state
	|> transformation_1(...)
	...
	|> transformation_2(...)
```

- The state should be persisted after all transformations
- state is stored outside the process

```Elixir
def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
	new_list = Todo.List.add_entry(todo_list, new_entry)
	Todo.Database.store(name, new_list)   #persist the state
	{:noreply, {name, new_list}}
end
```

- Persistent state can have a negative effect on restarts
- Is the state has an error, the process will never restart successfully
- Better to start clean and terminate all other dependent processes

---

# 10. Beyond GenServer
^a532a0
- Workers are the process that provides some part of your services, whereas supervisors organize the worker processes into a tree
- This enables starting and stopping processes in the desired order as ell as restart critical processes if they fail
- All processes started directly from a supervisor should be OTP-compliant
- Processes stated with plain `spawn` and `spawn_link` are not OTP compliant, therefore should be refrained form used
- Modules such as `Supervisor`, `GenServer`, and `Registry` allow you to start OTP-compliant processes that can be places into a supervision tree
- `Task` and `Agent`
	- Tasks used when you need to run one-off jobs
	- Agents are used to manage state and provide concurrent access to it
- _ETS tables_, serve as more efficient alternative to `GenServer` and `Agent`

## 10.1 <font style="color:#40E0D0">Tasks</font>
- The `Task` module can be used to concurrently run a job
- Tasked-powered processes have a different flow than server processes
- Starts its work immediately, does not serve requests, and stops when finished
- Two uses of the `Task` module:
	- _Awaited task_ - waits for the task to send the result back
	- _Non-awaited tasks_ - 

1. <font style="color:#A8A8A8; text-decoration: underline;">Awaited Tasks</font>
- An _awaited task_ is a process that executes some function, sends the function results back to the starter process, and then terminates

```Shell
iex(1)> long_job =
          fn ->
            Process.sleep(2000)
            :some_result
          end
iex(2)> task = Task.async(long_job)   #concurrent task
```

- The `Task.async/1` functions takes a zero-arity lambda, returns immediately, even if the lambda takes a long time
- Starter process is not blocks and can work concurrently
- The struct can be passed to `Task.await/1` to await the result of the task

```Shell
iex(3)> Task.await(task)
:some_result
```

- The message will contain the result of the lambda, 5 seconds is the default wait time, but can be adjusted as a second parameter `Task.await/2`
- Awaited tasks are used to run a couple of mutually independent, one-off computations and wait for all the results
	- Each query can be ran in a separate process and send the result as a message to the starter process

```Shell
iex(1)> run_query =       #long-running query
          fn query_def ->
            Process.sleep(2000)
            "#{query_def} result"
          end
iex(2)> queries = 1..5
 
iex(3)> tasks =
          Enum.map(
            queries,
            &Task.async(fn -> run_query.("query #{&1}") end)
          )
iex(4)> Enum.map(tasks, &Task.await/1)
["query 1 result", "query 2 result", "query 3 result", "query 4 result",
 "query 5 result"]
```

- Use the pipe operator to shorten the code

```Shell
iex(5)> 1..5
        |> Enum.map(&Task.async(fn -> run_query.("query #{&1}") end))
        |> Enum.map(&Task.await/1)
 
["query 1 result", "query 2 result", "query 3 result", "query 4 result",
 "query 5 result"]
```

- The results are returned in 2 seconds
- The result ordering is deterministic
- The `Task.async/1` links the new task to the starter process
- If any task process crashes, the starter process will crash too
- The crash of the starter process will cause all tasks to crash
- Starting multiple tasks with `Task.async/1` has _all-or-nothing_ semantics
- To individual address tasks, trap exits and handle corresponding exit messages in the starter process
- Use `Task.async_stream/3`

2. <font style="color:#A8A8A8; text-decoration: underline;">Non-Awaited Tasks</font>
- If you do not want to send a result message back, use `Task.start_link/1` function can be through as an OTP-compliant wrapper around plain `spawn_link`
- The function starts a separate process and links it to the called
- The process terminates with the reason `:normal`
- Unlike `Task.async/1`, `Task.start_link/1` won't send message to the starter process

```Shell
iex(1)> Task.start_link(fn ->
          Process.sleep(1000)
          IO.puts("Hello from task")
        end)
 
{:ok, #PID<0.89.0>}  
 
Hello from task!
```

- A non-responsive job
	- A system that gathers metrics about the system and returns at regular intervals

```Elixir
defmodule Todo.Metric do
	...

	defp loop() do
		Process.sleep(:timer.seconds(10))
		IO.inpect(collect_metrics())
		loop()
	end

	defp collect_metrics() do
		[
			memory_usage: :erlang.memory(:total),
			process_count: :erlang.system_info(:process_count)
		]
	end
end
```

- Run this loop as part of the system
- Metrics reporter as task

```Elixir
defmodule Todo.Metrics fo
	use Task

	def start_link(_arg), do: Task.start_link(&loop/0)
	...
end
```

- The `use Task` helps to inject the `child_spec/1` function into the `Todo.Metrics` module
- With the `GenServer`, the injected specification will invoke `start_link/1`, therefore it needs to be defined
- `start_link/1` invokes `Task.start_link/1` to start a task process where the loop is running
- Started a supervised metrics task

```Elixir
defmodule Todo.System do
	def start_link do
		Supervisor.start_link(
			[
				Todo.Metrics,
				...
			].
			strategy: :one_for_one
		)
	end
end
```

- The main purpose of `Task.start_link/1` is to allow you to start an OTP-compliant process that you can safely run as a child of some supervisor

```Shell
$ iex -S mix
 
iex(1)> Todo.System.start_link()
 
[memory_usage: 48110864, process_count: 74]   #printed after 10 seconds
[memory_usage: 48505592, process_count: 74]   #printed after 20 seconds
```

- This is a simple way of implementing a periodic job, without running multiple OS processes and using external schedulers such as `cron`
- It's worth separating scheduling from the job logic
	- One process for periodic scheduling and then start each job instance in a separate one-off process
	- Improves fault-tolerance
	- Implement this with third-party libraries such as Quantum

3. <font style="color:#A8A8A8; text-decoration: underline;">Supervising Dynamic Tasks</font>
- In many situation, you want to start non-awaited tasks dynamically
	- Communicate with a remote service
		- Payment gateway while handling a web request
- Perform this communication asynchronously, from a separate task process
- The incoming request is accepted, starts the task that communicates with the remote service, and immediately responds that the request has been accepted
- When task is done, it will notify the outcome via WebSocket or an email
	- Improves system responsiveness and enhances system resiliences to various networking issues
- This is an example of dynamically started independent task
- The task is started on demand, and its life cycle must be decoupled from the life cycle of the process that started it
- Use `DynanicSupervisor` and `Task.Supervisor` to run the task under a dedicated supervisor

```Shell
iex(1)> Task.Supervisor.start_link(name: MyTaskSupervisor)

iex(2)> Task.Supervisor.start_child(
          MyTaskSupervisor,
          fn ->
            IO.puts("Task started")
            Process.sleep(2000)
            IO.puts("Task stopping")
          end
        )
 
{:ok, #PID<0.118.0>}   #result of start_child
 
Task started           #printed immediately
Task stopping          #printed after 2 secs
```

- The shell process is the process that initiated task creation
- The task is actually started as a child of the task supervisor
- As a result of this process structure, the life cycle of the logical started and task are separated

## 10.2 <font style="color:#40E0D0">Agents</font>
- The `Agent` module provides an abstraction similar to `GenServer`
- Agents eliminate boilerplate associated with `GenServer`
- `Agent` does not support all the scenarios that `GenServer` does
- `Agent` can replace `GenServer` with `init/1`, `handle_cast/1`, and `handle_call/3`
	- But not `handle_info`, or `terminate/1`

1. <font style="color:#A8A8A8; text-decoration: underline;">Basic Use</font>
- To start an agent, use `Agent.start_link/1`

`iex(1)> {:ok, pid} = Agent.start_link(fn -> %{name: "Bob", age: 30} end)`

- `Agent.start_link/1` will start a new process and execute and provides lambda in that process
- Unlike a task, an agent process does not terminate when lambda is finished
- An agent uses the return value of the lambda as its state
- Other processes can access and manipulate an agent's state using various functions from the `Agent` module
- To fetch the agent's state, or some part of it use `Agent.get/2`

```Shell
iex(2)> Agent.get(pid, fn state -> state.name end)
"Bob"
```

- `Agent/get/2` takes the PID of the agent and a lambda
- The lambda is involved in the agent's process, and it receives the agent's state as the argument
- The return value of the lambda is sent back to the caller process as a message
- This message is received in `Agent.get/2`, which then returns the result to its caller
- To modify the agent's state, `Agent.update/2`

```Shell
iex(3)> Agent.update(pid, fn state -> %{state | age: state.age + 1} end)
:ok
```

- This will cause the internal state of the agent process to change, verify with `Agent.get/2`

```Shell
iex(2)> Agent.get(pid, fn state -> state end)
%{age: 31, name: "Bob"}
```

- `Agent.update/2` is synchronous
- This function only returns after the update has succeeded
- An asynchronous update can be performed with `Agent.cast/2`
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Agents and Concurrency</font>
- A single agent can be used by multiple client processes
- A change made by one process is observed by other processes

```Shell
iex(1)> {:ok, counter} = Agent.start_link(fn -> 0 end)
iex(2)> spawn(fn -> Agent.update(counter, fn count -> count + 1 end) end)
iex(3)> Agent.get(counter, fn count -> count end)
1
```

- The initial state of the agent is `0`
- The agent's state is manipulated from another process
- Check agent state from the shell
- An agent process works exactly like a `GenServer`
- If multiple clients try to work with the same agent at the same time, operations will be serialized and executed one by one
- The `Agent` module is implemented in plain Elixir on top of `GenServer`

```Elixir
defmodule MyAgent do
	use GenServer #agent is implemented

	def start_link(init_fun) do
		GenServer.start_link(__MODULE__, init_fun) #passes the lambda
	end

	def inti(init_fun) do
		{:ok, init_fun.()} #invoked lambda and uses its result as state
	end
	...
end
```
   
- Agent interface function take an anonymous function as an argument and pass the function to the server process, which, in turn invokes the function and does passes the result

```Elixir
defmodule MyAgent do
	...
	def get(pid, fun) do
		GenServer.call(pid, {:get, fun})
	end

	def update(pid, fun) do
		GenServer.ca;;(pid, {:update, fun})
	end

	def handle_call({:get, fun}, _from, state) do
		response = fun.(state)
		{:reply, response, state}
	end

	def handle_call({:update, fun}, _from, state) do
		new_state = fun.(state)
		{:reply, :ok, new_state}
	end
	...
end
```

- The `Agent` module is a plain `GenServer` that can be controlled by sending lambdas to the process
- Concurrent reasoning about agents is exactly the same as with `GenServer`

3. <font style="color:#A8A8A8; text-decoration: underline;">Agent-Powered To-do Server</font>

- Converting a `GenServer` into an agent is a fairly straightforward job
- Replace a pair of interface functions and the corresponding `GenServer` callback clause with a single function that uses the `Agent` API
- Agent-powered to-do server

```Elixir
defmodule Todo.server do
	use Agent, restart: :temporary

	def start_link(name) do
		Agent.start_link(
			fn ->
				IO.puts("Starting to-do server for #{name}")
				{name, Todo.Database.get(name) || Todo.List.new()}
			end,
			name: via_tuple(name)
		)
	end

	def add_entry(todo_server, new_entry) do
		Agent.cast(todo_server, fn {name, todo_list} ->
			new_list = Todo.List.add_entry(todo_list, new_entry)
			Todo.Database.store(name, new_list)
		end)
	end

	def entries(todo_server, date) do
		Agent.get(
			todo_server,
			fn {_name, todo_list} -> Todo.List.entries(todo_list, date) end
		)
	end

	defp via_tuple(name) do
		Todo.ProcessRegistry.via_tuple({__MODULE__, name})
	end
end
```

- The `use Agent` will start the default implementation of `child_spec/1`, allowing you to list the module in a child specification list

Always Wrap Agent Code in a Module
- With an `Agent`, the state can be manipulated in an arbitrary way through lambdas passed to functions
	- State is prone to accidental corruption
- To fix this problem, wrap an agent in a dedicated module and to only manipulate the agent process through functions of that module
- The new version of `Todo.Server` requires only 29 lines of code, which is shorter than the `GenServer`

4. <font style="color:#A8A8A8; text-decoration: underline;">Limitations of Agents</font>
- The `Agent` module can't be used to handle plain messages or if you want to run some logic on termination
- 




- Specifying idle timeout

```Elixir
defmodule Todo.Server do
	...

	@expiry_idle_timeout :timer.seconds(10)

	def init(name) do
		IO.puts("Starting to-do server fo #{name}")
		{:ok, {name, nil}, {:continue, :init}}
	end

	def handle_continue(:init, {name, nil}) do
		todo_list = Todo.Database.get(name) || Todo.List.new()

		{
			:noreply,
			{name, todo_list},
			@expiry_idle_timeout
		}
	end

	def handle_call({:entries, date}, _, {name, todo_list}) do
		{
			:reply
			Todo.List.entries(todo_list, date),
			{name, todo_list},
			@expiry_idle_timeout
		}
	end
	...
end
```

   







- Stopping an idle to-do server

```Elixir
defmodule Todo.Server do
	...

	def handle_info(:timeout, {name, todo_list}) do
		IO.puts("Stopping to-do server for #{name}")
		{:stop, :normal, {name, todo_list}}
	end
end
```

## 10.3 <font style="color:#40E0D0">ETS Tables</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Basic Operations</font>

- GenServer-powered key-value store

```Elixir
defmodule KeyValue do
	use GenServer

	def start_link do
		GenServer.start_link(__MODULE__, nil, name: __MODULE__)
	end

	def put(key, value) do
		GenServer.cast(__MODULE__, {:put, key, value})
	end

	def get(key) do
		GenServer.call(__MODULE__, {:getm key})
	end

	def init(_) do
		{:ok, %{}}
	end

	def handle_cast({:put, key, value}, store) do
		{:noreply, Map.put(store, key, value)}
	end

	def handle_call({:get, key}, _, store) do
		{:reply, Map.get(store, key), store}
	end
end
```





   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">ETS-Powered Key-Value Store</font>

- Creating the ETS tables

```Elixir
defmodule EtsKeyValue do
	use GenServer

	def start_link do
		GenServer.start_link(__MODULE__, nil, name: __MODULE__)
	end

	def init(_) do
		:ets.new(
		__MODULE__,
		[:named_table, :public, write_concurrency: true]
		)

		{:ok, nil}
	end
	...
end
```




```Elixir
defmodule EtsKeyValue do
	...

	def put(key, value) do
		:ets.insert(__MODULE__, {key, value})
	end

	def get(key) do
		case :ets.lookup(__MODULE__, key) do
			[{^key, value}] -> value
			[] -> nil
		end
	end
	...
end
```

   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Other ETS Operations</font>







   
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Exercise: Process Registry</font>







   
   

---

# Part 3 – Production

## 11. Working with Components

^f7afd7

### 11.1 <font style="color:#40E0D0">OTP Application</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Creating Application with the Mix Tool</font>
   
```Elixir
defmodule HelloWorld.MixProject do
	use Mix.Project

	def project do
		[
		 app: :hello_world,
		 version: "0.1.0",
		 elixir: "-> 1.15",
		 start_permanent: Mix.env() == :prod,
		 deps: deps()
		]
	end

	def application do
		[
			extra_applications: [:logger],
			mod: {HelloWorld.Application, []}
		]
	end

	defp deps do
		[]
	end
end
```





2. <font style="color:#A8A8A8; text-decoration: underline;">The Application Behavior</font>

- 


```Elixir
defmodule HelloWorld.Application do
	use Application

	def start(_tupe, _args) do
		children = []
		opts = [statergy: :one_for_one, name: HelloWorld.Supervisor]
		Supervisor.start_link(children, opts)
	end
end
```


   
3. <font style="color:#A8A8A8; text-decoration: underline;">Starting the Application</font>
   
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Library Application</font>
   
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Implementing the Application Callback</font>

- Specifying application parameters

```Elixir
defmodule Todo.MixProject do
	use Mix.Project

	def project do
		[
			app: :todo,
			version: "0.1.0",
			elixir: "-> 1.15",
			start_permanent: Mix.env() == :prod,
			deps: deps()
		]
	end

	def application do
		[
			extra_application: [:logger],
			mod: {Todo.Application, []}
		]
	end

	defp deps do
		[]
	end
end
```


- Implementing the application module

```Elixir
defmodule Todo.Application do
	use Application

	def start(_, _) do
		Todo.System.start_link()
	end
end
```





```Elixir
defmodule Todo.CacheTest do
	use ExUnit.Case

	test "server_process" do
		{:ok, cache} = Todo.Cache.start()
		bob_pid = Todo.Cache.server_process(cache, "bob")

		assert bob_pid != Todo.Cache.server_process("alice")
		assert bob_pid == Todo.Cache.server_process("bob")
	end
	...
end
```
   
- Testing server_process

```Elixir
defmodule Todo.CacheTest do
	use ExUnit.Case

	test "server_process" do
		bob_pid = Todo.Cache.server_process("bob")

		assert bob_pid != Todo.Cache.server_process("alice")
		assert bob_pid == Todo.Cache.server_process("bob")
	end
	...
end
```





6. <font style="color:#A8A8A8; text-decoration: underline;">The Application Folder Structure</font>
   
```Shell
lib/
  App1/
    ebin/
    priv/
 
  App2/
    ebin/
    priv/
  ...
```




```Shell
YourProjectFolder
_build
  dev
    lib
      App1
        ebin
        priv
 
      App2
      ...
```
### 11.2 <font style="color:#40E0D0">Working with Dependencies</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Adding a Dependency</font>

- Adding an external depencency

```Elixir
defmodule Todo.MixProject do
  ...
 
  defp deps do
    [
      {:poolboy, "~> 1.5"}   ❶
    ]
  end
end
```




   
2. <font style="color:#A8A8A8; text-decoration: underline;">Adapting the Pool</font>
   

- Starting a Poolboy-powered pool

```Elixir
defmodule Todo.Database do
	@db_folder "./persist"

	def child_spec(_) do
		File.mkdir_p!(@db_folder)

	:poolboy.child_spec(
		__MODULE__,
		[
			name: {:local, __MODULE__},
			worker_module: Todo.DatabaseWorker,
			size: 3
		],

		[@db_folder]
		)
	end
	...
end
```




- Adapted operation functions

```Elixir
defmodule Todo.Database do
	...

	def store(key, data) do
		:poolboy.transaction(
			__MODULE__,
			fn worker_pid ->
				Todo.DatabaseWorker.store(worker_pid, key, data)
			end
		)
	end

	def get(key) do
		:poolboy.transaction(
			__MODULE__,
			fn worker_pid ->
				Todo.DatabaseWorker.get(worker_pid, key)
			end
		)
	end
end
```


- Adapted worker interface

```Elixir
defmodule Todo.DatabaseWorker do
	use GenServer

	def start_link(db_folder) do
		GenServer.start_link(__MODULE__, db_folder)
	end

	def store(pid, key, data) do
		GenServer.cast(pid, {:store, key, data})
	end

	def get(pid, key) do
		GenServer.caa(pid, {:get, key})
	end
	...
end
```








3. <font style="color:#A8A8A8; text-decoration: underline;">Visualizing the System</font>
   
   

### 11.3 <font style="color:#40E0D0">Building a Web Server</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Choosing Dependencies</font>

- External dependencies for the web server

```
defmodule Todo.Mixfile do
	...

	defp deps do
		[
			[:poolboy, "-> 1.5"]
			{:plug_cowboy, "-> 2.6"}
		]
	end
end
```
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Starting the Server</font>

   - HTTP server specification

```Elixir
defmodule Todo.Web do
	...
	def child_spec(_arg) do
		Plug.Cowboy.child_spec(
			scheme: :http,
			options: [port: 5454],
			plug: __MODULE__
		)
	end
	...
end
```
   

- Starting the HTTP server

```Elixir
defmodule Todo.System do
	def start_link do
		Supervisor.start_link(
			[
				Todo.Metrics,
				Todo.ProcessRegistry,
				Todo.Database,
				Todo.Cache,
				Todo.Web
			],
			strategy: :one_for_one
		)
	end
end
```







3. <font style="color:#A8A8A8; text-decoration: underline;">Handling Requests</font>

- Setting up a route for add_entry

```Elixir
defmodule Todo.Web do
	use Plug.Router

	plug :match
	plug :dispatch

	...

	post "/add_entry" do
		...
	end
	...
end
```



- Implementing the add_entry request

```Elixir
defmodule Todo.Web do
	...
	post "/add_entry" do
		conn = Plug.Conn.fetch_query_params(conn)
		list_name = Map.fetch!(conn.params, "list")
		title = Map.fetch!(conn.params, "title")
```


   
4. <font style="color:#A8A8A8; text-decoration: underline;">Reasoning About the System</font>
   
   

### 11.4 <font style="color:#40E0D0">Configuring Applications</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Application Environment</font>
   
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Varying Configuration</font>
   
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Config Script Considerations</font>
   
   
   

---

## 12. Building a Distributed System

^7908a4

### 12.1 <font style="color:#40E0D0">Distributing Primitives</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Starting a Cluster</font>
   
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Communicating Between Nodes</font>
   
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Process Discovery</font>
   
   
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Links and Monitors</font>
   
   
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Other Distribution Services</font>
   
   
   

### 12.2 <font style="color:#40E0D0">Building a Fault-Tolerant Cluster</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Cluster Design</font>
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">The Distributed To-do Cache</font>
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Implementing a Replicated Database</font>
   
   
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Testing the System</font>
   
   
5. <font style="color:#A8A8A8; text-decoration: underline;">Detecting Partitions</font>
   
   
6. <font style="color:#A8A8A8; text-decoration: underline;">Highly Available Systems</font>
   
   

### 12.3 <font style="color:#40E0D0">Network Considerations</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Node Names</font>
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Cookies</font>
   
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Hidden Nodes</font>
   
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Firewalls</font>
   
   
   

---

## 13. Running the System

^888528

### 13.1 <font style="color:#40E0D0">Running a System with Elixir Tools</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Using the Mix and Elixir Commands</font>
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Running Scripts</font>
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Compiling for Production</font>
   
   

### 13.2 <font style="color:#40E0D0">OTP Releases</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Building a Release</font>
   
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Using a Release</font>
   
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Packaging in a Docker Container</font>
   
   
   

### 13.3 <font style="color:#40E0D0">Analyzing System Behavior</font>
1. <font style="color:#A8A8A8; text-decoration: underline;">Debugging</font>
   
   
   
2. <font style="color:#A8A8A8; text-decoration: underline;">Logging</font>
   
   
   
3. <font style="color:#A8A8A8; text-decoration: underline;">Interacting with the System</font>
   
   
   
4. <font style="color:#A8A8A8; text-decoration: underline;">Tracing</font>
   
   
