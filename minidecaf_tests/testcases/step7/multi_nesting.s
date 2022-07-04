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
          li    t0, 2                   
                                  # ý
          mv    t1, t0                  
                                  # ý
          li    t2, 3                   
                                  # T3 <- (T2 > T0)
          sgt   s1, t2,t1               
          beqz  s1, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 3                   
                                  # 
          mv    t1, t0                  
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL2:                                  
                                  # ý
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
