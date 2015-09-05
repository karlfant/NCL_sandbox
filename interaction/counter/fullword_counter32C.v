/////////////////////////////
// NCL sandbox
// 32 bit counter with full word completeness pipelining
// Karl Fant July 2015
/////////////////////////////

`timescale 10ps / 1ps

module fullword_counter32C;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 600 init = 0;
     # 5000 $stop;

  end
initial
 begin
    $dumpfile("fullword_counter32C.vcd");
    $dumpvars(0, fullword_counter32C);
    
 end

////// test bench
//////////////////////////////
////// circuit under test

wire carrycomp;
wire [31:0] sumcomp;
wire [1:0] sum [31:0];
wire [1:0] carry [32:0];
wire sumcarrycomp;
genvar i;

//full word completeness 32 bit counter
THnotN  u0(carry[0][1], sumcarrycomp, init); // auto produce carryin
assign carry[0][0] = 1'b0; // auto produce carryin

for (i=0; i<32; i=i+1) begin
  fullword_counter_ringC ci (sum[i][1:0], carry[i+1][1:0], sumcarrycomp, carry[i][1:0], init);
  TH12 u3 (sumcomp[i], sum[i][1], sum[i][0]);  // auto consume sum
end

TH12 u33 (carrycomp, carry[32][0], carry[32][1]);  // auto consume carryout

// completeness tree
wire AND0, AND1, AND2, AND3, AND4, AND5, AND6, AND7, AND8, AND9;
TH44 cl1 (AND0, sumcomp[0], sumcomp[1], sumcomp[2], sumcomp[3]); 
TH44 cl2 (AND1, sumcomp[4], sumcomp[5], sumcomp[6], sumcomp[7]); 
TH44 cl3 (AND2, sumcomp[8], sumcomp[9], sumcomp[10], sumcomp[11]); 
TH44 cl4 (AND3, sumcomp[12], sumcomp[13], sumcomp[14], sumcomp[15]); 
TH44 cl5 (AND4, sumcomp[16], sumcomp[17], sumcomp[18], sumcomp[19]); 
TH44 cl6 (AND5, sumcomp[20], sumcomp[21], sumcomp[22], sumcomp[23]); 
TH44 cl7 (AND6, sumcomp[24], sumcomp[25], sumcomp[26], sumcomp[27]); 
TH44 cl8 (AND7, sumcomp[28], sumcomp[29], sumcomp[30], sumcomp[31]); 
TH44 cl9 (AND8, AND0, AND1, AND2, AND3); 
TH44 cl10 (AND9, AND4, AND5, AND6, AND7); 
TH33 u4 (sumcarrycomp, AND8, AND9, carrycomp);  // ha closure


////// circuit under test
//////////////////////////////
////// test bench
wire [63:0] displaysum;
genvar k;

for (k=0; k<32; k=k+1) begin
assign displaysum[2*k+1] = sum[k][1];
assign displaysum[2*k] = sum[k][0];
end

endmodule
