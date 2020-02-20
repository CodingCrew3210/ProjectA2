@ Hayden Kowalchuk (c) 2020
@ CodingCrew 3210 Project A2
@ Goal: Register = val2 + 9 + val3 - val1
@ reg can be any gpr

.section .data

val1: .word 6    @ 32-bit variable val1 in memory
val2: .word 11   @ 32-bit variable val2 in memory
val3: .word 16   @ 32-bit variable val3 in memory

.section .text
.global _start

_start:
@  ldr r1, =a    @ load the memory address of a into r1
@  ldr r1, [r1]  @ load the value a into r1
@  ldr r2, =b    @ load the memory address of b into r2
@  ldr r2, [r2]  @ load the value b into r2
@  add r1,r1,r2  @ add r1 to r2 and store into r1
@  ldr r2, =c    @ load the memory address of c into r2
@  str r1, [r2]  @ store r1 into memory c

  @ r1 = val1
  ldr r1, =val1
  ldr r1, [r1]

  @ r2 = val2
  ldr r2, =val2
  ldr r2, [r2]

  @ r3 = val3
  ldr r3, =val3
  ldr r3, [r3]

  @ r4 = 9im
  mov r4, #9

  @ r2 = val2 + 9
  add r2, r2, r4

  @ r2 = (val2 + 9) + val3
  add r2, r2, r3

  @ r1 = ((val2 + 9) + val3) - val1
  sub r1, r2, r1

  mov r7, #1    @ Program Termination: exit syscall
  svc #0        @ Program Termination: wake kernel
.end
