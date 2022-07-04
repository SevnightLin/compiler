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
                                  # ü
          li    t1, 0                   
                                  # ü
          li    t2, 4                   
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # ü
          li    s2, 1                   
                                  # T5 <- (T0 + T3)
          add   s3, t0, s1              
                                  # STORE T4 -> T5, 0
          sw    s2, 0(s3)               
                                  # ü
          li    s4, 1                   
                                  # ü
          li    s5, 4                   
                                  # T8 <- (T6 * T7)
          mul   s6, s4, s5              
                                  # ü
          li    s7, 0                   
                                  # T10 <- (T0 + T8)
          add   s8, t0, s6              
                                  # STORE T9 -> T10, 0
          sw    s7, 0(s8)               
                                  # ü
          li    s9, 0                   
                                  # ü
          li    s10, 4                  
                                  # T13 <- (T11 * T12)
          mul   s11, s9, s10            
                                  # T14 <- (T0 + T13)
          add   t3, t0, s11             
                                  # T15 = LOAD T14, 0
          lw    t4, 0(t3)               
                                  # ü
          li    t5, 4                   
                                  # T17 <- (T15 * T16)
          mul   t6, t4, t5              
                                  # T18 <- (T0 + T17)
          add   t1, t0, t6              
                                  # T19 = LOAD T18, 0
          lw    t0, 0(t1)               
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
