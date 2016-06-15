module freedualtodual(output [1:0] outfinal, input outfinalCOMP, input [1:0] dualA, output dualACOMP, input [1:0] dualB, output dualBCOMP, input init);

wire M4, M5, P4, P5, inR4, inR5, dualABCOMP, dual4, dual5, outfinalenable;
wire [1:0] dualD, inA, inB;

// Arbitrate dualA and dualB to single outfinal flow

TH12 n13 (inR4, dualA[0], dualA[1]);
TH12 m13 (inR5, dualB[0], dualB[1]);


MUTEX  k0( M4, M5, inR4, inR5);
THnotN  k1(dual4, dualACOMP, init);
THnotN  k2(dual5, dualBCOMP, init);
and   k3(P4, M4, dual5);
and   k4(P5, M5, dual4);

TH22 k20 (dualACOMP, dualABCOMP, P4);
TH22 k21 (dualBCOMP, dualABCOMP, P5);

TH22 k31 (inA[0], P4, dualA[0]);
TH22 k32 (inA[1], P4, dualA[1]);
TH22 k33 (inB[0], P5, dualB[0]);
TH22 k34 (inB[1], P5, dualB[1]);

TH12 k17 (dualD[0], inA[0], inB[0]);
TH12 k18 (dualD[1], inA[1], inB[1]);

THnotN k30 (outfinalenable, outfinalCOMP, init);
TH22 k11 (outfinal[0], dualD[0], outfinalenable);
TH22 k12 (outfinal[1], dualD[1], outfinalenable);
TH12 k15 (dualABCOMP, outfinal[0], outfinal[1]);

endmodule
