`timescale 10ps / 1ps

module fulladdB2Dint(output [1:0] sum, input  sumoutcomp, output [1:0] carryout, input  carryoutcomp, input [1:0] A, input [1:0] B, input [1:0] carryin, output  incomp, input init);
wire carryenable, sumenable;
wire [1:0] temp, carrytemp;
// the fullfadder
THnotN  u0(sumenable, sumoutcomp, init); // sum closure
THXOR  u1(temp[0], A[0], B[0], A[1], B[1]);
THXOR  u2(temp[1], A[1], B[0], A[0], B[1]);
THXORE  u11(sum[0], temp[0], carryin[0], temp[1], carryin[1], sumenable);
THXORE  u12(sum[1], temp[1], carryin[0], temp[0], carryin[1], sumenable);
THnotN  u3(carryenable, carryoutcomp, init); // carry closure
TH22  u13(carrytemp[0], temp[1], carryin[0]);
TH22  u14(carrytemp[1], temp[1], carryin[1]);
TH54W32  u18(carryout[0], carryenable, carrytemp[0], B[0], A[0]);
TH54W32  u19(carryout[1], carryenable, carrytemp[1], B[1], A[1]);
THCOMP  u17(incomp, carryout[0], carryout[1], sum[0], sum[1]);
endmodule
