%include "io64.inc"

section .text
global main
main:
    ;write your code here

    ; 메모를 남길 수 있는 기능 = 주소
    
    ; 10진수(0 1 2 3 4 5 6 7 8 9)
    ; 10 11 12 13 ... 19 20
    
    ; 2진수(0 1)
    ; 0 1 10
    ; 0b0 0b1 0b10 0b11 0b100
    
    ; 16진수(0 1 2 3 4 5 6 7 8 9 A B C D E F)
    ; 0 1 2 3 4 5 6 7 8 9 A B C D E F 10
    ; 0x00
    
    ; 16진수는 2진수와의 변환이 편해 많이 사용한다
    ; 0b1001 0101 = 0x95
    
    ; 2진수의 부호 변환은, 모두 비트를 바꾼 뒤 +1을 하게되면
    ; 쉽게 전환 할 수 있다
    

    PRINT_STRING msg
    
    xor rax, rax
    ret
    
section .data
    msg db 'Hello world', 0x00