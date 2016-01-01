module freetoquad(output [3:0] quad, input quadCOMP, input inR0, output R0COMP, input inR1, output R1COMP, input inR2, output R2COMP, input inR3, output R3COMP, input init);
wire M0, M1, P0, P1, dual0, dual1, dualAenable;
wire M2, M3, P2, P3, dual2, dual3, dualBenable;
wire M4, M5, P4, P5, inR4, inR5, dualACOMP, dualBCOMP, dual4, dual5, quadenable;
wire [1:0] dualA, dualB;

// Arbitrate Ro and R1 to dualA rail flow
assign R0COMP = dualA[0];
assign R1COMP = dualA[1];
MUTEX  n0( M0, M1, inR0, inR1);
THnotN  n1(dual0, dualA[0], init);
THnotN  n2(dual1, dualA[1], init);
and   n3(P0, M0, dual1);
and   n4(P1, M1, dual0);
THnotN  n10(dualAenable, dualACOMP, init);

TH22 n11 (dualA[0], P0, dualAenable);
TH22 n12 (dualA[1], P1, dualAenable);
TH12 n13 (inR4, dualA[0], dualA[1]);


// Arbitrate R2 and R3 to dualB rail flow
assign R2COMP = dualB[0];
assign R3COMP = dualB[1];
MUTEX  m0( M2, M3, inR2, inR3);
THnotN  m1(dual2, dualB[0], init);
THnotN  m2(dual3, dualB[1], init);
and   m3(P2, M2, dual3);
and   m4(P3, M3, dual2);
THnotN  m10(dualBenable, dualBCOMP, init);

TH22 m11 (dualB[0], P2, dualBenable);
TH22 m12 (dualB[1], P3, dualBenable);
TH12 m13 (inR5, dualB[0], dualB[1]);


// Arbitrate dualA and dualB to quad flow
MUTEX  k0( M4, M5, inR4, inR5);
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
