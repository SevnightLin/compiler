          .text                         
          .globl main                   
          .align 2                      

          .text                         
_defn:                                  # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # þ
          li    t0, 4                   
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
                                  # T3 = CALL _defn
          mv    t0, zero                # initialize T3 with 0
          sw    t0, -4(sp)              
          addi  sp, sp, -4              
          call  _defn                   
          addi  sp, sp, 4               
          lw    t0, -4(sp)              
          mv    t0, a0                  
                                  # þ
          mv    t1, t0                  
          mv    a0, t1                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
