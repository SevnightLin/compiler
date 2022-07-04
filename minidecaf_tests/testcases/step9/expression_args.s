          .text                         
          .globl main                   
          .align 2                      

          .text                         
_add:                                   # function entry
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
                                  # þ
          li    t0, 4                   
                                  # þ
          li    t1, 1                   
                                  # þ
          li    t2, 2                   
                                  # T8 <- (T6 + T7)
          add   s1, t1, t2              
                                  # þ
                                  # þ
                                  # T9 = CALL _add
          mv    s2, zero                # initialize T9 with 0
          sw    s2, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -8              
          sw    s1, 4(sp)               
          sw    t0, 0(sp)               
          call  _add                    
          addi  sp, sp, 12              
          lw    s2, -4(sp)              
          mv    s2, a0                  
                                  # þ
          mv    s3, s2                  
                                  # T10 <- (T4 + T4)
          add   s4, s3, s3              
          mv    a0, s4                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
