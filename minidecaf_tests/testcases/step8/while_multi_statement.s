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
          li    t0, 0                   
                                  # ý
          mv    t1, t0                  
                                  # ý
          li    t2, 1                   
                                  # ý
          mv    s1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          sw    s1, -12(fp)             # spill T2 from s1 to (fp-12)
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 5                   
                                  # T5 <- (T4 > T0)
          lw    t1, -16(fp)             # load T0 from (fp-16) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 2                   
                                  # T7 <- (T0 + T6)
          lw    t1, -16(fp)             # load T0 from (fp-16) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # T8 <- (T2 * T0)
          lw    s1, -12(fp)             # load T2 from (fp-12) into s1
          mul   s2, s1, t1              
                                  # 
          mv    s1, s2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          sw    s1, -12(fp)             # spill T2 from s1 to (fp-12)
          j     __LL1                   
__LL3:                                  
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
