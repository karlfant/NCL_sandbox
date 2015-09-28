/////////////////////////////
// NCL sandbox
// full adder with data and null carry play ahead
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdB2(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, output ABCOMP, input [1:0] carryin, output carryinCOMP, input init);

// the fullfadder
// with data carry playahead and
// with null carry play ahead
wire Senable, Cenable, sumtemp00, sumtemp11, sumtemp01, sumtemp10, sumtempb00, sumtempb11, sumtempb01, sumtempb10, midCOMP, midenable;
wire [1:0] Ts, Tc;
wire [1:0] sumtemp, carrytemp;

THnotN  tbb5(midenable, midCOMP, init);
TH33  u1(sumtemp00, midenable, A[0], B[0]);
TH33  u2(sumtemp11, midenable, A[1], B[1]);
TH12  u3(sumtemp[0], sumtemp00, sumtemp11);
TH33  u4(sumtemp01, midenable, A[0], B[1]);
TH33  u5(sumtemp10, midenable, A[1], B[0]);
TH12  u6(sumtemp[1], sumtemp01, sumtemp10);
//THXORE  u5(sumtemp[1], midenable, A[1], B[0], A[0], B[1]);
TH12  u41(ABCOMP, sumtemp[0], sumtemp[1]);
assign carryinCOMP = midCOMP;


THnotN  tbb3(Senable, sumCOMP, init);
TH33  u7(sumtempb00, Senable, sumtemp[0], carryin[0]);
TH33  u8(sumtempb11, Senable, sumtemp[1], carryin[1]);
TH12  u9(sum[0], sumtempb00, sumtempb11);
TH33  u22(sumtempb01, Senable, sumtemp[0], carryin[1]);
TH33  u23(sumtempb10, Senable, sumtemp[1], carryin[0]);
TH12  u24(sum[1], sumtempb01, sumtempb10);
//THXORE  u11(sum[0], Senable, sumtemp[0], carryin[0], sumtemp[1], carryin[1]);
//THXORE  u12(sum[1], Senable, sumtemp[1], carryin[0], sumtemp[0], carryin[1]);


THnotN  tbb4(Cenable, carryCOMP, init);
TH22  u13(carrytemp[0], sumtemp[1], carryin[0]);
TH22  u14(carrytemp[1], sumtemp[1], carryin[1]);
TH33W2  u18(carryout[0], Cenable, carrytemp[0], sumtemp00);
TH33W2  u19(carryout[1], Cenable, carrytemp[1], sumtemp11);

// closure
THCOMP u21 (midCOMP, sum[1], sum[0], carryout[1], carryout[0]);  
endmodule
