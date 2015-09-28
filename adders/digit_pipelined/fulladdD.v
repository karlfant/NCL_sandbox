/////////////////////////////
// NCL sandbox
//  minterm full adder as two halfadders
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdD(output [1:0] sum, output [1:0] carryout, input [1:0] A, input [1:0] B, input [1:0] carryin);
 
// 2 halfadder full adder
wire [3:0] minterma, mintermb, mintermc;
wire [1:0] carrya, carryb, suma;
TH22  u12(minterma[0], A[0], B[0]);
TH22  u22(minterma[1], A[0], B[1]);
TH22  u32(minterma[2], A[1], B[0]);
TH22  u42(minterma[3], A[1], B[1]);
TH12  u1(suma[0], minterma[0], minterma[3]);
TH12  u2(suma[1], minterma[1], minterma[2]);
TH13  u3(carrya[0], minterma[0], minterma[1], minterma[2]);
assign carrya[1] = min[3];
TH22  u52(mintermb[0], carryin[0], suma[0]);
TH22  u62(mintermb[1], carryin[0], suma[1]);
TH22  u72(mintermb[2], carryin[1], suma[0]);
TH22  u82(mintermb[3], carryin[1], suma[1]);
TH12  u4(sum[0], mintermb[0], mintermb[3]);
TH12  u5(sum[1], mintermb[1], mintermb[2]);
TH13  u6(carryb[0], mintermb[0], mintermb[1], mintermb[2]);
assign carryb[1] = mintermb[3];
TH22  u53(mintermc[1], carrya[0], carryb[0]);
TH22  u63(mintermc[2], carrya[0], carryb[1]);
TH22  u73(mintermc[3], carrya[1], carryb[0]);
TH22  u83(mintermc[4], carrya[1], carryb[1]);
TH13  u7(carryout[1], mintermc[1], mintermc[2], mintermc[3]);
assign carryout[0] = mintermc[0];
endmodule
