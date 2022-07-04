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
                                  # ÿ
          li    t0, 4                   
                                  # ÿ
          mv    t1, t0                  
                                  # ÿ
          mv    t2, t0                  
                                  # T3 <- (T0 - T1)
          sub   s1, t2, t1              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
