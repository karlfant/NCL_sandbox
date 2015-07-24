/////////////////////////////
// NCL sandbox
// four stage single rail ring
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps

module ring1;

wire  A;
wire  B;
wire  C;
wire  D;
wire ACOMP, BCOMP, CCOMP, DCOMP;
  /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 1 init = 1;
     # 20 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring1.vcd");
    $dumpvars(0,ring1);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test

// one rail 4 stage ring
PipecomponentN u1(B, BCOMP, A, ACOMP, init);
Pipecomponent u2(C, CCOMP, B, BCOMP, init);
Pipecomponent u3(D, DCOMP, C, CCOMP, init);
PipecomponentD u4(A, ACOMP, D, DCOMP, init);

endmodule

module Pipecomponent(output Z, input ZCOMP, input A, output ACOMP, input init);
wire t0, enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(t0, A, enable);
assign Z = t0;
assign ACOMP = t0;
endmodule

module PipecomponentN(output  Z, input ZCOMP, input A, output ACOMP, input init);
wire t0, enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(t0, A, enable, init);
assign Z = t0;
assign ACOMP = t0;
endmodule

module PipecomponentD(output  Z, input ZCOMP, input A, output ACOMP, input init);
wire t0, enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(t0, A, enable, init);
assign Z = t0;
assign ACOMP = t0;
endmodule

