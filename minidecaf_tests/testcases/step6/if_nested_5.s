          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -12             
__LL0:                                  
                                  # ü
          li    t0, 0                   
                                  # ü
                                  # ü
          li    t1, 0                   
          beqz  t1, __LL4               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
          beqz  t0, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 3                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          j     __LL5                   
__LL5:                                  
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL3:                                  
                                  # ü
          li    t0, 4                   
                                  # ü
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          j     __LL5                   
__LL4:                                  
                                  # ü
          li    t0, 1                   
                                  # ü
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          j     __LL5                   
