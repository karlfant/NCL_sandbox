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
     # 10000 $stop;
  end
initial
 begin
    $dumpfile("digit_counter32B.vcd");
    $dumpvars(0, digit_counter32B);
 end

////// test bench
//////////////////////////////
////// circuit under test

wire [32:0] sumcarryCOMP;
wire [32:0] sumCOMP;
wire [1:0] sum [31:0];
wire [1:0] carry [32:0];
genvar i;

// 32 bit counter digit pipelined
THnotN  u0(carry[0][1], sumcarryCOMP[0], init); // auto produce carryin
assign carry[0][0] = 1'b0; // auto produce carryin

// digit pipelined counter
for (i=0; i<32; i=i+1) begin
  digit_counter_ringB ci (sum[i][1:0], sumCOMP[i], carry[i+1][1:0], sumcarryCOMP[i+1], carry[i][1:0], sumcarryCOMP[i],  init);
  TH12 u3 (sumCOMP[i], sum[i][1], sum[i][0]);  // auto consume sum
end

TH12 u33 (sumCOMP[32], carry[32][0], carry[32][1]);  // auto consume carryout
TH12 u35 (sumcarryCOMP[32], carry[32][0], carry[32][1]);  // auto consume carryout

////// circuit under test
//////////////////////////////
////// test bench

wire [63:0] displaysum;
for (i=0; i<32; i=i+1) begin
assign displaysum[2*i+1] = sum[i][1];
assign displaysum[2*i] = sum[i][0];
end

endmodule
