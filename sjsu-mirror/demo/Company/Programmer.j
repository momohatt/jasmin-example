.class public Programmer
.super Employee

.field private favoriteLanguage Ljava/lang/String;

;================================
; constructor
;================================
.method public <init>(Ljava/lang/String;FLjava/lang/String;)V

   .limit locals 4
   .limit stack 3

   aload 0
   aload 1
   fload 2
   invokespecial Employee/<init>(Ljava/lang/String;F)V

   aload 0
   aload 3
   putfield Programmer/favoriteLanguage Ljava/lang/String;

   return
.end method

;================================
;
;================================
.method public getFavoriteLanguage()Ljava/lang/String;
   .limit stack 1
   .limit locals 1

   aload 0 ; push this
   getfield Programmer/favoriteLanguage Ljava/lang/String;

   areturn
.end method
