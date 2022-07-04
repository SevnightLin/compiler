          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global a                     
          .size a, 4                    
a:                                      
          .word 3                       

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
                                  # T2 = LOAD_SYMBOL a
          la    t2, a                   
                                  # T3 = LOAD T2, 0
          lw    s1, 0(t2)               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
                                  # 
                                  # 
          li    t1, 4                   
                                  # 
          mv    t2, t1                  
                                  # (save modified registers before control flow changes)
          sw    t2, -12(fp)             # spill T0 from t2 to (fp-12)
          j     __LL2                   
__LL2:                                  
          lw    t0, -12(fp)             # load T0 from (fp-12) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
