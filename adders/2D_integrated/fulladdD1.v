/////////////////////////////
// NCL sandbox
//  minterm full adder as two halfadders
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdD1(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, output ABCOMP, input [1:0] carryin, output carryinCOMP, input init);
 
// 2 halfadder full adder
wire [3:0] minterma, mintermb, mintermc;
wire [1:0] carrya, carryb, suma, carryaa;
wire minaCOMP, minaenable, minbCOMP, minbenable, mincenable, carryaCOMP, carryaenable, ABCOMP;

THnotN  tbb3(minaenable, minaCOMP, init);
TH33  u12(minterma[0], A[0], B[0], minaenable);
TH33  u22(minterma[1], A[0], B[1], minaenable);
TH33  u32(minterma[2], A[1], B[0], minaenable);
TH33  u42(minterma[3], A[1], B[1], minaenable);
TH12  u1(suma[0], minterma[0], minterma[3]);
TH12  u2(suma[1], minterma[1], minterma[2]);
TH13  u3(carrya[0], minterma[0], minterma[1], minterma[2]);
assign carrya[1] = minterma[3];
// closure
THCOMP  k2(ABCOMP, suma[0], suma[1], carrya[0], carrya[1]);

THnotN  tbb4(minbenable, minbCOMP, init);
TH33  u52(mintermb[0], carryin[0], suma[0], minbenable);
TH33  u62(mintermb[1], carryin[0], suma[1], minbenable);
TH33  u72(mintermb[2], carryin[1], suma[0], minbenable);
TH33  u82(mintermb[3], carryin[1], suma[1], minbenable);
TH12  u4(sum[0], mintermb[0], mintermb[3]);
TH12  u5(sum[1], mintermb[1], mintermb[2]);
TH13  u6(carryb[0], mintermb[0], mintermb[1], mintermb[2]);
assign carryb[1] = mintermb[3];
// closure
THCOMP  u25(carryinCOMP, sum[0], sum[1], carryb[0], carryb[1]);
TH22  ob53 (minaCOMP, carryinCOMP, carryaCOMP);

THnotN  tbb6(mincenable, carryCOMP, init);
TH33  u8(mintermc[0], carrya[0], carryb[0], mincenable);
TH33  u9(mintermc[1], carrya[0], carryb[1], mincenable);
TH33  u10(mintermc[2], carrya[1], carryb[0], mincenable);
TH33  u20(mintermc[3], carrya[1], carryb[1], mincenable);
assign  carryout[0] = mintermc[0];
TH13  u11(carryout[1], mintermc[1], mintermc[2], mintermc[3]);
TH12 u35 (carryaCOMP, carryout[0], carryout[1]);
// closure
TH22 u21 (minbCOMP, sumCOMP, carryaCOMP);  
endmodule
