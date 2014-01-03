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
1000 A = 700: GOTO 20: REM DIGITAL CLOCK
1010 GOSUB 100
1020 DIM A$(6), B$(9, 6), CR$(7), JJ(9)
1030 FOR I = 1 TO 6: READ A$(I): NEXT I
1040 FOR I = 0 TO 7: READ CR$(I): NEXT I
1050 FOR I = 1 TO 9: READ JJ(I): NEXT I
1060 PRINT "     D I G I T A L   C L O C K": PRINT
1070 PRINT "The following demonstration program"
1080 PRINT : PRINT "was made on a DAI personal computer."
1090 PRINT : PRINT "It shows the esperanto-style use"
1100 PRINT : PRINT "of the BASICODE computing standard."
1110 PRINT : PRINT : PRINT : PRINT
1120 PRINT : PRINT "    Press any key"; : GOSUB 210
1130 GOSUB 100
1140 PRINT "Select extra time delay"
1150 PRINT : PRINT "IF needed:"
1160 PRINT
1170 PRINT "Time delay (between 0 and 5000"; : INPUT T: PRINT
1180 PRINT "Number of seconds per step (4-60) "; : INPUT C
1190 E$ = " "
1200 PRINT : PRINT "Fill in the desired display:"
1210 PRINT : PRINT "                  Hours "; : INPUT U
1220 PRINT : PRINT "                Minutes "; : INPUT M
1230 PRINT : PRINT "                Seconds "; : INPUT S
1240 GOSUB 100
1250 N = INT(U / 10): J = 1: IF N = 0 THEN 1270
1260 GOSUB 1440
1270 N = U - N * 10: J = 2: GOSUB 1440
1280 N = INT(M / 10): J = 3: GOSUB 1440
1290 N = M - N * 10: J = 4: GOSUB 1440
1300 N = INT(S / 10): J = 5: GOSUB 1440
1310 N = S - N * 10: J = 6: GOSUB 1440
1320 HO = 0: VE = 4: GOSUB 110
1330 FOR I = 1 TO 9
1340   J = JJ(I): K = I: IF I > 5 THEN K = 6
1350   PRINT E$; B$(J, 1); E$; B$(J, 2); E$; E$; B$(J, 3);
1360   PRINT E$; B$(J, 4); E$; E$; B$(K, 5); E$; B$(K, 6)
1370 NEXT I
1380 FOR I = 1 TO T: NEXT I
1390 S = S + C: IF S < 60 THEN 1250
1400 S = S - 60: M = M + 1: IF M < 60 THEN 1250
1410 M = M - 60: U = U + 1: IF U < 24 THEN 1250
1420 U = 0
1430 FOR I = 1 TO 9: B$(I, 1) = "     ": NEXT I: GOTO 1250
1440 FOR I = 1 TO 5
1450   B$(I, J) = CR$(VAL(MID$(A$(I), N + 1, 1)))
1460 NEXT I
1470 RETURN
25000 DATA "7277574777","5211544155","5277777377"
25010 DATA "5241115151","7277177177","0000000000"
25020 DATA "     ","    X","  X  ","   XX"
25030 DATA "X    ","X   X","X","XXXXX"
25040 DATA 1,2,2,2,3,4,4,4,5
30000 REM "AUTHOR: TH.V.LIESHOUT"
30010 REM "        POSTGALEI 5"
30020 REM "        1687 VP WOGNUM (N.H.)"
30030 REM "TRANSLATED BY JONATHAN"
30040 REM "MARKS FOR  RADIO 4.    "
30050 REM "SEE IF YOU CAN ADJUST "
30060 REM "THE PROGRAM TO  KEEP   "
30070 REM "REAL TIME.            "

