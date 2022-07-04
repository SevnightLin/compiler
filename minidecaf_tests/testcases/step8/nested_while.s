          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -16             
__LL0:                                  
                                  # ÿ
          li    t0, 1                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 20                  
                                  # 
          li    t1, 3                   
                                  # T4 <- (T0 / T3)
          lw    t2, -12(fp)             # load T0 from (fp-12) into t2
          div   s1, t2, t1              
                                  # T5 <- (T2 > T4)
          sgt   s2, t0,s1               
          beqz  s2, __LL6               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 1                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T6 from t1 to (fp-16)
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 10                  
                                  # T9 <- (T8 > T6)
          lw    t1, -16(fp)             # load T6 from (fp-16) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL5               
          j     __LL4                   
__LL4:                                  
                                  # 
          li    t0, 2                   
                                  # T11 <- (T6 * T10)
          lw    t1, -16(fp)             # load T6 from (fp-16) into t1
          mul   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T6 from t1 to (fp-16)
          j     __LL3                   
__LL5:                                  
                                  # T12 <- (T0 + T6)
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          lw    t1, -16(fp)             # load T6 from (fp-16) into t1
          add   t2, t0, t1              
                                  # ÿ
          mv    t0, t2                  
                                  # (save modified registers before control flow changes)
          sw    t0, -12(fp)             # spill T0 from t0 to (fp-12)
          j     __LL1                   
__LL6:                                  
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
