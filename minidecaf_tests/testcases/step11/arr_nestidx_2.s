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
                                  # T0 = ALLOC 40
          addi  sp, sp, -40             
          mv    t0, sp                  
                                  # ý
          li    t1, 0                   
                                  # ý
          li    t2, 4                   
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # ý
          li    s2, 0                   
                                  # T5 <- (T0 + T3)
          add   s3, t0, s1              
                                  # STORE T4 -> T5, 0
          sw    s2, 0(s3)               
                                  # (save modified registers before control flow changes)
          sw    t0, -12(fp)             # spill T0 from t0 to (fp-12)
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
                                  # 
          li    t1, 4                   
                                  # T8 <- (T6 * T7)
          mul   t2, t0, t1              
                                  # 
          li    s1, 0                   
                                  # 
          li    s2, 4                   
                                  # T11 <- (T9 * T10)
          mul   s3, s1, s2              
                                  # T12 <- (T0 + T11)
          lw    s4, -12(fp)             # load T0 from (fp-12) into s4
          add   s5, s4, s3              
                                  # T13 = LOAD T12, 0
          lw    s6, 0(s5)               
                                  # 
          li    s7, 1                   
                                  # T15 <- (T13 + T14)
          add   s8, s6, s7              
                                  # T16 <- (T0 + T8)
          add   s9, s4, t2              
                                  # STORE T15 -> T16, 0
          sw    s8, 0(s9)               
                                  # 
          li    s10, 0                  
                                  # 
          li    s11, 4                  
                                  # T19 <- (T17 * T18)
          mul   t3, s10, s11            
                                  # T20 <- (T0 + T19)
          add   t4, s4, t3              
                                  # T21 = LOAD T20, 0
          lw    t5, 0(t4)               
                                  # 
          li    t6, 4                   
                                  # T23 <- (T21 * T22)
          mul   t0, t5, t6              
                                  # 
          li    t1, 0                   
                                  # 
          li    t2, 4                   
                                  # T26 <- (T24 * T25)
          mul   s1, t1, t2              
                                  # T27 <- (T0 + T26)
          add   t1, s4, s1              
                                  # T28 = LOAD T27, 0
          lw    t2, 0(t1)               
                                  # 
          li    t1, 1                   
                                  # T30 <- (T28 + T29)
          add   s1, t2, t1              
                                  # T31 <- (T0 + T23)
          add   t1, s4, t0              
                                  # STORE T30 -> T31, 0
          sw    s1, 0(t1)               
                                  # 
          li    t0, 0                   
                                  # 
          li    t1, 4                   
                                  # T34 <- (T32 * T33)
          mul   t2, t0, t1              
                                  # T35 <- (T0 + T34)
          add   t0, s4, t2              
                                  # T36 = LOAD T35, 0
          lw    t1, 0(t0)               
                                  # 
          li    t0, 10                  
                                  # 
          li    t2, 1                   
                                  # T39 <- (T37 - T38)
          sub   s1, t0, t2              
                                  # T40 <- (T36 != T39)
          sub   t0, t1, s1              
          snez  t0, t0                  
          beqz  t0, __LL2               
          j     __LL1                   
__LL2:                                  
                                  # ý
          li    t0, 10                  
                                  # ý
          li    t1, 1                   
                                  # T43 <- (T41 - T42)
          sub   t2, t0, t1              
                                  # ý
          li    s1, 4                   
                                  # T45 <- (T43 * T44)
          mul   s2, t2, s1              
                                  # ý
          li    s3, 0                   
                                  # T47 <- (T0 + T45)
          lw    s4, -12(fp)             # load T0 from (fp-12) into s4
          add   s5, s4, s2              
                                  # STORE T46 -> T47, 0
          sw    s3, 0(s5)               
                                  # ý
          li    s6, 1                   
                                  # ý
          li    s7, 4                   
                                  # T50 <- (T48 * T49)
          mul   s8, s6, s7              
                                  # T51 <- (T0 + T50)
          add   s9, s4, s8              
                                  # T52 = LOAD T51, 0
          lw    s10, 0(s9)              
                                  # ý
          li    s11, 4                  
                                  # T54 <- (T52 * T53)
          mul   t3, s10, s11            
                                  # T55 <- (T0 + T54)
          add   t4, s4, t3              
                                  # T56 = LOAD T55, 0
          lw    t5, 0(t4)               
                                  # ý
          li    t6, 4                   
                                  # T58 <- (T56 * T57)
          mul   t0, t5, t6              
                                  # T59 <- (T0 + T58)
          add   t1, s4, t0              
                                  # T60 = LOAD T59, 0
          lw    t0, 0(t1)               
                                  # ý
          li    t1, 4                   
                                  # T62 <- (T60 * T61)
          mul   t2, t0, t1              
                                  # T63 <- (T0 + T62)
          add   t0, s4, t2              
                                  # T64 = LOAD T63, 0
          lw    t1, 0(t0)               
                                  # ý
          li    t0, 4                   
                                  # T66 <- (T64 * T65)
          mul   t2, t1, t0              
                                  # T67 <- (T0 + T66)
          add   t0, s4, t2              
                                  # T68 = LOAD T67, 0
          lw    t1, 0(t0)               
                                  # ý
          li    t0, 4                   
                                  # T70 <- (T68 * T69)
          mul   t2, t1, t0              
                                  # T71 <- (T0 + T70)
          add   t0, s4, t2              
                                  # T72 = LOAD T71, 0
          lw    t1, 0(t0)               
                                  # ý
          li    t0, 4                   
                                  # T74 <- (T72 * T73)
          mul   t2, t1, t0              
                                  # T75 <- (T0 + T74)
          add   t0, s4, t2              
                                  # T76 = LOAD T75, 0
          lw    t1, 0(t0)               
                                  # ý
          li    t0, 4                   
                                  # T78 <- (T76 * T77)
          mul   t2, t1, t0              
                                  # T79 <- (T0 + T78)
          add   t0, s4, t2              
                                  # T80 = LOAD T79, 0
          lw    t1, 0(t0)               
                                  # ý
          li    t0, 4                   
                                  # T82 <- (T80 * T81)
          mul   t2, t1, t0              
                                  # T83 <- (T0 + T82)
          add   t0, s4, t2              
                                  # T84 = LOAD T83, 0
          lw    t1, 0(t0)               
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
