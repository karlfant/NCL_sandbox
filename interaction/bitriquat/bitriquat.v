/////////////////////////////
// NCL sandbox
//  binary + trinary = quaternary adder
//  canonical minterm form
// Karl Fant July 2015
/////////////////////////////
`timescale 1ps / 1ps

module bitriquat;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 1000 init = 0;
     # 20000 $stop;
  end
initial
 begin
    $dumpfile("bitriquat.vcd");
    $dumpvars(0, bitriquat);
 end

wire [3:0] quaternary;
wire [3:0] quatout;
wire [2:0] trinary;
wire [1:0] binary;
wire quatcomp;

// generate input patterns for the adder
ring3gen TB1 (trinary[2:0], quatcomp, init);
ring2gen TB2 (binary[1:0], quatcomp, init);

////// test bench
//////////////////////////////
////// circuit under test

// perform bitriquat
wire bt00, bt01, bt02, bt10, bt11, bt12;

// combinational logic minterm
TH22  u1(bt00, binary[0], trinary[0]);
TH22  u2(bt01, binary[0], trinary[1]);
TH22  u3(bt02, binary[0], trinary[2]);
TH22  u4(bt10, binary[1], trinary[0]);
TH22  u5(bt11, binary[1], trinary[1]);
TH22  u6(bt12, binary[1], trinary[2]);

assign quaternary[0] = bt00;
TH12  u7(quaternary[1], bt10, bt01);
TH12  u11(quaternary[2], bt11, bt02);
assign quaternary[3] = bt12;

// output link for quat
THnotN  o0(quatenable, quatcomp, init);
TH22  o1(quatout[0], quaternary[0], quatenable);
TH22  o2(quatout[1], quaternary[1], quatenable);
TH22  o3(quatout[2], quaternary[2], quatenable);
TH22  o4(quatout[3], quaternary[3], quatenable);

////// circuit under test
//////////////////////////////
////// test bench

TH14 u10 (quatcomp, quatout[0], quatout[1], quatout[2], quatout[3]);  // auto consume
endmodule


