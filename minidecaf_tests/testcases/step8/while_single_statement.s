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
                                  # �
          li    t0, 0                   
                                  # �
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 5                   
                                  # T3 <- (T2 > T0)
          lw    t1, -12(fp)             # load T0 from (fp-12) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 2                   
                                  # T5 <- (T0 + T4)
          lw    t1, -12(fp)             # load T0 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          j     __LL1                   
__LL3:                                  
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
