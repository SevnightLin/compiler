          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global a                     
          .size a, 16                   
a:                                      
          .zero 16                      
          .data                         
          .global b                     
          .size b, 16                   
b:                                      
          .zero 16                      

          .text                         
_mulMatrix:                             # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -20             
__LL0:                                  
                                  # ý
          li    t0, 0                   
                                  # ý
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T1 from t1 to (fp-12)
          j     __LL1                   
__LL1:                                  
                                  # T5 <- (T0 > T1)
          lw    t0, 0(fp)               # load T0 from (fp+0) into t0
          lw    t1, -12(fp)             # load T1 from (fp-12) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL9               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T2 from t1 to (fp-16)
          j     __LL3                   
__LL3:                                  
                                  # T7 <- (T0 > T2)
          lw    t0, 0(fp)               # load T0 from (fp+0) into t0
          lw    t1, -16(fp)             # load T2 from (fp-16) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL8               
          j     __LL4                   
__LL4:                                  
                                  # 
          li    t0, 2                   
                                  # T9 <- (T1 * T8)
          lw    t1, -12(fp)             # load T1 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T10 <- (T9 + T2)
          lw    s1, -16(fp)             # load T2 from (fp-16) into s1
          add   s2, t2, s1              
                                  # 
          li    s3, 4                   
                                  # T12 <- (T10 * T11)
          mul   s4, s2, s3              
                                  # 
          li    s5, 0                   
                                  # T14 = LOAD_SYMBOL b
          la    s6, b                   
                                  # T15 <- (T14 + T12)
          add   s7, s6, s4              
                                  # STORE T13 -> T15, 0
          sw    s5, 0(s7)               
                                  # 
          li    s8, 0                   
                                  # 
          mv    s9, s8                  
                                  # (save modified registers before control flow changes)
          sw    s9, -20(fp)             # spill T3 from s9 to (fp-20)
          j     __LL5                   
__LL5:                                  
                                  # T17 <- (T0 > T3)
          lw    t0, 0(fp)               # load T0 from (fp+0) into t0
          lw    t1, -20(fp)             # load T3 from (fp-20) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL7               
          j     __LL6                   
__LL6:                                  
                                  # 
          li    t0, 2                   
                                  # T19 <- (T1 * T18)
          lw    t1, -12(fp)             # load T1 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T20 <- (T19 + T2)
          lw    s1, -16(fp)             # load T2 from (fp-16) into s1
          add   s2, t2, s1              
                                  # 
          li    s3, 4                   
                                  # T22 <- (T20 * T21)
          mul   s4, s2, s3              
                                  # 
          li    s5, 2                   
                                  # T24 <- (T1 * T23)
          mul   s6, t1, s5              
                                  # T25 <- (T24 + T2)
          add   s7, s6, s1              
                                  # 
          li    s8, 4                   
                                  # T27 <- (T25 * T26)
          mul   s9, s7, s8              
                                  # T28 = LOAD_SYMBOL b
          la    s10, b                  
                                  # T29 <- (T28 + T27)
          add   s11, s10, s9            
                                  # T30 = LOAD T29, 0
          lw    t3, 0(s11)              
                                  # 
          li    t4, 2                   
                                  # T32 <- (T1 * T31)
          mul   t5, t1, t4              
                                  # T33 <- (T32 + T3)
          lw    t6, -20(fp)             # load T3 from (fp-20) into t6
          add   t0, t5, t6              
                                  # 
          li    t2, 4                   
                                  # T35 <- (T33 * T34)
          mul   s2, t0, t2              
                                  # T36 = LOAD_SYMBOL a
          la    t0, a                   
                                  # T37 <- (T36 + T35)
          add   t2, t0, s2              
                                  # T38 = LOAD T37, 0
          lw    t0, 0(t2)               
                                  # 
          li    t2, 2                   
                                  # T40 <- (T3 * T39)
          mul   s2, t6, t2              
                                  # T41 <- (T40 + T2)
          add   t2, s2, s1              
                                  # 
          li    s2, 4                   
                                  # T43 <- (T41 * T42)
          mul   s3, t2, s2              
                                  # T44 = LOAD_SYMBOL a
          la    t2, a                   
                                  # T45 <- (T44 + T43)
          add   s2, t2, s3              
                                  # T46 = LOAD T45, 0
          lw    t2, 0(s2)               
                                  # T47 <- (T38 * T46)
          mul   s2, t0, t2              
                                  # T48 <- (T30 + T47)
          add   t0, t3, s2              
                                  # T49 = LOAD_SYMBOL b
          la    t2, b                   
                                  # T50 <- (T49 + T22)
          add   s2, t2, s4              
                                  # STORE T48 -> T50, 0
          sw    t0, 0(s2)               
                                  # 
          li    t0, 1                   
                                  # T52 <- (T3 + T51)
          add   t2, t6, t0              
                                  # 
          mv    t6, t2                  
                                  # (save modified registers before control flow changes)
          sw    t6, -20(fp)             # spill T3 from t6 to (fp-20)
          j     __LL5                   
__LL7:                                  
                                  # ý
          li    t0, 1                   
                                  # T54 <- (T2 + T53)
          lw    t1, -16(fp)             # load T2 from (fp-16) into t1
          add   t2, t1, t0              
                                  # ý
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T2 from t1 to (fp-16)
          j     __LL3                   
__LL8:                                  
                                  # ý
          li    t0, 1                   
                                  # T56 <- (T1 + T55)
          lw    t1, -12(fp)             # load T1 from (fp-12) into t1
          add   t2, t1, t0              
                                  # ý
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T1 from t1 to (fp-12)
          j     __LL1                   
__LL9:                                  
                                  # ý
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           

          .text                         
_initMatrix:                            # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -20             
__LL10:                                 
                                  # ý
          li    t0, 0                   
                                  # ý
          mv    t1, t0                  
                                  # ý
          li    t2, 0                   
                                  # ý
          mv    s1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T61 from t1 to (fp-12)
          sw    s1, -16(fp)             # spill T59 from s1 to (fp-16)
          j     __LL11                  
__LL11:                                 
                                  # 
          li    t0, 2                   
                                  # T65 <- (T64 > T59)
          lw    t1, -16(fp)             # load T59 from (fp-16) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL16              
          j     __LL12                  
__LL12:                                 
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T60 from t1 to (fp-20)
          j     __LL13                  
__LL13:                                 
                                  # 
          li    t0, 2                   
                                  # T68 <- (T67 > T60)
          lw    t1, -20(fp)             # load T60 from (fp-20) into t1
          sgt   t2, t0,t1               
          beqz  t2, __LL15              
          j     __LL14                  
__LL14:                                 
                                  # 
          li    t0, 1                   
                                  # T70 <- (T61 + T69)
          lw    t1, -12(fp)             # load T61 from (fp-12) into t1
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    s1, 2                   
                                  # T72 <- (T59 * T71)
          lw    s2, -16(fp)             # load T59 from (fp-16) into s2
          mul   s3, s2, s1              
                                  # T73 <- (T72 + T60)
          lw    s4, -20(fp)             # load T60 from (fp-20) into s4
          add   s5, s3, s4              
                                  # 
          li    s6, 4                   
                                  # T75 <- (T73 * T74)
          mul   s7, s5, s6              
                                  # T76 = LOAD_SYMBOL a
          la    s8, a                   
                                  # T77 <- (T76 + T75)
          add   s9, s8, s7              
                                  # STORE T61 -> T77, 0
          sw    t1, 0(s9)               
                                  # 
          li    s10, 1                  
                                  # T79 <- (T60 + T78)
          add   s11, s4, s10            
                                  # 
          mv    s4, s11                 
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T61 from t1 to (fp-12)
          sw    s4, -20(fp)             # spill T60 from s4 to (fp-20)
          j     __LL13                  
__LL15:                                 
                                  # ý
          li    t0, 1                   
                                  # T81 <- (T59 + T80)
          lw    t1, -16(fp)             # load T59 from (fp-16) into t1
          add   t2, t1, t0              
                                  # ý
          mv    t1, t2                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T59 from t1 to (fp-16)
          j     __LL11                  
__LL16:                                 
                                  # ý
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
          addi  sp, sp, -20             
__LL17:                                 
                                  # ý
          li    t0, 2                   
                                  # ý
                                  # T84 = CALL _initMatrix
          mv    t1, zero                # initialize T86 with 0
          sw    t1, -4(sp)              
          lw    t2, -16(fp)             # load T127 from (fp-16) into t2
          sw    t2, -8(sp)              
          addi  sp, sp, -8              
          addi  sp, sp, -4              
          sw    t0, 0(sp)               
          call  _initMatrix             
          addi  sp, sp, 12              
          lw    t1, -4(sp)              
          lw    t2, -8(sp)              
          mv    zero, a0                
                                  # ý
          li    s1, 2                   
                                  # ý
                                  # T86 = CALL _mulMatrix
          sw    t2, -4(sp)              
          addi  sp, sp, -4              
          addi  sp, sp, -4              
          sw    s1, 0(sp)               
          call  _mulMatrix              
          addi  sp, sp, 8               
          lw    t2, -4(sp)              
          mv    zero, a0                
                                  # ý
          li    s2, 0                   
                                  # ý
          mv    s3, s2                  
                                  # ý
          li    s4, 2                   
                                  # T90 <- (T89 > T87)
          sgt   s5, s4,s3               
                                  # (save modified registers before control flow changes)
          sw    t2, -16(fp)             # spill T127 from t2 to (fp-16)
          sw    s3, -12(fp)             # spill T87 from s3 to (fp-12)
          beqz  s5, __LL21              
          j     __LL18                  
__LL18:                                 
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # 
          li    t2, 2                   
                                  # T94 <- (T93 > T91)
          sgt   s1, t2,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T91 from t1 to (fp-20)
          beqz  s1, __LL20              
          j     __LL19                  
__LL19:                                 
                                  # 
          li    t0, 2                   
                                  # T96 <- (T87 * T95)
          lw    t1, -12(fp)             # load T87 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # T97 <- (T96 + T91)
          lw    s1, -20(fp)             # load T91 from (fp-20) into s1
          add   s2, t2, s1              
                                  # 
          li    s3, 4                   
                                  # T99 <- (T97 * T98)
          mul   s4, s2, s3              
                                  # 
          li    s5, 2                   
                                  # T101 <- (T87 * T100)
          mul   s6, t1, s5              
                                  # T102 <- (T101 + T91)
          add   s7, s6, s1              
                                  # 
          li    s8, 4                   
                                  # T104 <- (T102 * T103)
          mul   s9, s7, s8              
                                  # T105 = LOAD_SYMBOL b
          la    s10, b                  
                                  # T106 <- (T105 + T104)
          add   s11, s10, s9            
                                  # T107 = LOAD T106, 0
          lw    t3, 0(s11)              
                                  # T108 = LOAD_SYMBOL a
          la    t4, a                   
                                  # T109 <- (T108 + T99)
          add   t5, t4, s4              
                                  # STORE T107 -> T109, 0
          sw    t3, 0(t5)               
                                  # 
          li    t6, 2                   
                                  # T111 <- (T87 * T110)
          mul   t0, t1, t6              
                                  # T112 <- (T111 + T91)
          add   t2, t0, s1              
                                  # 
          li    t0, 4                   
                                  # T114 <- (T112 * T113)
          mul   s2, t2, t0              
                                  # 
          li    t0, 0                   
                                  # T116 = LOAD_SYMBOL b
          la    t2, b                   
                                  # T117 <- (T116 + T114)
          add   s3, t2, s2              
                                  # STORE T115 -> T117, 0
          sw    t0, 0(s3)               
                                  # 
          li    t0, 1                   
                                  # T119 <- (T91 + T118)
          add   t2, s1, t0              
                                  # 
          mv    s1, t2                  
                                  # 
          li    t0, 2                   
                                  # T121 <- (T120 > T91)
          sgt   t2, t0,s1               
                                  # (save modified registers before control flow changes)
          sw    s1, -20(fp)             # spill T91 from s1 to (fp-20)
          beqz  t2, __LL20              
          j     __LL19                  
__LL20:                                 
                                  # ý
          li    t0, 1                   
                                  # T123 <- (T87 + T122)
          lw    t1, -12(fp)             # load T87 from (fp-12) into t1
          add   t2, t1, t0              
                                  # ý
          mv    t1, t2                  
                                  # ý
          li    s1, 2                   
                                  # T125 <- (T124 > T87)
          sgt   s2, s1,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T87 from t1 to (fp-12)
          beqz  s2, __LL21              
          j     __LL18                  
__LL21:                                 
                                  # ý
          li    t0, 2                   
                                  # ý
                                  # T127 = CALL _mulMatrix
          addi  sp, sp, 0               
          addi  sp, sp, -4              
          sw    t0, 0(sp)               
          call  _mulMatrix              
          addi  sp, sp, 4               
          mv    zero, a0                
                                  # ý
          li    t1, 0                   
                                  # ý
          li    t2, 0                   
                                  # ý
          li    s1, 2                   
                                  # T131 <- (T128 * T130)
          mul   s2, t1, s1              
                                  # T132 <- (T131 + T129)
          add   s3, s2, t2              
                                  # ý
          li    s4, 4                   
                                  # T134 <- (T132 * T133)
          mul   s5, s3, s4              
                                  # T135 = LOAD_SYMBOL b
          la    s6, b                   
                                  # T136 <- (T135 + T134)
          add   s7, s6, s5              
                                  # T137 = LOAD T136, 0
          lw    s8, 0(s7)               
                                  # ý
          li    s9, 199                 
                                  # T139 <- (T137 != T138)
          sub   s10, s8, s9             
          snez  s10, s10                
          beqz  s10, __LL23             
          j     __LL22                  
__LL22:                                 
                                  # 
          li    t0, 1                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL23:                                 
                                  # ý
          li    t0, 0                   
                                  # ý
          li    t1, 1                   
                                  # ý
          li    t2, 2                   
                                  # T144 <- (T141 * T143)
          mul   s1, t0, t2              
                                  # T145 <- (T144 + T142)
          add   s2, s1, t1              
                                  # ý
          li    s3, 4                   
                                  # T147 <- (T145 * T146)
          mul   s4, s2, s3              
                                  # T148 = LOAD_SYMBOL b
          la    s5, b                   
                                  # T149 <- (T148 + T147)
          add   s6, s5, s4              
                                  # T150 = LOAD T149, 0
          lw    s7, 0(s6)               
                                  # ý
          li    s8, 290                 
                                  # T152 <- (T150 != T151)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL25              
          j     __LL24                  
__LL24:                                 
                                  # 
          li    t0, 2                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL25:                                 
                                  # ý
          li    t0, 1                   
                                  # ý
          li    t1, 0                   
                                  # ý
          li    t2, 2                   
                                  # T157 <- (T154 * T156)
          mul   s1, t0, t2              
                                  # T158 <- (T157 + T155)
          add   s2, s1, t1              
                                  # ý
          li    s3, 4                   
                                  # T160 <- (T158 * T159)
          mul   s4, s2, s3              
                                  # T161 = LOAD_SYMBOL b
          la    s5, b                   
                                  # T162 <- (T161 + T160)
          add   s6, s5, s4              
                                  # T163 = LOAD T162, 0
          lw    s7, 0(s6)               
                                  # ý
          li    s8, 435                 
                                  # T165 <- (T163 != T164)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL27              
          j     __LL26                  
__LL26:                                 
                                  # 
          li    t0, 3                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL27:                                 
                                  # ý
          li    t0, 1                   
                                  # ý
          li    t1, 1                   
                                  # ý
          li    t2, 2                   
                                  # T170 <- (T167 * T169)
          mul   s1, t0, t2              
                                  # T171 <- (T170 + T168)
          add   s2, s1, t1              
                                  # ý
          li    s3, 4                   
                                  # T173 <- (T171 * T172)
          mul   s4, s2, s3              
                                  # T174 = LOAD_SYMBOL b
          la    s5, b                   
                                  # T175 <- (T174 + T173)
          add   s6, s5, s4              
                                  # T176 = LOAD T175, 0
          lw    s7, 0(s6)               
                                  # ý
          li    s8, 634                 
                                  # T178 <- (T176 != T177)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL29              
          j     __LL28                  
__LL28:                                 
                                  # 
          li    t0, 4                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL29:                                 
                                  # ý
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
