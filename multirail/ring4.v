/////////////////////////////
// NCL sandbox
// four oscillation four rail pipeline ring
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps


module ring4;

wire [3:0] A, B, C, D;
wire ACOMP, BCOMP, CCOMP, DCOMP;
  /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 0 init = 1;
     # 20 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring4.vcd");
    $dumpvars(0,ring4);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test


// 4 rail 4 oscillation ring
PipecomponentN u1(B, BCOMP, A, ACOMP, init);
Pipecomponent u2(C, CCOMP, B, BCOMP, init);
Pipecomponent u3(D, DCOMP, C, CCOMP, init);
PipecomponentD u4(A, ACOMP, D, DCOMP, init);

endmodule

module Pipecomponent(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH22  u3(Z[2], A[2], enable);
TH22  u4(Z[3], A[3], enable);
TH14 u5 (ACOMP, Z[0], Z[1], Z[2], Z[3]);
endmodule


module PipecomponentN(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[1], enable);  // rotate rails
TH22  u2(Z[1], A[2], enable);
TH22  u3(Z[2], A[3], enable);
TH22N  u4(Z[3], A[0], enable, init);  //block data
TH14 u5 (ACOMP, Z[0], Z[1], Z[2], Z[3]);
endmodule

module PipecomponentD(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH22N  u3(Z[2], A[2], enable, init);
TH22N  u4(Z[3], A[3], enable, init);
TH14 u5 (ACOMP, Z[0], Z[1], Z[2], Z[3]);
endmodule

