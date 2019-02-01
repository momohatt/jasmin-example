# Copy of [the lecture note @ SJSU](http://www.cs.sjsu.edu/~pearce/modules/lectures/co/jvm/jasmin/index.html)

## index
* Jasmin / JVM Data Types
* The Jasmin Instruction Set

## Jasmin / JVM Data Types

### TYPES
There are 10 JVM/Jasmin primitive data types:

|||
|:----:|:----------|
| `I` | int (32 bits)       |
| `J` | long (64 bits)      |
| `F` | float (32 bits)     |
| `D` | double (64 bits)    |
| `B` | byte (8 bits)       |
| `S` | short (16 bits)     |
| `C` | char (16 bits)      |
| `Z` | boolean             |
| `a` | reference (32 bits) |
| `V` | void                |

In addition, there are three composite types:

|||
|:----:|:----------|
| `[X  ` | X[] (array of X)  |
| `LY; ` | class Y  |
| `(X)Y` | X->Y (method with domain = X and range = Y)  |

### Note
#### Sub-word types
byte, short, and char are second class types. While Jasmin programmers can load and store these types, Jasmin doesn't support arithmetic and logic on these types because it's more efficient to work with 32 bit quantities.

Also, boolean is a virtual type standing for the 32 bit ints 0 (false) and 1 (true).


## The Jasmin Instruction Set

Jasmin statements are comments, directives, and instructions:

```
STATEMENT ::= COMMENT | DIRECTIVE | INSTRUCTION
```

### Comments
Comments begin with a semi-colon. The assembler ignores everything between the semi-colon and the next end of line:

```jasmin
; this is a comment
```

### Directives
Directives begin with a period and are executed by the assembler rather than the JVM.

For example, suppose the file Car.java contains the following class declaration:

```java
public class Car extends Vehicle implements Carrier {
    private double speed;
    public void start() {
        // etc.
    }
}
```

A compiler that translated Java to Jasmin would translate Car.java into a file called Car.j that looked like this:

```jasmin
.class public Car          ; public class Car 
.super Vehicle             ; extends Vehicle
.implements Carrier        ; implements Carrier
.field private speed D     ; private double speed;
.method public start()V    ; public void start() {
.limit stack 4             ; start requires a 4 word stack
.limit locals 2            ; start requires space for 2 locals
    ; instruction go here
.end                       ; } // end of start
```

### Instructions
The typical format of a Jasmin instruction is:

```
LABEL: OPERATOR OPERAND(S) ; COMMENT
```

Labels are needed if the instruction will be the target of a `goto` instruction. Otherwise they are optional. The operator (`iadd` for example) is also called the mnemonic. Some operators require inputs, which are called operands, arguments, or parameters. Comments are optional. Don't under-use or over-use them.

A complete list of Jasmin instructions can be found at:

<http://jasmin.sourceforge.net/instructions.html>

Instructions are executed by the JVM and can roughly be grouped into four categories:

* [data control]()
* [arithmetic & logic]()
* [sequence control]()
* [method invocation]()
* [creating and using objects]()
* [arrays]()
