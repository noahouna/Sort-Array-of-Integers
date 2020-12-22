.ORIG x3000

NUMBERS[0] .FILL x32F0
NUMBERS[15] .FILL x32FF


    LDI R0, NUMBERS[0] ; Loads base address into R0
    AND R1, R1, #0     ; Initialize R1 to 0
    AND R2, R2, #0
    ADD R2, R2, #-1  ; Initialize R2 to -1

INCRKEY
   ADD R1, R0, #1
   ADD R2, R0, #1
   
   LDR R3, R1, #0
   LDR R4, R2, #0
   
   NOT R4, R4
   ADD R4, R4, #1
   
   ADD R5, R3, R4
   ;BRn 
  ; BRz
  ; BRp
   

.END