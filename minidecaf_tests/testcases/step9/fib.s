          .text                         
          .globl main                   
          .align 2                      

          .text                         
_fib:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -16             
__LL0:                                  
                                  # ü
          li    t0, 0                   
                                  # T2 <- (T0 == T1)
          lw    t1, 0(fp)               # load T0 from (fp+0) into t1
          sub   t2, t1, t0              
          seqz  t2, t2                  
                                  # ü
          li    s1, 1                   
                                  # T4 <- (T0 == T3)
          sub   s2, t1, s1              
          seqz  s2, s2                  
                                  # T5 <- (T2 || T4)
          or    s3, t2,s2
          snez  s3, s3
          beqz  s3, __LL2               
          j     __LL1                   
__LL1:                                  
          lw    t0, 0(fp)               # load T0 from (fp+0) into t0
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # ü
          li    t0, 1                   
                                  # T7 <- (T0 - T6)
          lw    t1, 0(fp)               # load T0 from (fp+0) into t1
          sub   t2, t1, t0              
                                  # ü
                                  # T8 = CALL _fib
          lw    s1, -12(fp)             # load T11 from (fp-12) into s1
          sw    s1, -4(sp)              
          lw    s2, -16(fp)             # load T8 from (fp-16) into s2
          sw    s2, -8(sp)              
          sw    t1, -12(sp)             
          addi  sp, sp, -12             
          addi  sp, sp, -4              
          sw    t2, 0(sp)               
          call  _fib                    
          addi  sp, sp, 16              
          lw    s1, -4(sp)              
          lw    s2, -8(sp)              
          lw    t1, -12(sp)             
          mv    s2, a0                  
                                  # ü
          li    s3, 2                   
                                  # T10 <- (T0 - T9)
          sub   s4, t1, s3              
                                  # ü
                                  # T11 = CALL _fib
          sw    s1, -4(sp)              
          sw    s2, -8(sp)              
          addi  sp, sp, -8              
          addi  sp, sp, -4              
          sw    s4, 0(sp)               
          call  _fib                    
          addi  sp, sp, 12              
          lw    s1, -4(sp)              
          lw    s2, -8(sp)              
          mv    s1, a0                  
                                  # T12 <- (T8 + T11)
          add   s5, s2, s1              
          mv    a0, s5                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL3:                                  
                                  # ü
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL4:                                  
                                  # ü
          li    t0, 5                   
                                  # ü
          mv    t1, t0                  
                                  # ü
                                  # T16 = CALL _fib
          mv    t2, zero                # initialize T16 with 0
          sw    t2, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    t1, 0(sp)               
          call  _fib                    
          addi  sp, sp, 8               
          lw    t2, -4(sp)              
          mv    t2, a0                  
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
