`timescale 10ps / 1ps

module steerD2(output [1:0] Ss, input SCOMP, output [1:0] Ts, input TCOMP, input [1:0] A, output ACOMP, input [1:0] steerin, output steerinCOMP, output [1:0] steerout, input steeroutCOMP, input init);

// 4 way steer component wit optimized steer piplineing
wire Sdone, Tdone, Senable, Tenable, StrCOMP, AACOMP;
wire Sgo, Tgo;

TH22  stu0 (Sgo, SCOMP, steeroutCOMP);
THnotN  tbb2(Senable, Sgo, init);
TH33  stu14(Ss[0], A[0], steerin[0], Senable);
TH33  stu24(Ss[1], A[1], steerin[0], Senable);
TH12  stu51(Sdone, Ss[0], Ss[1]);
assign steerout[0] = Sdone;

TH22  stu1 (Tgo, TCOMP, steeroutCOMP);
THnotN  tbb3(Tenable, Tgo, init);
TH33  stu15(Ts[0], A[0], steerin[1], Tenable);
TH33  stu25(Ts[1], A[1], steerin[1], Tenable);
TH12  stu61(Tdone, Ts[0], Ts[1]);
assign steerout[1] = Tdone;

// pipeline the steer down the flow path
//THnotN  tbb6(steerenable, steeroutCOMP, init);
//TH22  stu35(steerout[0], steerin[0], steerenable);
//TH22  stu36(steerout[1], steerin[1], steerenable);
//TH22  stu37(steerout[2], steerin[2], steerenable);
//TH22  stu38(steerout[3], steerin[3], steerenable);
TH12  stu31(ACOMP, Sdone, Tdone);
assign steerinCOMP = ACOMP;
//TH14  stu32(StrCOMP, steerout[0], steerout[1], steerout[2], steerout[3]);
//TH22  stu33 (steerinCOMP, AACOMP, StrCOMP);
//assign ACOMP = steerinCOMP;
endmodule
