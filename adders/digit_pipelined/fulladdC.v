/////////////////////////////
// NCL sandbox
//  minterm full adder
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdC(output [1:0] sum, output [1:0] carryout, input [1:0] A, input [1:0] B, input [1:0] carryin);
 
// minterm full adder
wire [7:0] min;
TH33  u12(min[0], carryin[0], A[0], B[0]);
TH33  u22(min[1], carryin[0], A[0], B[1]);
TH33  u32(min[2], carryin[0], A[1], B[0]);
TH33  u42(min[3], carryin[0], A[1], B[1]);
TH33  u52(min[4], carryin[1], A[0], B[0]);
TH33  u62(min[5], carryin[1], A[0], B[1]);
TH33  u72(min[6], carryin[1], A[1], B[0]);
TH33  u82(min[7], carryin[1], A[1], B[1]);
TH14  u1(sum[0], min[0], min[3], min[5], min[6]);
TH14  u2(sum[1], min[1], min[2], min[4], min[7]);
TH14  u3(carryout[0], min[0], min[1], min[2], min[4]);
TH14  u4(carryout[1], min[3], min[5], min[6], min[7]);
endmodule
