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
                                  # ÿ
          li    t0, 0                   
                                  # ÿ
          li    t1, 4                   
                                  # T2 <- (T0 * T1)
          mul   t2, t0, t1              
                                  # ÿ
          li    s1, 24                  
                                  # T4 = LOAD_SYMBOL a
          la    s2, a                   
                                  # T5 <- (T4 + T2)
          add   s3, s2, t2              
                                  # STORE T3 -> T5, 0
          sw    s1, 0(s3)               
                                  # ÿ
          li    s4, 0                   
                                  # ÿ
          li    s5, 4                   
                                  # T8 <- (T6 * T7)
          mul   s6, s4, s5              
                                  # T9 = LOAD_SYMBOL a
          la    s7, a                   
                                  # T10 <- (T9 + T8)
          add   s8, s7, s6              
                                  # T11 = LOAD T10, 0
          lw    s9, 0(s8)               
          mv    a0, s9                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
