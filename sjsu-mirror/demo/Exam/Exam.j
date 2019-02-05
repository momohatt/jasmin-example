.class public Exam
.super java/lang/Object

;==================================
; three fields
;==================================
.field private scores [I
.field private size I
.field private capacity I

;==================================
; default constructor
;==================================
.method public <init>()V

   .limit stack 2
   .limit locals 1

   aload 0
   invokespecial java/lang/Object/<init>()V

   ; initialize capacity
   aload 0                   ; <this>
   ldc 100                   ; <100 this>
   putfield Exam/capacity I  ; <> && this.capacity = 100

   ; initialize size
   aload 0                   ; <this>
   ldc 0                     ; <0 this>
   putfield Exam/size I      ; <> && this.size = 0

   ; initialize scores:
   aload 0                   ; <this>
   dup                       ; <this this>
   getfield Exam/capacity I  ; <100 this>
   newarray int              ; <ref this> where ref = new int[100]
   putfield Exam/scores [I   ; <> && this.scores = ref

   return
.end method

;==================================
; void validateIndex(index)
;==================================

.method private validateIndex(I)V

   .limit stack 2
   .limit locals 2

   ; validate index = locals[1]
   iload 1                   ; <index>
   iflt INDEX_ERROR          ; <> && if (index < 0) goto INDEX_ERROR
   iload 1                   ; <index>
   aload 0                   ; <this index>
   getfield Exam/size I      ; <this.size index>
   if_icmpge INDEX_ERROR     ; <> && if (index >= this.size) goto INDEX_ERROR
   return                    ; index is valid

INDEX_ERROR:

   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; push string to be printed
   ldc "Error: array index out of range!"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   ; terminate program with System.exit(1)
   ldc 1
   invokestatic java/lang/System/exit(I)V
   return   ; never reached

.end method

;==================================
; int getScore(index)
;==================================
.method public getScore(I)I

   .limit stack 2
   .limit locals 2

   ; validate index
   aload 0                   ; <this>
   iload 1                   ; <index this>
   invokevirtual Exam/validateIndex(I)V     ; <>

   aload 0                   ; <this>
   getfield Exam/scores [I   ; <this.scores>
   iload 1                   ; <index this.scores>
   iaload                    ; <this.scores[index]>
   ireturn

.end method

;==================================
; int getSize()
;==================================
.method public getSize()I

   .limit stack 1
   .limit locals 1

   aload 0                   ; <this>
   getfield Exam/size I      ; <this.size>
   ireturn

.end method

;==================================
; void addScore(score)
;==================================
.method public addScore(I)V

   .limit stack 3
   .limit locals 2

   ; check capacity
   aload 0                       ; <this>
   getfield Exam/capacity I      ; <this.capacity>
   aload 0                       ; <this this.capacity>
   getfield Exam/size I          ; <this.size this.capacity>
   if_icmple DONE                ; <> && if (this.capacity <= this.size) goto DONE

   ; scores[size] = score
   aload 0                       ; <this>
   getfield Exam/scores [I       ; <this.scores>
   ;iload 1                       ; <score this.scores>
   aload 0                       ; <this this.scores>
   getfield Exam/size I          ; <this.size this.scores>
   iload 1                       ; <score this.size this.scores>
   iastore                       ; <> && this.scores[this.size] = score

   ; size = size + 1
   aload 0                       ; <this>
   dup                           ; <this this>
   getfield Exam/size I          ; <this.size this>
   ldc 1                         ; <1 this.size this>
   iadd                          ; <1 + this.size this>
   putfield Exam/size I          ; <> && this.size = 1 + this.size

   return

DONE:
   ; push java.lang.System.out (type PrintStream)
   getstatic java/lang/System/out Ljava/io/PrintStream;
   ; push string to be printed
   ldc "Error: array full!"
   ; invoke println
   invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
   return

.end method

;==================================
; double getAverage()
;==================================
.method public getAverage()D

   .limit stack 2
   .limit locals 1
   ; left as an exercise!
   ldc2_w 0.0
   dreturn

.end method
