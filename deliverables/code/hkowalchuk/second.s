@ second program: c = a+b

.section .data

a: .word 2 @ 32-bit variable a in memory
b: .word 5 @ 32-bit variable b in memory
c: .word 0 @ 32-bit variable c in memory

.section .text
.global _start

_start:
  ldr rl, =a    @ load the memory address of a into rl
  ldr rl, [rl]  @ load the value a into rl
  ldr r2, =b    @ load the memory address of b into r2
  ldr r2, [r2]  @ load the value b into r2
  add rl,rl,r2  @ addr to r2 and store into rl
  ldr r2, =c    @ load the memory address of c into r2
  str rl, [12]  @ store r1 into memory c
  
  mov 17, #1    @ Program Termination: exit syscall
  sve #0        @ Program Termination: wake kernel
.end
