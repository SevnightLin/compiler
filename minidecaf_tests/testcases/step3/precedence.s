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
          li    t1, 3                   
                                  # ý
          li    t2, 4                   
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # T4 <- (T0 + T3)
          add   s2, t0, s1              
          mv    a0, s2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
