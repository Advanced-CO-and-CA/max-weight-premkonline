/******************************************************************************
* file: arm_lab_cs18m512_assignment3.s
* author: Premkumar Sholapur
* Roll no: cs18m512
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
 *Finding the 32-bit number that has the largest number of bits set
 */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
data_start: .word 0x205A15E3 @(0010 0000 0101 1010 0001 0101 1101 0011 – 13)
            .word 0x256C8700 @(0010 0101 0110 1100 1000 0111 0000 0000 – 11)
data_end:   .word 0x295468F2 @(0010 1001 0101 0100 0110 1000 1111 0010 – 14)

   NUM:     .word 0x0 @0x295468F2
   WEIGHT:  .word 0x0 @14

  @ TEXT section
      .text

.globl _main

_main:
      MOV R0, #0 @ max_num
      MOV R1, #0 @ max_weight

      LDR R2, =data_start
      LDR R3, =data_end

LOOPA:CMP R2, R3
      BGT DONE
      LDR R4, [R2], #4 @ Contains the number
      
      MOV R5, #32      @ counter to check each of 32-bits
      MOV R6, #0       @ initialize counter = 0
      MOV R7, R4       @ Temp copy of R4

LOOP32:
      LSLS  R7, #1
      ADDCS R6, R6, #1  @ If carry set, increment counter
      SUB   R5, R5, #1
      CMP   R5, #0
      BNE   LOOP32
      
      CMP   R6, R1
      MOVGT R0, R4
      MOVGT R1, R6
      
      B LOOPA
   
DONE: LDR R8, =NUM
      STR R0, [R8], #4
      STR R1, [R8]
   

      

