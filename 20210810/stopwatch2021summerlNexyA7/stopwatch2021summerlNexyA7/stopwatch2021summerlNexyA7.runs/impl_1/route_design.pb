
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: bf2e5d8a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1074.879 ; gain = 120.9412default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
{
\No timing constraints were detected. The router will operate in resource-optimization mode.
64*routeZ35-64h px? 
{

Phase %s%s
101*constraints2
2.1 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.1 Fix Topology Constraints | Checksum: bf2e5d8a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1079.945 ; gain = 126.0082default:defaulth px? 
t

Phase %s%s
101*constraints2
2.2 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.2 Pre Route Cleanup | Checksum: bf2e5d8a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1079.945 ; gain = 126.0082default:defaulth px? 
H
3Phase 2 Router Initialization | Checksum: 0230b66a
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
B
-Phase 3 Initial Routing | Checksum: c4e3d268
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.297 ; gain = 131.3592default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 18913598c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.742 ; gain = 131.8052default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
D
/Phase 9 Depositing Routes | Checksum: d3cbe397
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.742 ; gain = 131.8052default:defaulth px? 
=
Router Completed Successfully
16*routeZ35-16h px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:28 ; elapsed = 00:00:25 . Memory (MB): peak = 1085.742 ; gain = 131.8052default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
422default:default2
42default:default2
42default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:282default:default2
00:00:252default:default2
1085.7422default:default2
131.8052default:defaultZ17-268h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0372default:default2
1085.7422default:default2
0.0002default:defaultZ17-268h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?C:/Xilinx/SHCodesign2021/stopwatch2021summerlNexyA7/stopwatch2021summerlNexyA7.runs/impl_1/Stopwatch2021summerNexysA7_drc_routed.rpt?C:/Xilinx/SHCodesign2021/stopwatch2021summerlNexyA7/stopwatch2021summerlNexyA7.runs/impl_1/Stopwatch2021summerNexysA7_drc_routed.rpt2default:default8Z2-168h px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
iThere are no user specified timing constraints. Timing constraints are needed for proper timing analysis.200*timingZ38-313h px? 
P
/No user defined clocks was found in the design!216*powerZ33-232h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 


End Record