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
                                  # ?
          li    t0, 1                   
                                  # ?
          mv    t1, t0                  
                                  # ?
          li    t2, 0                   
                                  # ?
          mv    s1, t2                  
                                  # (save modified registers before control flow changes)
          sw    s1, -12(fp)             # spill T2 from s1 to (fp-12)
          beqz  t1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 1                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T2 from t1 to (fp-12)
          j     __LL2                   
__LL2:                                  
          lw    t0, -12(fp)             # load T2 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
