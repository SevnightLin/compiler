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
                                  # ý
          li    t0, 1                   
                                  # (save modified registers before control flow changes)
          sw    t0, -12(fp)             # spill T0 from t0 to (fp-12)
          beqz  t0, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
                                  # T2 <- (- T1)
          neg   t1, t0                  
                                  # T3 <- (T0 && T2)
          lw    t2, -12(fp)             # load T0 from (fp-12) into t2
          snez  s1, t2
          sub   s1, zero, s1
          and   s1, s1,t1
          snez  s1, s1
                                  # (save modified registers before control flow changes)
          sw    s1, -16(fp)             # spill T3 from s1 to (fp-16)
          j     __LL3                   
__LL3:                                  
          lw    t0, -16(fp)             # load T3 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # T3 <- snez T0
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          snez  t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T3 from t1 to (fp-16)
          j     __LL3                   
