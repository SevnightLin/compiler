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
                                  # þ
          li    t0, 12                  
                                  # T1 <- (- T0)
          neg   t1, t0                  
                                  # þ
          li    t2, 5                   
                                  # T3 <- (T1 / T2)
          div   s1, t1, t2              
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
