/////////////////////////////
// NCL sandbox
// four rail ring feeding four rail pipeline
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps

module ring4pipe4;

wire [3:0] A, B, C, D, E;
wire ACOMP, BCOMP, CCOMP, DCOMP, ECOMP;
  /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 0 init = 1;
     # 200 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring4pipe4.vcd");
    $dumpvars(0, ring4pipe4);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test

// 4 rail ring producing 4 rail output
ring4gen TB1 (A[3:0], ACOMP, init);

// 4 rail rail pipeline receiving A flow from ring
PipecomponentP u1(B[3:0], BCOMP, A[3:0], ACOMP, init);
PipecomponentP u2(C[3:0], CCOMP, B[3:0], BCOMP, init);
PipecomponentP u3(D[3:0], DCOMP, C[3:0], CCOMP, init);
PipecomponentP u4(E[3:0], ECOMP, D[3:0], DCOMP, init);

TH14 u5 (ECOMP, E[0], E[1], E[2], E[3]);  // auto consume
endmodule

module PipecomponentP(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH22  u3(Z[2], A[2], enable);
TH22  u4(Z[3], A[3], enable);
TH14 u5 (ACOMP, Z[0], Z[1], Z[2], Z[3]);
endmodule

module PipecomponentI(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH22N  u3(Z[2], A[2], enable, init);
TH22N  u4(Z[3], A[3], enable, init);
TH14 u5 (ACOMP, Z[0], Z[1], Z[2], Z[3]);
endmodule

