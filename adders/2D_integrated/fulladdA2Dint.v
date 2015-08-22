`timescale 10ps / 1ps

module fulladdA2Dint(output [1:0] sum, input  sumoutcomp, output [1:0] carryout, input  carryoutcomp, input [1:0] A, input [1:0] B, input [1:0] carryin, output  incomp, input init);
// the fullfadder
wire carryenable, sumenable;
THnotN  u0(sumenable, sumoutcomp, init); // sum closure
TH45W2  u8(sum[0], carryout[1], carryin[0], B[0], A[0], sumenable);
TH45W2  u9(sum[1], carryout[0], carryin[1], B[1], A[1], sumenable);
THnotN  u1(carryenable, carryoutcomp, init); // carry closure
TH44W2  u18(carryout[0], carryenable, carryin[0], B[0], A[0]);
TH44W2  u19(carryout[1], carryenable, carryin[1], B[1], A[1]);
THCOMP  u17(incomp, carryout[0], carryout[1], sum[0], sum[1]);
endmodule
