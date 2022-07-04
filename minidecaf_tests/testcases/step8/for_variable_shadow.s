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
          li    t0, 0                   
                                  # ÿ
                                  # ÿ
          li    t1, 0                   
                                  # ÿ
          mv    t2, t1                  
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          mv    s2, s1                  
                                  # ÿ
          li    s3, 10                  
                                  # T6 <- (T5 > T0)
          sgt   s4, s3,s2               
                                  # (save modified registers before control flow changes)
          sw    t2, -12(fp)             # spill T2 from t2 to (fp-12)
          sw    s2, -16(fp)             # spill T0 from s2 to (fp-16)
          beqz  s4, __LL4               
          j     __LL1                   
__LL1:                                  
                                  # 
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          mv    t1, t0                  
                                  # 
          mv    t2, t1                  
                                  # 
          li    s1, 10                  
                                  # T10 <- (T9 > T8)
          sgt   s2, s1,t2               
                                  # (save modified registers before control flow changes)
          sw    t2, -20(fp)             # spill T8 from t2 to (fp-20)
          beqz  s2, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 1                   
                                  # T12 <- (T2 + T11)
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 1                   
                                  # T14 <- (T8 + T13)
          lw    s2, -20(fp)             # load T8 from (fp-20) into s2
          add   s3, s2, s1              
                                  # 
          mv    s2, s3                  
                                  # 
          li    s4, 10                  
                                  # T16 <- (T15 > T8)
          sgt   s5, s4,s2               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          sw    s2, -20(fp)             # spill T8 from s2 to (fp-20)
          beqz  s5, __LL3               
          j     __LL2                   
__LL3:                                  
                                  # ÿ
          li    t0, 1                   
                                  # T18 <- (T0 + T17)
          lw    t1, -16(fp)             # load T0 from (fp-16) into t1
          add   t2, t1, t0              
                                  # ÿ
          mv    t1, t2                  
                                  # ÿ
          li    s1, 10                  
                                  # T20 <- (T19 > T0)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          beqz  s2, __LL4               
          j     __LL1                   
__LL4:                                  
                                  # T21 <- (T2 + T0)
          lw    t0, -12(fp)             # load T2 from (fp-12) into t0
          lw    t1, -16(fp)             # load T0 from (fp-16) into t1
          add   t2, t0, t1              
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
