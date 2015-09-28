/////////////////////////////
// NCL sandbox
//  minterm full adder
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdC(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, input [1:0] carryin, output sumcarryCOMP, input init);
 
// minterm full adder
wire [7:0] min;
wire Senable, Cenable;
wire [1:0] Ts, Tc;
TH33  u12(min[0], carryin[0], A[0], B[0]);
TH33  u22(min[1], carryin[0], A[0], B[1]);
TH33  u32(min[2], carryin[0], A[1], B[0]);
TH33  u42(min[3], carryin[0], A[1], B[1]);
TH33  u52(min[4], carryin[1], A[0], B[0]);
TH33  u62(min[5], carryin[1], A[0], B[1]);
TH33  u72(min[6], carryin[1], A[1], B[0]);
TH33  u82(min[7], carryin[1], A[1], B[1]);
TH14  u1(Ts[0], min[0], min[3], min[5], min[6]);
TH14  u2(Ts[1], min[1], min[2], min[4], min[7]);
TH14  u3(Tc[0], min[0], min[1], min[2], min[4]);
TH14  u4(Tc[1], min[3], min[5], min[6], min[7]);
// sum link
THnotN  tbb3(Senable, sumCOMP, init);
TH22  ob4 (sum[0], Ts[0], Senable);
TH22  ob5 (sum[1], Ts[1], Senable);
// carry link
THnotN  tbb4(Cenable, carryCOMP, init);
TH22  ob6 (carryout[0], Tc[0], Cenable);
TH22  ob7 (carryout[1], Tc[1], Cenable);
// closure
THCOMP u21 (sumcarryCOMP, sum[1], sum[0], carryout[1], carryout[0]);  
endmodule
