          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -12             
__LL0:                                  
                                  # ý
          li    t0, 0                   
                                  # ý
                                  # ý
          li    t1, 0                   
                                  # ý
          mv    t2, t1                  
                                  # ý
          li    s1, 3                   
                                  # T4 <- (T3 > T0)
          sgt   s2, s1,t2               
                                  # (save modified registers before control flow changes)
          sw    t2, -12(fp)             # spill T0 from t2 to (fp-12)
          beqz  s2, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
                                  # T6 <- (T0 * T5)
          lw    t1, -12(fp)             # load T0 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 1                   
                                  # T8 <- (T0 + T7)
          add   s2, t1, s1              
                                  # 
          mv    t1, s2                  
                                  # 
          li    s3, 3                   
                                  # T10 <- (T9 > T0)
          sgt   s4, s3,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s4, __LL2               
          j     __LL1                   
__LL2:                                  
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
