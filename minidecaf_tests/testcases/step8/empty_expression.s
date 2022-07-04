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
                                  # þ
          li    t0, 3                   
                                  # þ
          mv    t1, t0                  
                                  # þ
          li    t2, 0                   
                                  # þ
          mv    s1, t2                  
                                  # þ
          li    s2, 10                  
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
                                  # T7 <- (T2 + T6)
          lw    t1, -12(fp)             # load T2 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 10                  
                                  # T9 <- (T8 > T2)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          beqz  s2, __LL2               
          j     __LL1                   
__LL2:                                  
          lw    t0, -16(fp)             # load T0 from (fp-16) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
