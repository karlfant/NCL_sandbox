/////////////////////////////
// NCL sandbox
// 32 bit counter with digit completeness pipelining
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps

module digit_counter32B;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 1200 init = 0;
     # 5000 $stop;
  end
initial
 begin
    $dumpfile("digit_counter32B.vcd");
    $dumpvars(0, digit_counter32B);
 end

////// test bench
//////////////////////////////
////// circuit under test

wire carrycomp;
wire [31:0] countcomp, sumcarrycomp;
wire [32:0] sumcomp;
wire [1:0] sum [31:0];
wire [1:0] carry [32:0];
wire [1:0] carryin; 
wire [63:0] displaysum;
genvar i, k;

// 32 bit counter digit pipelined
THnotN  u0(carry[0][1], sumcomp[0], init); // auto produce carryin
assign carry[0][0] = 1'b0; // auto produce carryin

// digit pipelined counter
for (i=0; i<32; i=i+1) begin
  digit_counter_ringB ci (sum[i][1:0], carry[i+1][1:0], sumcarrycomp[i], carry[i][1:0], init);
  TH12 u3 (sumcomp[i], sum[i][1], sum[i][0]);  // auto consume sum
  TH22 u4 (sumcarrycomp[i], sumcomp[i+1], sumcomp[i]);  // ha closure
end

TH12 u33 (sumcomp[32], carry[31][0], carry[31][1]);  // auto consume carryout


////// circuit under test
//////////////////////////////
////// test bench

for (k=0; k<32; k=k+1) begin
assign displaysum[2*k+1] = sum[k][1];
assign displaysum[2*k] = sum[k][0];
end

endmodule
