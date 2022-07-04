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
                                  # ü
          li    t0, 1                   
                                  # (save modified registers before control flow changes)
          sw    t0, -12(fp)             # spill T0 from t0 to (fp-12)
          beqz  t0, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
                                  # T2 <- (T0 && T1)
          lw    t1, -12(fp)             # load T0 from (fp-12) into t1
          snez  t2, t1
          sub   t2, zero, t2
          and   t2, t2,t0
          snez  t2, t2
                                  # (save modified registers before control flow changes)
          sw    t2, -16(fp)             # spill T2 from t2 to (fp-16)
          j     __LL3                   
__LL3:                                  
          lw    t0, -16(fp)             # load T2 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # T2 <- snez T0
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          snez  t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T2 from t1 to (fp-16)
          j     __LL3                   
