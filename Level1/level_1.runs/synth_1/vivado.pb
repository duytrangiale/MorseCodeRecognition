
~
Command: %s
53*	vivadotcl2M
9synth_design -top Morse_decoder_TOP -part xc7a35tcpg236-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px? 
?
%s*synth2?
xStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 835.074 ; gain = 234.555
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2%
Morse_decoder_TOP2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/Morse_decoder_TOP.v2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
	debouncer2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/debouncer.v2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
	heartbeat2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/Activity1/heartbeat.v2default:default2
52default:default8@Z8-6157h px? 
a
%s
*synth2I
5	Parameter TOPCOUNT bound to: 20000 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	heartbeat2default:default2
 2default:default2
12default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/Activity1/heartbeat.v2default:default2
52default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	debouncer2default:default2
 2default:default2
22default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/debouncer.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2$
sevenSegmentDisp2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/sevenSegmentDisp.v2default:default2
232default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2-
heartbeat__parameterized02default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/Activity1/heartbeat.v2default:default2
52default:default8@Z8-6157h px? 
b
%s
*synth2J
6	Parameter TOPCOUNT bound to: 100000 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
heartbeat__parameterized02default:default2
 2default:default2
22default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/Activity1/heartbeat.v2default:default2
52default:default8@Z8-6155h px? 
?
default block is never used226*oasys2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/sevenSegmentDisp.v2default:default2
542default:default8@Z8-226h px? 
?
synthesizing module '%s'%s4497*oasys2'
sevenSegmentDecoder2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/new/sevenSegmentDecoder.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2'
sevenSegmentDecoder2default:default2
 2default:default2
32default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/new/sevenSegmentDecoder.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2$
sevenSegmentDisp2default:default2
 2default:default2
42default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/sevenSegmentDisp.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2 
keyProcessor2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/keyProcessor.v2default:default2
232default:default8@Z8-6157h px? 
L
%s
*synth24
 	Parameter DIT bound to: 2'b01 
2default:defaulth p
x
? 
L
%s
*synth24
 	Parameter DAH bound to: 2'b10 
2default:defaulth p
x
? 
M
%s
*synth25
!	Parameter IDLE bound to: 2'b00 
2default:defaulth p
x
? 
P
%s
*synth28
$	Parameter MEASURE bound to: 2'b01 
2default:defaulth p
x
? 
R
%s
*synth2:
&	Parameter TRANSLATE bound to: 2'b10 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter READY bound to: 2'b11 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2-
heartbeat__parameterized12default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/Activity1/heartbeat.v2default:default2
52default:default8@Z8-6157h px? 
e
%s
*synth2M
9	Parameter TOPCOUNT bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2-
heartbeat__parameterized12default:default2
 2default:default2
42default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/Activity1/heartbeat.v2default:default2
52default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
waitCounter2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/waitCounter.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
waitCounter2default:default2
 2default:default2
52default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/waitCounter.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
keyProcessor2default:default2
 2default:default2
62default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/keyProcessor.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2#
code_comparator2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
232default:default8@Z8-6157h px? 
M
%s
*synth25
!	Parameter WAIT bound to: 2'b00 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter CHECK bound to: 2'b10 
2default:defaulth p
x
? 
M
%s
*synth25
!	Parameter DONE bound to: 2'b01 
2default:defaulth p
x
? 
?
synthesizing module '%s'%s4497*oasys2
counter2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/new/counter.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
counter2default:default2
 2default:default2
72default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/imports/new/counter.v2default:default2
232default:default8@Z8-6155h px? 
?
-case statement is not full and has no default155*oasys2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
582default:default8@Z8-155h px? 
?
-case statement is not full and has no default155*oasys2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
782default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2#
code_comparator2default:default2
 2default:default2
82default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2%
Morse_decoder_rom2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/Morse_decoder_rom.v2default:default2
232default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
Morse_decoder_rom2default:default2
 2default:default2
92default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/Morse_decoder_rom.v2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

FSM_letter2default:default2
 2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/FSM_letter.v2default:default2
232default:default8@Z8-6157h px? 
M
%s
*synth25
!	Parameter IDLE bound to: 2'b00 
2default:defaulth p
x
? 
S
%s
*synth2;
'	Parameter CODE_CHECK bound to: 2'b01 
2default:defaulth p
x
? 
M
%s
*synth25
!	Parameter DISP bound to: 2'b10 
2default:defaulth p
x
? 
N
%s
*synth26
"	Parameter CLOSE bound to: 2'b11 
2default:defaulth p
x
? 
?
+Unused sequential element %s was removed. 
4326*oasys2
	state_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/FSM_letter.v2default:default2
432default:default8@Z8-6014h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

FSM_letter2default:default2
 2default:default2
102default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/FSM_letter.v2default:default2
232default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2%
Morse_decoder_TOP2default:default2
 2default:default2
112default:default2
12default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/Morse_decoder_TOP.v2default:default2
232default:default8@Z8-6155h px? 
|
!design %s has unconnected port %s3331*oasys2

FSM_letter2default:default2
clk2default:defaultZ8-3331h px? 
}
!design %s has unconnected port %s3331*oasys2

FSM_letter2default:default2
done2default:defaultZ8-3331h px? 
?
%s*synth2?
xFinished RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 907.738 ; gain = 307.219
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 907.738 ; gain = 307.219
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 907.738 ; gain = 307.219
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
907.7382default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/constrs_1/imports/digilent-xdc-master/Basys-3-Master.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/constrs_1/imports/digilent-xdc-master/Basys-3-Master.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/constrs_1/imports/digilent-xdc-master/Basys-3-Master.xdc2default:default27
#.Xil/Morse_decoder_TOP_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1029.9842default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1029.9842default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Constraint Validation : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2 
keyProcessor2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2#
code_comparator2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                             0001 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                 MEASURE |                             0010 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_               TRANSLATE |                             0100 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                   READY |                             1000 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2 
keyProcessor2default:defaultZ8-3354h px? 
?
!inferring latch for variable '%s'327*oasys2
addr_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
812default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys20
FSM_sequential_nextstate_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
602default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2,
FSM_onehot_nextstate_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
602default:default8@Z8-327h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    WAIT |                              001 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                   CHECK |                              010 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                    DONE |                              100 |                               01
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2#
code_comparator2default:defaultZ8-3354h px? 
?
!inferring latch for variable '%s'327*oasys2,
FSM_onehot_nextstate_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
602default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
	found_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
832default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
done_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
822default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2
next_reg2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.srcs/sources_1/new/code_comparator.v2default:default2
462default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 8     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 8     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
>
%s
*synth2&
Module debouncer 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
E
%s
*synth2-
Module sevenSegmentDisp 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
@
%s
*synth2(
Module waitCounter 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
A
%s
*synth2)
Module keyProcessor 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 8     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      8 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 7     
2default:defaulth p
x
? 
<
%s
*synth2$
Module counter 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 1     
2default:defaulth p
x
? 
D
%s
*synth2,
Module code_comparator 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 8     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
codecompare/done_reg2default:default2%
Morse_decoder_TOP2default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
2
%s*synth2

ROM:
2default:defaulth px? 
?
%s*synth2t
`+--------------------+---------------------------------------+---------------+----------------+
2default:defaulth px? 
?
%s*synth2u
a|Module Name         | RTL Object                            | Depth x Width | Implemented As | 
2default:defaulth px? 
?
%s*synth2t
`+--------------------+---------------------------------------+---------------+----------------+
2default:defaulth px? 
?
%s*synth2u
a|sevenSegmentDecoder | ssd                                   | 32x8          | LUT            | 
2default:defaulth px? 
?
%s*synth2u
a|Morse_decoder_rom   | data                                  | 32x8          | LUT            | 
2default:defaulth px? 
?
%s*synth2u
a|Morse_decoder_TOP   | sevensegDisp/inst_sevenSegmentDec/ssd | 32x8          | LUT            | 
2default:defaulth px? 
?
%s*synth2u
a|Morse_decoder_TOP   | memory/data                           | 32x8          | LUT            | 
2default:defaulth px? 
?
%s*synth2u
a+--------------------+---------------------------------------+---------------+----------------+

2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:19 ; elapsed = 00:00:20 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:00:19 ; elapsed = 00:00:20 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:00:19 ; elapsed = 00:00:20 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    23|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     7|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |    15|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    14|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    12|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    34|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    40|
2default:defaulth px? 
D
%s*synth2,
|9     |FDRE   |   152|
2default:defaulth px? 
D
%s*synth2,
|10    |FDSE   |     8|
2default:defaulth px? 
D
%s*synth2,
|11    |LD     |    10|
2default:defaulth px? 
D
%s*synth2,
|12    |IBUF   |     6|
2default:defaulth px? 
D
%s*synth2,
|13    |OBUF   |    20|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
k
%s
*synth2S
?+------+-----------------+----------------------------+------+
2default:defaulth p
x
? 
k
%s
*synth2S
?|      |Instance         |Module                      |Cells |
2default:defaulth p
x
? 
k
%s
*synth2S
?+------+-----------------+----------------------------+------+
2default:defaulth p
x
? 
k
%s
*synth2S
?|1     |top              |                            |   342|
2default:defaulth p
x
? 
k
%s
*synth2S
?|2     |  codecompare    |code_comparator             |    48|
2default:defaulth p
x
? 
k
%s
*synth2S
?|3     |    inst_count   |counter                     |    10|
2default:defaulth p
x
? 
k
%s
*synth2S
?|4     |  db             |debouncer                   |    30|
2default:defaulth p
x
? 
k
%s
*synth2S
?|5     |    debouncebeat |heartbeat                   |    24|
2default:defaulth p
x
? 
k
%s
*synth2S
?|6     |  keyproc        |keyProcessor                |   180|
2default:defaulth p
x
? 
k
%s
*synth2S
?|7     |    hb1          |heartbeat__parameterized1   |    43|
2default:defaulth p
x
? 
k
%s
*synth2S
?|8     |    spaceTime    |waitCounter                 |    65|
2default:defaulth p
x
? 
k
%s
*synth2S
?|9     |      hb         |heartbeat__parameterized1_0 |    49|
2default:defaulth p
x
? 
k
%s
*synth2S
?|10    |  sevensegDisp   |sevenSegmentDisp            |    57|
2default:defaulth p
x
? 
k
%s
*synth2S
?|11    |    inst_beat    |heartbeat__parameterized0   |    29|
2default:defaulth p
x
? 
k
%s
*synth2S
?+------+-----------------+----------------------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 8 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Runtime : Time (s): cpu = 00:00:16 ; elapsed = 00:00:22 . Memory (MB): peak = 1029.984 ; gain = 307.219
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 1029.984 ; gain = 429.465
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0032default:default2
1029.9842default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
332default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1029.9842default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2[
G  A total of 10 instances were transformed.
  LD => LDCE: 10 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
452default:default2
112default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:282default:default2
00:00:302default:default2
1029.9842default:default2
722.4102default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1029.9842default:default2
0.0002default:defaultZ17-268h px? 
K
"No constraints selected for write.1103*constraintsZ18-5210h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?C:/Users/Gia Duy/Documents/Basys3_project/Assignment_level_1/Assignment_level_1/Assignment_level_1.runs/synth_1/Morse_decoder_TOP.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
xExecuting : report_utilization -file Morse_decoder_TOP_utilization_synth.rpt -pb Morse_decoder_TOP_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Tue May 12 14:11:16 20202default:defaultZ17-206h px? 


End Record