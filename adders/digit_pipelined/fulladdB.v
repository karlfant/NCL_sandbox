`timescale 10ps / 1ps

module fulladdA(output [1:0] sum, input sumCOMP, output [1:0] carryout,input carryoutCOMP, input [1:0] A, input [1:0] B, output sumcarryCOMP, input [1:0] carryin, output carryinCOMP, input init);
wire [1:0] temp, carrytemp;

// the fullfadder
// with data carry playahead and
// with null carry play ahead
wire Senable;
wire [1:0] Ts;
THXOR  u1(temp[0], A[0], B[0], A[1], B[1]);
THXOR  u2(temp[1], A[1], B[0], A[0], B[1]);
THXOR  u11(Ts[0], temp[0], carryin[0], temp[1], carryin[1]);
THXOR  u12(Ts[1], temp[1], carryin[0], temp[0], carryin[1]);
TH22  u13(carrytemp[0], temp[1], carryin[0]);
TH22  u14(carrytemp[1], temp[1], carryin[1]);
TH23W2  u18(carryout[0], carrytemp[0], B[0], A[0]);
TH23W2  u19(carryout[1], carrytemp[1], B[1], A[1]);
// sum link
THnotN  tbb3(Senable, sumCOMP, init);
TH22  ob4 (sum[0], Ts[0], Senable);
TH22  ob5 (sum[1], Ts[1], Senable);
// closure
//TH12 u21 (sumcarryCOMP, sum[1], sum[0]);  
TH12 u21 (carryinCOMP, sum[1], sum[0]);  
TH22 u22 (sumcarryCOMP, carryoutCOMP, carryinCOMP);
endmodule
