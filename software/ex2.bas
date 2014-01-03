 1000 A = 2000: GOTO 20: REM ** YAHTZEE **
 1010 GOSUB 100
 1020 PRINT "This is an electronic  YAHTZEE."
 1030 PRINT "You may throw the dice a maximum of "
 1040 PRINT "three times just as in "
 1050 PRINT "the <real> Yahtzee."
 1060 PRINT : PRINT "You get a bonus of 35 points"
 1070 PRINT "IF   you score more than 63 points"
 1080 PRINT "in the left-hand  column (this appears"
 1090 PRINT "auto matically). You receive 100 extra"
 1100 PRINT "points for each extra YAHTZEE."
 1110 PRINT : PRINT "WARNING!"
 1120 PRINT "You DO NOT have to press <RETURN> (OR "
 1130 PRINT "whatever it's called on your machine)."
 1140 PRINT "So be careful which key you press."
 1150 PRINT "There is no second chance!"
 1160 PRINT "The Chip-Shop crew have done this TO "
 1170 PRINT "speed up the game."
 1180 PRINT : PRINT "to continue, press <SPACEBAR> ";
 1190 GOSUB 210: IF IN$ <> " " THEN 1190
 1200 REM
 1210 REM
 1220 REM SWITCH THE CURSOR  OFF
 1230 REM HERE IF POSSIBLE
 1240 RC = 175
 1250 DIM W$(6), A$(6), D$(15)
 1260 DIM N(13), NN(7), W(6), A(13)
 1270 PR = 0: BO = 0: GOSUB 100
 1280 AA = 0: BB = 0: CC = 0: DD = 0: EE = 0: FF = 0: GG = 0
 1290 M7 = 0: M8 = 0: M9 = 0: MA = 0: MB = 0: MC = 0: MD = 0
 1300 N1 = 0: N2 = 0: N3 = 0: N4 = 0: N5 = 0: N6 = 0
 1310 N7 = 0: N8 = 0: N9 = 0: NA = 0: NB = 0: NC = 0: ND = 0
 1320 A$(1) = "   "
 1330 A$(2) = "*  "
 1340 A$(3) = " * "
 1350 A$(4) = "  *"
 1360 A$(5) = "* *"
 1370 REM
 1380 HO = 12: VE = 1: GOSUB 110: PRINT "Y A H T Z E E"
 1390 HO = 11: VE = 23: GOSUB 110: PRINT "Record "; RC; " points";
 1400 HO = 0: VE = 10: GOSUB 110
 1410 PRINT "***  Press <SPACEBAR> TO  start  *** ";
 1420 GOSUB 210: IF IN$ <> " " THEN 1420
 1430 HO = 0: VE = 10: GOSUB 110
 1440 PRINT "                                       "
 1450 REM  FIRST THROW
 1460 GOSUB 2000
 1470 FOR K = 1 TO 2
 1480   HO = 0: VE = 10: GOSUB 110
 1490   PRINT "How many shall I throw again (0-5) ? ";
 1500   GOSUB 210: IF ASC(IN$) < 48 OR ASC(IN$) > 53 THEN 1500
 1510   GOSUB 110: PRINT "                                       "
 1520   H = VAL(IN$): IF H = 0 THEN K = 2: GOTO 1720
 1530   IF H > 0 THEN HO = 0: VE = 8: GOSUB 110: PRINT "("; H; ")"
 1540   IF H = 5 THEN W(1) = 1: W(2) = 2: W(3) = 3: W(4) = 4: W(5) = 5
 1550   IF H = 5 THEN GOSUB 2000: GOTO 1720
 1560   HO = 7: VE = 10: GOSUB 110
 1570   PRINT "Which die (1-5) ?";
 1580   FOR X = 1 TO H
 1590     GOSUB 210: W$(X) = IN$
 1600     IF ASC(IN$) < 49 OR ASC(IN$) > 53 THEN 1590
 1610     W(X) = VAL(W$(X))
 1620     HO = 7 + 6 * (W(X) - 1): VE = 8: GOSUB 110: PRINT W$(X)
 1630   NEXT X
 1640   REM
 1650   FOR X = 1 TO H
 1660     IF W(X) = 1 THEN HO = 6: GOSUB 2300
 1670     IF W(X) = 2 THEN HO = 12: GOSUB 2300
 1680     IF W(X) = 3 THEN HO = 18: GOSUB 2300
 1690     IF W(X) = 4 THEN HO = 24: GOSUB 2300
 1700     IF W(X) = 5 THEN HO = 30: GOSUB 2300
 1710   NEXT X
 1720   HO = 0: VE = 8: GOSUB 110
 1730   PRINT "                                      "
 1740 NEXT K
 1750 GOSUB 4000
 1760 IF IN$ = "1" THEN GOSUB 5000
 1770 IF IN$ = "2" THEN GOSUB 5500
 1780 IF IN$ = "3" THEN GOSUB 6000
 1790 IF IN$ = "4" THEN GOSUB 6500
 1800 IF IN$ = "5" THEN GOSUB 7000
 1810 IF IN$ = "6" THEN GOSUB 7500
 1820 IF IN$ = "D" OR IN$ = "d" THEN GOSUB 8000
 1830 IF IN$ = "V" OR IN$ = "v" THEN GOSUB 8500
 1840 IF IN$ = "K" OR IN$ = "k" THEN GOSUB 9000
 1850 IF IN$ = "G" OR IN$ = "g" THEN GOSUB 9500
 1860 IF IN$ = "F" OR IN$ = "f" THEN GOSUB 10000
 1870 IF IN$ = "Y" OR IN$ = "y" THEN GOSUB 10500
 1880 IF IN$ = "C" OR IN$ = "c" THEN GOSUB 11000
 1890 IF AA + BB + CC + DD + EE + FF >= 63 THEN BO = 35
 1900 IF BO = 35 THEN HO = 14: VE = 19: GOSUB 110: PRINT BO
 1910 TL = 0
 1920 IF N1 = 1 AND N2 = 1 AND N3 = 1 AND N4 = 1 THEN TL = TL + 1
 1930 IF N5 = 1 AND N6 = 1 AND N7 = 1 AND N8 = 1 THEN TL = TL + 1
 1940 IF N9 = 1 AND NA = 1 AND NB = 1 AND NC = 1 THEN TL = TL + 1
 1950 IF ND = 1 THEN TL = TL + 1
 1960 IF TL = 4 THEN 1980
 1970 GOTO 1460
 1980 GOSUB 12000
 1990 END
 2000 REM  FIVE DICE THROW
 2010 REM
 2020 FOR WS = 1 TO 15 STEP 3
 2030   GOSUB 260: GOSUB 3000
 2040 NEXT WS
 2050 N = 0
 2060 FOR HO = 6 TO 30 STEP 6
 2070   FOR VE = 4 TO 6
 2080     N = N + 1: GOSUB 110: PRINT D$(N)
 2090   NEXT VE: NEXT HO
 2100 RETURN
 2300 REM  X DICE AGAIN
 2310 GOSUB 260
 2320 WS = W(X) * 3 - 2
 2330 GOSUB 3000
 2340 WS = W(X) * 3 - 3
 2350 FOR VE = 4 TO 6: WS = WS + 1: GOSUB 110: PRINT D$(WS)
 2360 NEXT VE: RETURN
 3000 REM  ROLLING OF THE DOUBLE
 3010 IF RV > 1 / 6 THEN 3030
 3015 A(WS) = 1
 3020 D$(WS) = A$(1): D$(WS + 1) = A$(3): D$(WS + 2) = A$(1): GOTO 3150
 3030 IF RV > 2 / 6 THEN 3050
 3035 A(WS) = 2
 3040 D$(WS) = A$(4): D$(WS + 1) = A$(1): D$(WS + 2) = A$(2): GOTO 3150
 3050 IF RV > 3 / 6 THEN 3070
 3055 A(WS) = 3
 3060 D$(WS) = A$(2): D$(WS + 1) = A$(3): D$(WS + 2) = A$(4): GOTO 3150
 3070 IF RV > 4 / 6 THEN 3090
 3075 A(WS) = 4
 3080 D$(WS) = A$(5): D$(WS + 1) = A$(1): D$(WS + 2) = A$(5): GOTO 3150
 3090 IF RV > 5 / 6 THEN 3110
 3095 A(WS) = 5
 3100 D$(WS) = A$(5): D$(WS + 1) = A$(3): D$(WS + 2) = A$(5): GOTO 3150
 3110 D$(WS) = A$(5): D$(WS + 1) = A$(5): D$(WS + 2) = A$(5)
 3115 A(WS) = 6
 3150 A = A(1): B = A(4): C = A(7): D = A(10): E = A(13): RETURN
 4000 HO = 4: VE = 10: GOSUB 110
 4010 PRINT "Where will you fill in the scOR e ?  "
 4020 HO = 0: VE = 13: GOSUB 110: PRINT "(1) Ones"
 4030 HO = 0: VE = 14: GOSUB 110: PRINT "(2) Twos"
 4040 HO = 0: VE = 15: GOSUB 110: PRINT "(3) Threes"
 4050 HO = 0: VE = 16: GOSUB 110: PRINT "(4) Fours"
 4060 HO = 0: VE = 17: GOSUB 110: PRINT "(5) Fives"
 4070 HO = 0: VE = 18: GOSUB 110: PRINT "(6) Sixes "
 4080 HO = 0: VE = 19: GOSUB 110: PRINT "    Bonus"
 4090 HO = 18: VE = 13: GOSUB 110: PRINT "(D) Three the same"
 4100 HO = 18: VE = 14: GOSUB 110: PRINT "(V) Four the same"
 4110 HO = 18: VE = 15: GOSUB 110: PRINT "(K) Small Street"
 4120 HO = 18: VE = 16: GOSUB 110: PRINT "(G) Large Street"
 4130 HO = 18: VE = 17: GOSUB 110: PRINT "(F) Full house"
 4140 HO = 18: VE = 18: GOSUB 110: PRINT "(Y) Yahtzee"
 4150 HO = 18: VE = 19: GOSUB 110: PRINT "(C) Choice"
 4160 GOSUB 210: TE = 0
 4170 IF IN$ <> "1" AND IN$ <> "2" AND IN$ <> "3" THEN TE = TE + 1
 4180 IF IN$ <> "4" AND IN$ <> "5" AND IN$ <> "6" THEN TE = TE + 1
 4190 IF IN$ <> "D" AND IN$ <> "V" AND IN$ <> "K" THEN TE = TE + 1
 4200 IF IN$ <> "G" AND IN$ <> "F" AND IN$ <> "Y" THEN TE = TE + 1
 4210 IF IN$ <> "C" THEN TE = TE + 1
 4220 IF TE = 5 THEN 4160
 4230 RETURN
 5000 REM   ONES
 5010 IF N1 = 1 THEN 1750
 5020 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 5030 IF A = 1 THEN AA = AA + 1
 5040 IF B = 1 THEN AA = AA + 1
 5050 IF C = 1 THEN AA = AA + 1
 5060 IF D = 1 THEN AA = AA + 1
 5070 IF E = 1 THEN AA = AA + 1
 5080 HO = 14: VE = 13: GOSUB 110: PRINT AA
 5090 N1 = 1
 5100 RETURN
 5500 REM   TWOS
 5510 IF N2 = 1 THEN 1750
 5520 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 5530 IF A = 2 THEN BB = BB + 2
 5540 IF B = 2 THEN BB = BB + 2
 5550 IF C = 2 THEN BB = BB + 2
 5560 IF D = 2 THEN BB = BB + 2
 5570 IF E = 2 THEN BB = BB + 2
 5580 HO = 14: VE = 14: GOSUB 110: PRINT BB
 5590 N2 = 1
 5600 RETURN
 6000 REM   THREES
 6010 IF N3 = 1 THEN 1750
 6020 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 6030 IF A = 3 THEN CC = CC + 3
 6040 IF B = 3 THEN CC = CC + 3
 6050 IF C = 3 THEN CC = CC + 3
 6060 IF D = 3 THEN CC = CC + 3
 6070 IF E = 3 THEN CC = CC + 3
 6080 HO = 14: VE = 15: GOSUB 110: PRINT CC
 6090 N3 = 1
 6100 RETURN
 6500 REM   FOURS
 6510 IF N4 = 1 THEN 1750
 6520 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 6530 IF A = 4 THEN DD = DD + 4
 6540 IF B = 4 THEN DD = DD + 4
 6550 IF C = 4 THEN DD = DD + 4
 6560 IF D = 4 THEN DD = DD + 4
 6570 IF E = 4 THEN DD = DD + 4
 6580 HO = 14: VE = 16: GOSUB 110: PRINT DD
 6590 N4 = 1
 6600 RETURN
 7000 REM   FIVES
 7010 IF N5 = 1 THEN 1750
 7020 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 7030 IF A = 5 THEN EE = EE + 5
 7040 IF B = 5 THEN EE = EE + 5
 7050 IF C = 5 THEN EE = EE + 5
 7060 IF D = 5 THEN EE = EE + 5
 7070 IF E = 5 THEN EE = EE + 5
 7080 HO = 14: VE = 17: GOSUB 110: PRINT EE
 7090 N5 = 1
 7100 RETURN
 7500 REM   SIXES
 7510 IF N6 = 1 THEN 1750
 7520 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 7530 IF A = 6 THEN FF = FF + 6
 7540 IF B = 6 THEN FF = FF + 6
 7550 IF C = 6 THEN FF = FF + 6
 7560 IF D = 6 THEN FF = FF + 6
 7570 IF E = 6 THEN FF = FF + 6
 7580 HO = 14: VE = 18: GOSUB 110: PRINT FF
 7590 N6 = 1
 7600 RETURN
 8000 REM THREE THE SAME
 8010 NN(1) = 0: NN(2) = 0: NN(3) = 0: NN(4) = 0: NN(5) = 0: NN(6) = 0
 8020 IF N7 = 1 THEN 1750
 8030 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 8040 FOR I = 1 TO 6: GOSUB 13000: NEXT I
 8050 TR = 0
 8060 IF NN(1) < 3 AND NN(2) < 3 AND NN(3) < 3 THEN TR = TR + 1
 8070 IF NN(4) < 3 AND NN(5) < 3 AND NN(6) < 3 THEN TR = TR + 1
 8080 IF TR < 2 THEN M7 = A + B + C + D + E
 8090 HO = 37: VE = 13: GOSUB 110: PRINT M7
 8100 N7 = 1
 8110 RETURN
 8500 REM  FOUR THE SAME
 8510 NN(1) = 0: NN(2) = 0: NN(3) = 0: NN(4) = 0: NN(5) = 0: NN(6) = 0
 8520 IF N8 = 1 THEN 1750
 8530 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
 8540 FOR I = 1 TO 6: GOSUB 13000: NEXT I
 8550 TR = 0
 8560 IF NN(1) < 4 AND NN(2) < 4 AND NN(3) < 4 THEN TR = TR + 1
 8570 IF NN(4) < 4 AND NN(5) < 4 AND NN(6) < 4 THEN TR = TR + 1
 8580 IF TR < 2 THEN M8 = A + B + C + D + E
 8590 HO = 37: VE = 14: GOSUB 110: PRINT M8
 8600 N8 = 1
 8610 RETURN
 9000 REM   SMALL STREET
 9010 NN(1) = 0: NN(2) = 0: NN(3) = 0: NN(4) = 0: NN(5) = 0: NN(6) = 0
 9020 IF N9 = 1 THEN 1750
 9030 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1: M9 = 30
 9040 FOR I = 1 TO 6: GOSUB 13000: NEXT I
 9050 TR = 0
 9060 IF NN(1) >= 1 AND NN(2) >= 1 THEN TR = TR + 1
 9070 IF NN(3) >= 1 AND NN(4) >= 1 THEN TR = TR + 1
 9080 IF TR = 2 THEN M9 = 30
 9090 TR = 0
 9100 IF NN(2) >= 1 AND NN(3) >= 1 THEN TR = TR + 1
 9110 IF NN(4) >= 1 AND NN(5) >= 1 THEN TR = TR + 1
 9120 IF TR = 2 THEN M9 = 30
 9130 TR = 0
 9140 IF NN(3) >= 1 AND NN(4) >= 1 THEN TR = TR + 1
 9150 IF NN(5) >= 1 AND NN(6) >= 1 THEN TR = TR + 1
 9160 IF TR = 2 THEN M9 = 30
 9170 HO = 37: VE = 15: GOSUB 110: PRINT M9
 9180 N9 = 1
 9190 RETURN
 9500 REM   LARGE STREET
 9510 NN(1) = 0: NN(2) = 0: NN(3) = 0: NN(4) = 0: NN(5) = 0: NN(6) = 0
 9520 IF NA = 1 THEN 1750
 9530 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1: MA = 40
 9540 FOR I = 1 TO 6: GOSUB 13000: NEXT I
 9550 TR = 0
 9560 IF NN(1) >= 1 AND NN(2) >= 1 AND NN(3) >= 1 THEN TR = TR + 1
 9570 IF NN(4) >= 1 AND NN(5) >= 1 THEN TR = TR + 1
 9580 IF TR = 2 THEN MA = 40
 9590 TR = 0
 9600 IF NN(2) >= 1 AND NN(3) >= 1 AND NN(4) >= 1 THEN TR = TR + 1
 9610 IF NN(5) >= 1 AND NN(6) >= 1 THEN TR = TR + 1
 9620 IF TR = 2 THEN MA = 40
 9630 HO = 37: VE = 16: GOSUB 110: PRINT MA
 9640 NA = 1
 9650 RETURN
10000 REM   FULL HOUSE
10010 NN(1) = 0: NN(2) = 0: NN(3) = 0: NN(4) = 0: NN(5) = 0: NN(6) = 0
10020 IF NB = 1 THEN 1750
10030 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
10040 FOR I = 1 TO 6: GOSUB 13000: NEXT I
10050 TR = 0: TS = 0
10060 FOR I = 1 TO 6: IF NN(I) = 3 THEN TR = 1
10065 NEXT I
10070 FOR I = 1 TO 6: IF NN(I) = 2 THEN TS = 1
10075 NEXT I
10080 IF TR = 1 AND TS = 1 THEN MB = 25
10090 HO = 37: VE = 17: GOSUB 110: PRINT MB
10100 NB = 1
10110 RETURN
10500 REM    FIVE THE SAME
10510 IF NC = 1 THEN 1750
10520 IF A = B AND B = C AND C = D AND D = E THEN MC = 50
10530 HO = 37: VE = 18: GOSUB 110: PRINT MC
10540 NC = 1
10550 RETURN
11000 REM   CHOICE
11010 IF ND = 1 THEN 1750
11020 IF A = B AND B = C AND C = D AND D = E THEN PR = PR + 1
11030 MD = A + B + C + D + E
11040 HO = 37: VE = 19: GOSUB 110: PRINT MD
11050 ND = 1
11060 RETURN
12000 REM   END
12010 GG = AA + BB + CC + DD + EE + FF + BO + M7 + M8 + M9
12020 GG = GG + MA + MB + MC + MD
12025 IF MC = 50 THEN GG = GG + PR * 100
12030 IF NOT (MC = 50 AND PR > 0) THEN 12050
12040 HO = 11: VE = 21: GOSUB 110: PRINT "Bonus  "; PR * 100; " points"
12050 HO = 11: VE = 22: GOSUB 110: PRINT "TO tal "; GG; " points"
12060 IF GG > RC THEN RC = GG
12070 HO = 0: VE = 10: GOSUB 110
12080 PRINT "       Another game (Y/N) ?          ";
12090 GOSUB 210: IF IN$ = "Y" OR IN$ = "y" THEN 1270
12100 GOSUB 100
12110 HO = 0: VE = 10: GOSUB 110
12120 PRINT "Chip Shop wishing you happy computing."
12130 RETURN
13000 IF A = I THEN NN(I) = NN(I) + 1
13010 IF B = I THEN NN(I) = NN(I) + 1
13020 IF C = I THEN NN(I) = NN(I) + 1
13030 IF D = I THEN NN(I) = NN(I) + 1
13040 IF E = I THEN NN(I) = NN(I) + 1
13050 RETURN
30000 REM *****************************
30010 REM *                           *
30020 REM *          YAHTZEE          *
30030 REM *                           *
30040 REM *      written   by         *
30050 REM *                           *
30060 REM *    Richard van Straten    *
30070 REM *     P. Soutmanlaan 63     *
30080 REM *   1701 MB  Heerhoguwaard  *
30090 REM *   The Netherlands         *
30100 REM *     Translated  by        *
30110 REM *   Jonathan Marks          *
30120 REM *      Hilversum            *
30130 REM *   January 1984            *
30140 REM *                           *
30150 REM *****************************
