.data
msg1: .asciiz "Enter the number of elements: "
msg2: .asciiz "Enter the element: "
msg3: .asciiz "The max element: "
msg4: .asciiz "Enter the lower bound: "
msg5: .asciiz "Enter the upper bound: "
msg6: .asciiz "Number of elements in range: "
enter: .asciiz "\n"
array: .word 0: 100

.text
Start:
    	add $t1, $0, $0    # i=0
    	la $t2, array      # t2 is the address of arr[0]
Input_num_of_elements:
   	# Print msg1
   	li $v0, 4
    	la $a0, msg1
    	syscall

    	# Read num_of_elements in the array
    	li $v0, 5
    	syscall
    	move $t0, $v0    # t0 = n

Input_elements:
    	# Print msg2
    	li $v0, 4
    	la $a0, msg2
    	syscall

    	# Read elements in the array
    	li $v0, 5
    	syscall
    	sw $v0, ($t2)
    	addi $t2, $t2, 4
    	addi $t1, $t1, 1
    	blt $t1, $t0, Input_elements

Set_max:
    	la $t2, array    # reset t2
    	add $t1, $0, $0	 #reset i = 0
   	lw $t3, ($t2)    # t3 = A[0] = max

Loop_max:
    	lw $t4, ($t2)	# t4 = arr[i]
    	blt $t3, $t4, Handle	#if arr[i] > max then jump to handle
    	addi $t1, $t1, 1	#i++	
    	addi $t2, $t2, 4	#Point to the next element
    	blt $t1, $t0, Loop_max	#i < n then loop
    	j print_max #else then print the max number

Handle:
   	move $t3, $t4	#max = t4 = arr[i]
    	addi $t1, $t1, 1	#i++	
    	addi $t2, $t2, 4	#Point to the next element
    	blt $t1, $t0, Loop_max	#i < n then loop


print_max:
    	# Print msg3
    	li $v0, 4
    	la $a0, msg3
    	syscall

    	# Print max element
    	li $v0, 1
    	move $a0, $t3
    	syscall
print_enter:
    	# Print enter
    	li $v0, 4
    	la $a0, enter
    	syscall
input_lowerbound:
	#Print msg4
	li $v0,4
	la $a0, msg4
	syscall
	#Read the lower bound
	li $v0, 5
	syscall
	move $s0, $v0	#s0 = m
input_upperbound:
	#Print msg5
	li $v0, 4
	la $a0, msg5
	syscall
	#Read the upperbound
	li $v0, 5
	syscall
	move $s1, $v0   #$s1 = M
	la $t2, array	#Reset to the address of arr[0]
	add $t1, $0, $0	#reset i = 0
	add $s2, $0, $0	#s2 = count = 0
count_in_range:
	lw $t4, ($t2)	#t4 = arr[i]
	blt $t4, $s1, check1	#if arr[i] < M then branch to check1
	j handle2	
check1:
	bgt $t4, $s0, handle1	#if arr[i] < M && arr[i] > m then count++
	j handle2	
handle1: 
	addi $s2, $s2, 1	#count++
	addi $t2, $t2, 4	#point to the next elements
	addi $t1, $t1, 1	#i++
	ble $t1, $t0, count_in_range	#i < n then loop
	j quit
handle2:
	addi $t2, $t2, 4	#point to the next element
	addi $t1, $t1, 1	#i++
	ble $t1, $t0, count_in_range	#i < n then loop
quit:	
print_count:
	#Print msg6
	li $v0, 4
	la $a0, msg6
	syscall
	#Print count
	li $v0, 1
	add $a0, $s2, $0
	syscall
	
  
    
 
    
   
