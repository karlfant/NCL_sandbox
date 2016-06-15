module freetoquad(output [3:0] quad, input quadCOMP, input R0, output R0COMP, input R1, output R1COMP, input R2, output R2COMP, input R3, output R3COMP, input init);
wire M4, M5, P4, P5, R4, R5, dualACOMP, dualBCOMP, dual4, dual5, quadenable;
wire [1:0] dualA, dualB;

// Arbitrate Ro and R1 to dualA rail flow
freetodual n00 (dualA, dualACOMP, R0, R0COMP, R1, R1COMP, init);
TH12 n13 (R4, dualA[0], dualA[1]);

// Arbitrate R2 and R3 to dualB rail flow
freetodual m00 (dualB, dualBCOMP, R2, R2COMP, R3, R3COMP, init);
TH12 m13 (R5, dualB[0], dualB[1]);


// Arbitrate dualA and dualB to quad flow
MUTEX  k0( M4, M5, R4, R5);
THnotN  k1(dual4, dualACOMP, init);
THnotN  k2(dual5, dualBCOMP, init);
and   k3(P4, M4, dual5);
and   k4(P5, M5, dual4);
THnotN  k10(quadenable, quadCOMP, init);

TH33 k11 (quad[0], dualA[0], P4, quadenable);
TH33 k12 (quad[1], dualA[1], P4, quadenable);
TH12 k15 (dualACOMP, quad[0], quad[1]);

TH33 k13 (quad[2], dualB[0], P5, quadenable);
TH33 k14 (quad[3], dualB[1], P5, quadenable);
TH12 k16 (dualBCOMP, quad[2], quad[3]);

endmodule
