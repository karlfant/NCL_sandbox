/////////////////////////////
// NCL sandbox
//  binary + trinary = quaternary adder
//  optimization B
// Karl Fant July 2015
/////////////////////////////
`timescale 1ps / 1ps

module bitriquatB;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 1000 init = 0;
     # 20000 $stop;
 end
initial
 begin
    $dumpfile("bitriquatB.vcd");
    $dumpvars(0, bitriquatB);
 end

wire [3:0] quatout;
wire [2:0] triin;
wire [1:0] biin;
wire quatcomp;

ring3gen TB1 (triin[2:0], quatcomp, init);
ring2gen TB2 (biin[1:0], quatcomp, init);

////// test bench
//////////////////////////////
////// circuit under test

// perform bitriquat
wire bt10, bt11;

// combinational logic
TH22  u4(bt10, biin[1], triin[0]);
TH22  u5(bt11, biin[1], triin[1]);

// output link for quat plus combinational logic
THnotN  o0(quatenable, quatcomp, init);
TH33  o1(quatout[0], biin[0], triin[0], quatenable);
TH54W32  o2(quatout[1], quatenable, bt10, biin[0], triin[1]);
TH54W32  o3(quatout[2], quatenable, bt11, biin[0], triin[2]);
TH33  o4(quatout[3], biin[1], triin[2], quatenable);

////// circuit under test
//////////////////////////////
////// test bench

TH14 u10 (quatcomp, quatout[0], quatout[1], quatout[2], quatout[3]);  // auto consume
endmodule


