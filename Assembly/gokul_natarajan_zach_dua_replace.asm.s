;Project 3 CMSC 313 Gokul Natarajan and Zachary Dua
;User ID: GokulN1@linux.gl.umbc and ZDua1@linux.gl.umbc
;
;This code prompts the user for a location (index) of a string element to replace.
;Then it prints out a random string with 16 random elements. After that, it prints
;the updated string with a new random letter at the location that the user inputed.
    
    
        section .data
request:        db      "Enter a location in the string you want to replace 1-16: ", 10
    
len_r           equ     $-request

msg1:        db    "Here is the original string: ", 10
len_msg1:    equ    $-msg1

msg2:        db    "Here is the string with the random character updated: ", 10
len_msg2:    equ     $-msg2

new_line:    db      10

    section .bss

num_buff:    resb    3
char:        resb    1
rand_letter:    resb    8
rand_string:    resb    16
        section .text

        global main

main:
    call     rand
    mov     [rand_letter], rax
        
        mov     rax, 1        ;prints prompt
        mov     rdi, 1
        mov     rsi, request
        mov     rdx, len_r
        syscall

        mov     rax, 0        ;reads in number
        mov     rdi, 0
        mov     rsi, num_buff
        mov     rdx, 3
        syscall
    
    mov     rax, 1        ;prints prompt
        mov     rdi, 1
        mov     rsi, msg1
        mov     rdx, len_msg1
    syscall

        xor     r8, r8
    mov     r8, rand_string    ;make random string

                ;creates random string
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
        mov     byte[r8], dl
    
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 1], dl
    
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 2], dl
    
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 3], dl
    
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 4], dl
    
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 5], dl
    
    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 6], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 7], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 8], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 9], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 10], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 11], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 12], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 13], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 14], dl

    call     rand
    mov     [rand_letter], rax
        mov     dl, [rand_letter]
    mov     byte[r8 + 15], dl
    
    mov     rax, 1        ;prints random string
    mov     rdi, 1
    mov     rsi, rand_string
    mov     rdx, 16
    syscall

    mov     rax, 1        ;prints new line
        mov     rdi, 1
        mov     rsi, new_line
        mov     rdx, 1
        syscall

    mov     rax, 1        ;prints second prompt
        mov     rdi, 1
        mov     rsi, msg2
        mov     rdx, len_msg2
    syscall

    mov     r8, rand_string    ;get charater and replace with random letter
    xor     r9, r9        ;clears r9 register
    xor     r10, r10    ;clears r10 register
    mov     rdi, num_buff    ;places num entered by user in rdi
    mov     r9b, [num_buff]    ;first 8 bits of user input are stored in r9b
    sub     r9b, 48        ;subtract 48 from r9b to get value
    imul     r9, 10        ;multiply r9 by 10 to get the tens place number (0 or 10)
    mov     r10, r9        ;r9 gets stored in r10 in order to replace
    add     r8, r9        ;add r9 to r8 to store
    add     rdi, 1        ;shift over 1 character
    mov     r9b, [rdi]    ;second 8 bits are placed in r9b
    sub     r9b, 48      ;subtract 48 from r9b to get value
    add     r10, r9        ;add r9 to r10 in order to replace
    add     r8, r9        ;add r9 to r8 to store
    sub     r8, 1        ;subract 1 to balance for index

    mov     rax, rand_string ;replaces chosen index with random letter
        mov     cl, [rand_letter]
    mov     byte [rax +  r10 - 1], cl
    
    mov     rax, 1        ;prints updated string
        mov     rdi, 1
        mov     rsi, rand_string
        mov     rdx, 32
        syscall

    mov     al, [r8]
    mov     [char], al
    
    mov     rax, 1        ;prints new line
        mov     rdi, 1
        mov     rsi, new_line
        mov     rdx, 1
        syscall

rand:                ;function to get random letters
    rdtsc
    xor     rdx, rdx
    mov     rcx, 122-97 + 1    ;range of letters
     div     rcx
    mov     rax, rdx
    add     rax, 97        ;convert to ascii
    ret
exit:
    mov rax, 60
    xor rdi,rdi
    syscall
