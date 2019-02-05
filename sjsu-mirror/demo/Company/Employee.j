.class public Employee
.super java/lang/Object

.field private name Ljava/lang/String;
.field private salary F

;================================
; constructor
;================================
.method public <init>(Ljava/lang/String;F)V

   .limit locals 3
   .limit stack 2

   aload 0
   invokespecial java/lang/Object/<init>()V

   aload 0
   aload 1
   putfield Employee/name Ljava/lang/String;

   aload 0
   fload 2
   putfield Employee/salary F

   return
.end method


;================================
;
;================================
.method public getName()Ljava/lang/String;
   .limit stack 1
   .limit locals 1

   aload 0 ; push this
   getfield Employee/name Ljava/lang/String;

   areturn

.end method

;================================
;
;================================
.method public getSalary()F
   .limit stack 1
   .limit locals 1

   aload 0 ; push this
   getfield Employee/salary F

   freturn

.end method

;================================
;
;================================
.method public setSalary(F)V
   .limit stack 2
   .limit locals 2

   aload 0 ; push this
   fload 1 ; push salary
   putfield Employee/salary F

   return

.end method
