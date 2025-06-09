%include "io64.inc"


section .text
global main
main:
    mov rbp, rsp; for correct debugging

    ; Array and Pointer
    ; 배열: 동일한 타입의 데이터를 묶음
    ; - 배열을 구성하는 각 값을 배열 요소(element)라고 함
    ; - 배열의 위치를 가리키는 숫자를 인덱스(index)
    
    mov rax, a ; a의 주소(0x40301c), 프로그램 실행할때마다 달라질 수 있다, 데이터가 시작하는 첫번째의 주소 값이다
    
    ; 주소
    ; [시작 주소 + 인덱스 * 크기]
    
    PRINT_HEX 1, [a] ; a의 메모리에 접근해 그 값을 가져오기
    NEWLINE
    PRINT_HEX 1, [a+1]
    NEWLINE
    
    ; 연습문제: a배열의 모든 데이터 출력해보기
    xor ecx, ecx
LABEL_ARRAY_1:
    PRINT_HEX 1, [a+ecx]
    NEWLINE
    inc ecx
    cmp ecx, 5
    jne LABEL_ARRAY_1
    
    xor ecx, ecx
LABEL_PRINT_B:
    PRINT_HEX 2, [b+ecx*2]
    NEWLINE
    inc ecx
    cmp ecx, 5
    jne LABEL_PRINT_B
    
    
    
    xor rax, rax
    ret
    
    ; 초기화 된 데이터를 사용
    ; [변수 이름] [크기] [초기값]
    ; [크기]: 예약된 키워드 db(define byte, 1byte) dw(2byte), dd(4byte), dq(8byte)
section .data
    msg db 'Hello World', 0x00
    a db 0x01, 0x02, 0x03, 0x04, 0x05 ; 5 * 1 = 5바이트
    b times 5 dw 1 ; b라는 이름의 배열이 5개, 각 배열의 크기는 2바이트, 초기 값은 1 , 5*2 = 10 바이트

        
    ; 초기화 되지 않은 데이터
    ; [변수 이름] [크기] [개수]
    ; [크기] resb(1byte) resw(2byte) resd(4byte) resq(8byte)
section .bss
    num resb 1