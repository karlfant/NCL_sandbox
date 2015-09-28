`timescale 10ps / 1ps

module fulladdB(output [1:0] sum, output [1:0] carryout, input [1:0] A, input [1:0] B, input [1:0] carryin);
wire [1:0] temp, carrytemp;

// the fullfadder
// with data carry playahead and
// with null carry play ahead
THXOR  u1(temp[0], A[0], B[0], A[1], B[1]);
THXOR  u2(temp[1], A[1], B[0], A[0], B[1]);
THXOR  u11(sum[0], temp[0], carryin[0], temp[1], carryin[1]);
THXOR  u12(sum[1], temp[1], carryin[0], temp[0], carryin[1]);
TH22  u13(carrytemp[0], temp[1], carryin[0]);
TH22  u14(carrytemp[1], temp[1], carryin[1]);
TH23W2  u18(carryout[0], carrytemp[0], B[0], A[0]);
TH23W2  u19(carryout[1], carrytemp[1], B[1], A[1]);
endmodule
