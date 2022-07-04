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
          li    t2, 0                   
                                  # ý
          mv    s1, t2                  
                                  # ý
          li    s2, 3                   
                                  # T5 <- (T4 > T2)
          sgt   s3, s2,s1               
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          sw    s1, -12(fp)             # spill T2 from s1 to (fp-12)
          beqz  s3, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 1                   
                                  # T7 <- (T0 + T6)
          lw    t1, -16(fp)             # load T0 from (fp-16) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 1                   
                                  # T9 <- (T2 + T8)
          lw    s2, -12(fp)             # load T2 from (fp-12) into s2
          add   s3, s2, s1              
                                  # 
          mv    s2, s3                  
                                  # 
          li    s4, 3                   
                                  # T11 <- (T10 > T2)
          sgt   s5, s4,s2               
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          sw    s2, -12(fp)             # spill T2 from s2 to (fp-12)
          beqz  s5, __LL2               
          j     __LL1                   
__LL2:                                  
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
