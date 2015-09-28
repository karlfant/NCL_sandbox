/////////////////////////////
// NCL sandbox
// four stage single rail ring
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps

module ring1(output [3:0] steer, input steerCOMP, input init);

wire  A;
wire  B;
wire  C;
wire  D;
wire ACOMP, BCOMP, CCOMP, DCOMP, DDCOMP;
wire OACOMP, OBCOMP, OCCOMP, ODCOMP;
  /* Make an init that pulses once. */
/*  reg init = 0;
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
*/
///// Testbench
/////////////////////////////
///// Circuit Under Test

// one rail 4 stage ring
PipecomponentN u1(B, OBCOMP, A, ACOMP, init);
Pipecomponent u2(C, OCCOMP, B, BCOMP, init);
Pipecomponent u3(D, ODCOMP, C, CCOMP, init);
PipecomponentD u4(A, OACOMP, D, DCOMP, init);


THnotN u5 (steerenable, steerCOMP, init);
TH22N  u6 (steer[0], A, steerenable, init);
TH22  u7 (steer[1], B, steerenable);
TH22  u8 (steer[2], C, steerenable);
TH22  u9 (steer[3], D, steerenable);

TH22 u10 (OACOMP, ACOMP, steer[0]);
TH22 u11 (OBCOMP, BCOMP, steer[1]);
TH22 u12 (OCCOMP, CCOMP, steer[2]);
TH22 u13 (ODCOMP, DDCOMP, steer[3]);
TH11N u14 (DDCOMP, DCOMP, init);
endmodule

module Pipecomponent(output Z, input ZCOMP, input A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z, A, enable);
assign ACOMP = Z;
endmodule

module PipecomponentN(output  Z, input ZCOMP, input A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z, A, enable, init);
assign ACOMP = Z;
endmodule

module PipecomponentD(output  Z, input ZCOMP, input A, output ACOMP, input init);
wire enable;
THnot  u0(enable, ZCOMP);
TH22D  u1(Z, A, enable, init);
assign ACOMP = Z;
endmodule

