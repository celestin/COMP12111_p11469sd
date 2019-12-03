
; Written by Sam da Costa
;
; allows user to enter a 2 digit number
; This is displayed on the 7 seg display and displayed in binary on the bar graph
; The traffic lights then flash
; You can reset then with the clear button
startPro ;jump point for the program



;initialise displays
	LDA enable2
	STA &FFB
	LDA zero
	STA disp1
	STA disp2
	STA bar
	STA actual
	STA temp
	JMP next0;get first key
next0
	LDA keyrow4 ;load keyrow4
	SUB key8520 ;check if 0
	JNE next1
	LDA zero
	STA disp1
	JMP loop
next1	LDA keyrow3 ;load keyrow3
	SUB key741 ;check if 1
	JNE next2
	LDA one
	STA disp1
	JMP loop
next2	LDA keyrow3 ;load keyrow3
	SUB key8520 ;check if 2
	JNE next3
	LDA two
	STA disp1
	JMP loop
next3	LDA keyrow3 ;load keyrow3
	SUB key963 ;check if 3
	JNE next4
	LDA three
	STA disp1
	JMP loop
next4	LDA keyrow2 ;load keyrow3
	SUB key741 ;check if 4
	JNE next5
	LDA four
	STA disp1
	JMP loop
next5	LDA keyrow2 ;load keyrow3
	SUB key8520 ;check if 5
	JNE next6
	LDA five
	STA disp1
	JMP loop
next6	LDA keyrow2 ;load keyrow3
	SUB key963 ;check if 6
	JNE next7
	LDA six
	STA disp1
	JMP loop
next7	LDA keyrow1 ;load keyrow3
	SUB key741 ;check if 7
	JNE next8
	LDA seven
	STA disp1
	JMP loop
next8	LDA keyrow1 ;load keyrow3
	SUB key8520 ;check if 8
	JNE next9
	LDA eight
	STA disp1
	JMP loop
next9	LDA keyrow1 ;load keyrow3
	SUB key963 ;check if 9
	JNE next0
	LDA nine
	STA disp1
	JMP loop

loop;adjust displays
LDA disp1
STA disp2
LDA zero
STA disp1
;wait so that the value is not registered twice
;wait script
tLoop
	LDA junk
	ADD one
	STA junk
	LDA ldTimer
	ADD one
	STA ldTimer
	LDA ldTimer
	SUB tEnd
	JNE tLoop	
	JMP timerEnd

timerEnd



;get next key
next0A
	LDA keyrow4 ;load keyrow4
	SUB key8520 ;check if 0
	JNE next1A
	LDA zero
	STA disp1
	JMP loopA
next1A	LDA keyrow3 ;load keyrow3
	SUB key741 ;check if 1
	JNE next2A
	LDA one
	STA disp1
	JMP loopA
next2A	LDA keyrow3 ;load keyrow3
	SUB key8520 ;check if 2
	JNE next3A
	LDA two
	STA disp1
	JMP loopA
next3A	LDA keyrow3 ;load keyrow3
	SUB key963 ;check if 3
	JNE next4A
	LDA three
	STA disp1
	JMP loopA
next4A	LDA keyrow2 ;load keyrow3
	SUB key741 ;check if 4
	JNE next5A
	LDA four
	STA disp1
	JMP loopA
next5A	LDA keyrow2 ;load keyrow3
	SUB key8520 ;check if 5
	JNE next6A
	LDA five
	STA disp1
	JMP loopA
next6A	LDA keyrow2 ;load keyrow3
	SUB key963 ;check if 6
	JNE next7A
	LDA six
	STA disp1
	JMP loopA
next7A	LDA keyrow1 ;load keyrow3
	SUB key741 ;check if 7
	JNE next8A
	LDA seven
	STA disp1
	JMP loopA
next8A	LDA keyrow1 ;load keyrow3
	SUB key8520 ;check if 8
	JNE next9A
	LDA eight
	STA disp1
	JMP loopA
next9A	LDA keyrow1 ;load keyrow3
	SUB key963 ;check if 9
	JNE next0A
	LDA nine
	STA disp1
	JMP loopA
;concatenate numbers
loopA

	LDA disp2
	STA temp
	JNE flagA
	JMP allEq
flagA	SUB one
	STA temp
	LDA actual
	ADD ten
	STA actual
	LDA temp
	JNE flagA
	JMP allEq


allEq
	STA bar ;output to bar
	LDA actual
	ADD disp1
	STA actual

	LDA zero
	STA bar
	LDA actual
	STA bar
; timerlogic
timerRestart


	LDA keyrow1
	SUB keyC
	JNE timer
	JMP startPro
timer	LDA zero
	STA ldTimer
	STA junk

;flash traffic lights between states
tLoop2

	
	LDA junk
	ADD one
	STA junk
	LDA ldTimer
	ADD one
	STA ldTimer
	LDA ldTimer
	SUB tEnd
	JNE tLoop2	
	JMP timerEnd2

timerEnd2
	LDA state
	JNE flagB
	ADD one
	STA state
	LDA traff1
	STA traffic
	JMP timerRestart
flagB	SUB one
	JNE flagC
	ADD two
	STA state
	LDA traff2
	STA traffic
	JMP timerRestart
flagC	SUB one
	JNE flagD
	ADD three
	STA state
	LDA traff3
	STA traffic
	JMP timerRestart
flagD	LDA traff2
	STA traffic
	LDA zero
	STA state
	JMP timerRestart


	STP



zero	DEFW &0
one	DEFW &1
two	DEFW &2
three 	DEFW &3
four	DEFW &4
five 	DEFW &5
six	DEFW &6
seven	DEFW &7
eight	DEFW &8
nine	DEFW &9
ten	DEFW &000A

state	DEFW &0
traff1	DEFW &0021
traff2	DEFW &0012
traff3	DEFW &000C
ldTimer	DEFW &0
junk	DEFW &0
tEnd	DEFW &10000

keyC	DEFW &0004
key963	DEFW &0008
key8520	DEFW &0010
key741	DEFW &0020
actual	DEFW &0000
temp 	DEFW &0000
disp1	EQU &FF5
disp2	EQU &FF6
disp3	EQU &FF7
disp4	EQU &FF8
disp5	EQU &FF9
disp6	EQU &FFA
dispE	EQU &FFB
bar	EQU &FFE
keyrow1	EQU &FEF
keyrow2 EQU &FF0
keyrow3 EQU &FF1
keyrow4	EQU &FF2
traffic	EQU &FFF
enable  DEFW &003F
enable2 DEFW &0003
digit1	DEFW &FF6

