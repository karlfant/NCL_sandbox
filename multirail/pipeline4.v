`timescale 10ps / 1ps


module pipeline4;

wire [3:0] A;
wire [3:0] B;
wire [3:0] C;
wire [3:0] D;
wire [3:0] E;
wire ACOMP, BCOMP, CCOMP, DCOMP, ECOMP;
  /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 1 init = 1;
     # 20 init = 0;
     # 1000 $stop;

  end
initial
 begin
    $dumpfile("pipeline4.vcd");
    $dumpvars(0,pipeline4);
    
 end

// 4 stage pipeline
PipecomponentI u1(B[3:0], BCOMP, A[3:0], ACOMP, init);
Pipecomponent u2(C[3:0], CCOMP, B[3:0], BCOMP, init);
Pipecomponent u3(D[3:0], DCOMP, C[3:0], CCOMP, init);
Pipecomponent u4(E[3:0], ECOMP, D[3:0], DCOMP, init);
assign A[0] = !ACOMP;  // auto produce
assign A[1] = 0;  // auto produce
assign A[2] = 0;  // auto produce
assign A[3] = 0;  // auto produce
TH14 u5 (ECOMP, E[0], E[1], E[2], E[3]);  // auto consume
endmodule
 
module Pipecomponent(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire [3:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(t0[0], A[0], enable);
TH22  u2(t0[1], A[1], enable);
TH22  u3(t0[2], A[2], enable);
TH22  u4(t0[3], A[3], enable);
assign Z = t0[3:0];
TH14 u5 (ACOMPtemp, t0[0], t0[1], t0[2], t0[3]);
assign ACOMP = ACOMPtemp;
endmodule

module PipecomponentI(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire [3:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(t0[0], A[0], enable, init);
TH22N  u2(t0[1], A[1], enable, init);
TH22N  u3(t0[2], A[2], enable, init);
TH22N  u4(t0[3], A[3], enable, init);
assign Z = t0[3:0];
TH14 u5 (ACOMPtemp, t0[0], t0[1], t0[2], t0[3]);
assign ACOMP = ACOMPtemp;
endmodule

