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
          li    t0, 2                   
                                  # ý
          li    t1, 2                   
                                  # ý
          li    t2, 0                   
                                  # T3 <- (T1 > T2)
          sgt   s1, t1,t2               
                                  # T4 <- (T0 == T3)
          sub   s2, t0, s1              
          seqz  s2, s2                  
          mv    a0, s2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
