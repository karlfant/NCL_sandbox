/////////////////////////////
// NCL sandbox
// 32 bit counter with two D completeness pipelining
// Karl Fant July 2015
/////////////////////////////
`timescale 10ps / 1ps

module twoD_counter32A( output [63:0] count, input [31:0] countCOMP, input init);


////// test bench
//////////////////////////////
////// circuit under test

wire [32:0] carrycomp;
wire [31:0] sumcomp;
wire [1:0] sum [31:0];
wire [1:0] carry [32:0];
genvar i;

// 4 stage pipeline
THnotN  u0(carry[0][1], carrycomp[0], init); // auto produce carryin
assign carry[0][0] = 1'b0; // auto produce carryin

// two D digit pipelined counter
for (i=0; i<32; i=i+1) begin
  twoD_counter_ringA ci (sum[i][1:0], countCOMP[i], carry[i+1][1:0], carrycomp[i+1], carry[i][1:0], carrycomp[i], init);

//Verilog does not pass two D arrays so we have to map to a one D array and back to pass the dual rail numbers

assign count[2*i] = sum[i][0];
assign count[2*i+1] = sum[i][1];
end

TH12 u33 (carrycomp[32], carry[32][0], carry[32][1]);  // auto consume carryout

////// circuit under test
//////////////////////////////
/*
////// test bench

wire [63:0] displaysum;
genvar k;
for (k=0; k<32; k=k+1) begin
assign displaysum[2*k+1] = sum[k][1];
assign displaysum[2*k] = sum[k][0];

end
*/
endmodule
