`timescale 10ps / 1ps

module halfaddI(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, output ACOMP, input [1:0] B, output BCOMP, input init);

// the textbook halffadder 
// with data carry playahead but
// without null carry play ahead
wire Senable, Cenable;

THnotN  tbb3(Senable, sumCOMP, init);
THXORE  u8(sum[0], Senable, B[1], A[1], B[0], A[0]);
THXORE  u9(sum[1], Senable, B[0], A[1], B[1], A[0]);
THnotN  tbb4(Cenable, carryCOMP, init);
TH54W32  u18(carryout[0], Cenable, B[0], B[1], A[0]);
TH33  u19(carryout[1], Cenable, B[1], A[1]);

THCOMP u21 (ACOMP, sum[1], sum[0], carryout[1], carryout[0]);  
assign BCOMP = ACOMP;
endmodule
