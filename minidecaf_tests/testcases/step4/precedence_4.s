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
          li    t0, 2                   
                                  # þ
          li    t1, 2                   
                                  # T2 <- (T0 == T1)
          sub   t2, t0, t1              
          seqz  t2, t2                  
                                  # þ
          li    s1, 0                   
                                  # T4 <- (T2 || T3)
          or    s2, t2,s1
          snez  s2, s2
          mv    a0, s2                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
