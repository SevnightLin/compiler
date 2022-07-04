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
                                  # ý
          li    t0, 0                   
                                  # ý
          mv    t1, t0                  
                                  # ý
          li    t2, 1                   
                                  # T3 <- (- T2)
          neg   s1, t2                  
                                  # T4 <- (T0 > T3)
          sgt   s2, t1,s1               
          beqz  s2, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 4                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T5 from t1 to (fp-12)
          j     __LL3                   
__LL3:                                  
          lw    t0, -12(fp)             # load T5 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # ý
          li    t0, 5                   
                                  # ý
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T5 from t1 to (fp-12)
          j     __LL3                   
