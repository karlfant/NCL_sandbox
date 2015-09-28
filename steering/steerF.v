`timescale 10ps / 1ps

module steerF(output [1:0] Ss, output [1:0] Ts, output [1:0] Us, output [1:0] Vs, input [1:0] A, input [3:0] steerin, output [3:0] steerout);

// 4 way steer component 
TH22  stu14(Ss[0], A[0], steerin[0]);
TH22  stu24(Ss[1], A[1], steerin[0]);

TH22  stu15(Ts[0], A[0], steerin[1]);
TH22  stu25(Ts[1], A[1], steerin[1]);

TH22  stu16(Us[0], A[0], steerin[2]);
TH22  stu26(Us[1], A[1], steerin[2]);

TH22  stu17(Vs[0], A[0], steerin[3]);
TH22  stu27(Vs[1], A[1], steerin[3]);

assign steerout = steerin;

endmodule
