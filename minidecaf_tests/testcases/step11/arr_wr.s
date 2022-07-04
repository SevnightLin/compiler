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
                                  # T0 = ALLOC 8
          addi  sp, sp, -8              
          mv    t0, sp                  
                                  # þ
          li    t1, 0                   
                                  # þ
          li    t2, 4                   
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # þ
          li    s2, 1                   
                                  # T5 <- (T0 + T3)
          add   s3, t0, s1              
                                  # STORE T4 -> T5, 0
          sw    s2, 0(s3)               
                                  # þ
          li    s4, 1                   
                                  # þ
          li    s5, 4                   
                                  # T8 <- (T6 * T7)
          mul   s6, s4, s5              
                                  # þ
          li    s7, 0                   
                                  # þ
          li    s8, 4                   
                                  # T11 <- (T9 * T10)
          mul   s9, s7, s8              
                                  # T12 <- (T0 + T11)
          add   s10, t0, s9             
                                  # T13 = LOAD T12, 0
          lw    s11, 0(s10)             
                                  # þ
          li    t3, 5                   
                                  # T15 <- (T13 + T14)
          add   t4, s11, t3             
                                  # T16 <- (T0 + T8)
          add   t5, t0, s6              
                                  # STORE T15 -> T16, 0
          sw    t4, 0(t5)               
                                  # þ
          li    t6, 1                   
                                  # þ
          li    t1, 4                   
                                  # T19 <- (T17 * T18)
          mul   t2, t6, t1              
                                  # T20 <- (T0 + T19)
          add   t1, t0, t2              
                                  # T21 = LOAD T20, 0
          lw    t0, 0(t1)               
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
