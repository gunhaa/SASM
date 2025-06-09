%include "io64.inc"

section .text
global main
main:

    ; shift 연산, logical 연산
    
    ; shift 연산
    mov eax, 0x12345678
    PRINT_HEX 4, eax
    NEWLINE
    shl eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    shr eax, 8 
    PRINT_HEX 4, eax
    NEWLINE
    ; 해당 로직은 상위 1바이트의 정보를 잃는다(좌시프트 때문)
    ; 고급 언어는 /2, /4 같은 나눗셈을 시프트연산으로 구현한다
    ; 게임서버에서 ObjectID를 만들어 줄때 사용한다
    ; 각 비트가 정보를 의미하며, 이 정보를 넣기 위해 shift연산을 사용하는 방식으로 응용한다
    
    ; 논리 연산
    ; not and or xor
    
    ; not A: 0이면 1, 1이면 0
    ; A and B: 둘다 1이면 1, 아니면 0
    ; A or B: 둘중 하나라도 1이면 1, 아니면 0
    ; A xor B : 둘다 1이거나 둘다 0 이면 0, 아니면 1
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    ; 0b 0001 0100 => 0x14
    and al, bl ; al = al and bl , 결과를 al에 저장한다
    PRINT_HEX 1, al
    NEWLINE
    
    ; 0b1110 1011 = 0xeb
    not al
    PRINT_HEX 1, al
    NEWLINE
    
    ; AND NOT 응용사례
    ; bitflag: 하나의 정수 값에서 여러 개의 boolean 상태를 표현하기 위해 사용하는 방식으로, 각 비트가 특정한 상태를 나타낸다.
    ; AND	특정 비트만 남기기
    ; OR	특정 비트 켜기
    ; XOR	특정 비트 토글
    ; AND NOT	특정 비트 끄기 (~B 마스크 적용)
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    NEWLINE
    PRINT_HEX 1, al
    NEWLINE
    ; xor는 같은 연산을 두번하면
    ; 원복 된다는 특징을 가지고 있다
    ; 동일한 값으로 xor 두번하면 자기 자신으로 되돌아오는 특성
    ; 암호학에서 유용하게 사용된다 (value xor key)
    ; 대칭키 암호화로 많이 사용
        
    xor al,bl
    NEWLINE
    PRINT_HEX 1, al
    
    xor al,bl
    NEWLINE
    PRINT_HEX 1, al
    
    ; 자기 자신과 xor를 하면 무조건 0이 된다
    ; xor연산은 빠르다
    NEWLINE
    xor al,al
    PRINT_HEX 1,al
    
    ; 프로그램이 종료될 때 정상 종료를 알린다(0)
    ; a 레지스터에다가 넣어줌
    xor rax, rax
    ret
    
    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db 1, dw 2, dd 4 , dq8
section .data

    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [개수]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 1