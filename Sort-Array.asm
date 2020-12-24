.ORIG x3000

NUMBERS[0] .FILL x32F0
NUMBERS[15] .FILL x32FF


    LD R0, NUMBERS[0] ; Loads base address into R0
    AND R1, R1, #0    
    ADD R1, R1, #1   ; Initialize R1 to 1
    AND R2, R2, #0   ; Initialize R2 to 0
    BR START
    
INCRKEY
   ADD R1, R1, #1
   AND R2, R2, #0
   ADD R2, R1, #-1
   BR TEST
   
START
   ADD R1, R0, R1
   ADD R2, R0, R2

TEST   
   LDR R3, R1, #0
   LDR R4, R2, #0
   
   NOT R4, R4
   ADD R4, R4, #1
   
   ADD R5, R3, R4
   BRn SWITCH
   BRzp NOSWITCH
   
SWITCH
   NOT R4, R4
   ADD R4, R4, #1
   STR R4, R1, #0
   STR R3, R2, #0
   
   ;AND R2, R2, #0
   
   BR INCRKEY
    
NOSWITCH
   
   LD R3, NUMBERS[0]
   NOT R3, R3
   ADD R3, R3, #1
   
   ADD R3, R3, R2
   BRz ENDOFARRAY
   ADD R2, R2, #-1
   BR TEST
   
ENDOFARRAY

   LD R3, NUMBERS[15]
   NOT R3, R3
   ADD R3, R3, #1
   
   ADD R3, R3, R1
   BRz DONE
   ;AND R2, R2, #0
   BR INCRKEY
DONE

.END