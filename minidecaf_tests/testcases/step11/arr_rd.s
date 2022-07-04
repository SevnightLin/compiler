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
                                  # T0 = ALLOC 8
          addi  sp, sp, -8              
          mv    t0, sp                  
                                  # T1 = ALLOC 8
          addi  sp, sp, -8              
          mv    t1, sp                  
                                  # ü
          li    t2, 0                   
                                  # ü
          li    s1, 4                   
                                  # T4 <- (T2 * T3)
          mul   s2, t2, s1              
                                  # T5 <- (T1 + T4)
          add   s3, t1, s2              
                                  # T6 = LOAD T5, 0
          lw    s4, 0(s3)               
                                  # ü
          li    s5, 1                   
                                  # ü
          li    s6, 4                   
                                  # T9 <- (T7 * T8)
          mul   s7, s5, s6              
                                  # T10 <- (T1 + T9)
          add   s8, t1, s7              
                                  # T11 = LOAD T10, 0
          lw    s9, 0(s8)               
                                  # T12 <- (T6 + T11)
                                  # ü
          li    s10, 1                  
                                  # ü
          li    s11, 4                  
                                  # T15 <- (T13 * T14)
          mul   t3, s10, s11            
                                  # T16 <- (T1 + T15)
          add   t4, t1, t3              
                                  # T17 = LOAD T16, 0
                                  # ü
          li    t5, 0                   
                                  # ü
          li    t6, 4                   
                                  # T20 <- (T18 * T19)
          mul   t1, t5, t6              
                                  # T21 <- (T0 + T20)
          add   t2, t0, t1              
                                  # T22 = LOAD T21, 0
          lw    t1, 0(t2)               
                                  # ü
          li    t2, 0                   
                                  # ü
          li    s1, 4                   
                                  # T25 <- (T23 * T24)
          mul   s2, t2, s1              
                                  # T26 <- (T0 + T25)
          add   t2, t0, s2              
                                  # T27 = LOAD T26, 0
          lw    s1, 0(t2)               
                                  # T28 <- (T22 != T27)
          sub   t2, t1, s1              
          snez  t2, t2                  
                                  # (save modified registers before control flow changes)
          sw    t0, -12(fp)             # spill T0 from t0 to (fp-12)
          beqz  t2, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 1                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # ü
          li    t0, 1                   
                                  # ü
          li    t1, 4                   
                                  # T32 <- (T30 * T31)
          mul   t2, t0, t1              
                                  # T33 <- (T0 + T32)
          lw    s1, -12(fp)             # load T0 from (fp-12) into s1
          add   s2, s1, t2              
                                  # T34 = LOAD T33, 0
          lw    s3, 0(s2)               
                                  # ü
          li    s4, 1                   
                                  # ü
          li    s5, 4                   
                                  # T37 <- (T35 * T36)
          mul   s6, s4, s5              
                                  # T38 <- (T0 + T37)
          add   s7, s1, s6              
                                  # T39 = LOAD T38, 0
          lw    s8, 0(s7)               
                                  # T40 <- (T34 != T39)
          sub   s9, s3, s8              
          snez  s9, s9                  
          beqz  s9, __LL4               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 1                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL4:                                  
                                  # ü
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
