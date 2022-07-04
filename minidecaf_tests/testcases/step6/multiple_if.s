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
                                  # ÿ
          li    t0, 0                   
                                  # ÿ
          mv    t1, t0                  
                                  # ÿ
          li    t2, 0                   
                                  # ÿ
          mv    s1, t2                  
                                  # (save modified registers before control flow changes)
          sw    s1, -12(fp)             # spill T2 from s1 to (fp-12)
          beqz  t1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          j     __LL3                   
__LL3:                                  
          lw    t0, -12(fp)             # load T2 from (fp-12) into t0
          beqz  t0, __LL5               
          j     __LL4                   
__LL4:                                  
                                  # 
          li    t0, 4                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          j     __LL6                   
__LL6:                                  
                                  # T8 <- (T0 + T2)
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t0, t1              
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # ÿ
          li    t0, 3                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T0 from t1 to (fp-16)
          j     __LL3                   
__LL5:                                  
                                  # ÿ
          li    t0, 5                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          j     __LL6                   
