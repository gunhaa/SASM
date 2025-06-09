%include "io64.inc"


section .text
global main
main:

    ; INPUT창 사용
    GET_DEC 1, al
    ; 변수 할당도 가능
    GET_DEC 1, num
    
    PRINT_DEC 1, al
    NEWLINE
    PRINT_DEC 1, num
    
    ; 더하기 연산
    ; ADD a,b ( a = a + b)
    ; a는 레지스터 or 메모리
    ; b는 레지스터 or 메모리 or 상수
    ; 단 a,b 모두 메모리는 안된다
    ADD al, 1 ; 레지스터 + 상수
    NEWLINE ; 1+1
    PRINT_DEC 1, al
    
    ; 빼기 연산
    ; sub a,b (a= a-b)
    ; 더하기 연산과 규칙, 동작이 완전히 동일하다
    
    ; 해당 명령은 메모리의 포인터를 rax에 넘긴다
    ; mov rax, num
    add al, [num] ; 레지스터 + 메모리
    NEWLINE ; 2+2 = 4
    PRINT_DEC 1, al
    
    mov bl, 3 ; 레지스터 + 레지스터
    add al, bl 
    NEWLINE ; 4+3 = 7
    PRINT_DEC 1,al
    
    NEWLINE
    add [num], byte 1 ; 바이트를 붙여야 연산이 가능하다 
    PRINT_DEC 1, [num] ; 2+1 = 3
    NEWLINE 
    
    add [num], al ; 메모리 + 레지스터
    PRINT_DEC 1, [num] ;3+7=10
    NEWLINE
    
    ; 곱하기 연산
    ; 곱하기 연산은 사용 레지스터가 정해져있다
    ; mul reg
    ; - mul bl => al * bl 
    ; -- 연산 결과를 ax에 저장
    ; - mul bx => ax * bx
    ; -- 연산 결과를 dx(상위 16비트), ax(하위 16비트)에 저장
    ; - mul ebx => eax * ebx
    
    ; ex) 5*8은?
    ; ax레지스터 값을 초기화
    mov ax, 0
    mov al, 5
    mov bl, 8
    mul bl
    PRINT_DEC 2, ax
    NEWLINE
    
    ; 나누기 연산
    ; 규칙이 정해져 있다
    ; div reg
    ; - div bl => ax / bl
    ; -- 연산 결과는 al(몫) ah(나머지)
    
    ; 100/3은?
    mov ax, 100
    mov bl, 3
    div bl
    PRINT_DEC 1, al
    NEWLINE
    ; PRINT_DEC 1, ah ah레지스터는 출력 불가, 아래 방식으로 우회
    mov al, ah
    PRINT_DEC 1, al
        
    xor rax, rax
    ret
    
    
    ; 초기화 된 데이터를 사용
    ; [변수 이름] [크기] [초기값]
    ; [크기]: 예약된 키워드 db(define byte, 1byte) dw(2byte), dd(4byte), dq(8byte)
section .data
    
    ; 초기화 되지 않은 데이터
    ; [변수 이름] [크기] [개수]
    ; [크기] resb(1byte) resw(2byte) resd(4byte) resq(8byte)
section .bss
    num resb 1