          .text                         
          .globl main                   
          .align 2                      

          .text                         
_foo:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # ÿ
          li    t0, 1                   
                                  # T2 <- (T0 + T1)
          lw    t1, 0(fp)               # load T0 from (fp+0) into t1
          add   t2, t1, t0              
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
                                  # ÿ
          li    t0, 1                   
                                  # ÿ
          mv    t1, t0                  
                                  # ÿ
                                  # T6 = CALL _foo
          mv    t2, zero                # initialize T6 with 0
          sw    t2, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    t1, 0(sp)               
          call  _foo                    
          addi  sp, sp, 8               
          lw    t2, -4(sp)              
          mv    t2, a0                  
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
