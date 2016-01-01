`timescale 10ps / 1ps

module updncount(input countup, output countupCOMP, input countdn, output countdnCOMP, input init);

// 6 rail up down counter
wire [5:0] A, B, C, D;
wire ACOMP, BCOMP, CCOMP, DCOMP, CCOMP2, countCOMP;


// 4 stage ring
PipecomponentN u1(B, BCOMP, A, ACOMP, init);
Pipecomponentshift u3(C, CCOMP, B, BCOMP, countup, countupCOMP, countdn, countdnCOMP, init);
Pipecomponent u2(D, DCOMP, C, CCOMP, init);
PipecomponentD u4(A, ACOMP, D, DCOMP, init);
endmodule

module Pipecomponent(output [5:0] Z, input ZCOMP, input [5:0] A, output ACOMP, input init);
wire enable, COMP1, COMP2;
THnotN  u0(enable, ZCOMP, init);
TH22  u1(Z[0], A[0], enable);
TH22  u2(Z[1], A[1], enable);
TH22  u3(Z[2], A[2], enable);
TH22  u4(Z[3], A[3], enable);
TH22  u5(Z[4], A[4], enable);
TH22  u6(Z[5], A[5], enable);
TH14 u9 (COMP1, Z[0], Z[1], Z[2], Z[3]);
TH12 u10 (COMP2, Z[4], Z[5]);
TH12 u11 (ACOMP, COMP1, COMP2);
endmodule

module Pipecomponentshift(output [5:0] Z, input ZCOMP, input [5:0] A, output ACOMP, input countup, output countupCOMP, input countdn, output countdnCOMP, input init);
wire enable, up, down, upenable, downenable, COMP1, COMP2;
wire [5:0] W;

THnotN  u22(enable, ZCOMP, init);
TH22  u23(W[0], A[0], enable);
TH22  u24(W[1], A[1], enable);
TH22  u25(W[2], A[2], enable);
TH22  u26(W[3], A[3], enable);
TH22  u37(W[4], A[4], enable);
TH22  u48(W[5], A[5], enable);
THXOR  u1(Z[0], W[5], countup, W[1], countdn);
THXOR  u2(Z[1], W[0], countup, W[2], countdn);
THXOR  u3(Z[2], W[1], countup, W[3], countdn);
THXOR  u4(Z[3], W[2], countup, W[4], countdn);
THXOR  u5(Z[4], W[3], countup, W[5], countdn);
THXOR  u6(Z[5], W[4], countup, W[0], countdn);
//TH14 u9 (countCOMP, Z[0], Z[1], Z[2], Z[3]);
TH22  u27(countdnCOMP, countdn, countCOMP);
TH22  u28(countupCOMP, countup, countCOMP);
TH14 u9 (COMP1, Z[0], Z[1], Z[2], Z[3]);
TH12 u10 (COMP2, Z[4], Z[5]);
TH12 u11 (ACOMP, COMP1, COMP2);
TH12 u12 (countCOMP, COMP1, COMP2);
endmodule

module PipecomponentN(output [5:0] Z, input ZCOMP, input [5:0] A, output ACOMP, input init);
wire enable, COMP1, COMP2;
THnotN  u0(enable, ZCOMP, init);
TH22N  u1(Z[0], A[0], enable, init);
TH22  u2(Z[1], A[1], enable);
TH22  u3(Z[2], A[2], enable);
TH22  u4(Z[3], A[3], enable);
TH22  u5(Z[4], A[4], enable);
TH22  u6(Z[5], A[5], enable);
TH14 u9 (COMP1, Z[0], Z[1], Z[2], Z[3]);
TH12 u10 (COMP2, Z[4], Z[5]);
TH12 u11 (ACOMP, COMP1, COMP2);
endmodule

module PipecomponentD(output [5:0] Z, input ZCOMP, input [5:0] A, output ACOMP, input init);
wire enable, COMP1, COMP2;
THnot  u0(enable, ZCOMP);
TH22D  u1(Z[0], A[0], enable, init);
TH22N  u2(Z[1], A[1], enable, init);
TH22N  u3(Z[2], A[2], enable, init);
TH22N  u4(Z[3], A[3], enable, init);
TH22N  u5(Z[4], A[4], enable, init);
TH22N  u6(Z[5], A[5], enable, init);
TH14 u9 (COMP1, Z[0], Z[1], Z[2], Z[3]);
TH12 u10 (COMP2, Z[4], Z[5]);
TH12 u11 (ACOMP, COMP1, COMP2);
endmodule


/*
zerocountD(count -> ){
token {0, 7} A, B, C/0, D;
token count[up, down];
flow count => ;

// up down counter to track shifts before nonshifts

(A -> B);
(B, count -> C){
{[B/3, count/up], [B/1, count/down]} -> [C/0, out];
{[B/0, count/up], [B/2, count/down]} -> C/1;
{[B/1, count/up], [B/3, count/down]} -> C/2;
{[B/2, count/up], [B/0, count/down]} -> C/3;
}
(C -> D)
(D -> A);

close count <- C/#;
}

*/