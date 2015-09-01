init:
lui $a0, 0xc000	#vram
lui $a1, 0xd000	#keyboard
lui $a2, 0xe000	#seven-segment and led display
lui $a3, 0xf000	#state of seven segments, leds and sws
addi $sp, $zero, 0x0f00	#data

addi $s1, $zero, 80	#position of text_vram
addi $t0, $zero, 0x23
add $t7, $a0, $s1
sw $t0, 0($t7)
addi $s1, $s1, 1
add  $v0, $zero, $zero
add  $v1, $zero, $zero

text_init:
lw $t1, 0($a1)

text_while:
addi $v0, $v0, 1
j cursor
cursorelse:
add $t2, $t1, $zero
lw $t1, 0($a1)
beq $t1, $t2, text_while

addi $t0, $zero, 0xffff
lui  $s0, 0x0001    #$s0=0x00010000
add  $t0, $t0, $s0	#$t0=0x0000FFFF
and  $t0, $t1, $t0

keya:
addi $t1, $zero, 0xf01c
add  $t1, $t1, $s0
addi $t3, $zero, 0x61
beq  $t1, $t0, print

keyb:
addi $t1, $zero, 0xf032
add  $t1, $t1, $s0
addi $t3, $zero, 0x62
beq  $t1, $t0, print

keyc:
addi $t1, $zero, 0xf021
add  $t1, $t1, $s0
addi $t3, $zero, 0x63
beq  $t1, $t0, print

keyd:
addi $t1, $zero, 0xf023
add  $t1, $t1, $s0
addi $t3, $zero, 0x64
beq  $t1, $t0, print

keye:
addi $t1, $zero, 0xf024
add  $t1, $t1, $s0
addi $t3, $zero, 0x65
beq  $t1, $t0, print

keyf:
addi $t1, $zero, 0xf02b
add  $t1, $t1, $s0
addi $t3, $zero, 0x66
beq  $t1, $t0, print

keyg:
addi $t1, $zero, 0xf034
add  $t1, $t1, $s0
addi $t3, $zero, 0x67
beq  $t1, $t0, print

keyh:
addi $t1, $zero, 0xf033
add  $t1, $t1, $s0
addi $t3, $zero, 0x68
beq  $t1, $t0, print

keyi:
addi $t1, $zero, 0xf043
add  $t1, $t1, $s0
addi $t3, $zero, 0x69
beq  $t1, $t0, print

keyj:
addi $t1, $zero, 0xf03b
add  $t1, $t1, $s0
addi $t3, $zero, 0x6a
beq  $t1, $t0, print

keyk:
addi $t1, $zero, 0xf042
add  $t1, $t1, $s0
addi $t3, $zero, 0x6b
beq  $t1, $t0, print

keyl:
addi $t1, $zero, 0xf04b
add  $t1, $t1, $s0
addi $t3, $zero, 0x6c
beq  $t1, $t0, print

keym:
addi $t1, $zero, 0xf03a
add  $t1, $t1, $s0
addi $t3, $zero, 0x6d
beq  $t1, $t0, print

keyn:
addi $t1, $zero, 0xf031
add  $t1, $t1, $s0
addi $t3, $zero, 0x6e
beq  $t1, $t0, print

keyo:
addi $t1, $zero, 0xf044
add  $t1, $t1, $s0
addi $t3, $zero, 0x6f
beq  $t1, $t0, print

keyp:
addi $t1, $zero, 0xf04b
add  $t1, $t1, $s0
addi $t3, $zero, 0x70
beq  $t1, $t0, print

keyq:
addi $t1, $zero, 0xf015
add  $t1, $t1, $s0
addi $t3, $zero, 0x71
beq  $t1, $t0, print

keyr:
addi $t1, $zero, 0xf02d
add  $t1, $t1, $s0
addi $t3, $zero, 0x72
beq  $t1, $t0, print

keys:
addi $t1, $zero, 0xf01b
add  $t1, $t1, $s0
addi $t3, $zero, 0x73
beq  $t1, $t0, print

keyt:
addi $t1, $zero, 0xf02c
add  $t1, $t1, $s0
addi $t3, $zero, 0x74
beq  $t1, $t0, print

keyu:
addi $t1, $zero, 0xf03c
add  $t1, $t1, $s0
addi $t3, $zero, 0x75
beq  $t1, $t0, print

keyv:
addi $t1, $zero, 0xf02a
add  $t1, $t1, $s0
addi $t3, $zero, 0x76
beq  $t1, $t0, print

keyw:
addi $t1, $zero, 0xf01d
add  $t1, $t1, $s0
addi $t3, $zero, 0x77
beq  $t1, $t0, print

keyx:
addi $t1, $zero, 0xf022
add  $t1, $t1, $s0
addi $t3, $zero, 0x78
beq  $t1, $t0, print

keyy:
addi $t1, $zero, 0xf035
add  $t1, $t1, $s0
addi $t3, $zero, 0x79
beq  $t1, $t0, print

keyz:
addi $t1, $zero, 0xf01a
add  $t1, $t1, $s0
addi $t3, $zero, 0x7a
beq  $t1, $t0, print

keypoint:
addi $t1, $zero, 0xf049
add  $t1, $t1, $s0
addi $t3, $zero, 0x2e
beq  $t1, $t0, print

keyoblique:
addi $t1, $zero, 0xf05d
add  $t1, $t1, $s0
addi $t3, $zero, 0x5c
beq  $t1, $t0, print

keylk:
addi $t1, $zero, 0xf054
add  $t1, $t1, $s0
addi $t3, $zero, 0x5b
beq  $t1, $t0, print

keyrk:
addi $t1, $zero, 0xf05b
add  $t1, $t1, $s0
addi $t3, $zero, 0x5d
beq  $t1, $t0, print

keyspace:
addi $t1, $zero, 0xf029
add  $t1, $t1, $s0
addi $t3, $zero, 0x20
beq  $t1, $t0, print

keyenter:
addi $t1, $zero, 0xf05a
add  $t1, $t1, $s0
beq  $t1, $t0, enter

keyBKSP:
addi $t1, $zero, 0xf066
add  $t1, $t1, $s0
beq  $t1, $t0, BKSP

keyESC:
addi $t1, $zero, 0xf076
add  $t1, $t1, $s0
beq  $t1, $t0, ESC

keyF4:
addi $t1, $zero, 0xf00c
add  $t1, $t1, $s0
beq  $t1, $t0, F4

sw  $t0, 0($a2)

j text_init

print:
add $t7, $a0, $s1
sw $t3, 0($t7)
sw $t3, 0($a2)
sw $t3, 0($sp)
addi $s1, $s1, 1
addi $sp, $sp, 4
j text_init

cursor:
lui $t8, 0x0001
beq $v0, $t8, changecursor
j cursorelse

changecursor:
add $v0, $zero, $zero
add $t7, $a0, $s1
beq $v1, $zero, nocursor
add $v1, $zero, $zero
addi $t8, $zero, 0x7c
sw $t8, 0($t7)
j cursorelse
nocursor:
addi $v1, $zero, 1
sw $zero, 0($t7)
j cursorelse

F4:
addi $t8, $zero, 4800
add  $t9, $zero, $zero
F4while:
add  $t5, $a0, $t9
addi $t9, $t9, 1
sw  $zero, 0($t5)
slt $t5, $t8, $t9
beq $t5, $zero, F4while
j init

BKSP:
#if there are only '#', return
addi $t0, $zero, 0x0fff
and  $t0, $t0, $sp
addi  $t1, $zero, 0x0f00
beq  $t1, $t0, text_init
#else delete
add  $t7, $a0, $s1
sw   $zero, 0($t7)

nor  $t0, $zero, $zero
add  $s1, $s1, $t0	#$s1=$s1-1
add  $sp, $sp, $t0
add  $sp, $sp, $t0
add  $sp, $sp, $t0
add  $sp, $sp, $t0	#$sp=$sp-4
addi $t3, $zero, 0x20
sw   $t3, 0($t7)
j text_init

ESC:
add  $t0, $zero, $zero
lui $t1, 0x0f00
sw  $t0, 0($a2)
sw  $t0, 0($t1)
j graph

enter:
add  $t7, $a0, $s1
sw $zero, 0($t7)

addi $t0, $zero, 0x0f04	#*
beq $sp, $t0, judge
j newline
judge:
nor $t0, $zero, $zero	#$t0=0xFFFF_FFFF
add $t1, $sp, $zero		#$t1=$sp
add $t1, $t1, $t0		#$t1=$t1-1
judgehw:
lw $t2, 0($t1),
addi $t3, $zero, 0x68	#ascii of 'h'
beq $t2, $t3, hw
judgegame:
addi $t3, $zero, 0x67
beq $t2, $t3, ESC

newline:
addi $t0, $zero, 40
add  $t1, $zero, $zero
add  $t2, $zero, $zero
newlineloop:
addi $t2, $t2, 80
slt  $t3, $s1, $t2
beq  $t3, $zero, newlineloop
add  $s1, $t2, $zero
add  $t7, $a0, $s1
addi $t2, $zero, 0x23
sw   $t2, 0($t7)
addi $s1, $s1, 1
addi $sp, $zero, 0x0f00
j text_init

hw:
addi $t0, $zero, 80
add  $t1, $zero, $zero
hwloop:
addi $t1, $t1, 80
slt  $t2, $s1, $t1
beq  $t2, $zero, hwloop
add  $s1, $t1, $zero
add  $t7, $a0, $s1	#write address initializaton has been finished
addi $t0, $zero, 0x48#'H'
sw   $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x65#'e'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x6c#'l'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x6c#'l'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x6f#'o'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x57#'W'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x6f#'o'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x72#'r'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x6c#'l'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x64#'d'
sw 	 $t0, 0($t7)
addi $t7, $t7, 1
addi $t0, $zero, 0x21#'!'
sw 	 $t0, 0($t7)
j newline

graph:
#graph initialization
lui $s3, 0x0e00	#data stress of coordination (x,y)
lw $t1, 0($a1)
addi $s2, $zero, 0x4000	#counter
#initialize the dragon
add $s7, $zero, $zero#$s7 is the coordination of the dragon
lui $t3, 0x0024	#x of dragon
addi $t4, $zero,65	#y of dragon
add $s7, $t3, $t4
addi $t4, $s3, 4
sw  $s7, 0($t4)
add $k0, $zero, $zero
#initialize the thorns
lui  $s6, 200
addi $s6, $s6, 65
addi $t4, $s3, 12
sw   $s6, 0($t4)
#$t4 is the coordination of background
add $t4, $zero, $zero
add $s5, $zero, $zero	#$s5 is the score
sw $s5, 0($a2)

graph_while:
nor $t3, $zero, $zero	#$t3=0xffff_ffff
add $s2, $s2, $t3	#$s2=$s2-1
beq $s2, $zero, graph_move

graph_readkey:
#get the status of button
lw $t8, 0($a3)
addi $t9, $zero, 0x0f00
and  $t8, $t8, $t9
beq $t8, $zero, notjump
j jump
notjump:

add $t2, $t1, $zero
lw $t1, 0($a1)
beq $t1, $t2, graph_while

addi $t0, $zero, 0xffff
lui  $s0, 0x0001    #$s0=0x00010000
add  $t0, $t0, $s0	#$t0=0x0000FFFF
and  $t0, $t1, $t0

keygraphESC:
addi $t1, $zero, 0xf076
add  $t1, $t1, $s0
beq  $t1, $t0, graphESC

j graph_while

graphESC:
addi $t0, $zero, 0xffff
lui  $t1, 0x0f00
sw   $t0, 0($t1)
j newline

graph_move:
addi $s5, $s5, 1
sw $s5, 0($a2)
lui $t5, 0x1000
beq $s5, $t5, lose
#change the position of the dragon
lui  $t5, 0x8000
add  $s7, $s7, $t5
beq  $k0, $zero, jelse
addi $t8, $zero, 1
beq  $k0, $t8, j1
addi $t8, $zero, 2
beq  $k0, $t8, j2
addi $t8, $zero, 3
beq  $k0, $t8, j3
addi $t8, $zero, 4
beq  $k0, $t8, j4
addi $t8, $zero, 5
beq  $k0, $t8, j5
addi $t8, $zero, 6
beq  $k0, $t8, j6
addi $t8, $zero, 7
beq  $k0, $t8, j7
addi $t8, $zero, 8
beq  $k0, $t8, j8
addi $t8, $zero, 9
beq  $k0, $t8, j9
addi $t8, $zero, 10
beq  $k0, $t8, j10
addi $t8, $zero, 11
beq  $k0, $t8, j11
addi $t8, $zero, 12
beq  $k0, $t8, j12
addi $t8, $zero, 13
beq  $k0, $t8, j13
addi $t8, $zero, 14
beq  $k0, $t8, j14
addi $t8, $zero, 15
beq  $k0, $t8, j15
addi $t8, $zero, 16
beq  $k0, $t8, j16
addi $t8, $zero, 17
beq  $k0, $t8, j17
j jelse

j1:
addi  $s7, $s7, -15
addi $k0, $k0, 1  	#$k0=2
j jelse
j2:
addi  $s7, $s7, -13
addi $k0, $k0, 1	#$k0=3
j jelse
j3:
addi  $s7, $s7, -11
addi $k0, $k0, 1	#$k0=4
j jelse
j4:
addi  $s7, $s7, -9
addi $k0, $k0, 1	#$k0=5
j jelse
j5:
addi  $s7, $s7, -7
addi $k0, $k0, 1	#$k0=6
j jelse
j6:
addi  $s7, $s7, -5
addi $k0, $k0, 1	#$k0=7
j jelse
j7:
addi  $s7, $s7, -3
addi $k0, $k0, 1	#$k0=8
j jelse
j8:
addi  $s7, $s7, -2
addi $k0, $k0, 1	#$k0=9
j jelse
j9:
add  $s7, $s7, $zero
addi $k0, $k0, 1	#$k0=10
j jelse
j10:
addi  $s7, $s7, 2
addi $k0, $k0, 1	#$k0=11
j jelse
j11:
addi  $s7, $s7, 3
addi $k0, $k0, 1	#$k0=12
j jelse
j12:
addi  $s7, $s7, 5
addi $k0, $k0, 1	#$k0=13
j jelse
j13:
addi  $s7, $s7, 7
addi $k0, $k0, 1	#$k0=14
j jelse
j14:
addi  $s7, $s7, 9
addi $k0, $k0, 1	#$k0=15
j jelse
j15:
addi  $s7, $s7, 11
addi $k0, $k0, 1	#$k0=16
j jelse
j16:
addi  $s7, $s7, 13
addi $k0, $k0, 1	#$k0=17
j jelse
j17:
addi  $s7, $s7, 15
add $k0, $zero, $zero	#$k0=0
j jelse

jelse:
j check
checkelse:
addi $t5, $s3, 4
sw   $s7, 0($t5)
#show the thorns
addi $t5, $s3, 12
sw   $s6, 0($t5)
#move the thorns
lui $t6, 0xfff8
add $s6, $s6, $t6
lui $t5, 0xfff0
and $t6, $s6, $t5
beq $t5, $t6, resetthorn1
thorn1else:
#change the position of the background
sw   $t4, 0($s3)
addi $t4, $t4, 8
addi $t5, $zero, 315
slt  $t5, $t4, $t5
beq  $t5, $zero, resetbkg
resetbkgelse:
addi $s2, $zero, 0x4000
j graph_readkey

resetbkg:
add $t4, $zero, $zero
j resetbkgelse

resetthorn1:
lui $s6, 320
addi $s6, $s6, 65
j thorn1else

jump:
beq $k0, $zero, jumpelse
j notjump
jumpelse:
addi $k0, $zero, 1
j notjump

check:
#check point1(DX+40,DY+10)
lui $s0, 0xffff	#$s0=0xffff0000
addi $k1, $zero, 0xffff
lui $t5, 0x0001
add $k1, $k1, $t5	#$k1=0x0000ffff
#get DX+40
and $t8, $s7, $s0
lui $t5, 40
add $t8, $t8, $t5	#$t8=DX+40
#get TX+10
and $t9, $s6, $s0	#$t9=TX
lui $t5, 10
add $t5, $t9, $t5	#$t5=TX+10

slt $t5, $t5, $t8
beq $t5, $zero, checkelse
#get TX+20
lui $t5, 20
add $t5, $t9, $t5	#$t5=TX+20
slt $t5, $t8, $t5
beq $t5, $zero, point2
#get DY+10&TY
and $t5, $s7, $k1
addi $t5, $t5, 10	#$t5=DY+10
and $t7, $s6, $k1	#$t7=TY
slt $s4, $t5, $t7
beq $s4, $zero, lose
point2:
and $t8, $s7, $s0	#$t8=DX
and $t9, $s6, $s0	#$t9=TX
slt $t5, $t9, $t8
beq $t5, $zero, checkelse
lui $t5, 25
add $t5, $t9, $t5	#$t5=TX+40
slt $t5, $t8, $t5
beq $t5, $zero, checkelse
and $t5, $s7, $k1
addi $t5, $t5, 15	#$t5=DY+20
and $t7, $s6, $k1	#$t7=TY
slt $s4, $t5, $t7
beq $s4, $zero, lose
j checkelse

lose:
lw $t1, 0($a1)

lose_while:
add $t2, $t1, $zero
lw $t1, 0($a1)
beq $t1, $t2, lose_while

addi $t0, $zero, 0xffff
lui  $s0, 0x0001    #$s0=0x00010000
add  $t0, $t0, $s0	#$t0=0x0000FFFF
and  $t0, $t1, $t0

keyloseESC:
addi $t1, $zero, 0xf076
add  $t1, $t1, $s0
beq  $t1, $t0, graphESC

keyloseenter:
addi $t1, $zero, 0xf05a
add  $t1, $t1, $s0
beq  $t1, $t0, graph

j lose_while
