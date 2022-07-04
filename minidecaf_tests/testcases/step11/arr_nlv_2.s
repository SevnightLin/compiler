          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -28             
__LL0:                                  
                                  # T0 = ALLOC 96
          addi  sp, sp, -96             
          mv    t0, sp                  
                                  # ý
          li    t1, 1                   
                                  # ý
          mv    t2, t1                  
                                  # ý
          li    s1, 0                   
                                  # ý
          mv    s2, s1                  
                                  # ý
          li    s3, 2                   
                                  # T6 <- (T5 > T3)
          sgt   s4, s3,s2               
                                  # (save modified registers before control flow changes)
          sw    t0, -20(fp)             # spill T0 from t0 to (fp-20)
          sw    t2, -16(fp)             # spill T1 from t2 to (fp-16)
          sw    s2, -12(fp)             # spill T3 from s2 to (fp-12)
          beqz  s4, __LL6               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # 
          li    t2, 3                   
                                  # T10 <- (T9 > T7)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T7 from t1 to (fp-24)
          beqz  s1, __LL5               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 4                   
                                  # T12 <- (T3 * T11)
          lw    t1, -12(fp)             # load T3 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T13 <- (T12 + T7)
          lw    s1, -24(fp)             # load T7 from (fp-24) into s1
          add   s2, t2, s1              
                                  # 
          li    s3, 0                   
                                  # 
          li    s4, 3                   
                                  # T16 <- (T13 * T15)
          mul   s5, s2, s4              
                                  # T17 <- (T16 + T14)
          add   s6, s5, s3              
                                  # 
          li    s7, 4                   
                                  # T19 <- (T17 * T18)
          mul   s8, s6, s7              
                                  # 
          li    s9, 6                   
                                  # T21 <- (T3 * T20)
          mul   s10, t1, s9             
                                  # 
          li    s11, 3                  
                                  # T23 <- (T7 * T22)
          mul   t3, s1, s11             
                                  # T24 <- (T21 - T23)
          sub   t4, s10, t3             
                                  # T25 <- (T0 + T19)
          lw    t5, -20(fp)             # load T0 from (fp-20) into t5
          add   t6, t5, s8              
                                  # STORE T24 -> T25, 0
          sw    t4, 0(t6)               
                                  # 
          li    t0, 1                   
                                  # 
          mv    t2, t0                  
                                  # 
          li    t0, 4                   
                                  # T29 <- (T28 > T26)
          sgt   s2, t0,t2               
                                  # (save modified registers before control flow changes)
          sw    t2, -28(fp)             # spill T26 from t2 to (fp-28)
          beqz  s2, __LL4               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 2                   
                                  # T31 <- (T1 * T30)
          lw    t1, -16(fp)             # load T1 from (fp-16) into t1
          mul   t2, t1, t0              
                                  # 
          li    s1, 1                   
                                  # T33 <- (T31 + T32)
          add   s2, t2, s1              
                                  # 
          mv    t1, s2                  
                                  # 
          li    s3, 4                   
                                  # T35 <- (T3 * T34)
          lw    s4, -12(fp)             # load T3 from (fp-12) into s4
          mul   s5, s4, s3              
                                  # T36 <- (T35 + T7)
          lw    s6, -24(fp)             # load T7 from (fp-24) into s6
          add   s7, s5, s6              
                                  # 
          li    s8, 3                   
                                  # T38 <- (T36 * T37)
          mul   s9, s7, s8              
                                  # T39 <- (T38 + T26)
          lw    s10, -28(fp)            # load T26 from (fp-28) into s10
          add   s11, s9, s10            
                                  # 
          li    t3, 4                   
                                  # T41 <- (T39 * T40)
          mul   t4, s11, t3             
                                  # 
          li    t5, 4                   
                                  # T43 <- (T3 * T42)
          mul   t6, s4, t5              
                                  # T44 <- (T43 + T7)
          add   t0, t6, s6              
                                  # 
          li    t2, 1                   
                                  # T46 <- (T26 - T45)
          sub   s1, s10, t2             
                                  # 
          li    t2, 3                   
                                  # T48 <- (T44 * T47)
          mul   s2, t0, t2              
                                  # T49 <- (T48 + T46)
          add   t0, s2, s1              
                                  # 
          li    t2, 4                   
                                  # T51 <- (T49 * T50)
          mul   s1, t0, t2              
                                  # T52 <- (T0 + T51)
          lw    t0, -20(fp)             # load T0 from (fp-20) into t0
          add   t2, t0, s1              
                                  # T53 = LOAD T52, 0
          lw    s1, 0(t2)               
                                  # T54 <- (T53 + T1)
          add   t2, s1, t1              
                                  # T55 <- (T0 + T41)
          add   s1, t0, t4              
                                  # STORE T54 -> T55, 0
          sw    t2, 0(s1)               
                                  # 
          li    t2, 1                   
                                  # T57 <- (T26 + T56)
          add   s1, s10, t2             
                                  # 
          mv    s10, s1                 
                                  # 
          li    t2, 4                   
                                  # T59 <- (T58 > T26)
          sgt   s1, t2,s10              
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T1 from t1 to (fp-16)
          sw    s10, -28(fp)            # spill T26 from s10 to (fp-28)
          beqz  s1, __LL4               
          j     __LL3                   
__LL4:                                  
                                  # ý
          li    t0, 1                   
                                  # T61 <- (T7 + T60)
          lw    t1, -24(fp)             # load T7 from (fp-24) into t1
          add   t2, t1, t0              
                                  # ý
          mv    t1, t2                  
                                  # ý
          li    s1, 3                   
                                  # T63 <- (T62 > T7)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T7 from t1 to (fp-24)
          beqz  s2, __LL5               
          j     __LL2                   
__LL5:                                  
                                  # ý
          li    t0, 1                   
                                  # T65 <- (T3 + T64)
          lw    t1, -12(fp)             # load T3 from (fp-12) into t1
          add   t2, t1, t0              
                                  # ý
          mv    t1, t2                  
                                  # ý
          li    s1, 2                   
                                  # T67 <- (T66 > T3)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T3 from t1 to (fp-12)
          beqz  s2, __LL6               
          j     __LL1                   
__LL6:                                  
                                  # ý
          li    t0, 1                   
                                  # ý
          li    t1, 2                   
                                  # ý
          li    t2, 4                   
                                  # T71 <- (T68 * T70)
          mul   s1, t0, t2              
                                  # T72 <- (T71 + T69)
          add   s2, s1, t1              
                                  # ý
          li    s3, 3                   
                                  # ý
          li    s4, 3                   
                                  # T75 <- (T72 * T74)
          mul   s5, s2, s4              
                                  # T76 <- (T75 + T73)
          add   s6, s5, s3              
                                  # ý
          li    s7, 4                   
                                  # T78 <- (T76 * T77)
          mul   s8, s6, s7              
                                  # T79 <- (T0 + T78)
          lw    s9, -20(fp)             # load T0 from (fp-20) into s9
          add   s10, s9, s8             
                                  # T80 = LOAD T79, 0
          lw    s11, 0(s10)             
                                  # ý
          li    t3, 0                   
                                  # ý
          li    t4, 0                   
                                  # ý
          li    t5, 4                   
                                  # T84 <- (T81 * T83)
          mul   t6, t3, t5              
                                  # T85 <- (T84 + T82)
          add   t0, t6, t4              
                                  # ý
          li    t1, 2                   
                                  # ý
          li    t2, 3                   
                                  # T88 <- (T85 * T87)
          mul   s1, t0, t2              
                                  # T89 <- (T88 + T86)
          add   t0, s1, t1              
                                  # ý
          li    t1, 4                   
                                  # T91 <- (T89 * T90)
          mul   t2, t0, t1              
                                  # T92 <- (T0 + T91)
          add   t0, s9, t2              
                                  # T93 = LOAD T92, 0
          lw    t1, 0(t0)               
                                  # T94 <- (T80 + T93)
          add   t0, s11, t1             
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
