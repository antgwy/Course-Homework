DATA SEGMENT
    STR1 DB 'COUNT OF ODD NUMBERS:','$'
    STR2 DB 13,10,'SUM OF ODD NUMBERS:','$'
    STR0 DB 13,10,'$'
    CNT DB 0
    SUMODD DW 0
    NUM DW 0
    X DW 1
    A DW 5
    B DW 3
    MOD DW 256
DATA ENDS

STACK SEGMENT STACK 'STACK'
    DW 100H DUP(?)
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,SS:STACK
START:
    MOV AX, DATA 
    MOV DS, AX
    MOV AX, STACK
    MOV SS, AX
    MOV CX, 200
    
FOR1:
    MOV AX, X
    MUL A
    ADD AX, B
    DIV MOD
    MOV AX, DX ; (A*X+B)%MOD, A=5, B=3, MOD=256
    MOV X, AX
    SHR AX, 1
    JNC EVEN
    RCL AX, 1
    INC NUM
    ADD SUMODD, AX
    ; LEA SI, X
    ; CALL PRINT
    ; MOV DX, OFFSET STR0
    ; MOV AH, 9
    ; INT 21H
EVEN:    
    LOOP FOR1    
    
    MOV DX, OFFSET STR1
    MOV AH, 9
    INT 21H
    LEA SI, NUM
    CALL PRINT
    MOV AL, BYTE PTR NUM
    MOV CNT, AL
    
    MOV DX, OFFSET STR2
    MOV AH,9
    INT 21H
    LEA SI, SUMODD
    CALL PRINT
    
    MOV AH, 4CH
    INT 21H

PRINT PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV AX, [SI]
    MOV BX, 10
    MOV CX, 0
INIT:
    XOR DX, DX
    DIV BX ; �� AX �� DX
    INC CX
    PUSH DX
    CMP AX, 0
    JNZ INIT
OUTPUT:
    POP DX
    OR DX, 30H
    MOV AH, 2
    INT 21H
    LOOP OUTPUT
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT ENDP
  
CODE ENDS
END START