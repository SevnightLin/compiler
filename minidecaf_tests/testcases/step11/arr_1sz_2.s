          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global a                     
          .size a, 4                    
a:                                      
          .zero 4                       

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # T0 = ALLOC 4
          addi  sp, sp, -4              
          mv    t0, sp                  
                                  # ÿ
          li    t1, 0                   
                                  # ÿ
          li    t2, 4                   
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # ÿ
          li    s2, 0                   
                                  # ÿ
          li    s3, 0                   
                                  # ÿ
          li    s4, 1                   
                                  # T7 <- (T4 * T6)
          mul   s5, s2, s4              
                                  # T8 <- (T7 + T5)
          add   s6, s5, s3              
                                  # ÿ
          li    s7, 0                   
                                  # ÿ
          li    s8, 1                   
                                  # T11 <- (T8 * T10)
          mul   s9, s6, s8              
                                  # T12 <- (T11 + T9)
          add   s10, s9, s7             
                                  # ÿ
          li    s11, 0                  
                                  # ÿ
          li    t3, 1                   
                                  # T15 <- (T12 * T14)
          mul   t4, s10, t3             
                                  # T16 <- (T15 + T13)
          add   t5, t4, s11             
                                  # ÿ
          li    t6, 0                   
                                  # ÿ
          li    t1, 1                   
                                  # T19 <- (T16 * T18)
          mul   t2, t5, t1              
                                  # T20 <- (T19 + T17)
          add   t1, t2, t6              
                                  # ÿ
          li    t2, 0                   
                                  # ÿ
          li    s2, 1                   
                                  # T23 <- (T20 * T22)
          mul   s3, t1, s2              
                                  # T24 <- (T23 + T21)
          add   t1, s3, t2              
                                  # ÿ
          li    t2, 4                   
                                  # T26 <- (T24 * T25)
          mul   s2, t1, t2              
                                  # ÿ
          li    t1, 24                  
                                  # T28 <- (T0 + T26)
          add   t2, t0, s2              
                                  # STORE T27 -> T28, 0
          sw    t1, 0(t2)               
                                  # T29 = LOAD_SYMBOL a
          la    t2, a                   
                                  # T30 <- (T29 + T3)
          add   s2, t2, s1              
                                  # STORE T27 -> T30, 0
          sw    t1, 0(s2)               
                                  # ÿ
          li    t1, 0                   
                                  # ÿ
          li    t2, 4                   
                                  # T33 <- (T31 * T32)
          mul   s1, t1, t2              
                                  # T34 = LOAD_SYMBOL a
          la    t1, a                   
                                  # T35 <- (T34 + T33)
          add   t2, t1, s1              
                                  # T36 = LOAD T35, 0
          lw    t1, 0(t2)               
                                  # ÿ
          li    t2, 0                   
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          li    s2, 1                   
                                  # T40 <- (T37 * T39)
          mul   s3, t2, s2              
                                  # T41 <- (T40 + T38)
          add   t2, s3, s1              
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          li    s2, 1                   
                                  # T44 <- (T41 * T43)
          mul   s3, t2, s2              
                                  # T45 <- (T44 + T42)
          add   t2, s3, s1              
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          li    s2, 1                   
                                  # T48 <- (T45 * T47)
          mul   s3, t2, s2              
                                  # T49 <- (T48 + T46)
          add   t2, s3, s1              
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          li    s2, 1                   
                                  # T52 <- (T49 * T51)
          mul   s3, t2, s2              
                                  # T53 <- (T52 + T50)
          add   t2, s3, s1              
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          li    s2, 1                   
                                  # T56 <- (T53 * T55)
          mul   s3, t2, s2              
                                  # T57 <- (T56 + T54)
          add   t2, s3, s1              
                                  # ÿ
          li    s1, 4                   
                                  # T59 <- (T57 * T58)
          mul   s2, t2, s1              
                                  # T60 <- (T0 + T59)
          add   t2, t0, s2              
                                  # T61 = LOAD T60, 0
          lw    t0, 0(t2)               
                                  # T62 <- (T36 + T61)
          add   t2, t1, t0              
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
