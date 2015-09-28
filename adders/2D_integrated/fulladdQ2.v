/////////////////////////////
// NCL sandbox
//  minterm full adder as two halfadders
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdQ2(output [3:0] sumQ, input sumCOMP, output [1:0] carryout, input carryCOMP, input [3:0] AQ, input [3:0] BQ, output ABCOMP, input [1:0] carryin, output sumcarryCOMP, input init);
 
// 2 halfadder full adder
wire Senable, Cenable, sumQCOMP;
wire [3:0] Ts;
wire [1:0] Tc;
// 2 halfadder full adder
wire [3:0] minterma, mintermb, mintermc;
wire [1:0] carrya, carryb, suma;

// the quaternary minterm
wire S0C0, S2C0A, S2C0B, S1C0, S3C0A, S3C0B, S0C1A, S0C1B, S1C1, S2C1, S3C1;
wire IS3C0, IS3C1;
wire sumcarryORCOMP, AB1COMP, AB2COMP, ORenable;
TH22  mt0 (S0C0, AQ[0], BQ[0]);
TH22  mt1 (S2C0A, AQ[1], BQ[1]);
THXOR mt2 (S1C0, AQ[1], BQ[0], AQ[0], BQ[1]);
THXOR mt3 (S2C0B, AQ[2], BQ[0], AQ[0], BQ[2]);
THXOR mt4 (S3C0A, AQ[3], BQ[0], AQ[2], BQ[1]);
THXOR mt5 (S3C0B, AQ[1], BQ[2], AQ[0], BQ[3]);
TH22  mt6 (S0C1A, AQ[2], BQ[2]);
TH22  mt7 (S2C1, AQ[3], BQ[3]);
THXOR mt8 (S0C1B, AQ[3], BQ[1], AQ[1], BQ[3]);
THXOR mt9 (S1C1, AQ[3], BQ[2], AQ[2], BQ[3]);

// the OR rank
wire IS0, IS1, IC0A, IC0B, IS2, IC1A, IC1B, IS3;
THnotN  tbb2(ORenable, sumcarryORCOMP, init);
TH34W2  OR0(IS0, ORenable, S0C0, S0C1A, S0C1B);
TH33W2  OR1(IS1, ORenable, S1C0, S1C1);
TH33W2  OR2(IC0A, ORenable, S1C0, S2C0B);
TH33W2  OR3(IC0B, ORenable, S2C0A, S0C0);
TH34W2  OR4(IS2, ORenable, S2C0B, S2C0A, S2C1);
TH33W2  OR5(IC1A, ORenable, S2C1, S0C1A);
TH33W2  OR6(IC1B, ORenable, S0C1B, S1C1);
TH33W2  OR7(IS3, ORenable, S3C0A, S3C0B);
TH14 OR8 (AB1COMP, IS0, IS1, IS2, IS3);  // auto consume sum
TH14 OR9 (AB2COMP, IC0A, IC0B, IC1A, IC1B);  // auto consume sum
TH33W2 OR10 (ABCOMP, AB1COMP, AB2COMP, IS3);

// the output rank
THnotN  tbb3(Senable, sumCOMP, init);
THXORE out0 (sumQ[0], Senable, carryin[0], IS0, carryin[1], IS3);
THXORE out1 (sumQ[1], Senable, carryin[0], IS1, carryin[1], IS0);
THXORE out2 (sumQ[2], Senable, carryin[0], IS2, carryin[1], IS1);
THXORE out3 (sumQ[3], Senable, carryin[0], IS3, carryin[1], IS2);
TH14 u10 (sumQCOMP, sumQ[1], sumQ[0], sumQ[2], sumQ[3]);  // auto consume sum

THnotN  tbb4(Cenable, carryCOMP, init);
TH22  out6(IS3C0, carryin[0], IS3);
TH22  out7(IS3C1, carryin[1], IS3);
TH44W3  out4(carryout[0], Cenable, IC0A, IC0B, IS3C0);
TH44W3  out5(carryout[1], Cenable, IC1A, IC1B, IS3C1);
// sum link
//THnotN  tbb3(Senable, sumCOMP, init);
//TH22  link0 (sumQ[0], Ts[0], Senable);
//TH22  link1 (sumQ[1], Ts[1], Senable);
//TH22  link2 (sumQ[2], Ts[2], Senable);
//TH22  link3 (sumQ[3], Ts[3], Senable);
//TH14 u10 (sumQCOMP, sumQ[1], sumQ[0], sumQ[2], sumQ[3]);  // auto consume sum
// carry link
//THnotN  tbb4(Cenable, carryCOMP, init);
//TH22  link4 (carryout[0], Tc[0], Cenable);
//TH22  link5 (carryout[1], Tc[1], Cenable);
//TH12  link6 (sumcarryCOMP, carryout[1], carryout[0]); 
// closure
TH33W2 u21 (sumcarryORCOMP, sumQCOMP, carryout[1], carryout[0]);  
assign sumcarryCOMP = sumcarryORCOMP;
endmodule
