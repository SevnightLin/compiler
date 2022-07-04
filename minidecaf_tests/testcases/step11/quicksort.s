          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global n                     
          .size n, 4                    
n:                                      
          .word 1000000                 
          .data                         
          .global a                     
          .size a, 4000000              
a:                                      
          .zero 4000000                 

          .text                         
_qsort:                                 # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -28             
__LL0:                                  
                                  # þ
          lw    t0, 4(fp)               # load T1 from (fp+4) into t0
          mv    t1, t0                  
                                  # þ
          lw    t2, 0(fp)               # load T0 from (fp+0) into t2
          mv    s1, t2                  
                                  # T5 <- (T1 + T0)
          add   s2, t0, t2              
                                  # þ
          li    s3, 2                   
                                  # T7 <- (T5 / T6)
          div   s4, s2, s3              
                                  # þ
          li    s5, 4                   
                                  # T9 <- (T7 * T8)
          mul   s6, s4, s5              
                                  # T10 = LOAD_SYMBOL a
          la    s7, a                   
                                  # T11 <- (T10 + T9)
          add   s8, s7, s6              
                                  # T12 = LOAD T11, 0
          lw    s9, 0(s8)               
                                  # þ
          mv    s10, s9                 
                                  # þ
          li    s11, 1                  
                                  # þ
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T2 from t1 to (fp-20)
          sw    s1, -16(fp)             # spill T3 from s1 to (fp-16)
          sw    s10, -12(fp)            # spill T4 from s10 to (fp-12)
          j     __LL1                   
__LL1:                                  
                                  # T15 <- (T3 <= T2)
          lw    t0, -16(fp)             # load T3 from (fp-16) into t0
          lw    t1, -20(fp)             # load T2 from (fp-20) into t1
          slt   t2, t0,t1               
          seqz  t2, t2                  
          beqz  t2, __LL8               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 4                   
                                  # T17 <- (T2 * T16)
          lw    t1, -20(fp)             # load T2 from (fp-20) into t1
          mul   t2, t1, t0              
                                  # T18 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T19 <- (T18 + T17)
          add   s2, s1, t2              
                                  # T20 = LOAD T19, 0
          lw    s3, 0(s2)               
                                  # T21 <- (T4 > T20)
          lw    s4, -12(fp)             # load T4 from (fp-12) into s4
          sgt   s5, s4,s3               
          beqz  s5, __LL4               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 1                   
                                  # T23 <- (T2 + T22)
          lw    t1, -20(fp)             # load T2 from (fp-20) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T2 from t1 to (fp-20)
          j     __LL2                   
__LL4:                                  
                                  # þ
          li    t0, 4                   
                                  # T25 <- (T3 * T24)
          lw    t1, -16(fp)             # load T3 from (fp-16) into t1
          mul   t2, t1, t0              
                                  # T26 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T27 <- (T26 + T25)
          add   s2, s1, t2              
                                  # T28 = LOAD T27, 0
          lw    s3, 0(s2)               
                                  # T29 <- (T28 > T4)
          lw    s4, -12(fp)             # load T4 from (fp-12) into s4
          sgt   s5, s3,s4               
          beqz  s5, __LL6               
          j     __LL5                   
__LL5:                                  
                                  # 
          li    t0, 1                   
                                  # T31 <- (T3 - T30)
          lw    t1, -16(fp)             # load T3 from (fp-16) into t1
          sub   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T3 from t1 to (fp-16)
          j     __LL4                   
__LL6:                                  
                                  # T32 <- (T2 > T3)
          lw    t0, -20(fp)             # load T2 from (fp-20) into t0
          lw    t1, -16(fp)             # load T3 from (fp-16) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL7               
          j     __LL8                   
__LL8:                                  
                                  # T56 <- (T0 > T2)
          lw    t0, 0(fp)               # load T0 from (fp+0) into t0
          lw    t1, -20(fp)             # load T2 from (fp-20) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL10              
          j     __LL9                   
__LL9:                                  
                                  # 
                                  # 
                                  # T57 = CALL _qsort
          lw    t0, -16(fp)             # load T3 from (fp-16) into t0
          sw    t0, -4(sp)              
          lw    t1, 4(fp)               # load T1 from (fp+4) into t1
          sw    t1, -8(sp)              
          lw    t2, -24(fp)             # load T59 from (fp-24) into t2
          sw    t2, -12(sp)             
          addi  sp, sp, -12             
          addi  sp, sp, -8              
          lw    s1, -20(fp)             # load T2 from (fp-20) into s1
          sw    s1, 4(sp)               
          lw    s2, 0(fp)               # load T0 from (fp+0) into s2
          sw    s2, 0(sp)               
          call  _qsort                  
          addi  sp, sp, 20              
          lw    t0, -4(sp)              
          lw    t1, -8(sp)              
          lw    t2, -12(sp)             
          mv    zero, a0                
                                  # (save modified registers before control flow changes)
          sw    t0, -16(fp)             # spill T3 from t0 to (fp-16)
          sw    t1, 4(fp)               # spill T1 from t1 to (fp+4)
          sw    t2, -24(fp)             # spill T59 from t2 to (fp-24)
          j     __LL10                  
__LL10:                                 
                                  # T58 <- (T3 > T1)
          lw    t0, -16(fp)             # load T3 from (fp-16) into t0
          lw    t1, 4(fp)               # load T1 from (fp+4) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL12              
          j     __LL11                  
__LL11:                                 
                                  # 
                                  # 
                                  # T59 = CALL _qsort
          addi  sp, sp, 0               
          addi  sp, sp, -8              
          lw    t0, 4(fp)               # load T1 from (fp+4) into t0
          sw    t0, 4(sp)               
          lw    t1, -16(fp)             # load T3 from (fp-16) into t1
          sw    t1, 0(sp)               
          call  _qsort                  
          addi  sp, sp, 8               
          mv    zero, a0                
          j     __LL12                  
__LL12:                                 
                                  # 
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL7:                                  
                                  # þ
          li    t0, 4                   
                                  # T35 <- (T2 * T34)
          lw    t1, -20(fp)             # load T2 from (fp-20) into t1
          mul   t2, t1, t0              
                                  # T36 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T37 <- (T36 + T35)
          add   s2, s1, t2              
                                  # T38 = LOAD T37, 0
          lw    s3, 0(s2)               
                                  # þ
          mv    s4, s3                  
                                  # þ
          li    s5, 4                   
                                  # T40 <- (T2 * T39)
          mul   s6, t1, s5              
                                  # þ
          li    s7, 4                   
                                  # T42 <- (T3 * T41)
          lw    s8, -16(fp)             # load T3 from (fp-16) into s8
          mul   s9, s8, s7              
                                  # T43 = LOAD_SYMBOL a
          la    s10, a                  
                                  # T44 <- (T43 + T42)
          add   s11, s10, s9            
                                  # T45 = LOAD T44, 0
          lw    t3, 0(s11)              
                                  # T46 = LOAD_SYMBOL a
          la    t4, a                   
                                  # T47 <- (T46 + T40)
          add   t5, t4, s6              
                                  # STORE T45 -> T47, 0
          sw    t3, 0(t5)               
                                  # þ
          li    t6, 4                   
                                  # T49 <- (T3 * T48)
          mul   t0, s8, t6              
                                  # T50 = LOAD_SYMBOL a
          la    t2, a                   
                                  # T51 <- (T50 + T49)
          add   s1, t2, t0              
                                  # STORE T33 -> T51, 0
          sw    s4, 0(s1)               
                                  # þ
          li    t0, 1                   
                                  # T53 <- (T2 + T52)
          add   t2, t1, t0              
                                  # þ
          mv    t1, t2                  
                                  # þ
          li    t0, 1                   
                                  # T55 <- (T3 - T54)
          sub   t2, s8, t0              
                                  # þ
          mv    s8, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T2 from t1 to (fp-20)
          sw    s8, -16(fp)             # spill T3 from s8 to (fp-16)
          j     __LL1                   
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
__LL13:                                 
                                  # T61 = LOAD_SYMBOL state
          la    t0, state               
                                  # T62 = LOAD T61, 0
          lw    t1, 0(t0)               
                                  # T63 <- 64013
          li    t2, 64013               
                                  # T64 <- (T62 * T63)
          mul   s1, t1, t2              
                                  # T65 <- 1531011
          li    s2, 1531011             
                                  # T66 <- (T64 + T65)
          add   s3, s1, s2              
                                  # T67 <- 32768
          li    s4, 32768               
                                  # T68 <- (T66 % T67)
          rem   s5, s3, s4              
                                  # T69 = LOAD_SYMBOL state
          la    s6, state               
                                  # STORE T68 -> T69, 0
          sw    s5, 0(s6)               
                                  # T70 = LOAD_SYMBOL state
          la    s7, state               
                                  # T71 = LOAD T70, 0
          lw    s8, 0(s7)               
                                  # þ
          li    s9, 1000                
                                  # T73 <- (T71 % T72)
          rem   s10, s8, s9             
          mv    a0, s10                 
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           

          .text                         
_initArr:                               # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -16             
__LL14:                                 
                                  # þ
          li    t0, 0                   
                                  # þ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T76 from t1 to (fp-16)
          j     __LL15                  
__LL15:                                 
                                  # T78 <- (T75 > T76)
          lw    t0, 0(fp)               # load T75 from (fp+0) into t0
          lw    t1, -16(fp)             # load T76 from (fp-16) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL17              
          j     __LL16                  
__LL16:                                 
                                  # 
          li    t0, 4                   
                                  # T80 <- (T76 * T79)
          lw    t1, -16(fp)             # load T76 from (fp-16) into t1
          mul   t2, t1, t0              
                                  # T81 = CALL _rand
          lw    s1, -12(fp)             # load T81 from (fp-12) into s1
          sw    s1, -4(sp)              
          sw    t2, -8(sp)              
          sw    t1, -12(sp)             
          lw    s2, 0(fp)               # load T75 from (fp+0) into s2
          sw    s2, -16(sp)             
          addi  sp, sp, -16             
          call  _rand                   
          addi  sp, sp, 16              
          lw    s1, -4(sp)              
          lw    t2, -8(sp)              
          lw    t1, -12(sp)             
          lw    s2, -16(sp)             
          mv    s1, a0                  
                                  # T82 = LOAD_SYMBOL a
          la    s3, a                   
                                  # T83 <- (T82 + T80)
          add   s4, s3, t2              
                                  # STORE T81 -> T83, 0
          sw    s1, 0(s4)               
                                  # 
          li    s5, 1                   
                                  # T85 <- (T76 + T84)
          add   s6, t1, s5              
                                  # 
          mv    t1, s6                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T76 from t1 to (fp-16)
          sw    s1, -12(fp)             # spill T81 from s1 to (fp-12)
          sw    s2, 0(fp)               # spill T75 from s2 to (fp+0)
          j     __LL15                  
__LL17:                                 
                                  # þ
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           

          .text                         
_isSorted:                              # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -12             
__LL18:                                 
                                  # þ
          li    t0, 0                   
                                  # þ
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T88 from t1 to (fp-12)
          j     __LL19                  
__LL19:                                 
                                  # 
          li    t0, 1                   
                                  # T91 <- (T87 - T90)
          lw    t1, 0(fp)               # load T87 from (fp+0) into t1
          sub   t2, t1, t0              
                                  # T92 <- (T91 > T88)
          lw    s1, -12(fp)             # load T88 from (fp-12) into s1
          sgt   s2, t2,s1               
          beqz  s2, __LL23              
          j     __LL20                  
__LL20:                                 
                                  # 
          li    t0, 4                   
                                  # T94 <- (T88 * T93)
          lw    t1, -12(fp)             # load T88 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T95 = LOAD_SYMBOL a
          la    s1, a                   
                                  # T96 <- (T95 + T94)
          add   s2, s1, t2              
                                  # T97 = LOAD T96, 0
          lw    s3, 0(s2)               
                                  # 
          li    s4, 1                   
                                  # T99 <- (T88 + T98)
          add   s5, t1, s4              
                                  # 
          li    s6, 4                   
                                  # T101 <- (T99 * T100)
          mul   s7, s5, s6              
                                  # T102 = LOAD_SYMBOL a
          la    s8, a                   
                                  # T103 <- (T102 + T101)
          add   s9, s8, s7              
                                  # T104 = LOAD T103, 0
          lw    s10, 0(s9)              
                                  # T105 <- (T97 > T104)
          sgt   s11, s3,s10             
          beqz  s11, __LL22             
          j     __LL21                  
__LL21:                                 
                                  # 
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL22:                                 
                                  # þ
          li    t0, 1                   
                                  # T108 <- (T88 + T107)
          lw    t1, -12(fp)             # load T88 from (fp-12) into t1
          add   t2, t1, t0              
                                  # þ
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T88 from t1 to (fp-12)
          j     __LL19                  
__LL23:                                 
                                  # þ
          li    t0, 1                   
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
          addi  sp, sp, -20             
__LL24:                                 
                                  # T111 = LOAD_SYMBOL n
          la    t0, n                   
                                  # T112 = LOAD T111, 0
          lw    t1, 0(t0)               
                                  # þ
                                  # T113 = CALL _initArr
          mv    t2, zero                # initialize T127 with 0
          sw    t2, -4(sp)              
          mv    s1, zero                # initialize T123 with 0
          sw    s1, -8(sp)              
          mv    s2, zero                # initialize T117 with 0
          sw    s2, -12(sp)             
          addi  sp, sp, -12             
          addi  sp, sp, -4              
          sw    t1, 0(sp)               
          call  _initArr                
          addi  sp, sp, 16              
          lw    t2, -4(sp)              
          lw    s1, -8(sp)              
          lw    s2, -12(sp)             
          mv    zero, a0                
                                  # T115 = LOAD_SYMBOL n
          la    s3, n                   
                                  # T116 = LOAD T115, 0
          lw    s4, 0(s3)               
                                  # þ
                                  # T117 = CALL _isSorted
          sw    t2, -4(sp)              
          sw    s1, -8(sp)              
          sw    s2, -12(sp)             
          addi  sp, sp, -12             
          addi  sp, sp, -4              
          sw    s4, 0(sp)               
          call  _isSorted               
          addi  sp, sp, 16              
          lw    t2, -4(sp)              
          lw    s1, -8(sp)              
          lw    s2, -12(sp)             
          mv    s2, a0                  
                                  # T114 <- T117
          mv    s5, s2                  
                                  # T118 = LOAD_SYMBOL n
          la    s6, n                   
                                  # T119 = LOAD T118, 0
          lw    s7, 0(s6)               
                                  # þ
          li    s8, 1                   
                                  # T121 <- (T119 - T120)
          sub   s9, s7, s8              
                                  # þ
          li    s10, 0                  
                                  # þ
                                  # þ
                                  # T123 = CALL _qsort
          sw    t2, -4(sp)              
          sw    s5, -8(sp)              
          addi  sp, sp, -8              
          addi  sp, sp, -8              
          sw    s10, 4(sp)              
          sw    s9, 0(sp)               
          call  _qsort                  
          addi  sp, sp, 16              
          lw    t2, -4(sp)              
          lw    s5, -8(sp)              
          mv    zero, a0                
                                  # T125 = LOAD_SYMBOL n
          la    s11, n                  
                                  # T126 = LOAD T125, 0
          lw    t3, 0(s11)              
                                  # þ
                                  # T127 = CALL _isSorted
          sw    t2, -4(sp)              
          sw    s5, -8(sp)              
          addi  sp, sp, -8              
          addi  sp, sp, -4              
          sw    t3, 0(sp)               
          call  _isSorted               
          addi  sp, sp, 12              
          lw    t2, -4(sp)              
          lw    s5, -8(sp)              
          mv    t2, a0                  
                                  # T124 <- T127
          mv    t4, t2                  
                                  # þ
          li    t5, 0                   
                                  # T129 <- (T114 == T128)
          sub   t6, s5, t5              
          seqz  t6, t6                  
                                  # (save modified registers before control flow changes)
          sw    t4, -16(fp)             # spill T124 from t4 to (fp-16)
          sw    t6, -12(fp)             # spill T129 from t6 to (fp-12)
          beqz  t6, __LL26              
          j     __LL25                  
__LL25:                                 
                                  # 
          li    t0, 1                   
                                  # T131 <- (T124 == T130)
          lw    t1, -16(fp)             # load T124 from (fp-16) into t1
          sub   t2, t1, t0              
          seqz  t2, t2                  
                                  # T132 <- (T129 && T131)
          lw    s1, -12(fp)             # load T129 from (fp-12) into s1
          snez  s2, s1
          sub   s2, zero, s2
          and   s2, s2,t2
          snez  s2, s2
                                  # (save modified registers before control flow changes)
          sw    s2, -20(fp)             # spill T132 from s2 to (fp-20)
          j     __LL27                  
__LL27:                                 
                                  # T133 <- (! T132)
          lw    t0, -20(fp)             # load T132 from (fp-20) into t0
          seqz  t1, t0                  
          beqz  t1, __LL29              
          j     __LL28                  
__LL28:                                 
                                  # 
          li    t0, 1                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL26:                                 
                                  # T132 <- snez T129
          lw    t0, -12(fp)             # load T129 from (fp-12) into t0
          snez  t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T132 from t1 to (fp-20)
          j     __LL27                  
__LL29:                                 
                                  # þ
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
