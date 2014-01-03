    1 REM ***************
    2 REM BASICODE-3 FOR  BBC BASIC FOR  Windows
    3 REM Based on the BSC3 code of Peter Maathuis
    4 REM changes made by Victor Reijs, 2005
    5 REM No BASICODE format support, so no loading/saving
    6 REM of program or data files possible
    7 REM ***************
   10 GOTO  1000
   20 RV=RND(-TIME):CLEAR:*ESC
   21 ON:MODE7:HG=1280:VG=1000:HO=39:VE=24:SV=7:IN=0:*FX15,0
   28 ONERRORREPORT:PRINT "/";ERL':GOTO  952
   29 GOTO  1010
  100 MODE7:RETURN
  110 PRINT TAB(HO,VE);:RETURN
  120 HO=POS:VE=VPOS:RETURN
  150 PRINT " "CHR$157CHR$129SR$" "CHR$135CHR$156;:RETURN
  200 IN$=INKEY$(0):GOTO  211
  210 IN$=GET$
  211 IN=ASCIN$:IF IN>135IN=IN-108:RETURN
  212 IF IN=135IN=127:RETURN
  213 IF IN>128IN=32:RETURN
  214 IF IN<32ANDIN<>13IN=0:RETURN
  215 IF IN>95ANDIN<127IN=IN-32:RETURN
  216 RETURN
  220 IF HO<0ORHO>39ORVE<0ORVE>24IN=0:RETURN
  221 H%=POS:V%=VPOS:GOSUB 110:A%=135:IN=((USR&FFF4)AND&FF00)DIV256:GOSUB 212
  222 PRINT TAB(H%,V%);:RETURN
  250 SOUND 1,-15,160,7:RETURN
  260 RV=RND(1):RETURN
  270 FR=HIMEM-END:RETURN
  280 IF FR=1THEN  *ESC OFF
  281 IF FR=0THEN  *ESC ON
  282 RETURN
  300 SR$=STR$SR:RETURN
  310 @%=&1020000+CN*256+CT:SR$=STR$SR:IF VALSR$=0SR$=STR$0
  311 @%=0:IF MID$(SR$,LENSR$-CN,1)<>"."ORINSTR(SR$,"E")SR$=STRING$(CT,"*"):RETURN
  312 IF CN=0SR$=LEFT$(SR$,LENSR$-1)
  313 IF LENSR$>CT SR$=STRING$(CT,"*")
  314 SR$=STRING$(CT-LENSR$," ")+SR$:RETURN
  330 IF SR$=""RETURN ELSEO$=SR$:SR$="":FOR I%=1TO LENO$:A%=ASCMID$(O$,I%):IF A%>96ANDA%<127SR$=SR$+CHR$(A%-32)ELSESR$=SR$+CHR$A%
  331 NEXT :RETURN
  350 VDU2:VDU21
  351 PRINT SR$;:VDU6:VDU3
  352 RETURN
  360 VDU2:VDU21
  361 PRINT :VDU6:VDU3
  362 RETURN
  400 SOUND1,-SV,(SP-47)*4,SD*2:A%=TIME:REPEATUNTILTIME=A%+SD*10:RETURN
  450 TIME=0:*fx21,0
  451 IN$=INKEY$(SD*10)
  452 IF IN$=""SD=0:IN=0:RETURN ELSESD=(SD*10-TIME)/100:GOTO 211
  500 IN=0
  502 IF NF>1THEN 509
  503 PRINT "No BASICODE FOR mat implemented"
  504 RETURN
  509 IF NF MOD2=1C%=OPENOUTNF$ ELSEC%=OPENINNF$
  510 IF NF>5H%=C%ELSEIF NF>3G%=C%ELSEF%=C%
  511 RETURN
  540 IN=0:IN$="":IF NF<2THEN 550
  541 IF NF>5C%=H%ELSEIF NF>3C%=G%ELSEC%=F%
  542 IF EOF#C%IN=1:RETURN
  543 INPUT#C%,IN$
  544 IF EOF#C%IN=1:RETURN ELSERETURN
  550 PRINT "No BASICODE FOR mat implemented"
  551 RETURN
  560 IN=0:IF NF<2THEN 570
  561 IF NF>5C%=H%ELSEIF NF>3C%=G%ELSEC%=F%
  562 PRINT #C%,SR$:RETURN
  570 PRINT "No BASICODE FOR mat implemented":RETURN
  580 IN=0:IF NF<2THEN 590
  581 IF NF>5C%=H%ELSEIF NF>3C%=G%ELSEC%=F%
  582 CLOSE#C%:RETURN
  590 PRINT "No BASICODE FOR mat implemented":RETURN
  600 MODE6:VDU5:RETURN
  620 I%=69+CN+CN:GOTO  640
  630 I%=5+CN
  640 PLOTI%,HO*1280,999-VE*1000:RETURN
  650 MOVEHO*1280,999-VE*1000:PRINT SR$;:MOVEHO*1280,999-VE*1000:RETURN
  950 MODE7:SR$=CHR$(12): GOSUB  350: *ESC ON:*FX15,0
  952 END
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
