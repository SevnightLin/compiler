          .text                         
          .globl main                   
          .align 2                      

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -16             
__LL0:                                  
                                  # T0 = ALLOC 120
          addi  sp, sp, -120            
          mv    t0, sp                  
                                  # þ
          li    t1, 0                   
                                  # þ
          li    t2, 4                   
                                  # T3 <- (T1 * T2)
          mul   s1, t1, t2              
                                  # þ
          li    s2, 0                   
                                  # T5 <- (T0 + T3)
          add   s3, t0, s1              
                                  # STORE T4 -> T5, 0
          sw    s2, 0(s3)               
                                  # þ
          li    s4, 1                   
                                  # þ
          li    s5, 4                   
                                  # T8 <- (T6 * T7)
          mul   s6, s4, s5              
                                  # þ
          li    s7, 1                   
                                  # T10 <- (T0 + T8)
          add   s8, t0, s6              
                                  # STORE T9 -> T10, 0
          sw    s7, 0(s8)               
                                  # þ
          li    s9, 2                   
                                  # þ
          mv    s10, s9                 
                                  # þ
          li    s11, 30                 
                                  # T14 <- (T13 > T11)
          sgt   t3, s11,s10             
                                  # (save modified registers before control flow changes)
          sw    t0, -16(fp)             # spill T0 from t0 to (fp-16)
          sw    s10, -12(fp)            # spill T11 from s10 to (fp-12)
          beqz  t3, __LL2               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 4                   
                                  # T16 <- (T11 * T15)
          lw    t1, -12(fp)             # load T11 from (fp-12) into t1
          mul   t2, t1, t0              
                                  # 
          li    s1, 2                   
                                  # T18 <- (T11 - T17)
          sub   s2, t1, s1              
                                  # 
          li    s3, 4                   
                                  # T20 <- (T18 * T19)
          mul   s4, s2, s3              
                                  # T21 <- (T0 + T20)
          lw    s5, -16(fp)             # load T0 from (fp-16) into s5
          add   s6, s5, s4              
                                  # T22 = LOAD T21, 0
          lw    s7, 0(s6)               
                                  # 
          li    s8, 1                   
                                  # T24 <- (T11 - T23)
          sub   s9, t1, s8              
                                  # 
          li    s10, 4                  
                                  # T26 <- (T24 * T25)
          mul   s11, s9, s10            
                                  # T27 <- (T0 + T26)
          add   t3, s5, s11             
                                  # T28 = LOAD T27, 0
          lw    t4, 0(t3)               
                                  # T29 <- (T22 + T28)
          add   t5, s7, t4              
                                  # T30 <- (T0 + T16)
          add   t6, s5, t2              
                                  # STORE T29 -> T30, 0
          sw    t5, 0(t6)               
                                  # 
          li    t0, 1                   
                                  # T32 <- (T11 + T31)
          add   t2, t1, t0              
                                  # 
          mv    t1, t2                  
                                  # 
          li    t0, 30                  
                                  # T34 <- (T33 > T11)
          sgt   t2, t0,t1               
                                  # (save modified registers before control flow changes)
          sw    t1, -12(fp)             # spill T11 from t1 to (fp-12)
          beqz  t2, __LL2               
          j     __LL1                   
__LL2:                                  
                                  # þ
          li    t0, 2                   
                                  # þ
          li    t1, 4                   
                                  # T37 <- (T35 * T36)
          mul   t2, t0, t1              
                                  # T38 <- (T0 + T37)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T39 = LOAD T38, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 1                   
                                  # T41 <- (T39 != T40)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL4               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 2                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL4:                                  
                                  # þ
          li    t0, 3                   
                                  # þ
          li    t1, 4                   
                                  # T45 <- (T43 * T44)
          mul   t2, t0, t1              
                                  # T46 <- (T0 + T45)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T47 = LOAD T46, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 2                   
                                  # T49 <- (T47 != T48)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL6               
          j     __LL5                   
__LL5:                                  
                                  # 
          li    t0, 3                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL6:                                  
                                  # þ
          li    t0, 4                   
                                  # þ
          li    t1, 4                   
                                  # T53 <- (T51 * T52)
          mul   t2, t0, t1              
                                  # T54 <- (T0 + T53)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T55 = LOAD T54, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 3                   
                                  # T57 <- (T55 != T56)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL8               
          j     __LL7                   
__LL7:                                  
                                  # 
          li    t0, 4                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL8:                                  
                                  # þ
          li    t0, 5                   
                                  # þ
          li    t1, 4                   
                                  # T61 <- (T59 * T60)
          mul   t2, t0, t1              
                                  # T62 <- (T0 + T61)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T63 = LOAD T62, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 5                   
                                  # T65 <- (T63 != T64)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL10              
          j     __LL9                   
__LL9:                                  
                                  # 
          li    t0, 5                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL10:                                 
                                  # þ
          li    t0, 6                   
                                  # þ
          li    t1, 4                   
                                  # T69 <- (T67 * T68)
          mul   t2, t0, t1              
                                  # T70 <- (T0 + T69)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T71 = LOAD T70, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 8                   
                                  # T73 <- (T71 != T72)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL12              
          j     __LL11                  
__LL11:                                 
                                  # 
          li    t0, 6                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL12:                                 
                                  # þ
          li    t0, 7                   
                                  # þ
          li    t1, 4                   
                                  # T77 <- (T75 * T76)
          mul   t2, t0, t1              
                                  # T78 <- (T0 + T77)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T79 = LOAD T78, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 13                  
                                  # T81 <- (T79 != T80)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL14              
          j     __LL13                  
__LL13:                                 
                                  # 
          li    t0, 7                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL14:                                 
                                  # þ
          li    t0, 8                   
                                  # þ
          li    t1, 4                   
                                  # T85 <- (T83 * T84)
          mul   t2, t0, t1              
                                  # T86 <- (T0 + T85)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T87 = LOAD T86, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 21                  
                                  # T89 <- (T87 != T88)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL16              
          j     __LL15                  
__LL15:                                 
                                  # 
          li    t0, 8                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL16:                                 
                                  # þ
          li    t0, 9                   
                                  # þ
          li    t1, 4                   
                                  # T93 <- (T91 * T92)
          mul   t2, t0, t1              
                                  # T94 <- (T0 + T93)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T95 = LOAD T94, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 34                  
                                  # T97 <- (T95 != T96)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL18              
          j     __LL17                  
__LL17:                                 
                                  # 
          li    t0, 9                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL18:                                 
                                  # þ
          li    t0, 10                  
                                  # þ
          li    t1, 4                   
                                  # T101 <- (T99 * T100)
          mul   t2, t0, t1              
                                  # T102 <- (T0 + T101)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T103 = LOAD T102, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 55                  
                                  # T105 <- (T103 != T104)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL20              
          j     __LL19                  
__LL19:                                 
                                  # 
          li    t0, 10                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL20:                                 
                                  # þ
          li    t0, 11                  
                                  # þ
          li    t1, 4                   
                                  # T109 <- (T107 * T108)
          mul   t2, t0, t1              
                                  # T110 <- (T0 + T109)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T111 = LOAD T110, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 89                  
                                  # T113 <- (T111 != T112)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL22              
          j     __LL21                  
__LL21:                                 
                                  # 
          li    t0, 11                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL22:                                 
                                  # þ
          li    t0, 12                  
                                  # þ
          li    t1, 4                   
                                  # T117 <- (T115 * T116)
          mul   t2, t0, t1              
                                  # T118 <- (T0 + T117)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T119 = LOAD T118, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 144                 
                                  # T121 <- (T119 != T120)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL24              
          j     __LL23                  
__LL23:                                 
                                  # 
          li    t0, 12                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL24:                                 
                                  # þ
          li    t0, 13                  
                                  # þ
          li    t1, 4                   
                                  # T125 <- (T123 * T124)
          mul   t2, t0, t1              
                                  # T126 <- (T0 + T125)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T127 = LOAD T126, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 233                 
                                  # T129 <- (T127 != T128)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL26              
          j     __LL25                  
__LL25:                                 
                                  # 
          li    t0, 13                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL26:                                 
                                  # þ
          li    t0, 14                  
                                  # þ
          li    t1, 4                   
                                  # T133 <- (T131 * T132)
          mul   t2, t0, t1              
                                  # T134 <- (T0 + T133)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T135 = LOAD T134, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 377                 
                                  # T137 <- (T135 != T136)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL28              
          j     __LL27                  
__LL27:                                 
                                  # 
          li    t0, 14                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL28:                                 
                                  # þ
          li    t0, 15                  
                                  # þ
          li    t1, 4                   
                                  # T141 <- (T139 * T140)
          mul   t2, t0, t1              
                                  # T142 <- (T0 + T141)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T143 = LOAD T142, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 610                 
                                  # T145 <- (T143 != T144)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL30              
          j     __LL29                  
__LL29:                                 
                                  # 
          li    t0, 15                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL30:                                 
                                  # þ
          li    t0, 16                  
                                  # þ
          li    t1, 4                   
                                  # T149 <- (T147 * T148)
          mul   t2, t0, t1              
                                  # T150 <- (T0 + T149)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T151 = LOAD T150, 0
          lw    s3, 0(s2)               
                                  # þ
          li    s4, 987                 
                                  # T153 <- (T151 != T152)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL32              
          j     __LL31                  
__LL31:                                 
                                  # 
          li    t0, 16                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL32:                                 
                                  # þ
          li    t0, 17                  
                                  # þ
          li    t1, 4                   
                                  # T157 <- (T155 * T156)
          mul   t2, t0, t1              
                                  # T158 <- (T0 + T157)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T159 = LOAD T158, 0
          lw    s3, 0(s2)               
                                  # T160 <- 1597
          li    s4, 1597                
                                  # T161 <- (T159 != T160)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL34              
          j     __LL33                  
__LL33:                                 
                                  # 
          li    t0, 17                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL34:                                 
                                  # þ
          li    t0, 18                  
                                  # þ
          li    t1, 4                   
                                  # T165 <- (T163 * T164)
          mul   t2, t0, t1              
                                  # T166 <- (T0 + T165)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T167 = LOAD T166, 0
          lw    s3, 0(s2)               
                                  # T168 <- 2584
          li    s4, 2584                
                                  # T169 <- (T167 != T168)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL36              
          j     __LL35                  
__LL35:                                 
                                  # 
          li    t0, 18                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL36:                                 
                                  # þ
          li    t0, 19                  
                                  # þ
          li    t1, 4                   
                                  # T173 <- (T171 * T172)
          mul   t2, t0, t1              
                                  # T174 <- (T0 + T173)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T175 = LOAD T174, 0
          lw    s3, 0(s2)               
                                  # T176 <- 4181
          li    s4, 4181                
                                  # T177 <- (T175 != T176)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL38              
          j     __LL37                  
__LL37:                                 
                                  # 
          li    t0, 19                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL38:                                 
                                  # þ
          li    t0, 20                  
                                  # þ
          li    t1, 4                   
                                  # T181 <- (T179 * T180)
          mul   t2, t0, t1              
                                  # T182 <- (T0 + T181)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T183 = LOAD T182, 0
          lw    s3, 0(s2)               
                                  # T184 <- 6765
          li    s4, 6765                
                                  # T185 <- (T183 != T184)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL40              
          j     __LL39                  
__LL39:                                 
                                  # 
          li    t0, 20                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL40:                                 
                                  # þ
          li    t0, 21                  
                                  # þ
          li    t1, 4                   
                                  # T189 <- (T187 * T188)
          mul   t2, t0, t1              
                                  # T190 <- (T0 + T189)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T191 = LOAD T190, 0
          lw    s3, 0(s2)               
                                  # T192 <- 10946
          li    s4, 10946               
                                  # T193 <- (T191 != T192)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL42              
          j     __LL41                  
__LL41:                                 
                                  # 
          li    t0, 21                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL42:                                 
                                  # þ
          li    t0, 22                  
                                  # þ
          li    t1, 4                   
                                  # T197 <- (T195 * T196)
          mul   t2, t0, t1              
                                  # T198 <- (T0 + T197)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T199 = LOAD T198, 0
          lw    s3, 0(s2)               
                                  # T200 <- 17711
          li    s4, 17711               
                                  # T201 <- (T199 != T200)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL44              
          j     __LL43                  
__LL43:                                 
                                  # 
          li    t0, 22                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL44:                                 
                                  # þ
          li    t0, 23                  
                                  # þ
          li    t1, 4                   
                                  # T205 <- (T203 * T204)
          mul   t2, t0, t1              
                                  # T206 <- (T0 + T205)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T207 = LOAD T206, 0
          lw    s3, 0(s2)               
                                  # T208 <- 28657
          li    s4, 28657               
                                  # T209 <- (T207 != T208)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL46              
          j     __LL45                  
__LL45:                                 
                                  # 
          li    t0, 23                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL46:                                 
                                  # þ
          li    t0, 24                  
                                  # þ
          li    t1, 4                   
                                  # T213 <- (T211 * T212)
          mul   t2, t0, t1              
                                  # T214 <- (T0 + T213)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T215 = LOAD T214, 0
          lw    s3, 0(s2)               
                                  # T216 <- 46368
          li    s4, 46368               
                                  # T217 <- (T215 != T216)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL48              
          j     __LL47                  
__LL47:                                 
                                  # 
          li    t0, 24                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL48:                                 
                                  # þ
          li    t0, 25                  
                                  # þ
          li    t1, 4                   
                                  # T221 <- (T219 * T220)
          mul   t2, t0, t1              
                                  # T222 <- (T0 + T221)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T223 = LOAD T222, 0
          lw    s3, 0(s2)               
                                  # T224 <- 75025
          li    s4, 75025               
                                  # T225 <- (T223 != T224)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL50              
          j     __LL49                  
__LL49:                                 
                                  # 
          li    t0, 25                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL50:                                 
                                  # þ
          li    t0, 26                  
                                  # þ
          li    t1, 4                   
                                  # T229 <- (T227 * T228)
          mul   t2, t0, t1              
                                  # T230 <- (T0 + T229)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T231 = LOAD T230, 0
          lw    s3, 0(s2)               
                                  # T232 <- 121393
          li    s4, 121393              
                                  # T233 <- (T231 != T232)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL52              
          j     __LL51                  
__LL51:                                 
                                  # 
          li    t0, 26                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL52:                                 
                                  # þ
          li    t0, 27                  
                                  # þ
          li    t1, 4                   
                                  # T237 <- (T235 * T236)
          mul   t2, t0, t1              
                                  # T238 <- (T0 + T237)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T239 = LOAD T238, 0
          lw    s3, 0(s2)               
                                  # T240 <- 196418
          li    s4, 196418              
                                  # T241 <- (T239 != T240)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL54              
          j     __LL53                  
__LL53:                                 
                                  # 
          li    t0, 27                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL54:                                 
                                  # þ
          li    t0, 28                  
                                  # þ
          li    t1, 4                   
                                  # T245 <- (T243 * T244)
          mul   t2, t0, t1              
                                  # T246 <- (T0 + T245)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T247 = LOAD T246, 0
          lw    s3, 0(s2)               
                                  # T248 <- 317811
          li    s4, 317811              
                                  # T249 <- (T247 != T248)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL56              
          j     __LL55                  
__LL55:                                 
                                  # 
          li    t0, 28                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL56:                                 
                                  # þ
          li    t0, 29                  
                                  # þ
          li    t1, 4                   
                                  # T253 <- (T251 * T252)
          mul   t2, t0, t1              
                                  # T254 <- (T0 + T253)
          lw    s1, -16(fp)             # load T0 from (fp-16) into s1
          add   s2, s1, t2              
                                  # T255 = LOAD T254, 0
          lw    s3, 0(s2)               
                                  # T256 <- 514229
          li    s4, 514229              
                                  # T257 <- (T255 != T256)
          sub   s5, s3, s4              
          snez  s5, s5                  
          beqz  s5, __LL58              
          j     __LL57                  
__LL57:                                 
                                  # 
          li    t0, 29                  
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL58:                                 
                                  # þ
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
