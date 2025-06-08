section .text
global main
main:
    mov rbp, rsp; for correct debugging

    ; 8bit = 1byte
    ; 16bit = 2byte = 1word
    ; 32bit = 4byte = 2word = 1dword(double-word)
    ; 64bit = 8byte = 4word = 2dword = 1qword(quad-word)
    ; 바로 쓸 자료에대한 임시 저장을 위한 것이 cpu-register(0.3~1 ns)
    ; 메인 메모리(50~120 ns)에 대한 저장도 빠르다고는 하지만
    ; IO bus를 타야해서 register에 비하면 느리다


    ; mov reg1, cst    오른쪽에서 왼쪽으로 데이터 대입
    ; mov reg1, reg2   오른쪽 레지스터의 값을 왼쪽에 복사

    ; 하위 32비트 사용
    mov eax, 0x1234
    ; 64비트 모두 사용
    mov rbx, 0x12345678
    ; 최하단 1바이트 사용
    mov cl, 0xff

    mov al, 0x00
 ;   mov rax, rdx
    
    ; 메모리 <-> 레지스터
    ; 해당 명령은 a의 주소값을 가져온다
    ; 0x403010
    ; 0x403011 의 메모리를 분석해보면 0x22의 값이 나오며, 메모리의 포인터는 비트 단위가 아닌 바이트 단위이다
    ; 컴퓨터의 메모리는 바이트(Byte)를 최소 단위로 읽고 쓴다
    ; 1바이트 = 8비트는 CPU가 한 번에 다룰 수 있는 최소 데이터 단위
    ; CPU는 보통 "몇 번째 바이트"인지 기준으로 주소를 부여함 → 주소 = 바이트 인덱스
    ; mov rax, a ; a라는 바구니의 주소값을 rax에 복사
    ; mov rax, [a] ; a주소의 값을 가져오지만, 범위를 지정하지 않았기에 rax레지스터의 8바이트를 모두 가져온
    mov al, [a]
    
    mov [a], byte 0x55
    mov [a], word 0x6666
    mov [a], cl
    
    xor rax, rax
    ret

    ; 변수의 선언 및 사용    
    ; 변수는 그냥 데이터를 저장하는 바구니 [ ] 
    ; - 처음에 바구니 사용하겠다 선언(이름과 크기 지정)
    
    ; 메모리에는 구분할 수 있도록 주소(번지수)가 있다
    
    ; 초기화 된 데이터를 사용
    ; [변수 이름] [크기] [초기값]
    ; [크기]: 예약된 키워드 db(define byte, 1byte) dw(2byte), dd(4byte), dq(8byte)
section .data
    a db 0x11  ; [0x11]
    b dw 0x2222
    c dd 0x33333333
    d dq 0x4444444444444444

    ; 초기화 되지 않은 데이터
    ; [변수 이름] [크기] [개수]
    ; [크기] resb(1byte) resw(2byte) resd(4byte) resq(8byte)
section .bss
    e resb 10

