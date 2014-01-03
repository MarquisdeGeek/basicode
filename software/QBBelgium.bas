1 REM start GW-BASIC with /f:9
2 REM version 0.2 by V. Reijs
10 GOTO 1000: REM BASICODE-2 versie 1.0, (C) 1987, H. Vosman
20 KEY OFF: CLEAR : OPTION BASE 0: SCREEN 0: CLS : COLOR 7, 0, 0
21 OHT% = 80: OVT% = 24: REM grenzen tekst scherm (80X24), als OHT%=40 dan (40x24)
22 WIDTH OHT%: LOCATE 1, 1, 0
23 SR = 0: SR$ = "": IN$ = " ": CT = 0: CN = 0
24 ON ERROR GOTO 980
25 OX$ = TIME$: RANDOMIZE (VAL(LEFT$(OX$, 2)) + VAL(MID$(OX$, 4, 2)) + VAL(RIGHT$(OX$, 2)))
43 OPRN = 1: REM printing to file
46 IF OPRN = 1 THEN OPEN "Printbas.txt" FOR OUTPUT AS 9
50 GOTO 1010
100 CLS : LOCATE , , 0: RETURN
110 OVE% = INT(VE) + 1: OHO% = INT(HO) + 1
111 IF OVE% > OVT% THEN OVE% = OVT% ELSE IF OVE% < 1 THEN OVE% = 1
112 IF OHO% > OHT% THEN OHO% = OHT% ELSE IF OHO% < 1 THEN OHO% = 1
113 LOCATE OVE%, OHO%, 0: RETURN
120 HO = POS(HO) - 1: VE = CSRLIN - 1: RETURN
200 IN$ = INKEY$: IF IN$ <> "" GOTO 212 ELSE RETURN
210 LOCATE , , 1: REM cursor wordt zichtbaar
211 IN$ = INKEY$: IF IN$ = "" GOTO 211 ELSE LOCATE , , 0
212 IN$ = LEFT$(IN$, 1): RETURN
250 BEEP: RETURN
260 RV = RND(1): RETURN
270 FR = FRE(""): RETURN
300 SR$ = MID$(STR$(ABS(SR)), 2): IF LEFT$(SR$, 1) = "." THEN SR$ = "0" + SR$
301 IF SR < 0 THEN SR$ = "-" + SR$
302 RETURN
310 SR$ = "": IF CT <= 0 THEN RETURN ELSE OS# = CDBL(ABS(SR))
311 IF CN <= 0 THEN OI# = INT(OS# + .5): OF# = 0: GOTO 313 ELSE OI# = INT(OS# + .5 * 10 ^ -CN): OF# = INT(((OS# - OI#) * 10 ^ CN) + .5)
312 OFIP# = OF#: GOSUB 316: IF OX$ = "" GOTO 315 ELSE SR$ = "." + STRING$(CN - LEN(OX$), 48) + OX$
313 OFIP# = OI#: GOSUB 316: IF OX$ = "" GOTO 315 ELSE SR$ = OX$ + SR$: IF (SGN(SR) < 0) AND (NOT ((OI# = 0) AND (OF# = 0))) THEN SR$ = "-" + SR$
314 IF LEN(SR$) <= CT THEN SR$ = STRING$(CT - LEN(SR$), 32) + SR$: RETURN
315 SR$ = STRING$(CT, 42): RETURN
316 IF OFIP# > 10 ^ 16 THEN OX$ = "": RETURN ELSE OX$ = MID$(STR$(OFIP#), 2): RETURN
350 IF OPRN = 0 THEN LPRINT SR$; : RETURN
355 IF OPRN = 1 THEN PRINT #9, SR$; : RETURN
360 IF OPRN = 0 THEN LPRINT : RETURN
365 IF OPRN = 1 THEN PRINT #9, "": RETURN
950 IF OPRN = 1 THEN CLOSE 9
951 GOSUB 952: CLEAR : ON ERROR GOTO 0: END
952 SCREEN 0, 0, 0: WIDTH 80: LOCATE , , 1: COLOR 7, 0, 0: KEY ON: CLS : RETURN
980 OHO% = POS(0): OVE% = CSRLIN: LOCATE 25, 1
981 IF ERR = 24 THEN PRINT "Device timeout, printer?"; : BEEP: GOTO 992
982 IF ERR = 27 THEN PRINT "Printer heeft geen papier of staat uit."; : BEEP: GOTO 991
983 IF ERR = 1 THEN PRINT "NEXT zonder FOR in regel"; ERL; : GOTO 991
984 IF ERR = 26 THEN PRINT "FOR zonder NEXT in regel"; ERL; : GOTO 991
985 IF ERR = 4 THEN PRINT "READ fout, te weinig DATA aanwezig."; : GOTO 991
986 IF ERR = 5 THEN PRINT "Onjuiste parameters, in regel"; ERL; : GOTO 991
987 IF ERR = 11 THEN PRINT "Deling door nul, in regel"; ERL; : GOTO 991
988 IF ERR <> 2 THEN 990
989 GOSUB 952: PRINT "BASIC syntax fout in regel"; ERL; : LOCATE OVE%, OHO%: ON ERROR GOTO 0: RESUME
990 PRINT "Fout nr"; ERR; "in regel"; ERL; "Zie handleiding";
991 O$ = INPUT$(1): LOCATE 25, 1: PRINT SPC(OHT% - 1);
992 LOCATE OVE%, OHO%: RESUME NEXT: REM (C) 1987, H. Vosman   
1000 A = 100: GOTO 20: REM BELGIAN NAUGHTY
1010 LL = 10: REM LENGTH OF STREAM
1020 KI = 4.5: REM POWER OF STREAM
1030 TS = .07: REM SPEED OF STREAM
1040 C$ = "+": C = ASC(C$): REM STREAMCHR
1050 DIM TH(105 + LL), TV(105 + LL)
1060 SN = 0: SO = 0: S = 0: GOSUB 100
1070 SH = 10: HO = 1
1080 VE = SH
1090 GOSUB 110: GOSUB 120: IF VE = SH THEN SH = SH + 1: GOTO 1080
1100 SH = SH - 1: SB = 15: VE = 1
1110 HO = SB
1120 GOSUB 110: GOSUB 120: IF HO = SB THEN SB = SB + 1: GOTO 1110
1130 SB = SB - 1
1140 HO = INT((SB - 19) / 2): VE = 0: GOSUB 110
1150 PRINT " ================="
1160 VE = 1: GOSUB 110: PRINT "!                 !"
1170 VE = 2: GOSUB 110: PRINT "!   MANNEKE PIS   !"
1180 VE = 3: GOSUB 110: PRINT "!                 !"
1190 VE = 4: GOSUB 110: PRINT " ================="
1200 VE = 9: GOSUB 110
1210 PRINT "DO YOU NEED INSTRUCTIONS?";
1220 GOSUB 210
1230 IF (IN$ <> "Y") AND (IN$ <> "Y") THEN 1450
1240 GOSUB 100
1250 PRINT : PRINT "This game is based on the famous"
1260 PRINT : PRINT "Brussels tourist attraction."
1270 PRINT : PRINT "You simply have TO  aim TO  hit"
1280 PRINT : PRINT "the bucket by filling in values"
1290 PRINT : PRINT "FOR  POWER and ANGLE."
1300 PRINT : PRINT "for example:"
1310 PRINT : PRINT "Fill in the value 60 FOR  POWER"
1320 PRINT "and 60 FOR  the ANGLE."
1330 PRINT "You should now see the aim of the game!"
1340 PRINT
1350 PRINT "You can choose power values"
1360 PRINT "between 0 and 100"
1370 PRINT "and angles between 90 and -90"
1380 PRINT "PRESS ANY KEY TO START"
1390 GOSUB 210
1400 REM  EXAMPLE
1410 XP = 0: YP = INT(SH / 2): REM X,Y OF MAN
1420 XQ = INT(SB / 2 - 2): YQ = 5 + YP: REM X,Y OF POT
1430 GOSUB 1500: SN = 0: SO = 0
1440 REM  RANDOM FOR  MAN AND POT
1450 GOSUB 260: XP = 0: YP = 2 + INT((SH - 9) * RV)
1460 GOSUB 260: YQ = 2 + INT((SH - 8) * RV)
1470 GOSUB 260: XQ = 3 + INT((SB - 4) * RV)
1480 GOSUB 1500: GOTO 1450
1490 REM  *** PLAYSUBROUTINE ***
1500 GOSUB 100
1510 GOSUB 2090: REM DRAW MAN AND POT
1520 VE = SH - 4: HO = 0: GOSUB 110
1530 PRINT "SCORE IS       ";
1540 VE = SH - 4: HO = 10: GOSUB 110
1550 SR = SN: GOSUB 300: PRINT SR$; " %"
1560 PRINT "SCORE WAS      ";
1570 VE = SH - 3: HO = 10: GOSUB 110
1580 SR = SO: GOSUB 300: PRINT SR$; " %"
1590 GOSUB 200: IF IN$ <> "" THEN 1590
1600 VE = SH - 4: HO = SB - 13: GOSUB 110: PRINT "POWER  "; : INPUT U
1610 VE = SH - 3: HO = SB - 13: GOSUB 110: PRINT "ANGLE  "; : INPUT W
1620 V = U / KI: K = K + 1: H = W * 3.141592 / 180: T2 = LL + 1
1630 VE = SH - 2: FOR HO = 0 TO 25: GOSUB 110: PRINT " "; : NEXT HO
1640 REM MOVEMENT OF STREAM
1650 TT = 0: FOR IT = 0 TO 100: T = IT * TS: FOR DELAY = 1 TO 50000: NEXT DELAY
1660   REM ERASE STREAMCHARACTER
1670   VE = TV(T2 - LL + 1): HO = TH(T2 - LL + 1)
1680   GOSUB 110: PRINT " "
1690   REM COMPUTE NEW POSITION
1700   YS = INT((SIN(H) * V - 5 * T) * T)
1710   XS = INT(COS(H) * V * T)
1720   HO = XP + XS + 1: VE = YP - YS
1730   IF HO >= SB THEN HO = SB - 1: XS = SB - XP - 2
1740   IF VE < 0 THEN VE = 0
1750   GOSUB 110: PRINT C$
1760   REM STO RE THIS POSITION
1770   TV(T2) = VE: TH(T2) = HO: VE = YP - YS
1780   T2 = T2 + 1: IF T2 >= 149 THEN 1870
1790   REM CHECK IF  STREAM IN POT
1800   REM TO O LOW OR BESIDE
1810   IF (HO = XQ) AND (VE = YQ) THEN TT = 1: GOTO 1870
1820   IF (VE = YQ) AND (HO = XQ - 1) THEN 1870
1830   IF (VE > YP) AND (VE > YQ) THEN 1870
1840 NEXT IT
1850 IF TT = 0 THEN 1990
1860 GOTO 1880
1870 IT = 100: GOTO 1840
1880 VE = SH - 2: HO = 0: GOSUB 110: PRINT "        WELL DONE !!!"
1890 REM REDRAW POT AND
1900 REM  DRAW SPLASHES
1910 GOSUB 250: REM BELL!
1920 HO = XQ: VE = YQ: GOSUB 110: PRINT "U"
1930 HO = XQ - 3: VE = YQ - 3: GOSUB 110: PRINT "\ \!/ /"
1940 HO = XQ - 2: VE = YQ - 2: GOSUB 110: PRINT "\ ! /"
1950 HO = XQ - 1: VE = YQ - 1: GOSUB 110: PRINT "\!/"
1960 TE = 0
1970 FOR Z = 0 TO 1000: NEXT Z
1980 SO = SN: S = S + 1: SN = INT(100 * S / K + .5): RETURN
1990 VE = SH - 2: HO = 0: GOSUB 110: PRINT "SORRY, YOU MISSED THE POT!"
2000 REM COUNT PIDDLES AND
2010 REM PRINT  NUMBER
2020 TE = TE + 1: IF (TE > 9) AND (TE < 17) THEN TE = TE + 7
2030 FOR T3 = T2 - LL TO T2
2040   VE = TV(T3): HO = TH(T3): GOSUB 110: PRINT " "
2050 NEXT T3
2060 HO = XP + XS + 1: VE = YP - YS: GOSUB 110: PRINT CHR$(TE + 48)
2070 SO = INT(SN): SN = INT(100 * S / K + .5): GOSUB 2090: GOTO 1520
2080 REM DRAW MAN
2090 HO = XP: VE = YP - 1: GOSUB 110: PRINT "O"
2100 VE = YP: GOSUB 110: PRINT ">/"
2110 VE = YP + 1: GOSUB 110: PRINT "I"
2120 REM DRAW POT
2130 HO = XQ: VE = YQ: GOSUB 110: PRINT "U"
2140 HO = 0: VE = SH - 5: GOSUB 110
2150 FOR I = 1 TO SB: PRINT "="; : NEXT I: RETURN
30000 REM
30010 REM YOU CAN ADJUST THE LENGTH
30020 REM OF THE STREAM IN LINE 1010
30030 REM (LL=10)
30040 REM THE INFLUENCE OF THE POWER
30050 REM FACTO R CAN BE CHANGED IN
30060 REM LINE 1020. POWER IS
30070 REM CONTROLLED BY KI=4.5
30090 REM
30100 REM THE STREAM SPEED IS ADJUSTED
30110 REM IN LINE 1030
30120 REM YOU NEED (TS=.07)
30130 REM
30140 REM THE CHARACTER IN THE STREAM
30150 REM CAN BE CHANGED IN LINE
30160 REM 1040 :C$="+"
30170 REM
30180 REM THIS PROGRAM WAS RE-WRITTEN
30190 REM IN BASICODE-2 BY MEMBERS OF
30200 REM THE DUTCH BASICODE TEAM. THE
30210 REM ORIGINAL WAS MADE ON A PET
30220 REM AND SUBMITTED IN 1980
30230 REM FOR  A HOBBYSCOPE COMPETITION
30240 REM BY JAN COLLY, VEENDAM,
30250 REM THE NETHERLANDS. TRANSLATED
30260 REM INTO  ENGLISH FOR  "THE CHIP
30270 REM SHOP" BY JONATHAN MARKS,
30280 REM THE NETHERLANDS.
30290 REM NOW IT IS YOUR TURN TO
30330 REM TO  WRITE A BASICODE PROGRAM.

