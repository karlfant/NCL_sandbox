`timescale 10ps / 1ps


module ring4;

wire [3:0] A;
wire [3:0] B;
wire [3:0] C;
wire [3:0] D;
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
    $dumpfile("ring4.vcd");
    $dumpvars(0,ring4);
    
 end

// 4 stage ring
PipecomponentN u1(B, BCOMP, A, ACOMP, init);
Pipecomponent u2(C, CCOMP, B, BCOMP, init);
Pipecomponent u3(D, DCOMP, C, CCOMP, init);
PipecomponentD u4(A, ACOMP, D, DCOMP, init);

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


module PipecomponentN(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire [3:0] t0;
wire enable, ACOMPtemp;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(t0[0], A[1], enable, init);  // rotate rails
TH22N  u2(t0[1], A[2], enable, init);
TH22N  u3(t0[2], A[3], enable, init);
TH22N  u4(t0[3], A[0], enable, init);
assign Z = t0[3:0];
TH14 u5 (ACOMPtemp, t0[0], t0[1], t0[2], t0[3]);
assign ACOMP = ACOMPtemp;
endmodule

module PipecomponentD(output [3:0] Z, input ZCOMP, input [3:0] A, output ACOMP, input init);
wire [3:0] t0;
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(t0[0], A[0], enable, init);
TH22N  u2(t0[1], A[1], enable, init);
TH22N  u3(t0[2], A[2], enable, init);
TH22N  u4(t0[3], A[3], enable, init);
assign Z = t0[3:0];
TH14 u5 (ACOMPtemp, t0[0], t0[1], t0[2], t0[3]);
assign ACOMP = ACOMPtemp;
endmodule

