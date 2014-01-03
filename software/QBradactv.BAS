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
1000 A = 100: GOTO 20: REM RADIOACTIVE DECAY
1010 XM = 40: YM = 23
1020 ZM = 3: C = XM * YM
1030 E = 1: N = 0
1040 DIM A(XM - E, YM - E)
1050 P$ = ".": S$ = ""
1060 FOR X = E TO XM
1070   S$ = S$ + "*": NEXT X
1090 REM
1100 REM *** MENU ***
1110 GOSUB 100
1120 PRINT "          RADIOACTIVE  DECAY"
1130 PRINT "          ==================": PRINT
1140 PRINT "Written by E. Ivens ": PRINT : PRINT
1150 PRINT "Choose from:": PRINT
1160 PRINT "1. The Decay experiment.": PRINT
1170 PRINT "2. Instructions FOR   the student.": PRINT
1180 PRINT "3. Instructions FOR   the teacher.": PRINT
1190 PRINT "4. Explanation FOR   the programmer.": PRINT
1200 PRINT "5. STOP": PRINT : PRINT
1210 PRINT "Which number ? ";
1220 GOSUB 210: REM Wait FOR  key
1230 A = VAL(IN$)
1240 IF A < 1 OR A > 5 THEN 1260
1250 ON A GOSUB 1500, 2000, 3000, 4000, 5000
1260 HO = N: VE = 19
1270 GOSUB 110
1280 PRINT "You must choose 1, 2, 3, 4 or 5 !": PRINT
1290 GOTO 1210
1490 REM
1500 REM *** TEST ***
1510 GOSUB 100
1520 FOR Y = N TO YM - E
1530   HO = 0: VE = Y
1540   GOSUB 110
1550   PRINT S$;
1560 NEXT Y
1570 HO = ZM: VE = YM
1580 GOSUB 110
1590 PRINT "One moment please !";
1600 FOR X = N TO XM - E
1610   FOR Y = N TO YM - E
1620     A(X, Y) = E
1630   NEXT Y
1640 NEXT X
1650 HO = ZM: VE = YM
1660 GOSUB 110
1670 PRINT C; "  Press any key ! ";
1680 GOSUB 210: REM GET KEY
1690 HO = ZM: VE = YM
1700 GOSUB 110
1710 PRINT C; " Press RETURN to stop";
1720 GOSUB 260: REM RANDOM
1730 HO = INT(XM * RV)
1740 GOSUB 260: REM RANDOM
1750 VE = INT(YM * RV)
1760 IF A(HO, VE) = N THEN 1780
1770 C = C - E
1780 IF A(HO, VE) = E THEN 1800
1790 C = C - N
1800 A(HO, VE) = N
1810 GOSUB 110: PRINT P$;
1820 HO = ZM: VE = YM
1830 GOSUB 110: PRINT C; " "; : FOR DELAY = 1 TO 1000: NEXT DELAY
1835 REM MAKE A WAITLOOP HERE
1840 IF C = N THEN 1920
1850 GOSUB 200
1860 IF IN$ = "" THEN 1720
1870 IF IN$ <> CHR$(13) THEN 1720
1880 HO = ZM: VE = YM
1890 GOSUB 110
1900 PRINT C; "                       ";
1910 GOTO 1950
1920 HO = N: VE = YM
1930 GOSUB 110
1940 PRINT "ALL ATOMS HAVE DECAYED.  ";
1950 GOSUB 6000
1960 C = XM * YM
1970 GOTO 1100
1990 REM
2000 REM *** STUDENT ***
2010 GOSUB 100
2020 PRINT "STUDENT   INSTRUCTIONS."
2030 PRINT "=======================": PRINT
2040 PRINT "At the start of the test you will": PRINT
2050 PRINT "see "; C; " stars. Each star represents": PRINT
2060 PRINT "a radio-active atom which will decay": PRINT
2070 PRINT "into another atom of lower mass,": PRINT
2080 PRINT "represented by a point.": PRINT
2090 PRINT "You cannot predict when the decay": PRINT
2100 PRINT "will occur.": PRINT
2110 PRINT "But you can say that after a certain": PRINT
2120 PRINT "time (THE HALF-LIF E), an average of half"
2130 PRINT "the original number of atoms": PRINT
2140 PRINT "will have decayed.";
2150 GOSUB 6000
2190 REM
2200 GOSUB 100
2210 PRINT "You can measure the half-lIF e of": PRINT
2220 PRINT "our example. Note the time it takes": PRINT
2230 PRINT "For 900 to become 450, 180 to": PRINT
2240 PRINT "become 90, etc.": PRINT
2250 PRINT "The counter at the bottom of the screen": PRINT
2260 PRINT "displays the number of radio-active": PRINT
2270 PRINT "atoms left.": PRINT : PRINT
2280 PRINT "Good luck with the experiment !"
2290 GOSUB 6000
2300 GOTO 1100
2900 REM
3000 REM *** TEACHER ***
3010 GOSUB 100
3020 PRINT "TEACHER  INSTRUCTIONS"
3030 PRINT "=====================": PRINT
3040 PRINT "This program could be used to": PRINT
3050 PRINT "demonstrate the classic theory of ": PRINT
3060 PRINT "decay and half-lIF e. Students can"
3070 PRINT
3080 PRINT "also measure half-lives.": PRINT
3090 PRINT "Note that IF  you repeat the experiment": PRINT
3100 PRINT "a number of times, it does matter IF  the"
3110 PRINT "computer is using random or": PRINT
3120 PRINT "pseudo-random numbers. In the latter": PRINT
3130 PRINT "case, the result will always be the ": PRINT
3140 PRINT "same. You many not want this.";
3150 GOSUB 6000
3190 REM
3200 GOSUB 100
3210 PRINT "The half-lIF e of this program": PRINT
3220 PRINT "is very dependent on the make of": PRINT
3230 PRINT "computer. On an APPLE this is about 86s.": PRINT
3240 PRINT "A shorter constant half-lIF e is not": PRINT
3250 PRINT "possible in BASICODE.": PRINT
3260 PRINT "A longer half-lIF e is possible.": PRINT : PRINT
3270 PRINT "See: Explanation FOR  the programmer."
3280 GOSUB 6000
3290 GOTO 1100
3900 REM
4000 REM *** PROGRAMER ***
4010 GOSUB 100
4020 PRINT "Explanation FOR  the programmer."
4030 PRINT "==============================": PRINT
4040 PRINT "You can make the half-life shorter": PRINT
4050 PRINT "by replacing the 'GOSUB 110' in lines ": PRINT
4060 PRINT "1810 and 1830 with your computers own": PRINT
4070 PRINT "command. Line 1820 is then deleted.": PRINT
4080 PRINT "The 'GOSUB 260' in lines 1720 and": PRINT
4090 PRINT "1740 could be changed too.": PRINT
4100 PRINT "You could change 1850 to GOTO 1730": PRINT
4110 PRINT "Making the half-lIF e longer is ": PRINT
4120 PRINT "no problem, either with a waitloop,": PRINT
4130 PRINT "or by making changes to line 1835.": PRINT
4140 PRINT "";
4150 GOSUB 6000
4190 REM
4200 GOSUB 100
4210 PRINT "The construction of lines 1760-1790": PRINT
4220 PRINT "may seem a little confusing.": PRINT
4230 PRINT "It is necessary to ensure": PRINT
4240 PRINT "that the half-life does": PRINT
4250 PRINT "not get steadily shorter."
4260 PRINT : PRINT
4270 PRINT "IF  you have limited computer memory": PRINT
4280 PRINT "all lines between 2000 to": PRINT
4290 PRINT "5900 can be erased. The experiment": PRINT
4300 PRINT "doesn't need these lines.": PRINT
4310 PRINT "You could also erase the menu."
4320 GOSUB 6000
4390 REM
4400 GOSUB 100
4410 PRINT "This program was written using the": PRINT
4420 PRINT "BASICODE screen norm, 40 characters by": PRINT
4430 PRINT "24 lines.": PRINT
4440 PRINT "IF  you want to change this": PRINT
4450 PRINT "change line 1010.": PRINT
4460 PRINT "Look For :": PRINT
4480 PRINT "XM = Number of characters per line,": PRINT
4490 PRINT "YM = Number of lines - 1."
4500 GOSUB 6000
4510 GOTO 1100
4900 REM
5000 REM *** STOP ***
5010 GOSUB 100
5020 PRINT "Goodbye. Hope you enjoyed it."
5030 END
5900 REM
6000 REM *** SUBROUTINE ***
6010 HO = XM - 7: VE = YM + E
6020 GOSUB 110
6030 PRINT "Press>";
6040 GOSUB 210: REM GET KEY
6050 RETURN
6900 REM
30000 REM -RADIOACTIVE DECAY
30010 REM THIS VERSION MADE
30020 REM MADE 12 JANUARY 84
30030 REM ON AN APPLE II
30040 REM
30050 REM WRITTEN BY
30170 REM E. IVENS,
30180 REM SCIENCE TEACHER,
30190 REM ST. LUDGERCOLLEGE,
30200 REM VONDELSTRAAT 5,
30210 REM 7002 AN  DOETINCHEM.
30220 REM THE NETHERLANDS
30230 REM
30240 REM TRANSLATED BY
30250 REM JONATHAN MARKS

