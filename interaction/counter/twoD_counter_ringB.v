/////////////////////////////
// NCL sandbox
//  four oscillator ring with half adder for
// 32 bit counter with two D digit completeness pipelining
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module twoD_counter_ringB (output wire [1:0] sum, output wire [1:0] carryout, input sumcomp, input carrycomp, input [1:0] carryin, output BCOMP, input init);
 
wire [1:0] A;
wire [1:0] B;
wire [1:0] C;
wire [1:0] D;
wire ACOMP, BCOMP, CCOMP, DCOMP, CCOMP2;


// 4 stage ring with halfadder

Pipecomponent2N u1(B, BCOMP, A, ACOMP, init);
halfadd u2(C, carryout, CCOMP2, carrycomp, B, carryin, BCOMP, init);
TH22 u5(CCOMP2, CCOMP, sumcomp);
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

module halfadd(output [1:0] sum, output [1:0] carry, input haCOMP, input carrycomp, input [1:0] A, input [1:0] B, output sumcarryCOMP, input init);
wire [1:0] t0, c0;
wire temp0;
wire enable, Cenable, sumCOMP, carryCOMP;
// the halfadder with null carry blocking
THXOR  u1(t0[0], A[0], B[0], A[1], B[1]);
THXOR  u2(t0[1], A[1], B[0], A[0], B[1]);
TH22  u3(c0[1], A[1], B[1]);
TH22  u13(temp0, B[0], A[1]);
TH12  u4(c0[0], A[0], temp0);
// The output link
THnotN  u0(enable, haCOMP, init);
THnotN  u12(Cenable, carrycomp, init);
TH22  u5(sum[0], t0[0], enable);
TH22  u6(sum[1], t0[1], enable);
TH22  u7(carry[0], c0[0], Cenable);
TH22  u8(carry[1], c0[1], Cenable);
// closure equations
TH12 u9 (sumCOMP, sum[0], sum[1]);
TH12 u10 (carryCOMP, carry[0], carry[1]);
TH22  u11(sumcarryCOMP, sumCOMP, carryCOMP);
endmodule
