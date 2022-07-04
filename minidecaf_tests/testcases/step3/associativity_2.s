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
                                  # ÿ
          li    t0, 6                   
                                  # ÿ
          li    t1, 3                   
                                  # T2 <- (T0 / T1)
          div   t2, t0, t1              
                                  # ÿ
          li    s1, 2                   
                                  # T4 <- (T2 / T3)
          div   s2, t2, s1              
          mv    a0, s2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
