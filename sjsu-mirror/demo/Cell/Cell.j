.class Cell
.super java/lang/Object

.field public static cellCount I
.field private static gen Ljava/util/Random;
.field private value I

.method static public <clinit>()V
   .limit stack 2
   ldc 0
   putstatic Cell/cellCount I
   new java/util/Random
   dup
   invokespecial java/util/Random/<init>()V
   putstatic Cell/gen Ljava/util/Random;
   return
.end method

.method public <init>()V

   .limit stack 3
   .limit locals 1

   aload 0
   invokespecial java/lang/Object/<init>()V

   aload 0
   getstatic Cell/gen Ljava/util/Random;
   ldc 100
   invokevirtual java/util/Random/nextInt(I)I
   putfield Cell/value I

   getstatic Cell/cellCount I
   ldc 1
   iadd
   putstatic Cell/cellCount I

   return

.end method

.method public getValue()I
   .limit locals 1
   .limit stack 1
   aload 0
   getfield Cell/value I
   ireturn
.end method
