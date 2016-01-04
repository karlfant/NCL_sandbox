`timescale 10ps / 1ps

module pprodA(output [1:0] Aout, input AoutCOMP, input [1:0] Ain, output AinCOMP, input [1:0] Bin, output BinCOMP, input init);

// partial product AND node
THnotN  tbb3(Aenable, AoutCOMP, init);
THANDE  ob4 (Aout[0], Ain[0], Bin[0], Ain[1], Bin[1], Aenable);
TH33  ob5 (Aout[1], Ain[1], Bin[1], Aenable);
TH12  ob6 (AinCOMP, Aout[0], Aout[1]);
assign BinCOMP = AinCOMP;
endmodule
