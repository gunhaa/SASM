%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging

    ; 반복문(while, for)
    ; 특정 조건을 만족할 때 까지 반복해서 실행
    
    ; ex) Hello World 10번 출력해야 할때
    ; PRINT_STRING msg
    ; NEWLINE
    
    ; cmp와 jmp를 이용한 반복문 구현이 가능하다
    
    ; 직접 구현
    ; helloworld 5번 출력 구현
    ; mov al,0
    
;L_LOOP:
;    cmp al,5
;    JNE L_helloworld
;    JE END
;    
;L_helloworld:
;    PRINT_STRING msg
;    NEWLINE
;    add al, 1
;    JMP L_LOOP
   
;END:
    
    ; Rookiss 구현
    mov ecx, 5
    
LABEL_LOOP:
    PRINT_STRING msg
    NEWLINE
    dec ecx ; sub ecx, 1 과 같은 동작, 1을 줄인다, 조금 더 빠름
    cmp ecx, 0
    jne LABEL_LOOP    
    
    ; 연습 문제) 1에서 100까지의 합을 구하는 프로그램 1+2+3...+100=?
    mov ecx, 0
    mov ebx, 0

LABEL_LOOP_100:
    add ecx, 1
    add ebx, ecx
    cmp ecx, 100    
    jne LABEL_LOOP_100
    
    PRINT_DEC 1, ebx
    NEWLINE
        
    ; Rookiss 구현
    mov eax, 100 ; 최종목적지
    xor ebx, ebx ; mov ebx, 0 과 동일
    xor ecx, ecx
    
LABEL_SUM:
    inc ecx ; add ecx, 1과 동일, 조금 더 빠름
    add ebx, ecx ; ebx = ebx + ecx
    cmp ecx, eax
    jne LABEL_SUM            
    PRINT_DEC 1, ebx
    NEWLINE


    ; loop [라벨]
    ; - ecx에 반복 횟수
    ; - loop 할때마다 ecx 1 감소, 0이면 빠져나감 아니면 라벨로 이동
    
    mov ecx, 100
    xor ebx, ebx ; 결과물
LABEL_LOOP_SUM:
    add ebx, ecx
    loop LABEL_LOOP_SUM
    PRINT_DEC 1, ebx

                
    xor rax, rax
    ret
    
    ; 초기화 된 데이터
    ; [변수 이름] [크기] [초기값]
    ; [크기] db1 dw2 dd4 dq4
section .data
    msg db 'Hello World', 0x00

    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [개수]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 10