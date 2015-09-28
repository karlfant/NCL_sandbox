`timescale 10ps / 1ps

module fulladdA2(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, input [1:0] carryin, output sumcarryCOMP, input init);

// the textbook fullfadder 
// with data carry playahead but
// without null carry play ahead
wire Senable, Cenable;
wire [1:0] Ts, Tc;
wire [7:0] suma;
THnotN  tbb3(Senable, sumCOMP, init);
TH44  u8(suma[0], Senable, carryin[0], B[0], A[0]);
TH33  u81(suma[1], Senable, carryout[1], carryin[0]);
TH33  u82(suma[2], Senable, carryout[1], B[0]);
TH33  u83(suma[3], Senable, carryout[1], A[0]);
TH44  u84(suma[4], Senable, carryin[1], B[1], A[1]);
TH33  u85(suma[5], Senable, carryout[0], carryin[1]);
TH33  u86(suma[6], Senable, carryout[0], B[1]);
TH33  u87(suma[7], Senable, carryout[0], A[1]);
TH14  u90(sum[0], suma[0], suma[1], suma[2], suma[3]); 
TH14  u91(sum[1], suma[4], suma[5], suma[6], suma[7]); 

THnotN  tbb4(Cenable, carryCOMP, init);
TH44W2  u18(carryout[0], Cenable, carryin[0], B[0], A[0]);
TH44W2  u19(carryout[1], Cenable, carryin[1], B[1], A[1]);
// sum link
//TH22  ob4 (sum[0], Ts[0], Senable);
//TH22  ob5 (sum[1], Ts[1], Senable);
// carry link
//TH22  ob6 (carryout[0], Tc[0], Cenable);
//TH22  ob7 (carryout[1], Tc[1], Cenable);
// closure
THCOMP u21 (sumcarryCOMP, sum[1], sum[0], carryout[1], carryout[0]);  
endmodule
