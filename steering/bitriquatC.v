/////////////////////////////
// NCL sandbox
//  binary + trinary = quaternary adder
//  optimization C
// Karl Fant July 2015
/////////////////////////////
`timescale 1ps / 1ps

module bitriquatC ( output [3:0] quatout, input quatoutcomp, init);

 /* Make an init that pulses once. */
/*  reg init = 1;
  initial begin
     # 1000 init = 0;
     # 20000 $stop;
  end
initial
 begin
    $dumpfile("bitriquatC.vcd");
    $dumpvars(0, bitriquatC);
 end
*/
//wire [3:0] quatout;
wire [2:0] trinary;
wire [1:0] binary;
//wire quatcomp;

ring3gen TB1 (trinary[2:0], quatcomp, init);
ring2gen TB2 (binary[1:0], quatcomp, init);

////// test bench
//////////////////////////////
////// circuit under test

// perform bitriquat
wire [1:0] temp;

// combinational logic
THXOR  u1(temp[0], binary[0], trinary[1], binary[1], trinary[0]);
THXOR  u2(temp[1], binary[0], trinary[2], binary[1], trinary[1]);

// output link for quat
THnotN  o0(quatenable, quatoutcomp, init);
TH33  o1(quatout[0], binary[0], trinary[0], quatenable);
TH22  o2(quatout[1], quatenable, temp[0]);
TH22  o3(quatout[2], quatenable, temp[1]);
TH33  o4(quatout[3], binary[1], trinary[2], quatenable);

////// circuit under test
//////////////////////////////
////// test bench

TH14 u10 (quatcomp, quatout[0], quatout[1], quatout[2], quatout[3]);  // auto consume
endmodule


