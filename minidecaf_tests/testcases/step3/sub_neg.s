          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # �
          li    t0, 2                   
                                  # �
          li    t1, 1                   
                                  # T2 <- (- T1)
          neg   t2, t1                  
                                  # T3 <- (T0 - T2)
          sub   s1, t0, t2              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
