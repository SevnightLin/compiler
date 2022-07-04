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
          li    t0, 2                   
                                  # ÿ
                                  # ÿ
          li    t1, 3                   
                                  # ÿ
          mv    t2, t1                  
                                  # ÿ
          li    s1, 0                   
                                  # ÿ
          mv    a0, t2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
