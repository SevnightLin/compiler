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
                                  # ý
          li    t0, 5                   
                                  # T1 <- (- T0)
          neg   t1, t0                  
                                  # ý
          li    t2, 3                   
                                  # T3 <- (T1 % T2)
          rem   s1, t1, t2              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
