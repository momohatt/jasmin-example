.class public RecursiveFunctions
.super java/lang/Object

;================================
; default constructor
;================================
.method public <init>()V
   aload 0
   invokespecial java/lang/Object/<init>()V
   return
.end method


;================================
; recursive factorial
;================================
.method public static fact(I)I
   .limit stack 3
   .limit locals 2

   ldc 1    ; push 1
   istore 1 ; local[1] = 1

   ; if local[0] <= 0 goto done
   iload 0
   ifle done

   iload 0
   ldc 1
   isub
   invokestatic RecursiveFunctions/fact(I)I
   iload 0
   imul
   istore 1

done:

   iload 1
   ireturn

.end method
