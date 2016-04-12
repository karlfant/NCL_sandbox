/////////////////////////////
// NCL sandbox
// 23 oscillation dual rail ring
// Karl Fant Jan 2016
/////////////////////////////

`timescale 100ps / 1ps

module ring3;

 /* Make an init that pulses once. */
  reg init = 0;
  initial begin
     # 1 init = 1;
     # 20 init = 0;
     # 1000 $stop;
  end
initial
 begin
    $dumpfile("ring3.vcd");
    $dumpvars(0,ring3);
 end

///// Testbench
/////////////////////////////
///// Circuit Under Test
wire [1:0]  A [2:0], B [2:0];
wire W0, W1, X0, X1;
wire [2:0]  COMP;
wire [1:0]  C;
wire [1:0]  D;
wire ACOMP, BCOMP, CCOMP, DCOMP;
genvar i;

// one rail 4 stage ring
dualbufD1 u0(A[1], COMP[1], A[0], COMP[0], init);
dualbufN u1(A[2], COMP[2], A[1], COMP[1], init);
dualbuf u2(A[0], COMP[0], A[2], COMP[2], init);

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

