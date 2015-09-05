/////////////////////////////
// NCL sandbox
//  four oscillator ring with half adder for
// 32 bit counter with two D digit completeness pipelining
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module twoD_counter_ringC (output wire [1:0] sum, input sumCOMP, output wire [1:0] carryout, input carryoutCOMP, input [1:0] carryin, output carryinCOMP, input init);
 
wire [1:0] A;
wire [1:0] B;
wire [1:0] C;
wire [1:0] D;
wire ACOMP, BCOMP, CCOMP, DCOMP, CCOMP2;


// 4 stage ring with halfadder

Pipecomponent2N u1(B, BCOMP, A, ACOMP, init);
halfadd u2(C, CCOMP2, carryout, carryoutCOMP, B, BCOMP, carryin, carryinCOMP, init);
TH22 u5(CCOMP2, CCOMP, sumCOMP);
assign sum = C;
Pipecomponent2 u3(D, DCOMP, C, CCOMP, init);
Pipecomponent2D u4(A, ACOMP, D, DCOMP, init);

endmodule

module Pipecomponent2(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule

module Pipecomponent2N(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z[0], A[0], enable, init);  // rotate rails
TH22N  u2(Z[1], A[1], enable, init);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule

module Pipecomponent2D(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule

module halfadd(output [1:0] sum, input suminCOMP, output [1:0] carryout, input carryoutCOMP, input [1:0] A, output sumcarrycomp, input [1:0] B, output sumcarrycompA, input init);
wire [1:0] t0, c0;
wire Senable, Cenable, sumCOMP, carryCOMP;
wire [3:0] min;
// the halfadder without null carry blocking
TH22  u12(min[0], A[0], B[0]);
TH22  u22(min[1], A[0], B[1]);
TH22  u32(min[2], A[1], B[0]);
TH22  u42(min[3], A[1], B[1]);
TH12  u1(t0[0], min[0], min[3]);
TH12  u2(t0[1], min[1], min[2]);
TH13  u3(c0[0], min[0], min[1], min[2]);
// The output link
THnotN  u0(Senable, suminCOMP, init);
THnotN  u13(Cenable, carryoutCOMP, init);
TH22  u5(sum[0], t0[0], Senable);
TH22  u6(sum[1], t0[1], Senable);
TH22  u7(carryout[0], c0[0], Cenable);
TH22  u8(carryout[1], min[3], Cenable);
// closure equations
THCOMP u9 (sumcarrycomp, sum[0], sum[1], carryout[0], carryout[1]);
assign sumcarrycompA = sumcarrycomp;
endmodule
