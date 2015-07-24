/////////////////////////////
// NCL sandbox
// fano-out fan-in single rail pipeline
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps


module fanoutfanin1;

wire  A;
wire  B, B2;
wire  Ctop, Cbot;
wire  Dtop, Dbot;
wire  E, F;
wire ACOMP, BCOMP, B2COMP, BtopCOMP, BbotCOMP, CtopCOMP, CbotCOMP, DtopCOMP, DbotCOMP, ECOMP, FCOMP;
  /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 1 init = 1;
     # 20 init = 0;
     # 1000 $stop;

  end
initial
 begin
    $dumpfile("fanoutfanin1.vcd");
    $dumpvars(0, fanoutfanin1);
    
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test

THnotN  A0(B, BCOMP, init); // auto produce B input

// fanout fanin pipeline

TH22 u10 (B2COMP, BtopCOMP, BbotCOMP);
Pipecomponent u9 (B2, B2COMP, B, BCOMP, init); // fanout component
Pipecomponent u3 (Ctop, CtopCOMP, B2, BtopCOMP, init);
Pipecomponent u4 (Cbot, CbotCOMP, B2, BbotCOMP, init);
Pipecomponent u5 (Dtop, DCOMP, Ctop, CtopCOMP, init);
Pipecomponent u6 (Dbot, DCOMP, Cbot, CbotCOMP, init);
Pipefanin u7 (E, ECOMP, Dtop, Dbot, DCOMP, init);  // fanin component
Pipecomponent u8 (F, FCOMP, E, ECOMP, init);

assign FCOMP = F;  // auto consume F output
endmodule

module Pipefanin(output Z, input ZCOMP, input A, input B, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH33  u1(Z, A, B, enable);
assign ACOMP = Z;
endmodule

module Pipecomponent(output Z, input ZCOMP, input A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z, A, enable);
assign ACOMP = Z;
endmodule

