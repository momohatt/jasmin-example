.class public TestCalculator
.super java/lang/Object

; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method

.method public static main([Ljava/lang/String;)V

   .limit stack 4
   .limit locals 2


   ; create a Calculator object on top of stack
   new Calculator
   dup   ; 2 refs to new calculator are needed on top of stack
   invokespecial Calculator/<init>()V ; call constructor

   ; push 98.6 degrees F onto stack
   ldc 98.6

   ; convert to centigrade
   invokevirtual Calculator/f2c(F)F
   ; save result in locals[1]
   fstore 1

   ; print result
   getstatic java/lang/System/out Ljava/io/PrintStream;
   fload 1
   invokevirtual java/io/PrintStream/println(F)V

   ; terminate main
   return

.end method
