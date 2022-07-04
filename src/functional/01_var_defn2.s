          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global a                     
          .size a, 4                    
a:                                      
          .word 3                       
          .data                         
          .global b                     
          .size b, 4                    
b:                                      
          .word 5                       

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # ü
          li    t0, 5                   
                                  # ü
          mv    t1, t0                  
                                  # T2 = LOAD_SYMBOL b
          la    t2, b                   
                                  # T3 = LOAD T2, 0
          lw    s1, 0(t2)               
                                  # T4 <- (T0 + T3)
          add   s2, t1, s1              
          mv    a0, s2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
