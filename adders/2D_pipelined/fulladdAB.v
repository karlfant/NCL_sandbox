`timescale 10ps / 1ps

module fulladdAB(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, input [1:0] carryin, output sumcarryCOMP, input init);

// the textbook fullfadder 
// with data carry playahead but
// without null carry play ahead
wire Senable, Cenable;
wire [1:0] Ts, Tc;
TH34W2  u8(Ts[0], carryout[1], carryin[0], B[0], A[0]);
TH34W2  u9(Ts[1], carryout[0], carryin[1], B[1], A[1]);
B23  u18(Tc[0], carryin[0], B[0], A[0]);
B23  u19(Tc[1], carryin[1], B[1], A[1]);
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
