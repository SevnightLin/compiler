          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -28             
__LL0:                                  
                                  # ÿ
          li    t0, 1                   
          beqz  t0, __LL5               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 2                   
          beqz  t0, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 3                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T4 from t1 to (fp-12)
          j     __LL4                   
__LL4:                                  
                                  # 
          lw    t0, -12(fp)             # load T4 from (fp-12) into t0
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T2 from t1 to (fp-16)
          j     __LL6                   
__LL6:                                  
                                  # 
          lw    t0, -16(fp)             # load T2 from (fp-16) into t0
          mv    t1, t0                  
                                  # 
          li    t2, 0                   
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T0 from t1 to (fp-20)
          beqz  t2, __LL11              
          j     __LL7                   
__LL7:                                  
                                  # 
          li    t0, 2                   
          beqz  t0, __LL9               
          j     __LL8                   
__LL8:                                  
                                  # 
          li    t0, 3                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T12 from t1 to (fp-24)
          j     __LL10                  
__LL10:                                 
                                  # 
          lw    t0, -24(fp)             # load T12 from (fp-24) into t0
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -28(fp)             # spill T10 from t1 to (fp-28)
          j     __LL12                  
__LL12:                                 
                                  # 
          lw    t0, -28(fp)             # load T10 from (fp-28) into t0
          mv    t1, t0                  
                                  # T16 <- (T0 * T8)
          lw    t2, -20(fp)             # load T0 from (fp-20) into t2
          mul   s1, t2, t1              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL3:                                  
                                  # ÿ
          li    t0, 4                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T4 from t1 to (fp-12)
          j     __LL4                   
__LL5:                                  
                                  # ÿ
          li    t0, 5                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T2 from t1 to (fp-16)
          j     __LL6                   
__LL9:                                  
                                  # ÿ
          li    t0, 4                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T12 from t1 to (fp-24)
          j     __LL10                  
__LL11:                                 
                                  # ÿ
          li    t0, 5                   
                                  # ÿ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -28(fp)             # spill T10 from t1 to (fp-28)
          j     __LL12                  
