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
          mv    t1, t0                  
                                  # ý
          li    t2, 2                   
                                  # ý
          mv    s1, t2                  
                                  # T4 <- (T0 + T2)
          add   s2, t1, s1              
          mv    a0, s2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
