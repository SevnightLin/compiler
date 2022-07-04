          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global a                     
          .size a, 8                    
a:                                      
          .zero 8                       

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # ü
          li    t0, 0                   
                                  # ü
          li    t1, 4                   
                                  # T2 <- (T0 * T1)
          mul   t2, t0, t1              
                                  # ü
          li    s1, 1                   
                                  # ü
          li    s2, 4                   
                                  # T5 <- (T3 * T4)
          mul   s3, s1, s2              
                                  # ü
          li    s4, 5                   
                                  # T7 = LOAD_SYMBOL a
          la    s5, a                   
                                  # T8 <- (T7 + T5)
          add   s6, s5, s3              
                                  # STORE T6 -> T8, 0
          sw    s4, 0(s6)               
                                  # T9 = LOAD_SYMBOL a
          la    s7, a                   
                                  # T10 <- (T9 + T2)
          add   s8, s7, t2              
                                  # STORE T6 -> T10, 0
          sw    s4, 0(s8)               
                                  # ü
          li    s9, 1                   
                                  # ü
          li    s10, 4                  
                                  # T13 <- (T11 * T12)
          mul   s11, s9, s10            
                                  # T14 = LOAD_SYMBOL a
          la    t3, a                   
                                  # T15 <- (T14 + T13)
          add   t4, t3, s11             
                                  # T16 = LOAD T15, 0
          lw    t5, 0(t4)               
                                  # ü
          li    t6, 0                   
                                  # ü
          li    t0, 4                   
                                  # T19 <- (T17 * T18)
          mul   t1, t6, t0              
                                  # T20 = LOAD_SYMBOL a
          la    t0, a                   
                                  # T21 <- (T20 + T19)
          add   t2, t0, t1              
                                  # T22 = LOAD T21, 0
          lw    t0, 0(t2)               
                                  # T23 <- (T16 * T22)
          mul   t1, t5, t0              
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
