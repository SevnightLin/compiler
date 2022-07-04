          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global sorted_after          
          .size sorted_after, 4         
sorted_after:                           
          .word 500                     
          .data                         
          .global a                     
          .size a, 2000                 
a:                                      
          .zero 2000                    
          .data                         
          .global state                 
          .size state, 4                
state:                                  
          .zero 4                       

          .text                         
_rand:                                  # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL0:                                  
                                  # T0 = LOAD_SYMBOL state
          la    t0, state               
                                  # T1 = LOAD T0, 0
          lw    t1, 0(t0)               
                                  # ü
          li    t2, 64013               
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # T4 <- 1531011
          li    s2, 1531011             
                                  # T5 <- (T3 + T4)
          add   s3, s1, s2              
                                  # ü
          li    s4, 32768               
                                  # T7 <- (T5 % T6)
          rem   s5, s3, s4              
                                  # T8 = LOAD_SYMBOL state
          la    s6, state               
                                  # STORE T7 -> T8, 0
          sw    s5, 0(s6)               
          mv    a0, s5                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           

          .text                         
_swap:                                  # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -8              
__LL1:                                  
                                  # ü
          li    t0, 4                   
                                  # T14 <- (T11 * T13)
          lw    t1, 4(fp)               # load T11 from (fp+4) into t1
          mul   t2, t1, t0              
                                  # T15 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T16 <- (T15 + T14)
          add   s2, s1, t2              
                                  # T17 = LOAD T16, 0
          lw    s3, 0(s2)               
                                  # ü
          mv    s4, s3                  
                                  # ü
          li    s5, 4                   
                                  # T19 <- (T11 * T18)
          mul   s6, t1, s5              
                                  # ü
          li    s7, 4                   
                                  # T21 <- (T10 * T20)
          lw    s8, 0(fp)               # load T10 from (fp+0) into s8
          mul   s9, s8, s7              
                                  # T22 = LOAD_SYMBOL a
          la    s10, a                  
                                  # T23 <- (T22 + T21)
          add   s11, s10, s9            
                                  # T24 = LOAD T23, 0
          lw    t3, 0(s11)              
                                  # T25 = LOAD_SYMBOL a
          la    t4, a                   
                                  # T26 <- (T25 + T19)
          add   t5, t4, s6              
                                  # STORE T24 -> T26, 0
          sw    t3, 0(t5)               
                                  # ü
          li    t6, 4                   
                                  # T28 <- (T10 * T27)
          mul   t0, s8, t6              
                                  # T29 = LOAD_SYMBOL a
          la    t1, a                   
                                  # T30 <- (T29 + T28)
          add   t2, t1, t0              
                                  # STORE T12 -> T30, 0
          sw    s4, 0(t2)               
                                  # ü
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           

          .text                         
_bubblesort:                            # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -20             
__LL2:                                  
                                  # ü
          li    t0, 0                   
                                  # ü
          mv    t1, t0                  
                                  # T35 <- (T32 > T33)
          lw    t2, 0(fp)               # load T32 from (fp+0) into t2
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T33 from t1 to (fp-12)
          beqz  s1, __LL8               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 1                   
                                  # T38 <- (T33 + T37)
          lw    t1, -12(fp)             # load T33 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    s1, t2                  
                                  # T39 <- (T32 > T36)
          lw    s2, 0(fp)               # load T32 from (fp+0) into s2
          sgt   s3, s2,s1               
                                  # (save modified registers before control flow changes)
          sw    s1, -20(fp)             # spill T36 from s1 to (fp-20)
          beqz  s3, __LL7               
          j     __LL4                   
__LL4:                                  
                                  # 
          li    t0, 4                   
                                  # T41 <- (T33 * T40)
          lw    t1, -12(fp)             # load T33 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T42 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T43 <- (T42 + T41)
          add   s2, s1, t2              
                                  # T44 = LOAD T43, 0
          lw    s3, 0(s2)               
                                  # 
          li    s4, 4                   
                                  # T46 <- (T36 * T45)
          lw    s5, -20(fp)             # load T36 from (fp-20) into s5
          mul   s6, s5, s4              
                                  # T47 = LOAD_SYMBOL a
          la    s7, a                   
                                  # T48 <- (T47 + T46)
          add   s8, s7, s6              
                                  # T49 = LOAD T48, 0
          lw    s9, 0(s8)               
                                  # T50 <- (T44 > T49)
          sgt   s10, s3,s9              
          beqz  s10, __LL6              
          j     __LL5                   
__LL5:                                  
                                  # 
                                  # 
                                  # T51 = CALL _swap
          lw    t0, -20(fp)             # load T36 from (fp-20) into t0
          sw    t0, -4(sp)              
          lw    t1, -12(fp)             # load T33 from (fp-12) into t1
          sw    t1, -8(sp)              
          lw    t2, 0(fp)               # load T32 from (fp+0) into t2
          sw    t2, -12(sp)             
          lw    s1, -16(fp)             # load T51 from (fp-16) into s1
          sw    s1, -16(sp)             
          addi  sp, sp, -16             
          addi  sp, sp, -8              
          sw    t1, 4(sp)               
          sw    t0, 0(sp)               
          call  _swap                   
          addi  sp, sp, 24              
          lw    t0, -4(sp)              
          lw    t1, -8(sp)              
          lw    t2, -12(sp)             
          lw    s1, -16(sp)             
          mv    s1, a0                  
                                  # (save modified registers before control flow changes)
          sw    t0, -20(fp)             # spill T36 from t0 to (fp-20)
          sw    t1, -12(fp)             # spill T33 from t1 to (fp-12)
          sw    t2, 0(fp)               # spill T32 from t2 to (fp+0)
          sw    s1, -16(fp)             # spill T51 from s1 to (fp-16)
          j     __LL6                   
__LL6:                                  
                                  # 
          li    t0, 1                   
                                  # T53 <- (T36 + T52)
          lw    t1, -20(fp)             # load T36 from (fp-20) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # T54 <- (T32 > T36)
          lw    s1, 0(fp)               # load T32 from (fp+0) into s1
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T36 from t1 to (fp-20)
          beqz  s2, __LL7               
          j     __LL4                   
__LL7:                                  
                                  # ü
          li    t0, 1                   
                                  # T56 <- (T33 + T55)
          lw    t1, -12(fp)             # load T33 from (fp-12) into t1
          add   t2, t1, t0              
                                  # ü
          mv    t1, t2                  
                                  # T57 <- (T32 > T33)
          lw    s1, 0(fp)               # load T32 from (fp+0) into s1
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T33 from t1 to (fp-12)
          beqz  s2, __LL8               
          j     __LL3                   
__LL8:                                  
                                  # ü
          li    t0, 0                   
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
          addi  sp, sp, -36             
__LL9:                                  
                                  # T60 <- 218397121
          li    t0, 218397121           
                                  # ü
                                  # ü
          li    t1, 0                   
                                  # ü
          mv    t2, t1                  
                                  # T63 = LOAD_SYMBOL sorted_after
          la    s1, sorted_after        
                                  # T64 = LOAD T63, 0
          lw    s2, 0(s1)               
                                  # T65 <- (T64 > T61)
          sgt   s3, s2,t2               
                                  # (save modified registers before control flow changes)
          sw    t2, -20(fp)             # spill T61 from t2 to (fp-20)
          beqz  s3, __LL11              
          j     __LL10                  
__LL10:                                 
                                  # 
          li    t0, 4                   
                                  # T67 <- (T61 * T66)
          lw    t1, -20(fp)             # load T61 from (fp-20) into t1
          mul   t2, t1, t0              
                                  # T68 = CALL _rand
          lw    s1, -12(fp)             # load T108 from (fp-12) into s1
          sw    s1, -4(sp)              
          lw    s2, -16(fp)             # load T68 from (fp-16) into s2
          sw    s2, -8(sp)              
          sw    t2, -12(sp)             
          sw    t1, -16(sp)             
          addi  sp, sp, -16             
          call  _rand                   
          addi  sp, sp, 16              
          lw    s1, -4(sp)              
          lw    s2, -8(sp)              
          lw    t2, -12(sp)             
          lw    t1, -16(sp)             
          mv    s2, a0                  
                                  # T69 = LOAD_SYMBOL a
          la    s3, a                   
                                  # T70 <- (T69 + T67)
          add   s4, s3, t2              
                                  # STORE T68 -> T70, 0
          sw    s2, 0(s4)               
                                  # 
          li    s5, 1                   
                                  # T72 <- (T61 + T71)
          add   s6, t1, s5              
                                  # 
          mv    t1, s6                  
                                  # T73 = LOAD_SYMBOL sorted_after
          la    s7, sorted_after        
                                  # T74 = LOAD T73, 0
          lw    s8, 0(s7)               
                                  # T75 <- (T74 > T61)
          sgt   s9, s8,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T61 from t1 to (fp-20)
          sw    s1, -12(fp)             # spill T108 from s1 to (fp-12)
          sw    s2, -16(fp)             # spill T68 from s2 to (fp-16)
          beqz  s9, __LL11              
          j     __LL10                  
__LL11:                                 
                                  # ü
          li    t0, 1                   
                                  # ü
          mv    t1, t0                  
                                  # ü
          li    t2, 0                   
                                  # ü
          mv    s1, t2                  
                                  # T80 = LOAD_SYMBOL sorted_after
          la    s2, sorted_after        
                                  # T81 = LOAD T80, 0
          lw    s3, 0(s2)               
                                  # ü
          li    s4, 1                   
                                  # T83 <- (T81 - T82)
          sub   s5, s3, s4              
                                  # T84 <- (T83 > T78)
          sgt   s6, s5,s1               
                                  # (save modified registers before control flow changes)
          sw    t1, -28(fp)             # spill T76 from t1 to (fp-28)
          sw    s1, -24(fp)             # spill T78 from s1 to (fp-24)
          beqz  s6, __LL15              
          j     __LL12                  
__LL12:                                 
                                  # 
          li    t0, 4                   
                                  # T86 <- (T78 * T85)
          lw    t1, -24(fp)             # load T78 from (fp-24) into t1
          mul   t2, t1, t0              
                                  # T87 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T88 <- (T87 + T86)
          add   s2, s1, t2              
                                  # T89 = LOAD T88, 0
          lw    s3, 0(s2)               
                                  # 
          li    s4, 1                   
                                  # T91 <- (T78 + T90)
          add   s5, t1, s4              
                                  # 
          li    s6, 4                   
                                  # T93 <- (T91 * T92)
          mul   s7, s5, s6              
                                  # T94 = LOAD_SYMBOL a
          la    s8, a                   
                                  # T95 <- (T94 + T93)
          add   s9, s8, s7              
                                  # T96 = LOAD T95, 0
          lw    s10, 0(s9)              
                                  # T97 <- (T89 > T96)
          sgt   s11, s3,s10             
          beqz  s11, __LL14             
          j     __LL13                  
__LL13:                                 
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -28(fp)             # spill T76 from t1 to (fp-28)
          j     __LL14                  
__LL14:                                 
                                  # 
          li    t0, 1                   
                                  # T100 <- (T78 + T99)
          lw    t1, -24(fp)             # load T78 from (fp-24) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # T101 = LOAD_SYMBOL sorted_after
          la    s1, sorted_after        
                                  # T102 = LOAD T101, 0
          lw    s2, 0(s1)               
                                  # 
          li    s3, 1                   
                                  # T104 <- (T102 - T103)
          sub   s4, s2, s3              
                                  # T105 <- (T104 > T78)
          sgt   s5, s4,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T78 from t1 to (fp-24)
          beqz  s5, __LL15              
          j     __LL12                  
__LL15:                                 
                                  # T106 = LOAD_SYMBOL sorted_after
          la    t0, sorted_after        
                                  # T107 = LOAD T106, 0
          lw    t1, 0(t0)               
                                  # ü
                                  # T108 = CALL _bubblesort
          lw    t2, -28(fp)             # load T76 from (fp-28) into t2
          sw    t2, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    t1, 0(sp)               
          call  _bubblesort             
          addi  sp, sp, 8               
          lw    t2, -4(sp)              
          mv    zero, a0                
                                  # ü
          li    s1, 1                   
                                  # T109 <- T110
          mv    s2, s1                  
                                  # ü
          li    s3, 0                   
                                  # T111 <- T112
          mv    s4, s3                  
                                  # ü
          li    s5, 1                   
                                  # T114 <- (T109 - T113)
          sub   s6, s2, s5              
                                  # T115 <- (T114 > T111)
          sgt   s7, s6,s4               
                                  # (save modified registers before control flow changes)
          sw    t2, -28(fp)             # spill T76 from t2 to (fp-28)
          sw    s2, -36(fp)             # spill T109 from s2 to (fp-36)
          sw    s4, -32(fp)             # spill T111 from s4 to (fp-32)
          beqz  s7, __LL19              
          j     __LL16                  
__LL16:                                 
                                  # 
          li    t0, 4                   
                                  # T117 <- (T111 * T116)
          lw    t1, -32(fp)             # load T111 from (fp-32) into t1
          mul   t2, t1, t0              
                                  # T118 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T119 <- (T118 + T117)
          add   s2, s1, t2              
                                  # T120 = LOAD T119, 0
          lw    s3, 0(s2)               
                                  # 
          li    s4, 1                   
                                  # T122 <- (T111 + T121)
          add   s5, t1, s4              
                                  # 
          li    s6, 4                   
                                  # T124 <- (T122 * T123)
          mul   s7, s5, s6              
                                  # T125 = LOAD_SYMBOL a
          la    s8, a                   
                                  # T126 <- (T125 + T124)
          add   s9, s8, s7              
                                  # T127 = LOAD T126, 0
          lw    s10, 0(s9)              
                                  # T128 <- (T120 > T127)
          sgt   s11, s3,s10             
          beqz  s11, __LL18             
          j     __LL17                  
__LL17:                                 
                                  # 
          li    t0, 0                   
                                  # T109 <- T129
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -36(fp)             # spill T109 from t1 to (fp-36)
          j     __LL18                  
__LL18:                                 
                                  # 
          li    t0, 1                   
                                  # T131 <- (T111 + T130)
          lw    t1, -32(fp)             # load T111 from (fp-32) into t1
          add   t2, t1, t0              
                                  # T111 <- T131
          mv    t1, t2                  
                                  # 
          li    s1, 1                   
                                  # T133 <- (T109 - T132)
          lw    s2, -36(fp)             # load T109 from (fp-36) into s2
          sub   s3, s2, s1              
                                  # T134 <- (T133 > T111)
          sgt   s4, s3,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -32(fp)             # spill T111 from t1 to (fp-32)
          beqz  s4, __LL19              
          j     __LL16                  
__LL19:                                 
                                  # ü
          li    t0, 200                 
                                  # ü
          li    t1, 10                  
                                  # T137 <- (T76 * T136)
          lw    t2, -28(fp)             # load T76 from (fp-28) into t2
          mul   s1, t2, t1              
                                  # T138 <- (T135 + T137)
          add   s2, t0, s1              
                                  # T139 <- (T138 + T109)
          lw    s3, -36(fp)             # load T109 from (fp-36) into s3
          add   s4, s2, s3              
          mv    a0, s4                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
