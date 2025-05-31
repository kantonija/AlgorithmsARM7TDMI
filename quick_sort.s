.syntax unified
.cpu arm7tdmi
.arm

.text
.global quick_sort
.global quick_sort_wrapper

quick_sort_wrapper:
    push {lr}
    
    
    cmp r1, #2
    blt wrapper_end
    
    mov r2, r1
    sub r2, r2, #1     
    mov r1, #0       
    bl quick_sort
    
wrapper_end:
    pop {pc}

quick_sort:
    push {r4, r5, r6, r7, lr}
    

    mov r7, r0    
    mov r4, r1    
    mov r5, r2     
    

    cmp r1, r2
    bge quick_sort_end
    

    bl partition
    
    mov r6, r0      
    
    mov r0, r7         
    mov r1, r4         
    sub r2, r6, #1      
    cmp r1, r2
    bge skip_left
    bl quick_sort

skip_left:
    mov r0, r7          
    add r1, r6, #1   
    mov r2, r5       
    cmp r1, r2
    bge skip_right
    bl quick_sort

skip_right:
quick_sort_end:
    pop {r4, r5, r6, r7, pc}

partition:
    push {r4, r5, r6, r7, r8, lr}
    
    lsl r3, r2, #2     
    ldr r4, [r0, r3]  
    
    mov r5, r1        
    mov r6, r1       
    
partition_loop:
    cmp r6, r2         
    bge partition_done
    
    lsl r3, r6, #2
    ldr r7, [r0, r3]
    
    cmp r7, r4
    bgt partition_continue
    
    cmp r5, r6
    beq skip_swap
    
    lsl r3, r5, #2     
    ldr r8, [r0, r3]   
    str r7, [r0, r3]   
    lsl r3, r6, #2   
    str r8, [r0, r3]  
    
skip_swap:
    add r5, r5, #1     
    
partition_continue:
    add r6, r6, #1    
    b partition_loop
    
partition_done:
    cmp r5, r2
    beq skip_final_swap
    
    lsl r3, r5, #2    
    ldr r7, [r0, r3]    
    str r4, [r0, r3]   
    lsl r3, r2, #2      
    str r7, [r0, r3]   
    
skip_final_swap:
    mov r0, r5          
    pop {r4, r5, r6, r7, r8, pc}
