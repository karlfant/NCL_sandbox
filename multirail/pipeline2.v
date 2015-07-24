`timescale 10ps / 1ps


module pipeline2;

wire [1:0] A;
wire [1:0] B;
wire [1:0] C;
wire [1:0] D;
wire [1:0] E;
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
    $dumpfile("pipeline2.vcd");
    $dumpvars(0,pipeline2);
    
 end

// 4 stage pipeline
PipecomponentI u1(B[1:0], BCOMP, A[1:0], ACOMP, init);
Pipecomponent u2(C[1:0], CCOMP, B[1:0], BCOMP, init);
Pipecomponent u3(D[1:0], DCOMP, C[1:0], CCOMP, init);
Pipecomponent u4(E[1:0], ECOMP, D[1:0], DCOMP, init);

assign A[0] = !ACOMP;  // auto produce
assign A[1] = 0;  // auto produce
TH12 u5 (ECOMP, E[0], E[1]);  // auto consume
endmodule

module Pipecomponent(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
//wire [1:0] A;
//wire [1:0] Z;
wire [1:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(t0[0], A[0], enable);
TH22  u2(t0[1], A[1], enable);
assign Z = t0[1:0];
TH12 u5 (ACOMPtemp, t0[0], t0[1]);
assign ACOMP = ACOMPtemp;
endmodule

module PipecomponentI(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
//wire [1:0] A;
//wire [1:0] Z;
wire [1:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(t0[0], A[0], enable, init);
TH22N  u2(t0[1], A[1], enable, init);
assign Z = t0[1:0];
TH12 u5 (ACOMPtemp, t0[0], t0[1]);
assign ACOMP = ACOMPtemp;
endmodule

