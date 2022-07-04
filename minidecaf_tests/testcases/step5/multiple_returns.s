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
                                  # þ
          li    t0, 4                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL1:                                  
                                  # þ
          li    t0, 14                  
                                  # þ
          li    t1, 2                   
                                  # T11 <- (T9 * T10)
          mul   t2, t0, t1              
                                  # T12 <- (T8 && T11)
          mv    s1, zero                # initialize T8 with 0
          snez  s2, s1
          sub   s2, zero, s2
          and   s2, s2,t2
          snez  s2, s2
                                  # (save modified registers before control flow changes)
          sw    s2, -12(fp)             # spill T12 from s2 to (fp-12)
          j     __LL3                   
__LL3:                                  
          lw    t0, -12(fp)             # load T12 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # T12 <- snez T8
          mv    t0, zero                # initialize T8 with 0
          snez  t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T12 from t1 to (fp-12)
          j     __LL3                   
