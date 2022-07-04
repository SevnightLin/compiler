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
          mv    t1, t0                  
                                  # ÿ
          li    t2, 2                   
                                  # ÿ
          mv    s1, t2                  
                                  # ÿ
          li    s2, 0                   
                                  # ÿ
          mv    s3, s2                  
                                  # T6 <- (T0 > T2)
          sgt   s4, t1,s1               
                                  # (save modified registers before control flow changes)
          sw    s3, -12(fp)             # spill T4 from s3 to (fp-12)
          beqz  s4, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 5                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T7 from t1 to (fp-16)
          j     __LL6                   
__LL6:                                  
          lw    t0, -16(fp)             # load T7 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
          lw    t0, -12(fp)             # load T4 from (fp-12) into t0
          beqz  t0, __LL4               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 6                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T9 from t1 to (fp-20)
          j     __LL5                   
__LL5:                                  
                                  # 
          lw    t0, -20(fp)             # load T9 from (fp-20) into t0
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T7 from t1 to (fp-16)
          j     __LL6                   
__LL4:                                  
                                  # ÿ
          li    t0, 7                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T9 from t1 to (fp-20)
          j     __LL5                   
