`timescale 1ps / 1ps


module count_adder32A;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 3500 init = 0;
     # 200000 $stop;

  end
initial
 begin
    $dumpfile("count_adder32A.vcd");
    $dumpvars(0, count_adder32A);
    
 end

genvar i;

///// testbench no input
/////////////////////////////
///// Circuit Under Test

wire [63:0] bigA, bigB;
wire [31:0] countACOMP, countBCOMP;
wire [1:0] A [31:0];
wire [1:0] B [31:0];

twoD_counter32A cnt1 (bigA, sumcarrycompout, init);
twoD_counter32A cnt2 (bigB, sumcarrycompout, init);


wire [1:0] sum [31:0];
wire [1:0] carry [32:0];

// 32 bit ripple carry adder
THnotN  u0(carry[0][0], sumcomp[0], init); // auto produce carryin
assign carry[0][1] = 1'b0; // auto produce carryin

//  add
for (i=0; i<32; i=i+1) begin
assign A[i][0] = bigA[2*i];
assign A[i][1] = bigA[2*i+1];
assign B[i][0] = bigB[2*i];
assign B[i][1] = bigB[2*i+1];
  fulladdA ci (sum[i][1:0], sumcarrycompin[i], carry[i+1][1:0], A[i][1:0], B[i][1:0], carry[i][1:0], sumcarrycompout[i], init);
end

///// Circuit Under Test
//////////////////////////////
////// test bench output

wire [63:0] displaysum;
wire carrycomp;
wire [32:0] sumcomp;
wire [31:0] sumcarrycompin, sumcarrycompout, sumcarrycomptest, Oenable;
wire [1:0] sumout [31:0];
//build output buffer close with input buffer

for (i=0; i<32; i=i+1) begin
THnotN  tbb4(Oenable[i], sumcarrycompin[i], init);
TH22  ob0 (sumout[i][0], sum[i][0], Oenable[i]);
TH22  ob1 (sumout[i][1], sum[i][1], Oenable[i]);
TH12 u3 (sumcomp[i], sumout[i][1], sumout[i][0]);  // auto consume sum
TH22 u4 (sumcarrycompin[i], sumcomp[i], sumcomp[i+1]);  // ha closure
end
TH12 u3 (sumcomp[32], carry[32][0], carry[32][1]);  // auto consume sum

   for (i=0; i<32; i=i+1) begin
assign displaysum[2*i+1] = sumout[i][1];
assign displaysum[2*i] = sumout[i][0];
end
endmodule
