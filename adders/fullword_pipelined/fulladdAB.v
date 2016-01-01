`timescale 10ps / 1ps

module fulladdAB(output [1:0] sum, output [1:0] carryout, input [1:0] A, input [1:0] B, input [1:0] carryin);
// the textbook fullfadder 
// with data carry playahead but
// without null carry play ahead
TH34W2  u8(sum[0], carryout[1], carryin[0], B[0], A[0]);
TH34W2  u9(sum[1], carryout[0], carryin[1], B[1], A[1]);
B23  u18(carryout[0], carryin[0], B[0], A[0]);
B23  u19(carryout[1], carryin[1], B[1], A[1]);
endmodule
