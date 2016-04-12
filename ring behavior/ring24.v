/////////////////////////////
// NCL sandbox
// 24 oscillation dual rail ring
// padded with delays for a ratio of 4 to 5 
// to match the ratio of the ring movies and match their behavior
// Karl Fant Jan 2016
/////////////////////////////

`timescale 100ps / 1ps

module ring24;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 20 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring24.vcd");
    $dumpvars(0,ring24);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test
wire [1:0]  A [23:0];
wire [23:0]  COMP;

// one rail 4 stage ring
dualbufD1 u0(A[1], COMP[1], A[0], COMP[0], init);   // oscillation 0
dualbufN u1(A[2], COMP[2], A[1], COMP[1], init);   // oscillation 1
dualbufD1 u2(A[3], COMP[3], A[2], COMP[2], init);   // oscillation 2
dualbufN u3(A[4], COMP[4], A[3], COMP[3], init);   // oscillation 3
dualbufD0 u4(A[5], COMP[5], A[4], COMP[4], init);   // oscillation 4
dualbufN u5(A[6], COMP[6], A[5], COMP[5], init);   // oscillation 5
dualbufD1 u6(A[7], COMP[7], A[6], COMP[6], init);   // oscillation 6
dualbufN u7(A[8], COMP[8], A[7], COMP[7], init);   // oscillation 7
dualbufD0 u8(A[9], COMP[9], A[8], COMP[8], init);   // oscillation 8
dualbufN u9(A[10], COMP[10], A[9], COMP[9], init);   // oscillation 9
dualbuf u10(A[11], COMP[11], A[10], COMP[10], init);   // oscillation 0
dualbufN u11(A[12], COMP[12], A[11], COMP[11], init);   // oscillation 11
dualbuf u12(A[13], COMP[13], A[12], COMP[12], init);   // oscillation 12
dualbufN u13(A[14], COMP[14], A[13], COMP[13], init);   // oscillation 13
dualbufdelay16 u14(A[15], COMP[15], A[14], COMP[14], init);   // oscillation 14
dualbufN u15(A[16], COMP[16], A[15], COMP[15], init);   // oscillation 15
dualbuf u16(A[17], COMP[17], A[16], COMP[16], init);   // oscillation 16
dualbufN u17(A[18], COMP[18], A[17], COMP[17], init);   // oscillation 17
dualbuf u18(A[19], COMP[19], A[18], COMP[18], init);   // oscillation 18
dualbufN u19(A[20], COMP[20], A[19], COMP[19], init);   // oscillation 19
dualbuf u20(A[21], COMP[21], A[20], COMP[20], init);   // oscillation 20
dualbufN u21(A[22], COMP[22], A[21], COMP[21], init);   // oscillation 21
dualbuf u22(A[23], COMP[23], A[22], COMP[22], init);   // oscillation 22
dualbufN u23(A[0], COMP[0], A[023], COMP[23], init);   // oscillation 23
endmodule

module dualbuf(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2;
THnotN  u0(enable, ZCOMP, init);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH22  u1(Z[0], X2[0], enable);
TH22  u2(Z[1], X2[1], enable);
TH12  u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufN(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2;
THnotN  u0(enable, ZCOMP, init);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH22N  u1(Z[0], X2[0], enable, init);
TH22N  u2(Z[1], X2[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufD0(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2;
THnot  u0(enable, ZCOMP);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH22D  u1(Z[0], X2[0], enable, init);
TH22N  u2(Z[1], X2[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufD1(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2;
THnot  u0(enable, ZCOMP);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH22N  u1(Z[0], X2[0], enable, init);
TH22D  u2(Z[1], X2[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufdelay8(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10;
THnotN  u0(enable, ZCOMP, init);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH11  u16(X3[0], X2[0]);   // 10 ps delay
TH11  u17(X3[1], X2[1]);   // 10 ps delay
TH11  u18(X4[0], X3[0]);   // 10 ps delay
TH11  u19(X4[1], X3[1]);   // 10 ps delay
TH11  u20(X5[0], X4[0]);   // 10 ps delay
TH11  u21(X5[1], X4[1]);   // 10 ps delay
TH11  u22(X6[0], X5[0]);   // 10 ps delay
TH11  u23(X6[1], X5[1]);   // 10 ps delay
TH11  u24(X7[0], X6[0]);   // 10 ps delay
TH11  u25(X7[1], X6[1]);   // 10 ps delay
TH11  u26(X8[0], X7[0]);   // 10 ps delay
TH11  u27(X8[1], X7[1]);   // 10 ps delay
TH11  u28(X9[0], X8[0]);   // 10 ps delay
TH11  u29(X9[1], X8[1]);   // 10 ps delay
TH11  u30(X10[0], X9[0]);   // 10 ps delay
TH11  u31(X10[1], X9[1]);   // 10 ps delay
TH22N  u1(Z[0], X10[0], enable, init);
TH22N  u2(Z[1], X10[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufdelay16(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18;
THnotN  u0(enable, ZCOMP, init);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH11  u16(X3[0], X2[0]);   // 10 ps delay
TH11  u17(X3[1], X2[1]);   // 10 ps delay
TH11  u18(X4[0], X3[0]);   // 10 ps delay
TH11  u19(X4[1], X3[1]);   // 10 ps delay
TH11  u20(X5[0], X4[0]);   // 10 ps delay
TH11  u21(X5[1], X4[1]);   // 10 ps delay
TH11  u22(X6[0], X5[0]);   // 10 ps delay
TH11  u23(X6[1], X5[1]);   // 10 ps delay
TH11  u24(X7[0], X6[0]);   // 10 ps delay
TH11  u25(X7[1], X6[1]);   // 10 ps delay
TH11  u26(X8[0], X7[0]);   // 10 ps delay
TH11  u27(X8[1], X7[1]);   // 10 ps delay
TH11  u28(X9[0], X8[0]);   // 10 ps delay
TH11  u29(X9[1], X8[1]);   // 10 ps delay
TH11  u30(X10[0], X9[0]);   // 10 ps delay
TH11  u31(X10[1], X9[1]);   // 10 ps delay
TH11  u32(X11[0], X10[0]);   // 10 ps delay
TH11  u33(X11[1], X10[1]);   // 10 ps delay
TH11  u34(X12[0], X11[0]);   // 10 ps delay
TH11  u35(X12[1], X11[1]);   // 10 ps delay
TH11  u36(X13[0], X12[0]);   // 10 ps delay
TH11  u37(X13[1], X12[1]);   // 10 ps delay
TH11  u38(X14[0], X13[0]);   // 10 ps delay
TH11  u39(X14[1], X13[1]);   // 10 ps delay
TH11  u40(X15[0], X14[0]);   // 10 ps delay
TH11  u41(X15[1], X14[1]);   // 10 ps delay
TH11  u42(X16[0], X15[0]);   // 10 ps delay
TH11  u43(X16[1], X15[1]);   // 10 ps delay
TH11  u44(X17[0], X16[0]);   // 10 ps delay
TH11  u45(X17[1], X16[1]);   // 10 ps delay
TH11  u46(X18[0], X17[0]);   // 10 ps delay
TH11  u47(X18[1], X17[1]);   // 10 ps delay
TH22  u1(Z[0], X18[0], enable);
TH22  u2(Z[1], X18[1], enable);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufdelay24(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13, X14, X15, X16, X17, X18, X19, X20, X21, X22, X23, X24, X25, X26;
THnotN  u0(enable, ZCOMP, init);
TH11  u4(V[0], A[0]);   // 10 ps delay
TH11  u5(V[1], A[1]);   // 10 ps delay
TH11  u6(W[0], V[0]);   // 10 ps delay
TH11  u7(W[1], V[1]);   // 10 ps delay
TH11  u8(X[0], W[0]);   // 10 ps delay
TH11  u9(X[1], W[1]);   // 10 ps delay
TH11  u12(X1[0], X[0]);   // 10 ps delay
TH11  u13(X1[1], X[1]);   // 10 ps delay
TH11  u14(X2[0], X1[0]);   // 10 ps delay
TH11  u15(X2[1], X1[1]);   // 10 ps delay
TH11  u16(X3[0], X2[0]);   // 10 ps delay
TH11  u17(X3[1], X2[1]);   // 10 ps delay
TH11  u18(X4[0], X3[0]);   // 10 ps delay
TH11  u19(X4[1], X3[1]);   // 10 ps delay
TH11  u20(X5[0], X4[0]);   // 10 ps delay
TH11  u21(X5[1], X4[1]);   // 10 ps delay
TH11  u22(X6[0], X5[0]);   // 10 ps delay
TH11  u23(X6[1], X5[1]);   // 10 ps delay
TH11  u24(X7[0], X6[0]);   // 10 ps delay
TH11  u25(X7[1], X6[1]);   // 10 ps delay
TH11  u26(X8[0], X7[0]);   // 10 ps delay
TH11  u27(X8[1], X7[1]);   // 10 ps delay
TH11  u28(X9[0], X8[0]);   // 10 ps delay
TH11  u29(X9[1], X8[1]);   // 10 ps delay
TH11  u30(X10[0], X9[0]);   // 10 ps delay
TH11  u31(X10[1], X9[1]);   // 10 ps delay
TH11  u32(X11[0], X10[0]);   // 10 ps delay
TH11  u33(X11[1], X10[1]);   // 10 ps delay
TH11  u34(X12[0], X11[0]);   // 10 ps delay
TH11  u35(X12[1], X11[1]);   // 10 ps delay
TH11  u36(X13[0], X12[0]);   // 10 ps delay
TH11  u37(X13[1], X12[1]);   // 10 ps delay
TH11  u38(X14[0], X13[0]);   // 10 ps delay
TH11  u39(X14[1], X13[1]);   // 10 ps delay
TH11  u40(X15[0], X14[0]);   // 10 ps delay
TH11  u41(X15[1], X14[1]);   // 10 ps delay
TH11  u42(X16[0], X15[0]);   // 10 ps delay
TH11  u43(X16[1], X15[1]);   // 10 ps delay
TH11  u44(X17[0], X16[0]);   // 10 ps delay
TH11  u45(X17[1], X16[1]);   // 10 ps delay
TH11  u46(X18[0], X17[0]);   // 10 ps delay
TH11  u47(X18[1], X17[1]);   // 10 ps delay
TH11  u48(X19[0], X18[0]);   // 10 ps delay
TH11  u49(X19[1], X18[1]);   // 10 ps delay
TH11  u50(X20[0], X19[0]);   // 10 ps delay
TH11  u51(X20[1], X19[1]);   // 10 ps delay
TH11  u52(X21[0], X20[0]);   // 10 ps delay
TH11  u53(X21[1], X20[1]);   // 10 ps delay
TH11  u54(X22[0], X21[0]);   // 10 ps delay
TH11  u55(X22[1], X21[1]);   // 10 ps delay
TH11  u56(X23[0], X22[0]);   // 10 ps delay
TH11  u57(X23[1], X22[1]);   // 10 ps delay
TH11  u58(X24[0], X23[0]);   // 10 ps delay
TH11  u59(X24[1], X23[1]);   // 10 ps delay
TH11  u60(X25[0], X24[0]);   // 10 ps delay
TH11  u61(X25[1], X24[1]);   // 10 ps delay
TH11  u62(X26[0], X25[0]);   // 10 ps delay
TH11  u63(X26[1], X25[1]);   // 10 ps delay
TH22  u1(Z[0], X26[0], enable);
TH22  u2(Z[1], X26[1], enable);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

