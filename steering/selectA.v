`timescale 10ps / 1ps

module selectA(input [1:0] Ss, output SCOMP, input [1:0] Ts, output TCOMP, input [1:0] Us, output UCOMP, input [1:0] Vs, output VCOMP, output [1:0] A, input ACOMP, input [3:0] selectin, output selectinCOMP, output [3:0] selectout, input selectoutCOMP, input init);

// 4 way select component 
wire Senable, Tenable, Uenable, Venable, StrCOMP, Ssel, Tsel, Usel, Vsel, selCOMP, selectCOMP;
wire [1:0] W, X, Y, Z, B;
wire selectenable, selectoutenable;

//TH22 sel17 (Ssel, Adone, selectout[0]);
THnotN  sel18(Senable, Adone, init);
TH33  sel14(W[0], Ss[0], Senable, selectout[0]);
TH33  sel15(W[1], Ss[1], Senable, selectout[0]);
TH12  sel16(SCOMP, W[0], W[1]);

//TH22 sel27 (Tsel, Adone, selectout[1]);
THnotN  sel28(Tenable, Adone, init);
TH33  sel24(X[0], Ts[0], Tenable, selectout[1]);
TH33  sel25(X[1], Ts[1], Tenable, selectout[1]);
TH12  sel26(TCOMP, X[0], X[1]);

//TH22 sel37 (Usel, Adone, selectout[2]);
THnotN  sel38(Uenable, Adone, init);
TH33  sel34(Y[0], Us[0], Uenable, selectout[2]);
TH33  sel35(Y[1], Us[1], Uenable, selectout[2]);
TH12  sel36(UCOMP, Y[0], Y[1]);

//TH22 sel47 (Vsel, Adone, selectout[3]);
THnotN  sel48(Venable, Adone, init);
TH33  sel44(Z[0], Vs[0], Venable, selectout[3]);
TH33  sel45(Z[1], Vs[1], Venable, selectout[3]);
TH12  sel46(VCOMP, Z[0], Z[1]);

TH14  sel73(selCOMP, SCOMP, TCOMP, UCOMP, VCOMP);
TH22  sel74(selectinCOMP, selCOMP, StrCOMP);

// pipeline the select down the flow path
THnotN  tbb6(selectoutenable, selectoutCOMP, init);
TH22  sel65(selectout[0], selectin[0], selectoutenable);
TH22  sel66(selectout[1], selectin[1], selectoutenable);
TH22  sel67(selectout[2], selectin[2], selectoutenable);
TH22  sel68(selectout[3], selectin[3], selectoutenable);
TH14  sel72(StrCOMP, selectin[0], selectout[1], selectout[2], selectout[3]);
//TH22  sel63 (selectCOMP, selCOMP, StrCOMP);

// fanned in to output
THnotN  tbb5(selectenable, ACOMP, init);
TH14  sel52(B[0], W[0], X[0], Y[0], Z[0]);
TH14  sel53(B[1], W[1], X[1], Y[1], Z[1]);
TH22  sel56(A[0], B[0], selectenable);
TH22  sel57(A[1], B[1], selectenable);
TH12  sel58(Adone, A[0], A[1]);

endmodule
