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
                                  # ý
          li    t1, 3                   
                                  # ý
          mv    t2, t1                  
                                  # ý
          li    s1, 1                   
                                  # ý
          mv    s2, s1                  
                                  # T6 <- (T2 + T4)
          add   s3, t2, s2              
                                  # ý
          mv    t2, s3                  
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
