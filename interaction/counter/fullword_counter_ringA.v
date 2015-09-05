/////////////////////////////
// NCL sandbox
//  four oscillator ring with half adder for
// 32 bit counter with full word completeness pipelining
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fullword_counter_ringA (output wire [1:0] sumout, output wire [1:0] carryout, input sumcomp, input [1:0] carryin, input init);
 
wire [1:0] A;
wire [1:0] B;
wire [1:0] C;
wire [1:0] D;
wire [1:0] sum;
wire ACOMP, BCOMP, BCOMP2, CCOMP, DCOMP;

// 4 stage ring with halfadder

Pipecomponent2N u1(B, BCOMP2, A, ACOMP, init);
halfadd u2(sum, carryout, B, carryin);
TH22 u5(BCOMP2, BCOMP, sumcomp);
assign sumout = sum;
Pipecomponent2 u6(C, CCOMP, sum, BCOMP, init);
Pipecomponent2 u3(D, DCOMP, C, CCOMP, init);
Pipecomponent2D u4(A, ACOMP, D, DCOMP, init);
endmodule

module Pipecomponent2(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
//wire [1:0] t0;
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

// the halfadder with out null carry blocking
module halfadd(output [1:0] sum, output [1:0] carryout, input [1:0] A, input [1:0] carryin);
wire sumCOMP, carryCOMP;
THXOR  u1(sum[0], A[0], carryin[0], A[1], carryin[1]);
THXOR  u2(sum[1], A[1], carryin[0], A[0], carryin[1]);
TH22  u3(carryout[1], A[1], carryin[1]);
TH23W2  u4(carryout[0], A[0], carryin[0], A[1]);
endmodule
