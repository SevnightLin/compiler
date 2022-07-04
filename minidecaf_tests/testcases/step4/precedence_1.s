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
                                  # ÿ
          li    t0, 1                   
                                  # ÿ
          li    t1, 0                   
                                  # (save modified registers before control flow changes)
          sw    t0, -16(fp)             # spill T0 from t0 to (fp-16)
          sw    t1, -12(fp)             # spill T1 from t1 to (fp-12)
          beqz  t1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
                                  # T3 <- (T1 && T2)
          lw    t1, -12(fp)             # load T1 from (fp-12) into t1
          snez  t2, t1
          sub   t2, zero, t2
          and   t2, t2,t0
          snez  t2, t2
                                  # (save modified registers before control flow changes)
          sw    t2, -20(fp)             # spill T3 from t2 to (fp-20)
          j     __LL3                   
__LL3:                                  
                                  # T4 <- (T0 || T3)
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          lw    t1, -20(fp)             # load T3 from (fp-20) into t1
          or    t2, t0,t1
          snez  t2, t2
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # T3 <- snez T1
          lw    t0, -12(fp)             # load T1 from (fp-12) into t0
          snez  t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T3 from t1 to (fp-20)
          j     __LL3                   
