`timescale 10ps / 1ps


module ring3;

wire [2:0] A;
wire [2:0] B;
wire [2:0] C;
wire [2:0] D;
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
    $dumpfile("ring3.vcd");
    $dumpvars(0,ring3);
    
 end

// 4 stage ring
PipecomponentN u1(B, BCOMP, A, ACOMP, init);
Pipecomponent u2(C, CCOMP, B, BCOMP, init);
Pipecomponent u3(D, DCOMP, C, CCOMP, init);
PipecomponentD u4(A, ACOMP, D, DCOMP, init);

endmodule

module Pipecomponent(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire [2:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(t0[0], A[0], enable);
TH22  u2(t0[1], A[1], enable);
TH22  u3(t0[2], A[2], enable);
assign Z = t0[2:0];
TH13 u5 (ACOMPtemp, t0[0], t0[1], t0[2]);
assign ACOMP = ACOMPtemp;
endmodule


module PipecomponentN(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire [2:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(t0[0], A[1], enable, init);  // rotate rails
TH22N  u2(t0[1], A[2], enable, init);
TH22N  u3(t0[2], A[0], enable, init);
assign Z = t0[2:0];
TH13 u5 (ACOMPtemp, t0[0], t0[1], t0[2]);
assign ACOMP = ACOMPtemp;
endmodule

module PipecomponentD(output [2:0] Z, input ZCOMP, input [2:0] A, output ACOMP, input init);
wire [2:0] t0;
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(t0[0], A[0], enable, init);
TH22N  u2(t0[1], A[1], enable, init);
TH22N  u3(t0[2], A[2], enable, init);
assign Z = t0[2:0];
TH13 u5 (ACOMPtemp, t0[0], t0[1], t0[2]);
assign ACOMP = ACOMPtemp;
endmodule

