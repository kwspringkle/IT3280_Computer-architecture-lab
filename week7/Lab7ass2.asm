#Laboratory Exercise 7, Home Assignment 2 
.text
main:
	li $a0, -3	#load test input
	li $a1, 11
	li $a2, 7
	jal max		#call max procedure
	nop
endmain:	
	add $s0, $v0, $0
	li $v0, 10
	syscall
		
#---------------------------------------------------------------------- 
#Procedure max: find the largest of three integers 
#param[in]  $a0  integers 
#param[in]  $a1  integers 
#param[in]  $a2  integers 
#return     $v0   the largest value 
#---------------------------------------------------------------------

max:
	add $v0, $a0, $0 	#copy a0 in v0; largest so far
	sub $t0, $a1, $v0 	#compute a1 - v0
	bltz $t0, okay		#if a1 - v0 < 0 then no change
	nop
	add $v0, $a1, $0	#a1 is the largest so far
okay:
	sub $t0, $a2, $v0	#a2 - v0
	bltz $t0, done 		#if a2 - v0 < 0 then no change
	nop
	add $v0, $a2, $0	#else a2 is the largest
done: 	jr $ra			#return to calling program