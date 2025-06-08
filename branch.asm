%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging

    ; 분기문 if
    ; 특정 조건에 따라 코드 흐름을 제어하는 것
    ; ex) 스킬 버튼을 눌렀는가? YES -> 스킬 사용
    ; ex) 제한 시간 내에 던전 입장 수락 버튼을 눌렀는가? YES -> 입장 , NO -> 던전 취소
    
    ; 조건 -> 흐름
    
    ; CMP dst, src (compare, destination이 기준)
    ; 비교의 결과물은 Flag Register 저장
    
    ; JMP [label] 시리즈
    ; JMP : 무조건 jump
    ; JE : JumpEquals 같으면 jump
    ; JNE : JumpNotEquals 다르면 jump
    ; JG : JumpGreater 크면 jump
    ; JGE : JumpGreaterEquals 크거나 같으면 jump
    ; JL, JLE 등등..
    
    ; 두 숫자가 같으면 1을 출력, 아니면 0을 출력하는 프로그램
    mov rax, 10
    mov rbx, 10
    
    cmp rax, rbx
    
    je LABEL_EQUAL

    ; je에 의해 점프를 안했다면, 같지 않다는 의미
    mov rcx, 0
    jmp LABEL_EQUAL_END
    
;어셈블리에서만 사용되고, 바이너리가 될 때 사라진다
; je에서 넘어온다면, 다시 돌아가지 않고 아래로 계속해서 진행된다
LABEL_EQUAL:
    mov rcx, 1
LABEL_EQUAL_END:    
    PRINT_HEX 1, rcx
    NEWLINE
    
    ; 연습문제: 어떤 숫자(1~100)가 짝수면1, 홀수면 0을 출력하는 프로그램
    mov ax, 100
    mov bl, 2
    ; 나누기 연산
    ; div reg
    ; - div bl => ax / bl (al 몫, ah 나머지)
    div bl
    cmp ah, 0
    je LABEL_EVEN
    
    mov rcx, 0
    jmp LABEL_ODD
    
LABEL_EVEN:
    mov rcx, 1

LABEL_ODD:
    PRINT_HEX 1, rcx
    NEWLINE
    
    
    xor rax, rax
    ret
    
    ; 초기화 된 데이터
    ; [변수 이름] [크기] [초기값]
    ; [크기] db1 dw2 dd4 dq4
section .data

    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [개수]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 10