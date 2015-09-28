/////////////////////////////
// NCL sandbox
//  minterm full adder
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdC1(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, input [1:0] carryin, output sumcarryCOMP, input init);
 
// minterm full adder
wire [7:0] min;
wire Senable, Cenable;
wire [1:0] Ts, Tc;
wire TsA, TsB, TsC, TsD, TcA, TcB, TcC, TcD, minenable, Tsenable, Tcenable, minCOMP, minSCOMP, minCCOMP, TcCOMP, TsCOMP;

THnotN  ux(minenable, minCOMP, init);
TH44  u12(min[0], minenable, carryin[0], A[0], B[0]);
TH44  u22(min[1], minenable, carryin[0], A[0], B[1]);
TH44  u32(min[2], minenable, carryin[0], A[1], B[0]);
TH44  u42(min[3], minenable, carryin[0], A[1], B[1]);
TH44  u52(min[4], minenable, carryin[1], A[0], B[0]);
TH44  u62(min[5], minenable, carryin[1], A[0], B[1]);
TH44  u72(min[6], minenable, carryin[1], A[1], B[0]);
TH44  u82(min[7], minenable, carryin[1], A[1], B[1]);
TH14  ua(minA, min[0], min[1], min[2], min[3]);
TH14  ub(minB, min[4], min[5], min[6], min[7]);
TH12  uc(sumcarryCOMP, minA, minB);

THnotN  x5(Tsenable, TsCOMP, init);
TH33W2  x1(TsA, Tsenable, min[0], min[3]);
TH33W2  x4(TsB, Tsenable, min[5], min[6]);
TH33W2  x2(TsC, Tsenable, min[1], min[2]);
TH33W2  x3(TsD, Tsenable, min[4], min[7]);
TH14  x6(minSCOMP, TsA, TsB, TsC, TsD);

THnotN  y1(Senable, sumCOMP, init);
TH33W2  y2(sum[0], Senable, TsA, TsB);
TH33W2  y3(sum[1], Senable, TsC, TsD);
TH12    y4(TsCOMP, sum[0], sum[1]);

THnotN  u1(Tcenable, TcCOMP, init);
TH33W2  u2(TcA, Tcenable, min[0], min[1]);
TH33W2  u3(TcB, Tcenable, min[2], min[4]);
TH33W2  u4(TcC, Tcenable, min[3], min[5]);
TH33W2  u5(TcD, Tcenable, min[6], min[7]);
TH14  u6(minCCOMP, TcA, TcB, TcC, TcD);

TH22 w1(minCOMP, minSCOMP, minCCOMP);

THnotN  v1(Cenable, carryCOMP, init);
TH33W2  v2 (carryout[0], Cenable, TcA, TcB);
TH33W2  v3 (carryout[1], Cenable, TcC, TcD);
TH12    v4(TcCOMP, carryout[0], carryout[1]);

// sum link
//THnotN  tbb3(Senable, sumCOMP, init);
//TH22  ob4 (sum[0], Ts[0], Senable);
//TH22  ob5 (sum[1], Ts[1], Senable);
// carry link
//THnotN  tbb4(Cenable, carryCOMP, init);
//TH22  ob6 (carryout[0], Tc[0], Cenable);
//TH22  ob7 (carryout[1], Tc[1], Cenable);
// closure
//THCOMP u21 (sumcarryCOMP, sum[1], sum[0], carryout[1], carryout[0]);  
endmodule
