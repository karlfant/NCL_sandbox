`timescale 10ps / 1ps

module dualbuf(output [1:0] Aout, input AoutCOMP, input [1:0] Ain, output AinCOMP, input init);

// 2D array node
THnotN  tbb3(Aenable, AoutCOMP, init);
TH22  ob4 (Aout[0], Ain[0], Aenable);
TH22  ob5 (Aout[1], Ain[1], Aenable);
TH12  ob6 (AinCOMP, Aout[0], Aout[1]);

endmodule
