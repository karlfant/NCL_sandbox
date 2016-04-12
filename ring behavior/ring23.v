/////////////////////////////
// NCL sandbox
// 23 oscillation dual rail ring
// Karl Fant Jan 2016
/////////////////////////////

`timescale 100ps / 1ps

module ring23;

 /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 1 init = 1;
     # 20 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring23.vcd");
    $dumpvars(0,ring23);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test
wire [1:0]  A [22:0];
wire [22:0]  COMP;

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
dualbufD0 u10(A[11], COMP[11], A[10], COMP[10], init);
dualbufN u11(A[12], COMP[12], A[11], COMP[11], init);
dualbufD0 u12(A[13], COMP[13], A[12], COMP[12], init);
dualbufN u13(A[14], COMP[14], A[13], COMP[13], init);
dualbufD0 u14(A[15], COMP[15], A[14], COMP[14], init);
dualbufN u15(A[16], COMP[16], A[15], COMP[15], init);
dualbufD0 u16(A[17], COMP[17], A[16], COMP[16], init);
dualbufN u17(A[18], COMP[18], A[17], COMP[17], init);
dualbufD0 u18(A[19], COMP[19], A[18], COMP[18], init);
dualbufN u19(A[20], COMP[20], A[19], COMP[19], init);
dualbufD0 u20(A[21], COMP[21], A[20], COMP[20], init);
dualbufN u21(A[22], COMP[22], A[21], COMP[21], init);
dualbuf u22(A[0], COMP[0], A[22], COMP[22], init);
endmodule

module dualbuf(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
wire [1:0] X;
THnotN  u0(enable, ZCOMP, init);
//TH12  u4(X[0], A[0], A[1]);
//TH12  u5(X[1], A[1], A[0]);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH12  u3(ACOMP, Z[0], Z[1]);
endmodule

module dualbufN(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH12   u3(ACOMP, Z[0], Z[1]);
endmodule

module dualbufD0(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
wire [1:0] X;
THnot  u0(enable, ZCOMP);
TH12  u4(X[0], A[0], A[1]);
TH12  u5(X[1], A[1], A[0]);
TH22D  u1(Z[0], X[0], enable, init);
TH22N  u2(Z[1], X[1], enable, init);
TH12   u3(ACOMP, Z[0], Z[1]);
endmodule

module dualbufD1(output [1:0] Z, input ZCOMP, input [1:0] A, output ACOMP, input init);
wire enable;
THnot  u0(enable, ZCOMP);
TH22N  u1(Z[0], A[0], enable, init);
TH22D  u2(Z[1], A[1], enable, init);
TH12   u3(ACOMP, Z[0], Z[1]);
endmodule

