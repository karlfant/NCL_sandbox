/////////////////////////////
// NCL sandbox
//  2 rail ring source generator
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module ring2gen (output wire [1:0] C, input TCOMP, input init);

wire [1:0] A;
wire [1:0] B;
wire [1:0] D;
wire ACOMP, BCOMP, CCOMP, DCOMP, CCOMP2;

// 4 stage ring
Pipecomponent2N u1(B, BCOMP, A, ACOMP, init);
Pipecomponent2 u2(C, CCOMP2, B, BCOMP, init);
Pipecomponent2shift u3(D, DCOMP, C, CCOMP, init);
Pipecomponent2D u4(A, ACOMP, D, DCOMP, init);
TH22 u5(CCOMP2, CCOMP, TCOMP);

endmodule

module Pipecomponent2(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule

module Pipecomponent2shift(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[1], enable);
TH22  u2(Z[1], A[0], enable);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule


module Pipecomponent2N(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z[0], A[0], enable, init);  // rotate rails
TH22  u2(Z[1], A[1], enable);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule

module Pipecomponent2D(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH12 u5 (ACOMP, Z[0], Z[1]);
endmodule

