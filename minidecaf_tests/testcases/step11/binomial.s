          .text                         
          .globl main                   
          .align 2                      
          .data                         
          .global C                     
          .size C, 80000                
C:                                      
          .zero 80000                   
          .data                         
          .global P                     
          .size P, 4                    
P:                                      
          .word 10000007                

          .text                         
main:                                   # function entry
          sw    ra, -4(sp)              
          sw    fp, -8(sp)              
          mv    fp, sp                  
          addi  sp, sp, -32             
__LL0:                                  
                                  # ý
          li    t0, 5996                
                                  # ý
          mv    t1, t0                  
                                  # ý
          li    t2, 0                   
                                  # ý
          li    s1, 0                   
                                  # ý
          li    s2, 10000               
                                  # T5 <- (T2 * T4)
          mul   s3, t2, s2              
                                  # T6 <- (T5 + T3)
          add   s4, s3, s1              
                                  # ý
          li    s5, 4                   
                                  # T8 <- (T6 * T7)
          mul   s6, s4, s5              
                                  # ý
          li    s7, 1                   
                                  # T10 = LOAD_SYMBOL C
          la    s8, C                   
                                  # T11 <- (T10 + T8)
          add   s9, s8, s6              
                                  # STORE T9 -> T11, 0
          sw    s7, 0(s9)               
                                  # ý
          li    s10, 0                  
                                  # ý
          mv    s11, s10                
                                  # ý
          li    t3, 1                   
                                  # ý
          mv    t4, t3                  
                                  # T16 <- (T0 <= T14)
          slt   t5, t1,t4               
          seqz  t5, t5                  
                                  # (save modified registers before control flow changes)
          sw    t1, -20(fp)             # spill T0 from t1 to (fp-20)
          sw    s11, -16(fp)            # spill T12 from s11 to (fp-16)
          sw    t4, -12(fp)             # spill T14 from t4 to (fp-12)
          beqz  t5, __LL7               
          j     __LL1                   
__LL1:                                  
                                  # 
          li    t0, 0                   
                                  # 
          mv    t1, t0                  
                                  # T19 <- (T14 <= T17)
          lw    t2, -12(fp)             # load T14 from (fp-12) into t2
          slt   s1, t2,t1               
          seqz  s1, s1                  
                                  # (save modified registers before control flow changes)
          sw    t1, -24(fp)             # spill T17 from t1 to (fp-24)
          beqz  s1, __LL6               
          j     __LL2                   
__LL2:                                  
                                  # 
          li    t0, 1                   
                                  # T21 <- (T20 - T12)
          lw    t1, -16(fp)             # load T12 from (fp-16) into t1
          sub   t2, t0, t1              
                                  # T22 <- 10000
          li    s1, 10000               
                                  # T23 <- (T21 * T22)
          mul   s2, t2, s1              
                                  # T24 <- (T23 + T17)
          lw    s3, -24(fp)             # load T17 from (fp-24) into s3
          add   s4, s2, s3              
                                  # 
          li    s5, 4                   
                                  # T26 <- (T24 * T25)
          mul   s6, s4, s5              
                                  # T27 <- (! T17)
          seqz  s7, s3                  
                                  # (save modified registers before control flow changes)
          sw    s6, -28(fp)             # spill T26 from s6 to (fp-28)
          beqz  s7, __LL4               
          j     __LL3                   
__LL3:                                  
                                  # 
          li    t0, 1                   
                                  # 
          mv    t1, t0                  
                                  # (save modified registers before control flow changes)
          sw    t1, -32(fp)             # spill T28 from t1 to (fp-32)
          j     __LL5                   
__LL5:                                  
                                  # T52 = LOAD_SYMBOL C
          la    t0, C                   
                                  # T53 <- (T52 + T26)
          lw    t1, -28(fp)             # load T26 from (fp-28) into t1
          add   t2, t0, t1              
                                  # STORE T28 -> T53, 0
          lw    s1, -32(fp)             # load T28 from (fp-32) into s1
          sw    s1, 0(t2)               
                                  # 
          li    s2, 1                   
                                  # T55 <- (T17 + T54)
          lw    s3, -24(fp)             # load T17 from (fp-24) into s3
          add   s4, s3, s2              
                                  # 
          mv    s3, s4                  
                                  # T56 <- (T14 <= T17)
          lw    s5, -12(fp)             # load T14 from (fp-12) into s5
          slt   s6, s5,s3               
          seqz  s6, s6                  
                                  # (save modified registers before control flow changes)
          sw    s3, -24(fp)             # spill T17 from s3 to (fp-24)
          beqz  s6, __LL6               
          j     __LL2                   
__LL4:                                  
                                  # T30 <- 10000
          li    t0, 10000               
                                  # T31 <- (T12 * T30)
          lw    t1, -16(fp)             # load T12 from (fp-16) into t1
          mul   t2, t1, t0              
                                  # T32 <- (T31 + T17)
          lw    s1, -24(fp)             # load T17 from (fp-24) into s1
          add   s2, t2, s1              
                                  # ý
          li    s3, 4                   
                                  # T34 <- (T32 * T33)
          mul   s4, s2, s3              
                                  # T35 = LOAD_SYMBOL C
          la    s5, C                   
                                  # T36 <- (T35 + T34)
          add   s6, s5, s4              
                                  # T37 = LOAD T36, 0
          lw    s7, 0(s6)               
                                  # ý
          li    s8, 1                   
                                  # T39 <- (T17 - T38)
          sub   s9, s1, s8              
                                  # T40 <- 10000
          li    s10, 10000              
                                  # T41 <- (T12 * T40)
          mul   s11, t1, s10            
                                  # T42 <- (T41 + T39)
          add   t3, s11, s9             
                                  # ý
          li    t4, 4                   
                                  # T44 <- (T42 * T43)
          mul   t5, t3, t4              
                                  # T45 = LOAD_SYMBOL C
          la    t6, C                   
                                  # T46 <- (T45 + T44)
          add   t0, t6, t5              
                                  # T47 = LOAD T46, 0
          lw    t2, 0(t0)               
                                  # T48 <- (T37 + T47)
          add   t0, s7, t2              
                                  # T49 = LOAD_SYMBOL P
          la    t2, P                   
                                  # T50 = LOAD T49, 0
          lw    s2, 0(t2)               
                                  # T51 <- (T48 % T50)
          rem   t2, t0, s2              
                                  # ý
          mv    t0, t2                  
                                  # (save modified registers before control flow changes)
          sw    t0, -32(fp)             # spill T28 from t0 to (fp-32)
          j     __LL5                   
__LL6:                                  
                                  # ý
          li    t0, 1                   
                                  # T58 <- (T57 - T12)
          lw    t1, -16(fp)             # load T12 from (fp-16) into t1
          sub   t2, t0, t1              
                                  # ý
          mv    t1, t2                  
                                  # ý
          li    s1, 1                   
                                  # T60 <- (T14 + T59)
          lw    s2, -12(fp)             # load T14 from (fp-12) into s2
          add   s3, s2, s1              
                                  # ý
          mv    s2, s3                  
                                  # T61 <- (T0 <= T14)
          lw    s4, -20(fp)             # load T0 from (fp-20) into s4
          slt   s5, s4,s2               
          seqz  s5, s5                  
                                  # (save modified registers before control flow changes)
          sw    t1, -16(fp)             # spill T12 from t1 to (fp-16)
          sw    s2, -12(fp)             # spill T14 from s2 to (fp-12)
          beqz  s5, __LL7               
          j     __LL1                   
__LL7:                                  
                                  # ý
          li    t0, 0                   
                                  # T63 <- 10000
          li    t1, 10000               
                                  # T64 <- (T12 * T63)
          lw    t2, -16(fp)             # load T12 from (fp-16) into t2
          mul   s1, t2, t1              
                                  # T65 <- (T64 + T62)
          add   s2, s1, t0              
                                  # ý
          li    s3, 4                   
                                  # T67 <- (T65 * T66)
          mul   s4, s2, s3              
                                  # T68 = LOAD_SYMBOL C
          la    s5, C                   
                                  # T69 <- (T68 + T67)
          add   s6, s5, s4              
                                  # T70 = LOAD T69, 0
          lw    s7, 0(s6)               
                                  # ý
          li    s8, 1                   
                                  # T72 <- (T70 != T71)
          sub   s9, s7, s8              
          snez  s9, s9                  
                                  # T73 <- 10000
          li    s10, 10000              
                                  # T74 <- (T12 * T73)
          mul   s11, t2, s10            
                                  # T75 <- (T74 + T0)
          lw    t3, -20(fp)             # load T0 from (fp-20) into t3
          add   t4, s11, t3             
                                  # ý
          li    t5, 4                   
                                  # T77 <- (T75 * T76)
          mul   t6, t4, t5              
                                  # T78 = LOAD_SYMBOL C
          la    t0, C                   
                                  # T79 <- (T78 + T77)
          add   t1, t0, t6              
                                  # T80 = LOAD T79, 0
          lw    t0, 0(t1)               
                                  # ý
          li    t1, 1                   
                                  # T82 <- (T80 != T81)
          sub   s1, t0, t1              
          snez  s1, s1                  
                                  # T83 <- (T72 || T82)
          or    t0, s9,s1
          snez  t0, t0
                                  # ý
          li    t1, 1                   
                                  # T85 <- (T84 - T12)
          sub   s1, t1, t2              
                                  # ý
          li    t1, 1                   
                                  # T87 <- 10000
          li    s2, 10000               
                                  # T88 <- (T85 * T87)
          mul   s3, s1, s2              
                                  # T89 <- (T88 + T86)
          add   s1, s3, t1              
                                  # ý
          li    t1, 4                   
                                  # T91 <- (T89 * T90)
          mul   s2, s1, t1              
                                  # T92 = LOAD_SYMBOL C
          la    t1, C                   
                                  # T93 <- (T92 + T91)
          add   s1, t1, s2              
                                  # T94 = LOAD T93, 0
          lw    t1, 0(s1)               
                                  # ý
          li    s1, 1                   
                                  # T96 <- (T0 - T95)
          sub   s2, t3, s1              
                                  # T97 <- (T94 != T96)
          sub   s1, t1, s2              
          snez  s1, s1                  
                                  # T98 <- (T83 || T97)
          or    t1, t0,s1
          snez  t1, t1
          beqz  t1, __LL9               
          j     __LL8                   
__LL8:                                  
                                  # 
          li    t0, 1                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL9:                                  
                                  # T100 <- 1234
          li    t0, 1234                
                                  # T101 <- 10000
          li    t1, 10000               
                                  # T102 <- (T12 * T101)
          lw    t2, -16(fp)             # load T12 from (fp-16) into t2
          mul   s1, t2, t1              
                                  # T103 <- (T102 + T100)
          add   s2, s1, t0              
                                  # ý
          li    s3, 4                   
                                  # T105 <- (T103 * T104)
          mul   s4, s2, s3              
                                  # T106 = LOAD_SYMBOL C
          la    s5, C                   
                                  # T107 <- (T106 + T105)
          add   s6, s5, s4              
                                  # T108 = LOAD T107, 0
          lw    s7, 0(s6)               
                                  # T109 <- 6188476
          li    s8, 6188476             
                                  # T110 <- (T108 != T109)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL11              
          j     __LL10                  
__LL10:                                 
                                  # 
          li    t0, 2                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL11:                                 
                                  # T112 <- 2333
          li    t0, 2333                
                                  # T113 <- 10000
          li    t1, 10000               
                                  # T114 <- (T12 * T113)
          lw    t2, -16(fp)             # load T12 from (fp-16) into t2
          mul   s1, t2, t1              
                                  # T115 <- (T114 + T112)
          add   s2, s1, t0              
                                  # ý
          li    s3, 4                   
                                  # T117 <- (T115 * T116)
          mul   s4, s2, s3              
                                  # T118 = LOAD_SYMBOL C
          la    s5, C                   
                                  # T119 <- (T118 + T117)
          add   s6, s5, s4              
                                  # T120 = LOAD T119, 0
          lw    s7, 0(s6)               
                                  # T121 <- 9957662
          li    s8, 9957662             
                                  # T122 <- (T120 != T121)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL13              
          j     __LL12                  
__LL12:                                 
                                  # 
          li    t0, 3                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL13:                                 
                                  # T124 <- 3456
          li    t0, 3456                
                                  # T125 <- 10000
          li    t1, 10000               
                                  # T126 <- (T12 * T125)
          lw    t2, -16(fp)             # load T12 from (fp-16) into t2
          mul   s1, t2, t1              
                                  # T127 <- (T126 + T124)
          add   s2, s1, t0              
                                  # ý
          li    s3, 4                   
                                  # T129 <- (T127 * T128)
          mul   s4, s2, s3              
                                  # T130 = LOAD_SYMBOL C
          la    s5, C                   
                                  # T131 <- (T130 + T129)
          add   s6, s5, s4              
                                  # T132 = LOAD T131, 0
          lw    s7, 0(s6)               
                                  # T133 <- 9832509
          li    s8, 9832509             
                                  # T134 <- (T132 != T133)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL15              
          j     __LL14                  
__LL14:                                 
                                  # 
          li    t0, 4                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL15:                                 
                                  # T136 <- 5678
          li    t0, 5678                
                                  # T137 <- 10000
          li    t1, 10000               
                                  # T138 <- (T12 * T137)
          lw    t2, -16(fp)             # load T12 from (fp-16) into t2
          mul   s1, t2, t1              
                                  # T139 <- (T138 + T136)
          add   s2, s1, t0              
                                  # ý
          li    s3, 4                   
                                  # T141 <- (T139 * T140)
          mul   s4, s2, s3              
                                  # T142 = LOAD_SYMBOL C
          la    s5, C                   
                                  # T143 <- (T142 + T141)
          add   s6, s5, s4              
                                  # T144 = LOAD T143, 0
          lw    s7, 0(s6)               
                                  # T145 <- 2436480
          li    s8, 2436480             
                                  # T146 <- (T144 != T145)
          sub   s9, s7, s8              
          snez  s9, s9                  
          beqz  s9, __LL17              
          j     __LL16                  
__LL16:                                 
                                  # 
          li    t0, 5                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL17:                                 
                                  # ý
          li    t0, 2                   
                                  # T149 <- (T0 / T148)
          lw    t1, -20(fp)             # load T0 from (fp-20) into t1
          div   t2, t1, t0              
                                  # T150 <- 10000
          li    s1, 10000               
                                  # T151 <- (T12 * T150)
          lw    s2, -16(fp)             # load T12 from (fp-16) into s2
          mul   s3, s2, s1              
                                  # T152 <- (T151 + T149)
          add   s4, s3, t2              
                                  # ý
          li    s5, 4                   
                                  # T154 <- (T152 * T153)
          mul   s6, s4, s5              
                                  # T155 = LOAD_SYMBOL C
          la    s7, C                   
                                  # T156 <- (T155 + T154)
          add   s8, s7, s6              
                                  # T157 = LOAD T156, 0
          lw    s9, 0(s8)               
                                  # T158 <- 7609783
          li    s10, 7609783            
                                  # T159 <- (T157 != T158)
          sub   s11, s9, s10            
          snez  s11, s11                
          beqz  s11, __LL19             
          j     __LL18                  
__LL18:                                 
                                  # 
          li    t0, 6                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
__LL19:                                 
                                  # ý
          li    t0, 0                   
          mv    a0, t0                  
          mv    sp, fp                  
          lw    ra, -4(fp)              
          lw    fp, -8(fp)              
          ret                           
