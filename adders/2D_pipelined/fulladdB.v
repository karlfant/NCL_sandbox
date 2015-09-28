/////////////////////////////
// NCL sandbox
// full adder with data and null carry play ahead
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdB(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, input [1:0] carryin, output sumcarryCOMP, input init);

// the fullfadder
// with data carry playahead and
// with null carry play ahead
wire Senable, Cenable;
wire [1:0] Ts, Tc;
wire [1:0] sumtemp, carrytemp;
THXOR  u1(sumtemp[0], A[0], B[0], A[1], B[1]);
THXOR  u2(sumtemp[1], A[1], B[0], A[0], B[1]);
THXOR  u11(Ts[0], sumtemp[0], carryin[0], sumtemp[1], carryin[1]);
THXOR  u12(Ts[1], sumtemp[1], carryin[0], sumtemp[0], carryin[1]);
TH22  u13(carrytemp[0], sumtemp[1], carryin[0]);
TH22  u14(carrytemp[1], sumtemp[1], carryin[1]);
TH23W2  u18(Tc[0], carrytemp[0], B[0], A[0]);
TH23W2  u19(Tc[1], carrytemp[1], B[1], A[1]);
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
