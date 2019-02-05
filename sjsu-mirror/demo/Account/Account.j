.class public Account
.super java/lang/Object

.field private balance D = 0.0

; default constructor
.method public <init>()V
   aload_0
   invokespecial java/lang/Object/<init>()V
   return
.end method

.method public getBalance()D
   .limit stack 2
   aload_0 ; push this
   getfield Account/balance D
   dreturn
.end method

.method public deposit(D)V
   .limit stack 6   ; ???
   .limit locals 4  ; ???
   aload_0 ; push this 
   aload_0                      ; stack = this, this
   getfield Account/balance D   ; stack = this, this.balance
   dload_1                      ; stack = this, this.balance, amt
   dadd                         ; stack = this, this.balance + amt
   putfield Account/balance D
   return
.end method
