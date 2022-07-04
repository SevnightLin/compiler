          .text                         
          .globl main                   
          .align 2                      

          .text                         
_f:                                     # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
          lw    t0, 0(fp)               # load T0 from (fp+0) into t0
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
__LL1:                                  
                                  # ÿ
          li    t0, 6                   
                                  # ÿ
                                  # T3 = CALL _f
          mv    t1, zero                # initialize T3 with 0
          sw    t1, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    t0, 0(sp)               
          call  _f                      
          addi  sp, sp, 8               
          lw    t1, -4(sp)              
          mv    t1, a0                  
                                  # ÿ
          li    t2, 6                   
                                  # T5 <- (T3 != T4)
          sub   s1, t1, t2              
          snez  s1, s1                  
          beqz  s1, __LL3               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 1                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL3:                                  
                                  # ÿ
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
