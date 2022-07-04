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
          li    t0, 0                   
                                  # ý
                                  # ý
          li    t1, 1                   
                                  # ý
          mv    t2, t1                  
                                  # ý
          mv    s1, t2                  
                                  # ý
          li    s2, 2                   
                                  # ý
          mv    s3, s2                  
                                  # T6 <- (T0 + T4)
          add   s4, s1, s3              
                                  # ý
          mv    s1, s4                  
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
