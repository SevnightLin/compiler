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
                                  # ý
          li    t0, 1                   
                                  # ý
          li    t1, 1                   
                                  # T2 <- (T0 + T1)
          add   t2, t0, t1              
                                  # T3 <- (~ T2)
          not   s1, t2                  
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
