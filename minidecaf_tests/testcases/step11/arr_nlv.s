          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # T0 = ALLOC 96
          addi  sp, sp, -96             
          mv    t0, sp                  
                                  # ÿ
          li    t1, 1                   
                                  # ÿ
          li    t2, 2                   
                                  # ÿ
          li    s1, 4                   
                                  # T4 <- (T1 * T3)
          mul   s2, t1, s1              
                                  # T5 <- (T4 + T2)
          add   s3, s2, t2              
                                  # ÿ
          li    s4, 3                   
                                  # ÿ
          li    s5, 3                   
                                  # T8 <- (T5 * T7)
          mul   s6, s3, s5              
                                  # T9 <- (T8 + T6)
          add   s7, s6, s4              
                                  # ÿ
          li    s8, 4                   
                                  # T11 <- (T9 * T10)
          mul   s9, s7, s8              
                                  # ÿ
          li    s10, 5                  
                                  # T13 <- (T0 + T11)
          add   s11, t0, s9             
                                  # STORE T12 -> T13, 0
          sw    s10, 0(s11)             
                                  # ÿ
          li    t3, 0                   
                                  # ÿ
          li    t4, 0                   
                                  # ÿ
          li    t5, 4                   
                                  # T17 <- (T14 * T16)
          mul   t6, t3, t5              
                                  # T18 <- (T17 + T15)
          add   t1, t6, t4              
                                  # ÿ
          li    t2, 2                   
                                  # ÿ
          li    s1, 3                   
                                  # T21 <- (T18 * T20)
          mul   s2, t1, s1              
                                  # T22 <- (T21 + T19)
          add   t1, s2, t2              
                                  # ÿ
          li    t2, 4                   
                                  # T24 <- (T22 * T23)
          mul   s1, t1, t2              
                                  # ÿ
          li    t1, 1                   
                                  # ÿ
          li    t2, 2                   
                                  # ÿ
          li    s2, 4                   
                                  # T28 <- (T25 * T27)
          mul   s3, t1, s2              
                                  # T29 <- (T28 + T26)
          add   t1, s3, t2              
                                  # ÿ
          li    t2, 3                   
                                  # ÿ
          li    s2, 3                   
                                  # T32 <- (T29 * T31)
          mul   s3, t1, s2              
                                  # T33 <- (T32 + T30)
          add   t1, s3, t2              
                                  # ÿ
          li    t2, 4                   
                                  # T35 <- (T33 * T34)
          mul   s2, t1, t2              
                                  # T36 <- (T0 + T35)
          add   t1, t0, s2              
                                  # T37 = LOAD T36, 0
          lw    t2, 0(t1)               
                                  # T38 <- (T0 + T24)
          add   t1, t0, s1              
                                  # STORE T37 -> T38, 0
          sw    t2, 0(t1)               
                                  # ÿ
          li    t1, 1                   
                                  # ÿ
          li    t2, 2                   
                                  # ÿ
          li    s1, 4                   
                                  # T42 <- (T39 * T41)
          mul   s2, t1, s1              
                                  # T43 <- (T42 + T40)
          add   t1, s2, t2              
                                  # ÿ
          li    t2, 3                   
                                  # ÿ
          li    s1, 3                   
                                  # T46 <- (T43 * T45)
          mul   s2, t1, s1              
                                  # T47 <- (T46 + T44)
          add   t1, s2, t2              
                                  # ÿ
          li    t2, 4                   
                                  # T49 <- (T47 * T48)
          mul   s1, t1, t2              
                                  # T50 <- (T0 + T49)
          add   t1, t0, s1              
                                  # T51 = LOAD T50, 0
          lw    t2, 0(t1)               
                                  # ÿ
          li    t1, 0                   
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          li    s2, 4                   
                                  # T55 <- (T52 * T54)
          mul   s3, t1, s2              
                                  # T56 <- (T55 + T53)
          add   t1, s3, s1              
                                  # ÿ
          li    s1, 2                   
                                  # ÿ
          li    s2, 3                   
                                  # T59 <- (T56 * T58)
          mul   s3, t1, s2              
                                  # T60 <- (T59 + T57)
          add   t1, s3, s1              
                                  # ÿ
          li    s1, 4                   
                                  # T62 <- (T60 * T61)
          mul   s2, t1, s1              
                                  # T63 <- (T0 + T62)
          add   t1, t0, s2              
                                  # T64 = LOAD T63, 0
          lw    t0, 0(t1)               
                                  # T65 <- (T51 + T64)
          add   t1, t2, t0              
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
