`timescale 10ps / 1ps

module fulladd(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryoutCOMP, input [1:0] A, output ACOMP, input [1:0] B, output BCOMP, input [1:0] carryin, output carryinCOMP, input init);
// the textbook fullfadder 
// with data carry playahead but
// without null carry play ahead
wire Senable;
wire [1:0] Ts;
TH34W2  u8(Ts[0], carryout[1], carryin[0], B[0], A[0]);
TH34W2  u9(Ts[1], carryout[0], carryin[1], B[1], A[1]);
B23  u18(carryout[0], carryin[0], B[0], A[0]);
B23  u19(carryout[1], carryin[1], B[1], A[1]);
// sum link
THnotN  tbb3(Senable, sumCOMP, init);
TH22  ob4 (sum[0], Ts[0], Senable);
TH22  ob5 (sum[1], Ts[1], Senable);
// closure
TH12 u21 (carryinCOMP, sum[1], sum[0]);  
TH22 u22 (ACOMP, carryoutCOMP, carryinCOMP);
assign BCOMP = ACOMP;
endmodule
