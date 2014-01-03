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
350   IF OPRN = 0 THEN LPRINT SR$; : RETURN
355   IF OPRN = 1 THEN PRINT #9, SR$; : RETURN
360   IF OPRN = 0 THEN LPRINT : RETURN
365   IF OPRN = 1 THEN PRINT #9, "": RETURN
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
1000 DIM A$(4), K$(4), B(4), D(4), J(4)
1005 A = 100: GOTO 20: REM EXACT MASS
1010 GOSUB 1610
1020 GOSUB 100
1030 PRINT "Input exact mass please"; : INPUT X
1040 PRINT
1050 FOR I = 1 TO 4
1060   PRINT : PRINT
1070   PRINT "ELEMENT: "; A$(I); "  MASS: "; B(I)
1080   D(I) = INT((X + .03) / B(I))
1090 NEXT I
1100 PRINT : PRINT : PRINT
1110 PRINT "Maximum deviation of mass"; : INPUT W
1120 IF W <= .03 THEN 1160
1130 PRINT "Deviation to o high:Maximum deviation"
1140 PRINT "is 0.03 of mass !"
1150 GOTO 1110
1160 GOSUB 100
1170 PRINT
1180 PRINT "Mass: "; X; ", Max. Deviation: "; W
1190 PRINT : PRINT "  MASS     ";
1200 FOR I = 1 TO 4
1210   PRINT A$(I); "   ";
1220 NEXT I
1230 PRINT "DEVIATION"
1240 PRINT
1250 R1 = 0: I1 = 0
1260 R3 = R1: I3 = 0
1270 R4 = R3: I4 = 0
1280 I2 = INT((X - W - R4) / B(2)): IF I2 < 0 THEN 1350
1290 R2 = R4 + I2 * B(2)
1300 R = R2
1310 IF R < X - W THEN 1340
1320 IF R > X + W THEN 1350
1330 GOSUB 1460
1340 I2 = I2 + 1: R2 = R2 + B(2): GOTO 1300
1350 IF I4 < D(4) THEN I4 = I4 + 1: R4 = R4 + B(4): GOTO 1280
1360 IF I3 < D(3) THEN I3 = I3 + 1: R3 = R3 + B(3): GOTO 1270
1370 IF I1 < D(1) THEN I1 = I1 + 1: R1 = R1 + B(1): GOTO 1260
1380 PRINT : PRINT
1390 IF T > 0 THEN 1420
1400 PRINT "Sorry, but I can't find any FOR mulae"
1410 PRINT "to fit the mass given!"
1420 PRINT "Further calculations (y/n)"; : INPUT X$
1430 IF (X$ = "n") OR (X$ = "N") THEN END
1440 T = 0
1450 GOTO 1020
1460 REM PRINT  ROUTINE
1470 T = T + 1
1480 J(1) = I1
1490 J(2) = I2
1500 J(3) = I3
1510 J(4) = I4
1520 SR = R: CT = 8: CN = 4: GOSUB 310: PRINT SR$;
1530 FOR K = 1 TO 4
1540   CT = 4: CN = 0
1550   SR = J(K): GOSUB 310: PRINT SR$;
1560 NEXT K
1570 SR = R - X
1580 CT = 10: CN = 4: GOSUB 310
1590 PRINT SR$
1600 RETURN
1610 REM DIM A$(4), K$(4), B(4), D(4), J(4)
1620 GOSUB 100: PRINT : PRINT
1630 PRINT
1640 PRINT " Empirical FOR mula Calculation"
1650 PRINT
1660 PRINT " From Exact Mass"
1670 PRINT : PRINT
1680 PRINT " Using the elements:carbon,"
1690 PRINT
1700 PRINT " hydrogen, nitrogen, and oxygen."
1710 HO = 0: VE = 23: GOSUB 110
1720 PRINT "Press SPACE to continue.";
1730 GOSUB 210: IF IN$ <> " " THEN 1730
1740 GOSUB 100
1750 PRINT "You need to give me the exact mass of"
1760 PRINT : PRINT "the organic substance, plus"
1770 PRINT : PRINT "the deviation allowed (max:0.03.mass)"
1780 PRINT : PRINT "I will the calculate all possible"
1790 PRINT : PRINT "empirical formulae using C, H, O, and N."
1800 PRINT : PRINT "This should assist your analysis."
1810 HO = 0: VE = 23: GOSUB 110
1820 PRINT "Press SPACE to continue.";
1830 GOSUB 210: IF IN$ <> " " THEN 1830
1840 A$(1) = "C": A$(2) = "H": A$(3) = "N": A$(4) = "O"
1850 K$(1) = "C": K$(2) = "H": K$(3) = "N": K$(4) = "O"
1860 B(1) = 12: B(2) = 1.0078: B(3) = 14.0031: B(4) = 15.9949
1870 RETURN
30000 REM " E X A C T  M A S S      "
30010 REM =======================
30020 REM
30030 REM " THIS VERSION JANUARY 1984.
30040 REM "                         "
30050 REM " TRANSLATED BY JONATHAN  "
30060 REM " MARKS, HILVERSUM.
30070 REM
30080 REM
30090 REM
30100 REM
30110 REM
30120 REM " ORIGINAL VERSION:
30130 REM " WRITTEN BY
30140 REM
30150 REM " T.J. STAM.      "

