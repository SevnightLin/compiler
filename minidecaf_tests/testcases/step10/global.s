          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global foo                   
          .size foo, 4                  
foo:                                    
          .word 4                       

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # T0 = LOAD_SYMBOL foo
          la    t0, foo                 
                                  # T1 = LOAD T0, 0
          lw    t1, 0(t0)               
                                  # þ
          li    t2, 3                   
                                  # T3 <- (T1 + T2)
          add   s1, t1, t2              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
