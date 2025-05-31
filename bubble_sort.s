    .section .text
    .global bubble_sort

bubble_sort:
    push {r4-r8, lr}           

    mov r4, r0             
    mov r5, r1                

outer_loop:
    mov r6, #0              
    mov r1, #0              

    subs r7, r5, #1          

inner_loop_unrolled:
    cmp r1, r7
    bge inner_done             

    lsl r8, r1, #2            
    ldr r2, [r4, r8]        
    add r9, r1, #1
    lsl r9, r9, #2           
    ldr r3, [r4, r9]          

    cmp r2, r3
    ble no_swap_1

    str r3, [r4, r8]        
    str r2, [r4, r9]         
    mov r6, #1               

no_swap_1:
    add r1, r1, #1
    cmp r1, r7
    bge inner_done

    lsl r8, r1, #2            
    ldr r2, [r4, r8]
    add r9, r1, #1
    lsl r9, r9, #2
    ldr r3, [r4, r9]

    cmp r2, r3
    ble no_swap_2

    str r3, [r4, r8]
    str r2, [r4, r9]
    mov r6, #1

no_swap_2:
    add r1, r1, #1
    b inner_loop_unrolled     

inner_done:
    cmp r6, #0
    beq done                  

    subs r5, r5, #1           
    b outer_loop

done:
    pop {r4-r8, pc}         
    