`timescale 10ps / 1ps

module selectC(input [1:0] Ss, output SCOMP, input [1:0] Ts, output TCOMP, input [1:0] Us, output UCOMP, input [1:0] Vs, output VCOMP, output [1:0] A, input ACOMP, input [3:0] selectin, output selectinCOMP, output [3:0] selectout, input selectoutCOMP, input init);

// 4 way select component 
wire Senable, Tenable, Uenable, Venable, StrCOMP, Ssel, Tsel, Usel, Vsel, selCOMP, selectCOMP;
wire [1:0] W, X, Y, Z, B;
wire selectenable, selectoutenable;

TH22 sel17 (Ssel, Adone, selectoutCOMP);
THnotN  sel18(Senable, Ssel, init);
TH33  sel14(W[0], Ss[0], selectin[0], Senable);
TH33  sel15(W[1], Ss[1], selectin[0], Senable);
TH12  sel16(SCOMP, W[0], W[1]);
assign selectout[0] = SCOMP;

TH22 sel27 (Tsel, Adone, selectoutCOMP);
THnotN  sel28(Tenable, Tsel, init);
TH33  sel24(X[0], Ts[0], selectin[1], Tenable);
TH33  sel25(X[1], Ts[1], selectin[1], Tenable);
TH12  sel26(TCOMP, X[0], X[1]);
assign selectout[1] = TCOMP;

TH22 sel37 (Usel, Adone, selectoutCOMP);
THnotN  sel38(Uenable, Usel, init);
TH33  sel34(Y[0], Us[0], selectin[2], Uenable);
TH33  sel35(Y[1], Us[1], selectin[2], Uenable);
TH12  sel36(UCOMP, Y[0], Y[1]);
assign selectout[2] = UCOMP;

TH22 sel47 (Vsel, Adone, selectoutCOMP);
THnotN  sel48(Venable, Vsel, init);
TH33  sel44(Z[0], Vs[0], selectin[3], Venable);
TH33  sel45(Z[1], Vs[1], selectin[3], Venable);
TH12  sel46(VCOMP, Z[0], Z[1]);
assign selectout[3] = VCOMP;

TH14  sel73(selectinCOMP, selectout[0], selectout[1], selectout[2], selectout[3]);
//TH22  sel74(selectCOMP, selCOMP, selectoutCOMP);

// pipeline the select down the flow path
//THnotN  tbb6(selectoutenable, selectCOMP, init);
//TH22  sel65(selectout[0], selectin[0], selectoutenable);
//TH22  sel66(selectout[1], selectin[1], selectoutenable);
//TH22  sel67(selectout[2], selectin[2], selectoutenable);
//TH22  sel68(selectout[3], selectin[3], selectoutenable);
//TH14  sel72(StrCOMP, selectout[0], selectout[1], selectout[2], selectout[3]);
//TH22  sel63 (selectinCOMP, selCOMP, StrCOMP);

// fanned in to output
THnotN  tbb5(selectenable, ACOMP, init);
TH14  sel52(B[0], W[0], X[0], Y[0], Z[0]);
TH14  sel53(B[1], W[1], X[1], Y[1], Z[1]);
TH22  sel56(A[0], B[0], selectenable);
TH22  sel57(A[1], B[1], selectenable);
TH12  sel58(Adone, A[0], A[1]);

endmodule
