          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -24             
__LL0:                                  
                                  # T0 = ALLOC 16
          addi  sp, sp, -16             
          mv    t0, sp                  
                                  # þ
          li    t1, 0                   
                                  # þ
          mv    t2, t1                  
                                  # þ
          li    s1, 0                   
                                  # þ
          mv    s2, s1                  
                                  # þ
          li    s3, 2                   
                                  # T6 <- (T5 > T3)
          sgt   s4, s3,s2               
                                  # (save modified registers before control flow changes)
          sw    t0, -20(fp)             # spill T0 from t0 to (fp-20)
          sw    t2, -16(fp)             # spill T1 from t2 to (fp-16)
          sw    s2, -12(fp)             # spill T3 from s2 to (fp-12)
          beqz  s4, __LL4               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # 
          li    t2, 2                   
                                  # T10 <- (T9 > T7)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T7 from t1 to (fp-24)
          beqz  s1, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 2                   
                                  # T12 <- (T3 * T11)
          lw    t1, -12(fp)             # load T3 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T13 <- (T12 + T7)
          lw    s1, -24(fp)             # load T7 from (fp-24) into s1
          add   s2, t2, s1              
                                  # 
          li    s3, 4                   
                                  # T15 <- (T13 * T14)
          mul   s4, s2, s3              
                                  # 
          li    s5, 1                   
                                  # T17 <- (T1 + T16)
          lw    s6, -16(fp)             # load T1 from (fp-16) into s6
          add   s7, s6, s5              
                                  # 
          mv    s6, s7                  
                                  # T18 <- (T0 + T15)
          lw    s8, -20(fp)             # load T0 from (fp-20) into s8
          add   s9, s8, s4              
                                  # STORE T17 -> T18, 0
          sw    s7, 0(s9)               
                                  # 
          li    s10, 1                  
                                  # T20 <- (T7 + T19)
          add   s11, s1, s10            
                                  # 
          mv    s1, s11                 
                                  # 
          li    t3, 2                   
                                  # T22 <- (T21 > T7)
          sgt   t4, t3,s1               
                                  # (save modified registers before control flow changes)
          sw    s1, -24(fp)             # spill T7 from s1 to (fp-24)
          sw    s6, -16(fp)             # spill T1 from s6 to (fp-16)
          beqz  t4, __LL3               
          j     __LL2                   
__LL3:                                  
                                  # þ
          li    t0, 1                   
                                  # T24 <- (T3 + T23)
          lw    t1, -12(fp)             # load T3 from (fp-12) into t1
          add   t2, t1, t0              
                                  # þ
          mv    t1, t2                  
                                  # þ
          li    s1, 2                   
                                  # T26 <- (T25 > T3)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T3 from t1 to (fp-12)
          beqz  s2, __LL4               
          j     __LL1                   
__LL4:                                  
                                  # þ
          li    t0, 0                   
                                  # þ
          li    t1, 0                   
                                  # þ
          li    t2, 2                   
                                  # T30 <- (T27 * T29)
          mul   s1, t0, t2              
                                  # T31 <- (T30 + T28)
          add   s2, s1, t1              
                                  # þ
          li    s3, 4                   
                                  # T33 <- (T31 * T32)
          mul   s4, s2, s3              
                                  # T34 <- (T0 + T33)
          lw    s5, -20(fp)             # load T0 from (fp-20) into s5
          add   s6, s5, s4              
                                  # T35 = LOAD T34, 0
          lw    s7, 0(s6)               
                                  # þ
          li    s8, 40                  
                                  # T37 <- (T35 * T36)
          mul   s9, s7, s8              
                                  # þ
          li    s10, 0                  
                                  # þ
          li    s11, 1                  
                                  # þ
          li    t3, 2                   
                                  # T41 <- (T38 * T40)
          mul   t4, s10, t3             
                                  # T42 <- (T41 + T39)
          add   t5, t4, s11             
                                  # þ
          li    t6, 4                   
                                  # T44 <- (T42 * T43)
          mul   t0, t5, t6              
                                  # T45 <- (T0 + T44)
          add   t1, s5, t0              
                                  # T46 = LOAD T45, 0
          lw    t0, 0(t1)               
                                  # þ
          li    t1, 20                  
                                  # T48 <- (T46 * T47)
          mul   t2, t0, t1              
                                  # T49 <- (T37 + T48)
          add   t0, s9, t2              
                                  # þ
          li    t1, 1                   
                                  # þ
          li    t2, 0                   
                                  # þ
          li    s1, 2                   
                                  # T53 <- (T50 * T52)
          mul   s2, t1, s1              
                                  # T54 <- (T53 + T51)
          add   t1, s2, t2              
                                  # þ
          li    t2, 4                   
                                  # T56 <- (T54 * T55)
          mul   s1, t1, t2              
                                  # T57 <- (T0 + T56)
          add   t1, s5, s1              
                                  # T58 = LOAD T57, 0
          lw    t2, 0(t1)               
                                  # þ
          li    t1, 10                  
                                  # T60 <- (T58 * T59)
          mul   s1, t2, t1              
                                  # T61 <- (T49 + T60)
          add   t1, t0, s1              
                                  # þ
          li    t0, 1                   
                                  # þ
          li    t2, 1                   
                                  # þ
          li    s1, 2                   
                                  # T65 <- (T62 * T64)
          mul   s2, t0, s1              
                                  # T66 <- (T65 + T63)
          add   t0, s2, t2              
                                  # þ
          li    t2, 4                   
                                  # T68 <- (T66 * T67)
          mul   s1, t0, t2              
                                  # T69 <- (T0 + T68)
          add   t0, s5, s1              
                                  # T70 = LOAD T69, 0
          lw    t2, 0(t0)               
                                  # T71 <- (T61 + T70)
          add   t0, t1, t2              
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
