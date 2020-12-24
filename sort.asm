.ORIG x3000

NUMBERS[0] .FILL x32F0
NUMBERS[15] .FILL x32FF

    LD R0, NUMBERS[0]
    AND R1, R1, #0
    AND R2, R2, #0
    AND R3, R3, #0
    AND R4, R4, #0
    AND R5, R5, #0
    LD R6, NUMBERS[15]
    AND R7, R7, #0  ; Initialize registers

COMPARE

    LDR R1, R0, #0        ; Loads Integer A and determines if it is negative, positive, or zero to determine how to compare it to integer B
    BRn NEGCASE
    BRz ZEROCASE
    BRp POSCASE
    
NEGCASE

    LDR R2, R0, #1          ; Integer A is negative...if Integer B is negative, then determine which is greater, otherwise, increment pair
    BRn CMPRNEG
    BRz INCRPAIR
    BRp INCRPAIR

ZEROCASE

    LDR R2, R0, #1          ; Integer A is 0...if Integer B is negative, then swap pair, otherwise, increment pair
    BRn SWAP
    BRz INCRPAIR
    BRp INCRPAIR
    
POSCASE

    LDR R2, R0, #1        ; Integer A is postive...if Integer B is positive, then determine which is greater, otherwise, swap
    BRn SWAP
    BRz SWAP
    BRp CMPRPOS
    
CMPRNEG

    ADD R1, R1, #1      ; Loop determines the greatest of negative integers
    BRz SWAP
    ADD R2, R2, #1
    BRz INCRPAIR
    BRnp CMPRNEG
    
CMPRPOS

    ADD R1, R1, #-1     ; Loop determines the greatest of positive integers
    BRz INCRPAIR
    ADD R2, R2, #-1
    BRz SWAP
    BRnp CMPRPOS
    
SWAP

    LDR R1, R0, #0       ; Swaps positions of integers in array
    LDR R2, R0, #1
    STR R1, R0, #1
    STR R2, R0, #0
    ADD R3, R3, #1
    BR INCRPAIR
    
INCRPAIR

    ADD R0, R0, #1      ; Increments index
    BR ENDOFARRAY
    
ENDOFARRAY
    
    AND R5, R5, #0
    ADD R5, R6, #0 ; R6 starts as NUMBERS[15]
    NOT R5, R5
    ADD R5, R5, #1
    
    AND R4, R4, #0
    ADD R4, R5, R0
    BRzp RESTART?
    BRn COMPARE
    
RESTART?

    ADD R3, R3, #0            ; Determines if index has reached the end of array. If not, repeats sorting
    BRz DONE
    AND R3, R3, #0
    ADD R6, R6, #-1
    LD R0, NUMBERS[0]
    BR COMPARE
    
DONE
    
.END
