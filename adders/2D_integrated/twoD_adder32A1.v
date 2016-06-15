/////////////////////////////
// NCL sandbox
// two D adder with digit completeness input testbench
// and digit completeness output test bench
// Karl Fant July 2015
/////////////////////////////

`timescale 1ps / 1ps

module twoD_adder32A1;

 /* Make an init that pulses once. */
  reg init = 1;
  reg test = 0;

integer Aindata[31:0], Bindata[31:0], Soutdata[31:0];
integer check, checklast;
wire [1:0] Ain [31:0];
wire [1:0] Bin [31:0];
reg [1:0] fileA [31:0];
reg [1:0] fileB [31:0];
reg [1:0] filesum [31:0];
genvar i;

//wire [31:0] Afilecomp, Bfilecomp;

  initial begin
     # 10000 init = 0;
     # 200000 $stop;
  end
initial
 begin
    $dumpfile("twoD_adder32A1.vcd");
    $dumpvars(0, twoD_adder32A1);
    checklast = 1;
    check = 0;
 end

initial begin
  Aindata[0] = $fopen ("A0.dual", "r+");
  Aindata[1] = $fopen ("A1.dual", "r+");
  Aindata[2] = $fopen ("A2.dual", "r+");
  Aindata[3] = $fopen ("A3.dual", "r+");
  Aindata[4] = $fopen ("A4.dual", "r+");
  Aindata[5] = $fopen ("A5.dual", "r+");
  Aindata[6] = $fopen ("A6.dual", "r+");
  Aindata[7] = $fopen ("A7.dual", "r+");
  Aindata[8] = $fopen ("A8.dual", "r+");
  Aindata[9] = $fopen ("A9.dual", "r+");
  Aindata[10] = $fopen ("A10.dual", "r+");
  Aindata[11] = $fopen ("A11.dual", "r+");
  Aindata[12] = $fopen ("A12.dual", "r+");
  Aindata[13] = $fopen ("A13.dual", "r+");
  Aindata[14] = $fopen ("A14.dual", "r+");
  Aindata[15] = $fopen ("A15.dual", "r+");
  Aindata[16] = $fopen ("A16.dual", "r+");
  Aindata[17] = $fopen ("A17.dual", "r+");
  Aindata[18] = $fopen ("A18.dual", "r+");
  Aindata[19] = $fopen ("A19.dual", "r+");
  Aindata[20] = $fopen ("A20.dual", "r+");
  Aindata[21] = $fopen ("A21.dual", "r+");
  Aindata[22] = $fopen ("A22.dual", "r+");
  Aindata[23] = $fopen ("A23.dual", "r+");
  Aindata[24] = $fopen ("A24.dual", "r+");
  Aindata[25] = $fopen ("A25.dual", "r+");
  Aindata[26] = $fopen ("A26.dual", "r+");
  Aindata[27] = $fopen ("A27.dual", "r+");
  Aindata[28] = $fopen ("A28.dual", "r+");
  Aindata[29] = $fopen ("A29.dual", "r+");
  Aindata[30] = $fopen ("A30.dual", "r+");
  Aindata[31] = $fopen ("A31.dual", "r+");
  Bindata[0] = $fopen ("B0.dual", "r+");
  Bindata[1] = $fopen ("B1.dual", "r+");
  Bindata[2] = $fopen ("B2.dual", "r+");
  Bindata[3] = $fopen ("B3.dual", "r+");
  Bindata[4] = $fopen ("B4.dual", "r+");
  Bindata[5] = $fopen ("B5.dual", "r+");
  Bindata[6] = $fopen ("B6.dual", "r+");
  Bindata[7] = $fopen ("B7.dual", "r+");
  Bindata[8] = $fopen ("B8.dual", "r+");
  Bindata[9] = $fopen ("B9.dual", "r+");
  Bindata[10] = $fopen ("B10.dual", "r+");
  Bindata[11] = $fopen ("B11.dual", "r+");
  Bindata[12] = $fopen ("B12.dual", "r+");
  Bindata[13] = $fopen ("B13.dual", "r+");
  Bindata[14] = $fopen ("B14.dual", "r+");
  Bindata[15] = $fopen ("B15.dual", "r+");
  Bindata[16] = $fopen ("B16.dual", "r+");
  Bindata[17] = $fopen ("B17.dual", "r+");
  Bindata[18] = $fopen ("B18.dual", "r+");
  Bindata[19] = $fopen ("B19.dual", "r+");
  Bindata[20] = $fopen ("B20.dual", "r+");
  Bindata[21] = $fopen ("B21.dual", "r+");
  Bindata[22] = $fopen ("B22.dual", "r+");
  Bindata[23] = $fopen ("B23.dual", "r+");
  Bindata[24] = $fopen ("B24.dual", "r+");
  Bindata[25] = $fopen ("B25.dual", "r+");
  Bindata[26] = $fopen ("B26.dual", "r+");
  Bindata[27] = $fopen ("B27.dual", "r+");
  Bindata[28] = $fopen ("B28.dual", "r+");
  Bindata[29] = $fopen ("B29.dual", "r+");
  Bindata[30] = $fopen ("B30.dual", "r+");
  Bindata[31] = $fopen ("B31.dual", "r+");
  Soutdata[0] = $fopen ("sum0.dual", "r+");
  Soutdata[1] = $fopen ("sum1.dual", "r+");
  Soutdata[2] = $fopen ("sum2.dual", "r+");
  Soutdata[3] = $fopen ("sum3.dual", "r+");
  Soutdata[4] = $fopen ("sum4.dual", "r+");
  Soutdata[5] = $fopen ("sum5.dual", "r+");
  Soutdata[6] = $fopen ("sum6.dual", "r+");
  Soutdata[7] = $fopen ("sum7.dual", "r+");
  Soutdata[8] = $fopen ("sum8.dual", "r+");
  Soutdata[9] = $fopen ("sum9.dual", "r+");
  Soutdata[10] = $fopen ("sum10.dual", "r+");
  Soutdata[11] = $fopen ("sum11.dual", "r+");
  Soutdata[12] = $fopen ("sum12.dual", "r+");
  Soutdata[13] = $fopen ("sum13.dual", "r+");
  Soutdata[14] = $fopen ("sum14.dual", "r+");
  Soutdata[15] = $fopen ("sum15.dual", "r+");
  Soutdata[16] = $fopen ("sum16.dual", "r+");
  Soutdata[17] = $fopen ("sum17.dual", "r+");
  Soutdata[18] = $fopen ("sum18.dual", "r+");
  Soutdata[19] = $fopen ("sum19.dual", "r+");
  Soutdata[20] = $fopen ("sum20.dual", "r+");
  Soutdata[21] = $fopen ("sum21.dual", "r+");
  Soutdata[22] = $fopen ("sum22.dual", "r+");
  Soutdata[23] = $fopen ("sum23.dual", "r+");
  Soutdata[24] = $fopen ("sum24.dual", "r+");
  Soutdata[25] = $fopen ("sum25.dual", "r+");
  Soutdata[26] = $fopen ("sum26.dual", "r+");
  Soutdata[27] = $fopen ("sum27.dual", "r+");
  Soutdata[28] = $fopen ("sum28.dual", "r+");
  Soutdata[29] = $fopen ("sum29.dual", "r+");
  Soutdata[30] = $fopen ("sum30.dual", "r+");
  Soutdata[31] = $fopen ("sum31.dual", "r+");
end
wire [31:0] Acomp, Bcomp;
always @(negedge Acomp[0] & !init) begin
  check = $fscanf (Aindata[0], "%h", fileA[0][1:0]); end
always @(posedge Acomp[0] & !init) begin
fileA[0][1:0] = 0; end
always @(negedge Acomp[1] & !init) begin
  check = $fscanf (Aindata[1], "%h", fileA[1][1:0]); end
always @(posedge Acomp[1] & !init) begin
fileA[1][1:0] = 0; end
always @(negedge Acomp[2] & !init) begin
  check = $fscanf (Aindata[2], "%h", fileA[2][1:0]); end
always @(posedge Acomp[2] & !init) begin
fileA[2][1:0] = 0; end
always @(negedge Acomp[3] & !init) begin
  check = $fscanf (Aindata[3], "%h", fileA[3][1:0]); end
always @(posedge Acomp[3] & !init) begin
fileA[3][1:0] = 0; end
always @(negedge Acomp[4] & !init) begin
  check = $fscanf (Aindata[4], "%h", fileA[4][1:0]); end
always @(posedge Acomp[4] & !init) begin
fileA[4][1:0] = 0; end
always @(negedge Acomp[5] & !init) begin
  check = $fscanf (Aindata[5], "%h", fileA[5][1:0]); end
always @(posedge Acomp[5] & !init) begin
fileA[5][1:0] = 0; end
always @(negedge Acomp[6] & !init) begin
  check = $fscanf (Aindata[6], "%h", fileA[6][1:0]); end
always @(posedge Acomp[6] & !init) begin
fileA[6][1:0] = 0; end
always @(negedge Acomp[7] & !init) begin
  check = $fscanf (Aindata[7], "%h", fileA[7][1:0]); end
always @(posedge Acomp[7] & !init) begin
fileA[7][1:0] = 0; end
always @(negedge Acomp[8] & !init) begin
  check = $fscanf (Aindata[8], "%h", fileA[8][1:0]); end
always @(posedge Acomp[8] & !init) begin
fileA[8][1:0] = 0; end
always @(negedge Acomp[9] & !init) begin
  check = $fscanf (Aindata[9], "%h", fileA[9][1:0]); end
always @(posedge Acomp[9] & !init) begin
fileA[9][1:0] = 0; end
always @(negedge Acomp[10] & !init) begin
  check = $fscanf (Aindata[10], "%h", fileA[10][1:0]); end
always @(posedge Acomp[10] & !init) begin
fileA[10][1:0] = 0; end
always @(negedge Acomp[11] & !init) begin
  check = $fscanf (Aindata[11], "%h", fileA[11][1:0]); end
always @(posedge Acomp[11] & !init) begin
fileA[11][1:0] = 0; end
always @(negedge Acomp[12] & !init) begin
  check = $fscanf (Aindata[12], "%h", fileA[12][1:0]); end
always @(posedge Acomp[12] & !init) begin
fileA[12][1:0] = 0; end
always @(negedge Acomp[13] & !init) begin
  check = $fscanf (Aindata[13], "%h", fileA[13][1:0]); end
always @(posedge Acomp[13] & !init) begin
fileA[13][1:0] = 0; end
always @(negedge Acomp[14] & !init) begin
  check = $fscanf (Aindata[14], "%h", fileA[14][1:0]); end
always @(posedge Acomp[14] & !init) begin
fileA[14][1:0] = 0; end
always @(negedge Acomp[15] & !init) begin
  check = $fscanf (Aindata[15], "%h", fileA[15][1:0]); end
always @(posedge Acomp[15] & !init) begin
fileA[15][1:0] = 0; end
always @(negedge Acomp[16] & !init) begin
  check = $fscanf (Aindata[16], "%h", fileA[16][1:0]); end
always @(posedge Acomp[16] & !init) begin
fileA[16][1:0] = 0; end
always @(negedge Acomp[17] & !init) begin
  check = $fscanf (Aindata[17], "%h", fileA[17][1:0]); end
always @(posedge Acomp[17] & !init) begin
fileA[17][1:0] = 0; end
always @(negedge Acomp[18] & !init) begin
  check = $fscanf (Aindata[18], "%h", fileA[18][1:0]); end
always @(posedge Acomp[18] & !init) begin
fileA[18][1:0] = 0; end
always @(negedge Acomp[19] & !init) begin
  check = $fscanf (Aindata[19], "%h", fileA[19][1:0]); end
always @(posedge Acomp[19] & !init) begin
fileA[19][1:0] = 0; end
always @(negedge Acomp[20] & !init) begin
  check = $fscanf (Aindata[20], "%h", fileA[20][1:0]); end
always @(posedge Acomp[20] & !init) begin
fileA[20][1:0] = 0; end
always @(negedge Acomp[21] & !init) begin
  check = $fscanf (Aindata[21], "%h", fileA[21][1:0]); end
always @(posedge Acomp[21] & !init) begin
fileA[21][1:0] = 0; end
always @(negedge Acomp[22] & !init) begin
  check = $fscanf (Aindata[22], "%h", fileA[22][1:0]); end
always @(posedge Acomp[22] & !init) begin
fileA[22][1:0] = 0; end
always @(negedge Acomp[23] & !init) begin
  check = $fscanf (Aindata[23], "%h", fileA[23][1:0]); end
always @(posedge Acomp[23] & !init) begin
fileA[23][1:0] = 0; end
always @(negedge Acomp[24] & !init) begin
  check = $fscanf (Aindata[24], "%h", fileA[24][1:0]); end
always @(posedge Acomp[24] & !init) begin
fileA[24][1:0] = 0; end
always @(negedge Acomp[25] & !init) begin
  check = $fscanf (Aindata[25], "%h", fileA[25][1:0]); end
always @(posedge Acomp[25] & !init) begin
fileA[25][1:0] = 0; end
always @(negedge Acomp[26] & !init) begin
  check = $fscanf (Aindata[26], "%h", fileA[26][1:0]); end
always @(posedge Acomp[26] & !init) begin
fileA[26][1:0] = 0; end
always @(negedge Acomp[27] & !init) begin
  check = $fscanf (Aindata[27], "%h", fileA[27][1:0]); end
always @(posedge Acomp[27] & !init) begin
fileA[27][1:0] = 0; end
always @(negedge Acomp[28] & !init) begin
  check = $fscanf (Aindata[28], "%h", fileA[28][1:0]); end
always @(posedge Acomp[28] & !init) begin
fileA[28][1:0] = 0; end
always @(negedge Acomp[29] & !init) begin
  check = $fscanf (Aindata[29], "%h", fileA[29][1:0]); end
always @(posedge Acomp[29] & !init) begin
fileA[29][1:0] = 0; end
always @(negedge Acomp[30] & !init) begin
  check = $fscanf (Aindata[30], "%h", fileA[30][1:0]); end
always @(posedge Acomp[30] & !init) begin
fileA[30][1:0] = 0; end
always @(negedge Acomp[31] & !init) begin
  check = $fscanf (Aindata[31], "%h", fileA[31][1:0]); end
always @(posedge Acomp[31] & !init) begin
fileA[31][1:0] = 0; end

always @(negedge Bcomp[0] & !init) begin
  check = $fscanf (Bindata[0], "%h", fileB[0][1:0]); end
always @(posedge Bcomp[0] & !init) begin
fileB[0][1:0] = 0; end
always @(negedge Bcomp[1] & !init) begin
  check = $fscanf (Bindata[1], "%h", fileB[1][1:0]); end
always @(posedge Bcomp[1] & !init) begin
fileB[1][1:0] = 0; end
always @(negedge Bcomp[2] & !init) begin
  check = $fscanf (Bindata[2], "%h", fileB[2][1:0]); end
always @(posedge Bcomp[2] & !init) begin
fileB[2][1:0] = 0; end
always @(negedge Bcomp[3] & !init) begin
  check = $fscanf (Bindata[3], "%h", fileB[3][1:0]); end
always @(posedge Bcomp[3] & !init) begin
fileB[3][1:0] = 0; end
always @(negedge Bcomp[4] & !init) begin
  check = $fscanf (Bindata[4], "%h", fileB[4][1:0]); end
always @(posedge Bcomp[4] & !init) begin
fileB[4][1:0] = 0; end
always @(negedge Bcomp[5] & !init) begin
  check = $fscanf (Bindata[5], "%h", fileB[5][1:0]); end
always @(posedge Bcomp[5] & !init) begin
fileB[5][1:0] = 0; end
always @(negedge Bcomp[6] & !init) begin
  check = $fscanf (Bindata[6], "%h", fileB[6][1:0]); end
always @(posedge Bcomp[6] & !init) begin
fileB[6][1:0] = 0; end
always @(negedge Bcomp[7] & !init) begin
  check = $fscanf (Bindata[7], "%h", fileB[7][1:0]); end
always @(posedge Bcomp[7] & !init) begin
fileB[7][1:0] = 0; end
always @(negedge Bcomp[8] & !init) begin
  check = $fscanf (Bindata[8], "%h", fileB[8][1:0]); end
always @(posedge Bcomp[8] & !init) begin
fileB[8][1:0] = 0; end
always @(negedge Bcomp[9] & !init) begin
  check = $fscanf (Bindata[9], "%h", fileB[9][1:0]); end
always @(posedge Bcomp[9] & !init) begin
fileB[9][1:0] = 0; end
always @(negedge Bcomp[10] & !init) begin
  check = $fscanf (Bindata[10], "%h", fileB[10][1:0]); end
always @(posedge Bcomp[10] & !init) begin
fileB[10][1:0] = 0; end
always @(negedge Bcomp[11] & !init) begin
  check = $fscanf (Bindata[11], "%h", fileB[11][1:0]); end
always @(posedge Bcomp[11] & !init) begin
fileB[11][1:0] = 0; end
always @(negedge Bcomp[12] & !init) begin
  check = $fscanf (Bindata[12], "%h", fileB[12][1:0]); end
always @(posedge Bcomp[12] & !init) begin
fileB[12][1:0] = 0; end
always @(negedge Bcomp[13] & !init) begin
  check = $fscanf (Bindata[13], "%h", fileB[13][1:0]); end
always @(posedge Bcomp[13] & !init) begin
fileB[13][1:0] = 0; end
always @(negedge Bcomp[14] & !init) begin
  check = $fscanf (Bindata[14], "%h", fileB[14][1:0]); end
always @(posedge Bcomp[14] & !init) begin
fileB[14][1:0] = 0; end
always @(negedge Bcomp[15] & !init) begin
  check = $fscanf (Bindata[15], "%h", fileB[15][1:0]); end
always @(posedge Bcomp[15] & !init) begin
fileB[15][1:0] = 0; end
always @(negedge Bcomp[16] & !init) begin
  check = $fscanf (Bindata[16], "%h", fileB[16][1:0]); end
always @(posedge Bcomp[16] & !init) begin
fileB[16][1:0] = 0; end
always @(negedge Bcomp[17] & !init) begin
  check = $fscanf (Bindata[17], "%h", fileB[17][1:0]); end
always @(posedge Bcomp[17] & !init) begin
fileB[17][1:0] = 0; end
always @(negedge Bcomp[18] & !init) begin
  check = $fscanf (Bindata[18], "%h", fileB[18][1:0]); end
always @(posedge Bcomp[18] & !init) begin
fileB[18][1:0] = 0; end
always @(negedge Bcomp[19] & !init) begin
  check = $fscanf (Bindata[19], "%h", fileB[19][1:0]); end
always @(posedge Bcomp[19] & !init) begin
fileB[19][1:0] = 0; end
always @(negedge Bcomp[20] & !init) begin
  check = $fscanf (Bindata[20], "%h", fileB[20][1:0]); end
always @(posedge Bcomp[20] & !init) begin
fileB[20][1:0] = 0; end
always @(negedge Bcomp[21] & !init) begin
  check = $fscanf (Bindata[21], "%h", fileB[21][1:0]); end
always @(posedge Bcomp[21] & !init) begin
fileB[21][1:0] = 0; end
always @(negedge Bcomp[22] & !init) begin
  check = $fscanf (Bindata[22], "%h", fileB[22][1:0]); end
always @(posedge Bcomp[22] & !init) begin
fileB[22][1:0] = 0; end
always @(negedge Bcomp[23] & !init) begin
  check = $fscanf (Bindata[23], "%h", fileB[23][1:0]); end
always @(posedge Bcomp[23] & !init) begin
fileB[23][1:0] = 0; end
always @(negedge Bcomp[24] & !init) begin
  check = $fscanf (Bindata[24], "%h", fileB[24][1:0]); end
always @(posedge Bcomp[24] & !init) begin
fileB[24][1:0] = 0; end
always @(negedge Bcomp[25] & !init) begin
  check = $fscanf (Bindata[25], "%h", fileB[25][1:0]); end
always @(posedge Bcomp[25] & !init) begin
fileB[25][1:0] = 0; end
always @(negedge Bcomp[26] & !init) begin
  check = $fscanf (Bindata[26], "%h", fileB[26][1:0]); end
always @(posedge Bcomp[26] & !init) begin
fileB[26][1:0] = 0; end
always @(negedge Bcomp[27] & !init) begin
  check = $fscanf (Bindata[27], "%h", fileB[27][1:0]); end
always @(posedge Bcomp[27] & !init) begin
fileB[27][1:0] = 0; end
always @(negedge Bcomp[28] & !init) begin
  check = $fscanf (Bindata[28], "%h", fileB[28][1:0]); end
always @(posedge Bcomp[28] & !init) begin
fileB[28][1:0] = 0; end
always @(negedge Bcomp[29] & !init) begin
  check = $fscanf (Bindata[29], "%h", fileB[29][1:0]); end
always @(posedge Bcomp[29] & !init) begin
fileB[29][1:0] = 0; end
always @(negedge Bcomp[30] & !init) begin
  check = $fscanf (Bindata[30], "%h", fileB[30][1:0]); end
always @(posedge Bcomp[30] & !init) begin
fileB[30][1:0] = 0; end
always @(negedge Bcomp[31] & !init) begin
  checklast = $fscanf (Bindata[31], "%h", fileB[31][1:0]); end
always @(posedge Bcomp[31] & !init) begin
fileB[31][1:0] = 0; end

// test bench iterface  The first file record is read during init
// the resulting wavefront has to be blocked during init and then enabled when init goes low
wire [31:0] Aenable, Benable;
wire [32:0] sumcarryCOMP;

//build A input buffer close with file read
for (i=0; i<32; i=i+1) begin
THnotN  tbb3(Aenable[i], sumcarryCOMP[i], init);
TH22N  ob4 (Ain[i][0], fileA[i][0], Aenable[i], init);
TH22N  ob5 (Ain[i][1], fileA[i][1], Aenable[i], init);
TH12 u11 (Acomp[i], Ain[i][1], Ain[i][0]);  // auto consume sum
end

//build B input buffer close with file read
for (i=0; i<32; i=i+1) begin
THnotN  tbb2(Benable[i], sumcarryCOMP[i], init);
TH22N  ob2 (Bin[i][0], fileB[i][0], Benable[i], init);
TH22N  ob3 (Bin[i][1], fileB[i][1], Benable[i], init);
TH12 u10 (Bcomp[i], Bin[i][1], Bin[i][0]);  // auto consume sum
end

///// testbench input
/////////////////////////////
///// Circuit Under Test

wire [1:0] sum [31:0];
wire [1:0] carry [32:0];

wire [31:0] sumcomp;
// 32 bit ripple carry adder
THnotN  u0(carry[0][0], sumcarryCOMP[0], init); // auto produce carryin
assign carry[0][1] = 1'b0; // auto produce carryin

// bits 0 through 31 add
for (i=0; i<32; i=i+1) begin
  fulladdA1 ci (sum[i][1:0], sumcomp[i], carry[i+1][1:0], sumcarryCOMP[i+1], Ain[i][1:0], Bin[i][1:0], carry[i][1:0], sumcarryCOMP[i], init);
end
TH12 u18 (sumcarryCOMP[32], carry[32][1], carry[32][0]);  // auto consume carrry

///// Circuit Under Test
//////////////////////////////
////// test bench output

//wire carrycomp;

wire [31:0] testenable;
wire [1:0] sumout [31:0];
//build output buffer close with input buffer

for (i=0; i<32; i=i+1) begin
THnotN  u0(testenable[i], sumcomp[i], init); // auto produce carryin
TH22  ob0 (sumout[i][0], sum[i][0], testenable[i]);
TH22  ob1 (sumout[i][1], sum[i][1], testenable[i]);
TH12 u3 (sumcomp[i], sumout[i][1], sumout[i][0]);  // auto consume sum
end

wire [63:0] displaysum;
for (i=0; i<32; i=i+1) begin
assign displaysum[2*i+1] = sumout[i][1];
assign displaysum[2*i] = sumout[i][0];
end

// test against output file
always @(posedge sumcomp[0] & !init) begin
  check = $fscanf (Soutdata[0], "%h", filesum[0][1:0]); 
if(sumout[0] != filesum[0]) begin
  $display( "00 fail result ox%h  expected 0x%h", sumout[0] ,filesum[0]);
  test = 1;
end
end
always @(negedge sumcomp[0] & !init) begin
filesum[0][1:0] = 0; end

always @(posedge sumcomp[1] & !init) begin
  check = $fscanf (Soutdata[1], "%h", filesum[1][1:0]);
if(sumout[1] != filesum[1]) begin
  $display( "01 fail result ox%h  expected 0x%h", sumout[1] ,filesum[1]);
  test = 1;
end
end
always @(negedge sumcomp[1] & !init) begin
filesum[1][1:0] = 0; end

always @(posedge sumcomp[2] & !init) begin
  check = $fscanf (Soutdata[2], "%h", filesum[2][1:0]);
if(sumout[2] != filesum[2]) begin
  $display( "02 fail result ox%h  expected 0x%h", sumout[2] ,filesum[2]);
  test = 1;
end
end
always @(negedge sumcomp[2] & !init) begin
filesum[2][1:0] = 0; end

always @(posedge sumcomp[3] & !init) begin
  check = $fscanf (Soutdata[3], "%h", filesum[3][1:0]);
if(sumout[3] != filesum[3]) begin
  $display( "03 fail result ox%h  expected 0x%h", sumout[3] ,filesum[3]);
  test = 1;
end
end
always @(negedge sumcomp[3] & !init) begin
filesum[3][1:0] = 0; end

always @(posedge sumcomp[4] & !init) begin
  check = $fscanf (Soutdata[4], "%h", filesum[4][1:0]);
if(sumout[4] != filesum[4]) begin
  $display( "04 fail result ox%h  expected 0x%h", sumout[4] ,filesum[4]);
  test = 1;
end
end
always @(negedge sumcomp[4] & !init) begin
filesum[4][1:0] = 0; end

always @(posedge sumcomp[5] & !init) begin
  check = $fscanf (Soutdata[5], "%h", filesum[5][1:0]);
if(sumout[5] != filesum[5]) begin
  $display( "05 fail result ox%h  expected 0x%h", sumout[5] ,filesum[5]);
  test = 1;
end
end
always @(negedge sumcomp[5] & !init) begin
filesum[5][1:0] = 0; end

always @(posedge sumcomp[6] & !init) begin
  check = $fscanf (Soutdata[6], "%h", filesum[6][1:0]);
if(sumout[6] != filesum[6]) begin
  $display( "06 fail result ox%h  expected 0x%h", sumout[6] ,filesum[6]);
  test = 1;
end
end
always @(negedge sumcomp[6] & !init) begin
filesum[6][1:0] = 0; end

always @(posedge sumcomp[7] & !init) begin
  check = $fscanf (Soutdata[7], "%h", filesum[7][1:0]);
if(sumout[7] != filesum[7]) begin
  $display( "07 fail result ox%h  expected 0x%h", sumout[7] ,filesum[7]);
  test = 1;
end
end
always @(negedge sumcomp[7] & !init) begin
filesum[7][1:0] = 0; end

always @(posedge sumcomp[8] & !init) begin
  check = $fscanf (Soutdata[8], "%h", filesum[8][1:0]);
if(sumout[8] != filesum[8]) begin
  $display( "08 fail result ox%h  expected 0x%h", sumout[8] ,filesum[8]);
  test = 1;
end
end
always @(negedge sumcomp[8] & !init) begin
filesum[8][1:0] = 0; end

always @(posedge sumcomp[9] & !init) begin
  check = $fscanf (Soutdata[9], "%h", filesum[9][1:0]);
if(sumout[9] != filesum[9]) begin
  $display( "09 fail result ox%h  expected 0x%h", sumout[9] ,filesum[9]);
  test = 1;
end
end
always @(negedge sumcomp[9] & !init) begin
filesum[9][1:0] = 0; end

always @(posedge sumcomp[10] & !init) begin
  check = $fscanf (Soutdata[10], "%h", filesum[10][1:0]);
if(sumout[10] != filesum[10]) begin
  $display( "10 fail result ox%h  expected 0x%h", sumout[10] ,filesum[10]);
  test = 1;
end
end
always @(negedge sumcomp[10] & !init) begin
filesum[10][1:0] = 0; end

always @(posedge sumcomp[11] & !init) begin
  check = $fscanf (Soutdata[11], "%h", filesum[11][1:0]);
if(sumout[11] != filesum[11]) begin
  $display( "11 fail result ox%h  expected 0x%h", sumout[11] ,filesum[11]);
  test = 1;
end
end
always @(negedge sumcomp[11] & !init) begin
filesum[11][1:0] = 0; end

always @(posedge sumcomp[12] & !init) begin
  check = $fscanf (Soutdata[12], "%h", filesum[12][1:0]);
if(sumout[12] != filesum[12]) begin
  $display( "12 fail result ox%h  expected 0x%h", sumout[12] ,filesum[12]);
  test = 1;
end
end
always @(negedge sumcomp[12] & !init) begin
filesum[12][1:0] = 0; end

always @(posedge sumcomp[13] & !init) begin
  check = $fscanf (Soutdata[13], "%h", filesum[13][1:0]);
if(sumout[13] != filesum[13]) begin
  $display( "13 fail result ox%h  expected 0x%h", sumout[13] ,filesum[13]);
  test = 1;
end
end
always @(negedge sumcomp[13] & !init) begin
filesum[13][1:0] = 0; end

always @(posedge sumcomp[14] & !init) begin
  check = $fscanf (Soutdata[14], "%h", filesum[14][1:0]);
if(sumout[14] != filesum[14]) begin
  $display( "14 fail result ox%h  expected 0x%h", sumout[14] ,filesum[14]);
  test = 1;
end
end
always @(negedge sumcomp[14] & !init) begin
filesum[14][1:0] = 0; end

always @(posedge sumcomp[15] & !init) begin
  check = $fscanf (Soutdata[15], "%h", filesum[15][1:0]);
if(sumout[15] != filesum[15]) begin
  $display( "15 fail result ox%h  expected 0x%h", sumout[15] ,filesum[15]);
  test = 1;
end
end
always @(negedge sumcomp[15] & !init) begin
filesum[15][1:0] = 0; end

always @(posedge sumcomp[16] & !init) begin
  check = $fscanf (Soutdata[16], "%h", filesum[16][1:0]);
if(sumout[16] != filesum[16]) begin
  $display( "16 fail result ox%h  expected 0x%h", sumout[16] ,filesum[16]);
  test = 1;
end
end
always @(negedge sumcomp[16] & !init) begin
filesum[16][1:0] = 0; end

always @(posedge sumcomp[17] & !init) begin
  check = $fscanf (Soutdata[17], "%h", filesum[17][1:0]);
if(sumout[17] != filesum[17]) begin
  $display( "17 fail result ox%h  expected 0x%h", sumout[17] ,filesum[17]);
  test = 1;
end
end
always @(negedge sumcomp[17] & !init) begin
filesum[17][1:0] = 0; end

always @(posedge sumcomp[18] & !init) begin
  check = $fscanf (Soutdata[18], "%h", filesum[18][1:0]);
if(sumout[18] != filesum[18]) begin
  $display( "18 fail result ox%h  expected 0x%h", sumout[18] ,filesum[18]);
  test = 1;
end
end
always @(negedge sumcomp[18] & !init) begin
filesum[18][1:0] = 0; end

always @(posedge sumcomp[19] & !init) begin
  check = $fscanf (Soutdata[19], "%h", filesum[19][1:0]);
if(sumout[19] != filesum[19]) begin
  $display( "19 fail result ox%h  expected 0x%h", sumout[19] ,filesum[19]);
  test = 1;
end
end
always @(negedge sumcomp[19] & !init) begin
filesum[19][1:0] = 0; end

always @(posedge sumcomp[20] & !init) begin
  check = $fscanf (Soutdata[20], "%h", filesum[20][1:0]);
if(sumout[20] != filesum[20]) begin
  $display( "20 fail result ox%h  expected 0x%h", sumout[20] ,filesum[20]);
  test = 1;
end
end
always @(negedge sumcomp[20] & !init) begin
filesum[20][1:0] = 0; end

always @(posedge sumcomp[21] & !init) begin
  check = $fscanf (Soutdata[21], "%h", filesum[21][1:0]);
if(sumout[21] != filesum[21]) begin
  $display( "21 fail result ox%h  expected 0x%h", sumout[21] ,filesum[21]);
  test = 1;
end
end
always @(negedge sumcomp[21] & !init) begin
filesum[21][1:0] = 0; end

always @(posedge sumcomp[22] & !init) begin
  check = $fscanf (Soutdata[22], "%h", filesum[22][1:0]);
if(sumout[22] != filesum[22]) begin
  $display( "22 fail result ox%h  expected 0x%h", sumout[22] ,filesum[22]);
  test = 1;
end
end
always @(negedge sumcomp[22] & !init) begin
filesum[22][1:0] = 0; end

always @(posedge sumcomp[23] & !init) begin
  check = $fscanf (Soutdata[23], "%h", filesum[23][1:0]);
if(sumout[23] != filesum[23]) begin
  $display( "23 fail result ox%h  expected 0x%h", sumout[23] ,filesum[23]);
  test = 1;
end
end
always @(negedge sumcomp[23] & !init) begin
filesum[23][1:0] = 0; end

always @(posedge sumcomp[24] & !init) begin
  check = $fscanf (Soutdata[24], "%h", filesum[24][1:0]);
if(sumout[24] != filesum[24]) begin
  $display( "24 fail result ox%h  expected 0x%h", sumout[24] ,filesum[24]);
  test = 1;
end
end
always @(negedge sumcomp[24] & !init) begin
filesum[24][1:0] = 0; end

always @(posedge sumcomp[25] & !init) begin
  check = $fscanf (Soutdata[25], "%h", filesum[25][1:0]);
if(sumout[25] != filesum[25]) begin
  $display( "25 fail result ox%h  expected 0x%h", sumout[25] ,filesum[25]);
  test = 1;
end
end
always @(negedge sumcomp[25] & !init) begin
filesum[25][1:0] = 0; end

always @(posedge sumcomp[26] & !init) begin
  check = $fscanf (Soutdata[26], "%h", filesum[26][1:0]);
if(sumout[26] != filesum[26]) begin
  $display( "26 fail result ox%h  expected 0x%h", sumout[26] ,filesum[26]);
  test = 1;
end
end
always @(negedge sumcomp[26] & !init) begin
filesum[26][1:0] = 0; end

always @(posedge sumcomp[27] & !init) begin
  check = $fscanf (Soutdata[27], "%h", filesum[27][1:0]);
if(sumout[27] != filesum[27]) begin
  $display( "27 fail result ox%h  expected 0x%h", sumout[27] ,filesum[27]);
  test = 1;
end
end
always @(negedge sumcomp[27] & !init) begin
filesum[27][1:0] = 0; end

always @(posedge sumcomp[28] & !init) begin
  check = $fscanf (Soutdata[28], "%h", filesum[28][1:0]);
if(sumout[28] != filesum[28]) begin
  $display( "28 fail result ox%h  expected 0x%h", sumout[28] ,filesum[28]);
  test = 1;
end
end
always @(negedge sumcomp[28] & !init) begin
filesum[28][1:0] = 0; end

always @(posedge sumcomp[29] & !init) begin
  check = $fscanf (Soutdata[29], "%h", filesum[29][1:0]);
if(sumout[29] != filesum[29]) begin
  $display( "29 fail result ox%h  expected 0x%h", sumout[29] ,filesum[29]);
  test = 1;
end
end
always @(negedge sumcomp[29] & !init) begin
filesum[29][1:0] = 0; end

always @(posedge sumcomp[30] & !init) begin
  check = $fscanf (Soutdata[30], "%h", filesum[30][1:0]);
if(sumout[30] != filesum[30]) begin
  $display( "30 fail result ox%h  expected 0x%h", sumout[30] ,filesum[30]);
  test = 1;
end
end
always @(negedge sumcomp[30] & !init) begin
filesum[30][1:0] = 0; end

always @(posedge sumcomp[31] & !init) begin
  check = $fscanf (Soutdata[31], "%h", filesum[31][1:0]);
if(sumout[31] != filesum[31]) begin
  $display( "31 fail result ox%h  expected 0x%h", sumout[31] ,filesum[31]);
  test = 1;
end
end
always @(negedge sumcomp[31] & !init) begin
filesum[31][1:0] = 0; end

always @(checklast == 0) begin
 if (test == 0) begin
	$display( "pass"); end
else begin
	$display( "fail"); end
end
endmodule
