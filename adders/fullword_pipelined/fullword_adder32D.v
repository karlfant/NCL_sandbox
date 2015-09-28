`timescale 1ps / 1ps


module fullword_adder32D;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 5000 init = 0;
     # 800000 $stop;

  end
initial
 begin
    $dumpfile("fullword_adder32D.vcd");
    $dumpvars(0, fullword_adder32D);
    
 end

integer Aindata, Bindata, sumdata, check;
wire [1:0] Ain [31:0];
wire [1:0] Bin [31:0];
wire [1:0] Ainf [31:0];
wire [1:0] Binf [31:0];
reg [63:0] fileA;
reg [63:0] fileB;
reg [63:0] fileC;
genvar i;
genvar k;
reg l;

initial begin
  Aindata = $fopen ("alpha.dual", "r+");
  Bindata = $fopen ("beta.dual", "r+");
  sumdata = $fopen ("sum.dual", "r+");
end

always @(negedge Afilecomp & !init) begin
  check = $fscanf (Aindata, "%h", fileA);
end
always @(posedge Afilecomp & !init) begin
fileA = 0;
end

always @(negedge Bfilecomp & !init) begin
  check = $fscanf (Bindata, "%h", fileB);
end
always @(posedge Bfilecomp & !init) begin
fileB = 0;
end

// test bench iterface  The first file record is read during init
// the resulting wavefront has to be blocked during init and then enabled when init goes low
wire Aenable, Benable;
wire [31:0] Acomp, Bcomp;

//build A input buffer close with file read
THnotN  tbb3(Aenable, sumcarrycomp, init);
for (i=0; i<32; i=i+1) begin
TH22N  ob4 (Ain[i][0], fileA[2*i], Aenable, init);
TH22N  ob5 (Ain[i][1], fileA[2*i+1], Aenable, init);
TH12 u11 (Acomp[i], Ain[i][1], Ain[i][0]);  // auto consume sum
end

// completeness tree
wire AND0, AND1, AND2, AND3, AND4, AND5, AND6, AND7, ANDCOMP1, ANDCOMP2, Afilecomp;
TH44 cl11 (AND0, Acomp[0], Acomp[1], Acomp[2], Acomp[3]); 
TH44 cl12 (AND1, Acomp[4], Acomp[5], Acomp[6], Acomp[7]); 
TH44 cl13 (AND2, Acomp[8], Acomp[9], Acomp[10], Acomp[11]); 
TH44 cl14 (AND3, Acomp[12], Acomp[13], Acomp[14], Acomp[15]); 
TH44 cl15 (AND4, Acomp[16], Acomp[17], Acomp[18], Acomp[19]); 
TH44 cl16 (AND5, Acomp[20], Acomp[21], Acomp[22], Acomp[23]); 
TH44 cl17 (AND6, Acomp[24], Acomp[25], Acomp[26], Acomp[27]); 
TH44 cl18 (AND7, Acomp[28], Acomp[29], Acomp[30], Acomp[31]); 
TH44 cl19 (ANDCOMP1, AND0, AND1, AND2, AND3); 
TH44 cl20 (ANDCOMP2, AND4, AND5, AND6, AND7); 
TH22 cl21 (Afilecomp, ANDCOMP1, ANDCOMP2); 

//build B input buffer close with file read
THnotN  tbb2(Benable, sumcarrycomp, init);
for (i=0; i<32; i=i+1) begin
TH22N  ob2 (Bin[i][0], fileB[2*i], Benable, init);
TH22N  ob3 (Bin[i][1], fileB[2*i+1], Benable, init);
TH12 u10 (Bcomp[i], Bin[i][1], Bin[i][0]);  // auto consume sum
end

// completeness tree
wire AND8, AND9, AND10, AND11, AND12, AND13, AND14, AND15, ANDCOMP3, ANDCOMP4, Bfilecomp;
TH44 cl22 (AND8, Bcomp[0], Bcomp[1], Bcomp[2], Bcomp[3]); 
TH44 cl23 (AND9, Bcomp[4], Bcomp[5], Bcomp[6], Bcomp[7]); 
TH44 cl24 (AND10, Bcomp[8], Bcomp[9], Bcomp[10], Bcomp[11]); 
TH44 cl25 (AND11, Bcomp[12], Bcomp[13], Bcomp[14], Bcomp[15]); 
TH44 cl26 (AND12, Bcomp[16], Bcomp[17], Bcomp[18], Bcomp[19]); 
TH44 cl27 (AND13, Bcomp[20], Bcomp[21], Bcomp[22], Bcomp[23]); 
TH44 cl28 (AND14, Bcomp[24], Bcomp[25], Bcomp[26], Bcomp[27]); 
TH44 cl29 (AND15, Bcomp[28], Bcomp[29], Bcomp[30], Bcomp[31]); 
TH44 cl30 (ANDCOMP3, AND8, AND9, AND10, AND11); 
TH44 cl31 (ANDCOMP4, AND12, AND13, AND14, AND15); 
TH22 cl32 (Bfilecomp, ANDCOMP3, ANDCOMP4); 

///// testbench input
/////////////////////////////
///// Circuit Under Test


wire [1:0] sum [31:0];
wire [1:0] carry [32:0];

// 16 bit ripple carry adder
THnotN  u0(carry[0][0], sumcomp[0], init); // auto produce carryin
assign carry[0][1] = 1'b0; // auto produce carryin

//  add
for (i=0; i<32; i=i+1) begin
  fulladdD ci (sum[i][1:0], carry[i+1][1:0], Ain[i][1:0], Bin[i][1:0], carry[i][1:0]);
end

///// Circuit Under Test
//////////////////////////////
////// test bench output

wire carrycomp, Oenable;
wire [31:0] sumcomp;
wire [1:0] sumout [31:0];
//build output buffer close with input buffer

THnotN  tbb4(Oenable, sumcarrycomp, init);
for (i=0; i<32; i=i+1) begin
TH22  ob0 (displaysum[2*i], sum[i][0], Oenable);
TH22  ob1 (displaysum[2*i+1], sum[i][1], Oenable);
TH12 u3 (sumcomp[i], displaysum[2*i], displaysum[2*i+1]);  // auto consume sum
end

// completeness tree
wire AND40, AND41, AND42, AND43, AND44, AND45, AND46, AND47, ANDCOMP5, ANDCOMP6, ANDCOMP7, sumcarrycomp;
TH44 cl40 (AND40, sumcomp[0], sumcomp[1], sumcomp[2], sumcomp[3]); 
TH44 cl41 (AND41, sumcomp[4], sumcomp[5], sumcomp[6], sumcomp[7]); 
TH44 cl42 (AND42, sumcomp[8], sumcomp[9], sumcomp[10], sumcomp[11]); 
TH44 cl43 (AND43, sumcomp[12], sumcomp[13], sumcomp[14], sumcomp[15]); 
TH44 cl44 (AND44, sumcomp[16], sumcomp[17], sumcomp[18], sumcomp[19]); 
TH44 cl45 (AND45, sumcomp[20], sumcomp[21], sumcomp[22], sumcomp[23]); 
TH44 cl46 (AND46, sumcomp[24], sumcomp[25], sumcomp[26], sumcomp[27]); 
TH44 cl47 (AND47, sumcomp[28], sumcomp[29], sumcomp[30], sumcomp[31]); 
TH44 cl48 (ANDCOMP5, AND40, AND41, AND42, AND43); 
TH44 cl49 (ANDCOMP6, AND44, AND45, AND46, AND47); 
TH22 cl50 (ANDCOMP7, ANDCOMP5, ANDCOMP6); 
TH12 u33 (carrycomp, carry[31][0], carry[31][1]);  // auto consume carryout
TH22 u4 (sumcarrycomptest, ANDCOMP7, carrycomp);  // ha closure

always @(posedge sumcarrycomptest & !init) begin
  check = $fscanf (sumdata, "%h", fileC);
if(displaysum == fileC) begin
  $display( "pass result ox%h  expected 0x%h", displaysum ,fileC);
end
else begin
  $display( "fail result ox%h  expected 0x%h", displaysum ,fileC);
end
end
assign sumcarrycomp = sumcarrycomptest;

wire [63:0] displaysum;
//for (k=0; k<32; k=k+1) begin
//assign displaysum[2*k+1] = sumout[k][1];
//assign displaysum[2*k] = sumout[k][0];
//end

endmodule
