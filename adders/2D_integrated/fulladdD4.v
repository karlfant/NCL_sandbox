/////////////////////////////
// NCL sandbox
//  minterm full adder as two halfadders
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module fulladdD4(output [1:0] sum, input sumCOMP, output [1:0] carryout, input carryCOMP, input [1:0] A, input [1:0] B, output ABCOMP, input [1:0] carryin, output carryinCOMP, input init);
 
// 2 halfadder full adder

// 2 halfadder full adder
wire [3:0] minterma, mintermb, mintermc;
wire [1:0] carrya, carrya1, carrya2, carryb, suma;
wire minaCOMP, minaenable, minbCOMP, minbenable, mincenable, carryaCOMP, carryaenable, carrya1COMP, carrya1enable, carrya2COMP, carrya2enable, ABCOMP, sumaCOMP, sumaenable, sumenable;



THnotN  a11(minaenable, minaCOMP, init);
TH33  a5(minterma[0], A[0], B[0], minaenable);
TH33  a6(minterma[1], A[0], B[1], minaenable);
TH33  a7(minterma[2], A[1], B[0], minaenable);
TH33  a8(minterma[3], A[1], B[1], minaenable);
TH14  a9(ABCOMP, minterma[0], minterma[1], minterma[2], minterma[3]);

THnotN  b6(sumaenable, sumaCOMP, init);
TH33W2  b10(suma[0], sumaenable, minterma[0], minterma[3]);
TH33W2  b4(suma[1], sumaenable, minterma[1], minterma[2]);

THnotN  b16(carryaenable, carryaCOMP, init);
TH44W3  b7(carrya[0], carryaenable, minterma[0], minterma[1], minterma[2]);
TH22    b8(carrya[1], minterma[3], carryaenable);
// closure
THCOMP  b9(minaCOMP, carrya[0], carrya[1], suma[0], suma[1]);


THnotN  c0(carrya1enable, carrya1COMP, init);
TH22  c1 (carrya1[0], carrya[0], carrya1enable);
TH22  c2 (carrya1[1], carrya[1], carrya1enable);
TH12  c3(carryaCOMP, carrya1[0], carrya1[1]);


THnotN  c9(minbenable, minbCOMP, init);
TH33  c4(mintermb[0], carryin[0], suma[0], minbenable);
TH33  c5(mintermb[1], carryin[0], suma[1], minbenable);
TH33  c6(mintermb[2], carryin[1], suma[0], minbenable);
TH33  c7(mintermb[3], carryin[1], suma[1], minbenable);
TH14  c8(carryinCOMP, mintermb[0], mintermb[1], mintermb[2], mintermb[3]);
assign sumaCOMP = carryinCOMP;

THnotN  d1(sumenable, sumCOMP, init);
TH33W2  d3(sum[0], sumenable, mintermb[0], mintermb[3]);
TH33W2  d4(sum[1], sumenable, mintermb[1], mintermb[2]);

THnotN  d20(carrybenable, carrybCOMP, init);
TH44W3  d6(carryb[0], carrybenable, mintermb[0], mintermb[1], mintermb[2]);
TH22    d7(carryb[1], mintermb[3], carrybenable);
THCOMP  d11(minbCOMP, carryb[0], carryb[1], sum[0], sum[1]);


//THnotN  d2(carrya2enable, carrya2COMP, init);
//TH22  d8(carrya2[0], carrya1[0], carrya2enable);
//TH22  d9(carrya2[1], carrya1[1], carrya2enable);
//TH12  d10(carrya1COMP, carrya2[0], carrya2[1]);



THnotN  e9(mincenable, mincCOMP, init);
TH33  e4(mintermc[0], carrya1[0], carryb[0], mincenable);
TH33  e5(mintermc[1], carrya1[0], carryb[1], mincenable);
TH33  e6(mintermc[2], carrya1[1], carryb[0], mincenable);
TH33  e7(mintermc[3], carrya1[1], carryb[1], mincenable);
TH14  e8(carrya1COMP, mintermc[0], mintermc[1], mintermc[2], mintermc[3]);
assign carrybCOMP = carrya1COMP;


THnotN  f1(carryenable, carryCOMP, init);
TH22    f2(carryout[0], mintermc[0], carryenable);
TH44W3  f3(carryout[1], carryenable, mintermc[1], mintermc[2], mintermc[3]);
TH12    f4(mincCOMP, carryout[0], carryout[1]);
endmodule
