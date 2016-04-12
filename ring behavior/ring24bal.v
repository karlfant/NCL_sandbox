/////////////////////////////
// NCL sandbox
// 24 oscillation dual rail ring
// with delays added to balanced wavefront and bubbles paths
// Karl Fant Jan 2016
/////////////////////////////

`timescale 100ps / 1ps

module ring24bal;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 20 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring24bal.vcd");
    $dumpvars(0,ring24bal);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test
wire [1:0]  A [23:0];
wire [23:0]  COMP;

// one rail 4 stage ring
dualbufD1 u0(A[1], COMP[1], A[0], COMP[0], init);
dualbufN u1(A[2], COMP[2], A[1], COMP[1], init);
dualbufD1 u2(A[3], COMP[3], A[2], COMP[2], init);
dualbufN u3(A[4], COMP[4], A[3], COMP[3], init);
dualbufD1 u4(A[5], COMP[5], A[4], COMP[4], init);
dualbufN u5(A[6], COMP[6], A[5], COMP[5], init);
dualbufD0 u6(A[7], COMP[7], A[6], COMP[6], init);
dualbufN u7(A[8], COMP[8], A[7], COMP[7], init);
dualbufD0 u8(A[9], COMP[9], A[8], COMP[8], init);
dualbufN u9(A[10], COMP[10], A[9], COMP[9], init);
dualbufD1 u10(A[11], COMP[11], A[10], COMP[10], init);
dualbufN u11(A[12], COMP[12], A[11], COMP[11], init);
dualbuf u12(A[13], COMP[13], A[12], COMP[12], init);
dualbufN u13(A[14], COMP[14], A[13], COMP[13], init);
dualbuf u14(A[15], COMP[15], A[14], COMP[14], init);
dualbufN u15(A[16], COMP[16], A[15], COMP[15], init);
dualbuf u16(A[17], COMP[17], A[16], COMP[16], init);
dualbufN u17(A[18], COMP[18], A[17], COMP[17], init);
dualbuf u18(A[19], COMP[19], A[18], COMP[18], init);
dualbufN u19(A[20], COMP[20], A[19], COMP[19], init);
dualbuf u20(A[21], COMP[21], A[20], COMP[20], init);
dualbuf u21(A[22], COMP[22], A[21], COMP[21], init);
dualbuf u22(A[23], COMP[23], A[22], COMP[22], init);
dualbuf u23(A[0], COMP[0], A[023], COMP[23], init);
endmodule

module dualbuf(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4;
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
TH22  u1(Z[0], X4[0], enable);
TH22  u2(Z[1], X4[1], enable);
TH12  u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufN(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4;
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
TH22N  u1(Z[0], X4[0], enable, init);
TH22N  u2(Z[1], X4[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufD0(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4;
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
TH11  u16(X3[0], X2[0]);   // 10 ps delay
TH11  u17(X3[1], X2[1]);   // 10 ps delay
TH11  u18(X4[0], X3[0]);   // 10 ps delay
TH11  u19(X4[1], X3[1]);   // 10 ps delay
TH22D  u1(Z[0], X4[0], enable, init);
TH22N  u2(Z[1], X4[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule

module dualbufD1(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable, CCOMP, BCOMP;
wire [1:0] V, W, X, X1, X2, X3, X4;
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
TH11  u16(X3[0], X2[0]);   // 10 ps delay
TH11  u17(X3[1], X2[1]);   // 10 ps delay
TH11  u18(X4[0], X3[0]);   // 10 ps delay
TH11  u19(X4[1], X3[1]);   // 10 ps delay
TH22N  u1(Z[0], X4[0], enable, init);
TH22D  u2(Z[1], X4[1], enable, init);
TH12   u3(CCOMP, Z[0], Z[1]);
TH11  u10 (BCOMP, CCOMP);   // 10 ps delay
TH11  u11 (ACOMP, BCOMP);   // 10 ps delay
endmodule
