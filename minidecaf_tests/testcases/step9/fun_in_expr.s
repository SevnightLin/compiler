          .text                         
          .globl main                   
          .align 2                      

          .text                         
_sum:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # T2 <- (T1 + T0)
          lw    t0, 4(fp)               # load T1 from (fp+4) into t0
          lw    t1, 0(fp)               # load T0 from (fp+0) into t1
          add   t2, t0, t1              
          mv    a0, t2                  
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
__LL1:                                  
                                  # ý
          li    t0, 2                   
                                  # ý
          li    t1, 1                   
                                  # ý
                                  # ý
                                  # T7 = CALL _sum
          mv    t2, zero                # initialize T24 with 0
          sw    t2, -4(sp)              
          mv    s1, zero                # initialize T20 with 0
          sw    s1, -8(sp)              
          mv    s2, zero                # initialize T10 with 0
          sw    s2, -12(sp)             
          mv    s3, zero                # initialize T7 with 0
          sw    s3, -16(sp)             
          addi  sp, sp, -16             
          addi  sp, sp, -8              
          sw    t1, 4(sp)               
          sw    t0, 0(sp)               
          call  _sum                    
          addi  sp, sp, 24              
          lw    t2, -4(sp)              
          lw    s1, -8(sp)              
          lw    s2, -12(sp)             
          lw    s3, -16(sp)             
          mv    s3, a0                  
                                  # ý
          li    s4, 2                   
                                  # ý
          li    s5, 1                   
                                  # ý
                                  # ý
                                  # T10 = CALL _sum
          sw    t2, -4(sp)              
          sw    s1, -8(sp)              
          sw    s2, -12(sp)             
          sw    s3, -16(sp)             
          addi  sp, sp, -16             
          addi  sp, sp, -8              
          sw    s5, 4(sp)               
          sw    s4, 0(sp)               
          call  _sum                    
          addi  sp, sp, 24              
          lw    t2, -4(sp)              
          lw    s1, -8(sp)              
          lw    s2, -12(sp)             
          lw    s3, -16(sp)             
          mv    s2, a0                  
                                  # ý
          li    s6, 2                   
                                  # T12 <- (T10 / T11)
          div   s7, s2, s6              
                                  # ý
          li    s8, 2                   
                                  # T14 <- (T12 * T13)
          mul   s9, s7, s8              
                                  # T15 <- (T7 - T14)
          sub   s10, s3, s9             
                                  # ý
          mv    s11, s10                
                                  # ý
          li    t3, 2                   
                                  # ý
          li    t4, 4                   
                                  # ý
          li    t5, 3                   
                                  # ý
                                  # ý
                                  # T20 = CALL _sum
          sw    t2, -4(sp)              
          sw    s1, -8(sp)              
          sw    t3, -12(sp)             
          sw    s11, -16(sp)            
          addi  sp, sp, -16             
          addi  sp, sp, -8              
          sw    t5, 4(sp)               
          sw    t4, 0(sp)               
          call  _sum                    
          addi  sp, sp, 24              
          lw    t2, -4(sp)              
          lw    s1, -8(sp)              
          lw    t3, -12(sp)             
          lw    s11, -16(sp)            
          mv    s1, a0                  
                                  # T21 <- (T17 * T20)
          mul   t6, t3, s1              
                                  # ý
          li    t0, 2                   
                                  # ý
          li    t1, 1                   
                                  # ý
                                  # ý
                                  # T24 = CALL _sum
          sw    t2, -4(sp)              
          sw    t6, -8(sp)              
          sw    s11, -12(sp)            
          addi  sp, sp, -12             
          addi  sp, sp, -8              
          sw    t1, 4(sp)               
          sw    t0, 0(sp)               
          call  _sum                    
          addi  sp, sp, 20              
          lw    t2, -4(sp)              
          lw    t6, -8(sp)              
          lw    s11, -12(sp)            
          mv    t2, a0                  
                                  # T25 <- (T21 + T24)
          add   t0, t6, t2              
                                  # ý
          mv    t1, t0                  
                                  # T26 <- (T16 - T4)
          sub   t0, t1, s11             
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
