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
          li    t0, 0                   
                                  # ÿ
                                  # ÿ
          li    t1, 2                   
                                  # ÿ
                                  # ÿ
          li    t2, 3                   
                                  # ÿ
          mv    s1, t2                  
          mv    a0, s1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
