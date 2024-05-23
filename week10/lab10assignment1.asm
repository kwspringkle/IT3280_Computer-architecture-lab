.eqv SEVENSEG_LEFT    0xFFFF0011 # Dia chi cua den led 7 doan trai.  
                                    #     Bit 0 = doan a;   
                                    #     Bit 1 = doan b; ...   
                                    #     Bit 7 = dau .  
.eqv SEVENSEG_RIGHT   0xFFFF0010 # Dia chi cua den led 7 doan phai  
 
.data 
A: .word 0x3F, 0x6,0x5B,0x4F, 0X66,0X6D, 0X7D, 0X7, 0X7F, 0X6F 
.text  
main:  
   la $s1, A  #load the address of the array 
   addi $t1, $0, 0 #i = 0 
   addi $t2, $0, 10  #n = 10 
   li $t3, 1  #i++ 
   li $t4, 1 
   li $t5, -1 
loop_0to9:  
   lw $a0, ($s1)  #set value for segments 
   jal SHOW_7SEG_LEFT #show 
   nop 
   addi $s1, $s1, 4 #point to the next element 
   add $t1, $t1, $t3 
   beq $t1, $t2, change_direction 
   j loop_0to9 
loop_9to0: 
 lw $a0, ($s1) 
 jal SHOW_7SEG_LEFT 
 nop 
 addi $s1, $s1, -4 
 add $t1, $t1, $t3 
 beq $t1, $0, change_direction 
j loop_9to0 
change_direction: 
sub $t3, $0, $t3 
#change the direction i++ --> i-- --> i++ --> ... 
beq $t3, $t4, loop_0to9 
beq $t3, $t5, loop_9to0 
#---------------------------------------------------------------  
# Function  SHOW_7SEG_LEFT : turn on/off the 7seg  
# param[in]  $a0   
value to shown         
# remark     $t0 changed  
#---------------------------------------------------------------  
SHOW_7SEG_LEFT:  li   $t0,  SEVENSEG_LEFT # assign port's address   
sb   $a0,  0($t0)        # assign new value    
nop  
jr   $ra  
nop  
#---------------------------------------------------------------  
# Function  SHOW_7SEG_RIGHT : turn on/off the 7seg  
# param[in]  $a0   value to shown         
# remark     $t0 changed  
#---------------------------------------------------------------  
SHOW_7SEG_RIGHT: li   $t0,  SEVENSEG_RIGHT # assign port's address  
sb   $a0,  0($t0)         # assign new value   
nop  
jr   $ra     
nop
