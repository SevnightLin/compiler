          .text                         
          .globl main                   
          .align 2                      

          .text                         
_twice:                                 # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # ü
          li    t0, 2                   
                                  # T2 <- (T1 * T0)
          lw    t1, 0(fp)               # load T0 from (fp+0) into t1
          mul   t2, t0, t1              
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
                                  # ü
          li    t0, 3                   
                                  # ü
                                  # T5 = CALL _twice
          mv    t1, zero                # initialize T5 with 0
          sw    t1, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    t0, 0(sp)               
          call  _twice                  
          addi  sp, sp, 8               
          lw    t1, -4(sp)              
          mv    t1, a0                  
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
