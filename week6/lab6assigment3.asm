.data
A:      .word 7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
Aend:   .word

.text
main:
    la $a0, A           # $a0 = Address of A[0]
    la $a1, Aend        # $a1 = Address of A[n]
    addi $a2, $a0, 4    # $a2 = Address of A[1] = i
    j sort         
after_sort:
    li $v0, 10       	#Exit
    syscall
end_main:
sort:
    beq $a2, $a1, done  # Check if the list is sorted or not
    j loop     
after_loop:
    addi $a2, $a2, 4    # Increment pointer to the next element
    j sort         
done:
    j after_sort        # If sorted, exit
loop:
    addi $t0, $a2, -4   # j = i - 1
    lw $t1, 0($a2)      # $t1 = A[i] (current element)
check1:
    slt $t2, $t0, $a0   # Check if j < 0 (start of array)
    bne $t2, $0, return 
check2:
    lw $t3, 0($t0)      # $t3 = A[j] (previous element)
    slt $t2, $t3, $t1  # Check if A[j] < A[i]
    beq $t2, $0, return 
    sw $t3, 4($t0)      # A[j+1] = A[j] (swap elements)
    addi $t0, $t0, -4   # j = j - 1 
    j check1        
return:
    sw $t1, 4($t0)      # A[j+1] = key (insert key in the correct position)
    j after_loop        # Continue with the next element
