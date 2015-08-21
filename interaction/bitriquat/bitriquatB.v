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
wire [2:0] trinary;
wire [1:0] binary;
wire quatcomp;

ring3gen TB1 (trinary[2:0], quatcomp, init);
ring2gen TB2 (binary[1:0], quatcomp, init);

////// test bench
//////////////////////////////
////// circuit under test

// perform bitriquat
wire bt10, bt11;

// combinational logic
TH22  u4(bt10, binary[1], trinary[0]);
TH22  u5(bt11, binary[1], trinary[1]);

// output link for quat plus combinational logic
THnotN  o0(quatenable, quatcomp, init);
TH33  o1(quatout[0], binary[0], trinary[0], quatenable);
TH54W32  o2(quatout[1], quatenable, bt10, binary[0], trinary[1]);
TH54W32  o3(quatout[2], quatenable, bt11, binary[0], trinary[2]);
TH33  o4(quatout[3], binary[1], trinary[2], quatenable);

////// circuit under test
//////////////////////////////
////// test bench

TH14 u10 (quatcomp, quatout[0], quatout[1], quatout[2], quatout[3]);  // auto consume
endmodule


