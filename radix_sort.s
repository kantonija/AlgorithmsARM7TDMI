.syntax unified
.cpu arm7tdmi
.arm
.global radix_sort

radix_sort:
    push {r4-r11, lr}
    mov r4, r0     
    mov r5, r1     
    

    sub sp, sp, #80
    mov r6, sp         
    add r7, sp, #40     
    
    mov r8, #0
clear1:
    mov r9, #0
    str r9, [r7, r8, LSL #2]
    add r8, r8, #1
    cmp r8, #10
    blt clear1
    

    mov r8, #0
count1:
    cmp r8, r5
    bge count1_done
    
    ldr r9, [r4, r8, LSL #2]    
    mov r10, r9
digit1:
    cmp r10, #10
    blt digit1_done
    sub r10, r10, #10
    b digit1
digit1_done:
    
    ldr r11, [r7, r10, LSL #2]  
    add r11, r11, #1
    str r11, [r7, r10, LSL #2]  
    
    add r8, r8, #1
    b count1
count1_done:
    
    mov r8, #1
cum1:
    cmp r8, #10
    bge cum1_done
    
    ldr r9, [r7, r8, LSL #2]        
    sub r10, r8, #1
    ldr r11, [r7, r10, LSL #2]    
    add r9, r9, r11
    str r9, [r7, r8, LSL #2]
    
    add r8, r8, #1
    b cum1
cum1_done:
    
    sub r8, r5, #1
build1:
    cmp r8, #0
    blt build1_done
    
    ldr r9, [r4, r8, LSL #2]  
    mov r10, r9
digit1b:
    cmp r10, #10
    blt digit1b_done
    sub r10, r10, #10
    b digit1b
digit1b_done:
    
    ldr r11, [r7, r10, LSL #2]  
    sub r11, r11, #1           
    str r11, [r7, r10, LSL #2]
    
    str r9, [r6, r11, LSL #2]  
    
    sub r8, r8, #1
    b build1
build1_done:
    
    mov r8, #0
copy1:
    cmp r8, r5
    bge copy1_done
    
    ldr r9, [r6, r8, LSL #2]
    str r9, [r4, r8, LSL #2]
    
    add r8, r8, #1
    b copy1
copy1_done:
    
    ldr r8, [r4]        
    mov r9, #1
find_max:
    cmp r9, r5
    bge max_found
    
    ldr r10, [r4, r9, LSL #2]
    cmp r10, r8
    movgt r8, r10       
    
    add r9, r9, #1
    b find_max
max_found:
    
    cmp r8, #10
    blt sort_done
    
    mov r8, #0
clear2:
    mov r9, #0
    str r9, [r7, r8, LSL #2]
    add r8, r8, #1
    cmp r8, #10
    blt clear2
    
    mov r8, #0
count2:
    cmp r8, r5
    bge count2_done
    
    ldr r9, [r4, r8, LSL #2]  
    mov r10, #0                
div10:
    cmp r9, #10
    blt div10_done
    sub r9, r9, #10
    add r10, r10, #1
    b div10
div10_done:
    mov r9, r10
digit2:
    cmp r9, #10
    blt digit2_done
    sub r9, r9, #10
    b digit2
digit2_done:
    
    ldr r11, [r7, r9, LSL #2]   
    add r11, r11, #1
    str r11, [r7, r9, LSL #2]   
    
    add r8, r8, #1
    b count2
count2_done:
    
    mov r8, #1
cum2:
    cmp r8, #10
    bge cum2_done
    
    ldr r9, [r7, r8, LSL #2]
    sub r10, r8, #1
    ldr r11, [r7, r10, LSL #2]
    add r9, r9, r11
    str r9, [r7, r8, LSL #2]
    
    add r8, r8, #1
    b cum2
cum2_done:
    
    sub r8, r5, #1
build2:
    cmp r8, #0
    blt build2_done
    
    ldr r9, [r4, r8, LSL #2]   
    mov r10, #0
div10b:
    cmp r9, #10
    blt div10b_done
    sub r9, r9, #10
    add r10, r10, #1
    b div10b
div10b_done:
    
    mov r9, r10
digit2b:
    cmp r9, #10
    blt digit2b_done
    sub r9, r9, #10
    b digit2b
digit2b_done:
    
    ldr r11, [r7, r9, LSL #2]   
    sub r11, r11, #1            
    str r11, [r7, r9, LSL #2]
    
    ldr r10, [r4, r8, LSL #2]  
    str r10, [r6, r11, LSL #2]  
    
    sub r8, r8, #1
    b build2
build2_done:
    
    mov r8, #0
copy2:
    cmp r8, r5
    bge copy2_done
    
    ldr r9, [r6, r8, LSL #2]
    str r9, [r4, r8, LSL #2]
    
    add r8, r8, #1
    b copy2
copy2_done:
    
sort_done:
    add sp, sp, #80
    pop {r4-r11, pc}
