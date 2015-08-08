/////////////////////////////
// NCL sandbox
//  binary + trinary = quaternary adder
//  optimization C
// Karl Fant July 2015
/////////////////////////////
`timescale 1ps / 1ps

module bitriquatC;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 1000 init = 0;
     # 20000 $stop;
  end
initial
 begin
    $dumpfile("bitriquatC.vcd");
    $dumpvars(0, bitriquatC);
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
wire [1:0] temp;

// combinational logic
THXOR  u1(temp[0], biin[0], triin[1], biin[1], triin[0]);
THXOR  u2(temp[1], biin[0], triin[2], biin[1], triin[1]);

// output link for quat
THnotN  o0(quatenable, quatcomp, init);
TH33  o1(quatout[0], biin[0], triin[0], quatenable);
TH22  o2(quatout[1], quatenable, temp[0]);
TH22  o3(quatout[2], quatenable, temp[1]);
TH33  o4(quatout[3], biin[1], triin[2], quatenable);

////// circuit under test
//////////////////////////////
////// test bench

TH14 u10 (quatcomp, quatout[0], quatout[1], quatout[2], quatout[3]);  // auto consume
endmodule


