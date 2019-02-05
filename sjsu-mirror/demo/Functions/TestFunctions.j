.class public TestFunctions
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

   ldc 4
   invokestatic Functions/fact(I)I
   istore 0

   ; print result
   getstatic java/lang/System/out Ljava/io/PrintStream;
   iload 0
   invokevirtual java/io/PrintStream/println(I)V

   ; terminate main
   return

.end method
