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
                                  # ÿ
          li    t0, 0                   
                                  # ÿ
          mv    t1, t0                  
                                  # ÿ
          li    t2, 10                  
                                  # T3 <- (T2 > T0)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 1                   
                                  # T5 <- (T0 + T4)
          lw    t1, -12(fp)             # load T0 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 10                  
                                  # T7 <- (T6 > T0)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s2, __LL2               
          j     __LL1                   
__LL2:                                  
                                  # ÿ
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
