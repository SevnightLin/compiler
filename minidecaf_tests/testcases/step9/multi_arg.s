          .text                         
          .globl main                   
          .align 2                      

          .text                         
_sub_3:                                 # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # T3 <- (T2 - T1)
          lw    t0, 8(fp)               # load T2 from (fp+8) into t0
          lw    t1, 4(fp)               # load T1 from (fp+4) into t1
          sub   t2, t0, t1              
                                  # T4 <- (T3 - T0)
          lw    s1, 0(fp)               # load T0 from (fp+0) into s1
          sub   s2, t2, s1              
          mv    a0, s2                  
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
          li    t1, 4                   
                                  # ý
          li    t2, 10                  
                                  # ý
                                  # ý
                                  # ý
                                  # T9 = CALL _sub_3
          mv    s1, zero                # initialize T9 with 0
          sw    s1, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -12             
          sw    t2, 8(sp)               
          sw    t1, 4(sp)               
          sw    t0, 0(sp)               
          call  _sub_3                  
          addi  sp, sp, 16              
          lw    s1, -4(sp)              
          mv    s1, a0                  
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
