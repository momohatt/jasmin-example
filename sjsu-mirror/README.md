# Mirror of [the lecture note @ SJSU](http://www.cs.sjsu.edu/~pearce/modules/lectures/co/jvm/jasmin/index.html)

## index
* [Jasmin / JVM Data Types](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror#jasmin--jvm-data-types)
* [The Jasmin Instruction Set](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror#the-jasmin-instruction-set)
* Notes
    * [Initializing static fields](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror#initializing-static-fields-in-jasmin)
    * [The null pointer in Jasmin](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror#the-null-pointer-in-jasmin)

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

* [Data Control](https://github.com/momohatt/jasmin-example/blob/master/sjsu-mirror/instructions.md#data-control)
* [Arithmetic & Logic](https://github.com/momohatt/jasmin-example/blob/master/sjsu-mirror/instructions.md#arithmetic-and-logic)
* [Sequence Control](https://github.com/momohatt/jasmin-example/blob/master/sjsu-mirror/instructions.md#arithmetic-and-logic)
* [Method Invocation](https://github.com/momohatt/jasmin-example/blob/master/sjsu-mirror/instructions.md#method-invocation)
* [Creating and Using Objects](https://github.com/momohatt/jasmin-example/blob/master/sjsu-mirror/instructions.md#objects)
* [Arrays](https://github.com/momohatt/jasmin-example/blob/master/sjsu-mirror/instructions.md#arrays)


## Notes
### Initializing Static Fields in Jasmin
Java allows fields to be initialized inline. For example:

```java
class Cell {

    public static int cellCount = 0;
    private static java.util.Random gen = new java.util.Random();
    private int value = gen.nextInt(100);

    public Cell() {
        cellCount++;
    }
    public int getValue() {
        return value;
    }
}
```

Inline initialization of fields is a syntactic shortcut. A field can always be initialized in a constructor. But what about static fields? We need to be able to initialize them before any instance of the class is created. To do thgat Java allows classes to declare static blocks that are executed when the class is loaded:

```java
class Cell {

    public static int cellCount;
    private static java.util.Random gen;
    private int value;

    static {
        cellCount = 0;
        gen = new java.util.Random();
    }

    public Cell() {
        value = gen.nextInt(100);
        cellCount++;
    }
    public int getValue() {
        return value;
    }
}
```

In Jasmin these static blocks translate into a special method called `<clinit>`, which strands for "class init":

```jasmin
.method static public <clinit>()V
    // init static fields here
    return
.end method
```

See the following files for a demonstration:

* [Cell.java](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror/demo/Cell/Cell.java)
* [TestCell.java](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror/demo/Cell/TestCell.java)
* [Cell.j](https://github.com/momohatt/jasmin-example/tree/master/sjsu-mirror/demo/Cell/Cell.j)

### The null pointer in Jasmin
In Java, null is the initial value of every uninitialized reference variable:

```java
SpaceShip falcon; // falcon = null
```

Note that this implies that the null reference can masquerade as a reference to any type of object, including an array.

We should test for null before we invoke any methods:

```java
if (falcon != null) {
    falcon.fireLasers();
}
```

Often null is returned as an indication that a search has failed:

```java
SpaceShip find(String name) {
    for(SpaceShip s: fleet) {
        if (name.equals(s.getName())) {
            return s;
        }
    }
    return null; // spaceship not found ;-(
}
```

In C null is simply taken as 0, but this isn't true in Java. The JVM threats null as a special constant named `aconst_null`.

For example:

```jasmin
    aconst_null ; ldc null
    aload 1 ; load falcon
    if_acmpeq ERROR   ; note use of if_acmpeq (or if_acmpne) to compare addresses
    ; fire lasers
    goto DONE
ERROR:
    ; print error message
DONE:
```

Another example:

```jasmin
.method public find(Ljava/lang/String;)LSpaceship;
    ; search for name and return if found, else:
    aconst_null    ; ldc null
    areturn
.end method
```
