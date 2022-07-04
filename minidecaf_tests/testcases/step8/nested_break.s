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
                                  # ü
          li    t0, 0                   
                                  # ü
          mv    t1, t0                  
                                  # ü
          li    t2, 0                   
                                  # ü
          mv    s1, t2                  
                                  # ü
          li    s2, 10                  
                                  # T5 <- (T4 > T2)
          sgt   s3, s2,s1               
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          sw    s1, -12(fp)             # spill T2 from s1 to (fp-12)
          beqz  s3, __LL6               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # 
          li    t2, 10                  
                                  # T9 <- (T8 > T6)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T6 from t1 to (fp-20)
          beqz  s1, __LL5               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 2                   
                                  # T11 <- (T2 / T10)
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          div   t2, t1, t0              
                                  # 
          li    s1, 2                   
                                  # T13 <- (T11 * T12)
          mul   s2, t2, s1              
                                  # T14 <- (T13 == T2)
          sub   s3, s2, t1              
          seqz  s3, s3                  
          beqz  s3, __LL3               
          j     __LL5                   
__LL5:                                  
                                  # 
          li    t0, 1                   
                                  # T21 <- (T2 + T20)
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 10                  
                                  # T23 <- (T22 > T2)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          beqz  s2, __LL6               
          j     __LL1                   
__LL3:                                  
                                  # T15 <- (T0 + T2)
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t0, t1              
                                  # ü
          mv    t0, t2                  
                                  # (save modified registers before control flow changes)
          sw    t0, -16(fp)             # spill T0 from t0 to (fp-16)
          j     __LL4                   
__LL4:                                  
                                  # 
          li    t0, 1                   
                                  # T17 <- (T6 + T16)
          lw    t1, -20(fp)             # load T6 from (fp-20) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 10                  
                                  # T19 <- (T18 > T6)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T6 from t1 to (fp-20)
          beqz  s2, __LL5               
          j     __LL2                   
__LL6:                                  
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
