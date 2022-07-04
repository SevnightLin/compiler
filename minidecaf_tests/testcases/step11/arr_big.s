          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global a                     
          .size a, 4194304              
a:                                      
          .zero 4194304                 

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
                                  # T2 <- 1048576
          li    t2, 1048576             
                                  # T3 <- (T2 > T0)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 4                   
                                  # T5 <- (T0 * T4)
          lw    t1, -12(fp)             # load T0 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T6 <- 1048576
          li    s1, 1048576             
                                  # T7 <- (T6 - T0)
          sub   s2, s1, t1              
                                  # T8 = LOAD_SYMBOL a
          la    s3, a                   
                                  # T9 <- (T8 + T5)
          add   s4, s3, t2              
                                  # STORE T7 -> T9, 0
          sw    s2, 0(s4)               
                                  # 
          li    s5, 1                   
                                  # T11 <- (T10 + T0)
          add   s6, s5, t1              
                                  # 
          mv    t1, s6                  
                                  # T12 <- 1048576
          li    s7, 1048576             
                                  # T13 <- (T12 > T0)
          sgt   s8, s7,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T0 from t1 to (fp-12)
          beqz  s8, __LL2               
          j     __LL1                   
__LL2:                                  
                                  # T14 <- 142123
          li    t0, 142123              
                                  # ÿ
          li    t1, 4                   
                                  # T16 <- (T14 * T15)
          mul   t2, t0, t1              
                                  # T17 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T18 <- (T17 + T16)
          add   s2, s1, t2              
                                  # T19 = LOAD T18, 0
          lw    s3, 0(s2)               
                                  # T20 <- 564432
          li    s4, 564432              
                                  # ÿ
          li    s5, 4                   
                                  # T22 <- (T20 * T21)
          mul   s6, s4, s5              
                                  # T23 = LOAD_SYMBOL a
          la    s7, a                   
                                  # T24 <- (T23 + T22)
          add   s8, s7, s6              
                                  # T25 = LOAD T24, 0
          lw    s9, 0(s8)               
                                  # T26 <- (T19 + T25)
          add   s10, s3, s9             
          mv    a0, s10                 
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
