          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global foo                   
          .size foo, 4                  
foo:                                    
          .zero 4                       

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
          mv    t1, t0                  
                                  # ü
          li    t2, 3                   
                                  # T3 <- (T2 > T0)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # T4 = LOAD_SYMBOL foo
          la    t0, foo                 
                                  # T5 = LOAD T4, 0
          lw    t1, 0(t0)               
                                  # 
          li    t2, 1                   
                                  # T7 <- (T5 + T6)
          add   s1, t1, t2              
                                  # T8 = LOAD_SYMBOL foo
          la    s2, foo                 
                                  # STORE T7 -> T8, 0
          sw    s1, 0(s2)               
                                  # 
          li    s3, 1                   
                                  # T10 <- (T0 + T9)
          lw    s4, -12(fp)             # load T0 from (fp-12) into s4
          add   s5, s4, s3              
                                  # 
          mv    s4, s5                  
                                  # 
          li    s6, 3                   
                                  # T12 <- (T11 > T0)
          sgt   s7, s6,s4               
                                  # (save modified registers before control flow changes)
          sw    s4, -12(fp)             # spill T0 from s4 to (fp-12)
          beqz  s7, __LL2               
          j     __LL1                   
__LL2:                                  
                                  # T13 = LOAD_SYMBOL foo
          la    t0, foo                 
                                  # T14 = LOAD T13, 0
          lw    t1, 0(t0)               
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
