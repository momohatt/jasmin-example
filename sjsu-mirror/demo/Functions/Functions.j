.class public Functions
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
; absolute value
;================================
.method public static abs(J)J

   .limit stack 4
   .limit locals 2

   lload 0
   ldc2_w 0
   lcmp
   ifle else
   lload 0
   lreturn
else:
   lload 0
   ldc2_w -1
   lmul
   lreturn
.end method


;================================
; factorial
;================================
.method public static fact(I)I
   .limit stack 3
   .limit locals 2

   ldc 1    ; push 1
   istore 1 ; local[1] = 1

while:

   ; if local[0] <= 0 goto done
   iload 0
   ifle done


   ; local[1] = local[0] * local[1]
   iload 0
   iload 1
   imul
   istore 1

   ; local[0] = local[0] - 1
   iload 0
   ldc 1
   isub
   istore 0

   goto while

done:

   iload 1
   ireturn

.end method
