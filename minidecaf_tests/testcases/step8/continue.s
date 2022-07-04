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
          beqz  s3, __LL4               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
                                  # T7 <- (T0 / T6)
          lw    t1, -16(fp)             # load T0 from (fp-16) into t1
          div   t2, t1, t0              
                                  # 
          li    s1, 2                   
                                  # T9 <- (T7 * T8)
          mul   s2, t2, s1              
                                  # T10 <- (T9 != T0)
          sub   s3, s2, t1              
          snez  s3, s3                  
          beqz  s3, __LL2               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 1                   
                                  # T13 <- (T2 + T12)
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 10                  
                                  # T15 <- (T14 > T2)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          beqz  s2, __LL4               
          j     __LL1                   
__LL2:                                  
                                  # T11 <- (T0 + T2)
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t0, t1              
                                  # ü
          mv    t0, t2                  
                                  # (save modified registers before control flow changes)
          sw    t0, -16(fp)             # spill T0 from t0 to (fp-16)
          j     __LL3                   
__LL4:                                  
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
