    .section .text
    .global asm_swap

asm_swap:
    push {r0-r2, lr}     

    ldr r2, [r0]         
    ldr r3, [r1]          
    str r3, [r0]          
    str r2, [r1]         

    pop {r0-r2, pc}      
