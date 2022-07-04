          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -20             
__LL0:                                  
                                  # ý
          li    t0, 1                   
                                  # ý
          li    t1, 2                   
                                  # T3 <- (T1 > T2)
          sgt   t2, t0,t1               
          beqz  t2, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 3                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T4 from t1 to (fp-12)
          j     __LL3                   
__LL3:                                  
                                  # 
          lw    t0, -12(fp)             # load T4 from (fp-12) into t0
          mv    t1, t0                  
                                  # 
          li    t2, 1                   
                                  # 
          li    s1, 2                   
                                  # T10 <- (T8 > T9)
          sgt   s2, t2,s1               
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          beqz  s2, __LL5               
          j     __LL4                   
__LL4:                                  
                                  # 
          li    t0, 5                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T11 from t1 to (fp-20)
          j     __LL6                   
__LL6:                                  
                                  # 
          lw    t0, -20(fp)             # load T11 from (fp-20) into t0
          mv    t1, t0                  
                                  # T14 <- (T0 + T7)
          lw    t2, -16(fp)             # load T0 from (fp-16) into t2
          add   s1, t2, t1              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # ý
          li    t0, 4                   
                                  # ý
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T4 from t1 to (fp-12)
          j     __LL3                   
__LL5:                                  
                                  # ý
          li    t0, 6                   
                                  # ý
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T11 from t1 to (fp-20)
          j     __LL6                   
