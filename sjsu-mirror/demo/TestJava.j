.class public TestJava
.super java/lang/Object

; default constructor
.method public <init>()V
   aload 0
   invokespecial java/lang/Object/<init>()V
   return
.end method

.method public static print(Ljava/lang/String;)V
   .limit locals 1
   .limit stack 2
   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   return
.end method

.method public static print(D)V
   .limit locals 2
   .limit stack 4
   getstatic java/lang/System/out Ljava/io/PrintStream;
   dload 0
   invokevirtual java/io/PrintStream/println(D)V
   return
.end method

.method public static testMath()V
   .limit stack 4
   getstatic java/lang/Math/PI D
   ldc2_w 4.0
   ddiv
   invokestatic java/lang/Math/sin(D)D
   ldc "sin(pi/4) = "
   invokestatic TestJava/print(Ljava/lang/String;)V
   invokestatic TestJava/print(D)V
   return
.end method

.method static testRectangle()V

   .limit stack 4
   .limit locals 4
   new java/awt/Rectangle
   dup
   ldc 50
   ldc 30
   invokespecial java/awt/Rectangle/<init>(II)V
   dup
   ldc 10
   ldc 15
   invokevirtual java/awt/Rectangle/setLocation(II)V

   invokevirtual java/awt/Rectangle/toString()Ljava/lang/String;
   astore 0

   getstatic java/lang/System/out Ljava/io/PrintStream;
   aload 0
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

   return
.end method

; main
.method public static main([Ljava/lang/String;)V

   ;invokestatic TestJava/testMath()V
   invokestatic TestJava/testRectangle()V
   return

.end method
