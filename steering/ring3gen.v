/////////////////////////////
// NCL sandbox
//  2 rail ring source generator
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module ring3gen (output wire [2:0] C, input TCOMP, input init);

wire [2:0] A;
wire [2:0] B;
wire [2:0] D;
wire ACOMP, BCOMP, CCOMP, DCOMP, CCOMP2;

// 4 stage ring
PipecomponentN u1(B, BCOMP, A, ACOMP, init);
Pipecomponent u2(C, CCOMP2, B, BCOMP, init);
Pipecomponentshift u3(D, DCOMP, C, CCOMP, init);
PipecomponentD u4(A, ACOMP, D, DCOMP, init);
TH22 u5(CCOMP2, CCOMP, TCOMP);
endmodule

module Pipecomponent(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH22  u3(Z[2], A[2], enable);
TH13 u5 (ACOMP, Z[0], Z[1], Z[2]);
endmodule

module Pipecomponentshift(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[2], enable);
TH22  u2(Z[1], A[0], enable);
TH22  u3(Z[2], A[1], enable);
TH13 u5 (ACOMP, Z[0], Z[1], Z[2]);
endmodule


module PipecomponentN(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z[0], A[0], enable, init);  // rotate rails
TH22  u2(Z[1], A[1], enable);
TH22  u3(Z[2], A[2], enable);
TH13 u5 (ACOMP, Z[0], Z[1], Z[2]);
endmodule

module PipecomponentD(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH22N  u3(Z[2], A[2], enable, init);
TH13 u5 (ACOMP, Z[0], Z[1], Z[2]);
endmodule

