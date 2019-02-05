.class public TestAccount
.super java/lang/Object

; default constructor
.method public <init>()V
   aload_0 ; push this
   invokespecial java/lang/Object/<init>()V ; call super
   return
.end method

.method public static main([Ljava/lang/String;)V

   .limit stack 4
   .limit locals 4

   ; create an Account object on top of stack
   new Account
   dup
   invokespecial Account/<init>()V ; call constructor
   astore 0

   aload 0
   ; push $98.6
   ldc2_w 98.6

   ; deposit
   invokevirtual Account/deposit(D)V

   aload 0
   ; push $3.14
   ldc2_w 3.14

   ; deposit
   invokevirtual Account/deposit(D)V

   aload 0
   invokevirtual Account/getBalance()D


   ; save balance in locals[1]
   dstore 1

   ; print result
   getstatic java/lang/System/out Ljava/io/PrintStream;
   dload 1
   invokevirtual java/io/PrintStream/println(D)V

   ; terminate main
   return

.end method
