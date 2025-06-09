%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging

    ; 스택(stack) 메모리 영역을 사용
    ; 함수가 사용하는 일종의 메모장
    ; - 매개 변수 전달
    ; - 돌아갈 주소 관리
    
    ; 스택 메모리, 스택 프레임
    ; 레지스터는 다양한 용도로 사용
    ; - a b c d 범용 레지스터
    ; - 포인터 레지스터(다양한 용도로 사용, 포인터= 위치를 가리키는 ~)
    ; -- ip (Instruction Pointer): 다음 수행 명령어의 위치
    ; -- sp (stack pointer) : 현재 스택 top 위치(일종의 cursor)
    ; -- bp (base pointer) : 스택 상대주소 계산용
    
    ; push, pop 이용해서 사용
    push 5
    push 2
    call MAX
    PRINT_DEC 8, rax
    NEWLINE
    
    ; 스택을 비워놓지 않으면 크래시 발생(리턴 값을 찾지 못함)
    add rsp, 16 ; sp레지스터 두칸 이동시키는 선택도 가능, pop 두번도 가능
       
    xor rax, rax
    ret
    
MAX: 
    ; stack[length-1] = sp
    ; 여기가 call 된 시점의 stack [ 1, 2, ret, 이전 bp값]
    ; ret함수가 끝나고 다시 돌아올때 필요한 주소값을 넣어준다
    ; sp는 위치가 변한기 때문에 bp를 이용해 상대 위치를 계산한다(고정 위치로 사용)
    
    push rbp
    mov rbp, rsp ; sp 의 값은 내가 조작하지 않아도 하드웨어가 바꿔주는 값이다
    
    mov rax, [rbp+16]
    mov rbx, [rbp+24]
    cmp rax, rbx
    jg L1
    mov rax, rbx ; 결과는 rax에  
L1:     
    pop rbp
    ret   
   
 
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