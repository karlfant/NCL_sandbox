module freetotrinary(output [2:0] trinary, input trinaryCOMP, input R0, output R0COMP, input R1, output R1COMP, input R2, output R2COMP, input init);
//wire M0, M1, P0, P1, dual0, dual1, dualAenable;
wire M2, P2;
wire M4, P4, R4, dualACOMP, dual4, trienable;
wire [1:0] dualA;

// Arbitrate Ro and R1 to dualA rail flow

freetodual M00 (dualA, dualACOMP, R0, R0COMP, R1, R1COMP, init);

TH12 n13 (inR4, dualA[0], dualA[1]);

// Arbitrate dualA and R2 to trinary flow
MUTEX  k0( M4, M2, inR4, R2);
THnotN  k1(dual4, dualACOMP, init);
THnotN  k2(dual2, R2COMP, init);
and   k3(P4, M4, dual2);
and   k4(P2, M2, dual4);
THnotN  k10(trienable, trinaryCOMP, init);

TH33 k11 (trinary[0], dualA[0], P4, trienable);
TH33 k12 (trinary[1], dualA[1], P4, trienable);
TH12 k15 (dualACOMP, trinary[0], trinary[1]);

TH22 k13 (trinary[2], P2, trienable);
assign R2COMP = trinary[2];

endmodule
