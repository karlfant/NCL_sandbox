/////////////////////////////
// NCL sandbox
// four rail ring feeding four rail pipeline
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps

module ring4pipe4;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 200 init = 0;
     # 2000 $stop;
  end
initial
 begin
    $dumpfile("ring4pipe4.vcd");
    $dumpvars(0, ring4pipe4);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test

wire [3:0] A, B, C, D, E;
wire ACOMP, BCOMP, CCOMP, DCOMP, ECOMP;

// 4 rail ring producing 4 rail output
ring4gen TB1 (A[3:0], ACOMP, init);

// 4 rail rail pipeline receiving A flow from ring
Pipecomponent u1(B[3:0], BCOMP, A[3:0], ACOMP, init);
Pipecomponent u2(C[3:0], CCOMP, B[3:0], BCOMP, init);
Pipecomponent u3(D[3:0], DCOMP, C[3:0], CCOMP, init);
Pipecomponent u4(E[3:0], ECOMP, D[3:0], DCOMP, init);

TH14 u5 (ECOMP, E[0], E[1], E[2], E[3]);  // auto consume
endmodule
