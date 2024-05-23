.eqv MONITOR_SCREEN 0x10010000   #Dia chi bat dau cua bo nho man hinh  
.eqv RED            0x00FF0000   #Cac gia tri mau thuong su dung  
.eqv GREEN          0x0000FF00  
.eqv BLUE           0x000000FF  
.eqv WHITE          0x00FFFFFF  
.eqv YELLOW         0x00FFFF00  
.eqv BLACK      
.text  
0x00000000 
li $k0, MONITOR_SCREEN         
addi $k0, $k0, 256 #Dat dia chi bat dau la o cuoi cung goc phai hinh 
loop: li $t0, RED  #To mau do cho o vuong 
li $t1, BLACK #To de mau den len o mau do 
sw  $t0, ($k0) 
sw $t1, ($k0)  
addi $k0, $k0, -4 
bne $k0, $0, loop 
nop 
exit: 
