1000 A=1000 : GOTO 20
1010 RESTORE : PRINT "Test1"
1015 READ IT
1020 FOR X=1 TO IT
1030 READ HO,VE,T$
1040 GOSUB 110
1050 PRINT T$
1060 NEXT X
1070 END
1500 DATA 2
1510 DATA 10,3,"Hello"
1520 DATA 11,5,"World!"