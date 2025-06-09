%include "io64.inc"


section .text
global main
main:
    mov rbp, rsp; for correct debugging

    ; 함수, 어셈블리어에서는 프로시저procedure 서브루틴subroutine 이라고 불린다
    call PRINT_MSG
    
    mov eax, 10
    mov ebx, 5
    call MAX
    PRINT_DEC 4, ecx
    NEWLINE
    
    xor rax, rax
    ret

    
PRINT_MSG:
    PRINT_STRING msg
    NEWLINE
    ret ; return, 콜 했던 곳으로 되돌아간다

    ; ex) 두 값 중 더 큰 값을 반환 max
    ; 근데 2 값을 어떻게 넘겨 받지? 반환은 어떻게?
    ; eax, ebx 입력값을 ecx에 반환값을 넣기
MAX:
    call PRINT_MSG

    cmp eax, ebx
    jg L1
    mov ecx, ebx
    jmp L2
L1:
    mov ecx, eax    
L2: 
    ret
    
    ; 그런데 인자가 10개라면 어떻게 할까? a b c d
    ; eax, ebx에 이미 중요한 값이 있으면 어떻게 할까?
    ; .data .bss 사용하면? X
    ; 인자를 몇개를 할당해야 하지?
    
    ; 다른 메모리 구조가 필요하다
    ; - 꿈이 유효한 동안에는 그 꿈을 유지시켜야함(유효 범위의 개념이 있음)
    ; - 꿈이 끝나면 그 꿈을 부셔버려도 됨 (정리의 개념이 있다)
    ; - 꿈에서도 또 꿈을 꿀 수 있다는 것을 고려해야 함 (유동적으로 유효범위가 확장 가능)
    
    ; 스택(stack) 메모리 영역을 사용
    ; 함수가 사용하는 일종의 메모장
    ; - 매개 변수 전달
    ; - 돌아갈 주소 관리
   
 
    ; 초기화 된 데이터를 사용
    ; [변수 이름] [크기] [초기값]
    ; [크기]: 예약된 키워드 db(define byte, 1byte) dw(2byte), dd(4byte), dq(8byte)
section .data
    msg db 'Hello World', 0x00
    
    ; 초기화 되지 않은 데이터
    ; [변수 이름] [크기] [개수]
    ; [크기] resb(1byte) resw(2byte) resd(4byte) resq(8byte)
section .bss
    num resb 1