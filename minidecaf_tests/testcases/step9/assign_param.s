          .text                         
          .globl main                   
          .align 2                      

          .text                         
_fun:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # �
          li    t0, 5                   
                                  # �
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
                                  # �
          li    t0, 0                   
                                  # �
          mv    t1, t0                  
                                  # �
          li    t2, 5                   
                                  # �
                                  # T6 = CALL _fun
          sw    t1, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    t2, 0(sp)               
          call  _fun                    
          addi  sp, sp, 8               
          lw    t1, -4(sp)              
          mv    zero, a0                
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
