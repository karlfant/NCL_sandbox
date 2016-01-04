/////////////////////////////
// NCL sandbox
// two D adder with digit completeness input testbench
// and digit completeness output test bench
// Karl Fant July 2015
/////////////////////////////

`timescale 1ps / 1ps

module twoD_mult8S;

 /* Make an init that pulses once. */
  reg init = 1;
  reg test = 0;
  reg [8:0] count[31:0];
  reg [8:0] count0 = 0;
  reg [8:0] count1 = 0;
  reg [8:0] count2 = 0;
  reg [8:0] count3 = 0;
  reg [8:0] count4 = 0;
  reg [8:0] count5 = 0;
  reg [8:0] count6 = 0;
  reg [8:0] count7 = 0;
  reg [8:0] count8 = 0;
  reg [8:0] count9 = 0;
  reg [8:0] count10 = 0;
  reg [8:0] count11 = 0;
  reg [8:0] count12 = 0;
  reg [8:0] count13 = 0;
  reg [8:0] count14 = 0;
  reg [8:0] count15 = 0;
genvar i, j, m, n;
 initial 
begin
     # 2000 init = 0;
     # 200000 $stop;
  end
initial
begin
    $dumpfile("twoD_mult8S.vcd");
    $dumpvars(0, twoD_mult8S);
    checklast = 1;
//genvar p;
//for (p=0; p<32; p=p+1) begin
 //count[0] = 0; count[1] = 0; count[2] = 0; count[3] = 0; count[4] = 0; count[5] = 0; count[6] = 0; count[6] = 0;
// end
end

integer Aindata[31:0], Bindata[31:0], Soutdata[31:0];
integer check, checklast;
wire [1:0] Ain [31:0];
wire [1:0] Bin [31:0];
reg [1:0] fileA [31:0];
reg [1:0] fileB [31:0];
reg [1:0] filesum [31:0];

wire [31:0] Afilecomp, Bfilecomp;
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
  Soutdata[0] = $fopen ("prod0.dual", "r+");
  Soutdata[1] = $fopen ("prod1.dual", "r+");
  Soutdata[2] = $fopen ("prod2.dual", "r+");
  Soutdata[3] = $fopen ("prod3.dual", "r+");
  Soutdata[4] = $fopen ("prod4.dual", "r+");
  Soutdata[5] = $fopen ("prod5.dual", "r+");
  Soutdata[6] = $fopen ("prod6.dual", "r+");
  Soutdata[7] = $fopen ("prod7.dual", "r+");
  Soutdata[8] = $fopen ("prod8.dual", "r+");
  Soutdata[9] = $fopen ("prod9.dual", "r+");
  Soutdata[10] = $fopen ("prod10.dual", "r+");
  Soutdata[11] = $fopen ("prod11.dual", "r+");
  Soutdata[12] = $fopen ("prod12.dual", "r+");
  Soutdata[13] = $fopen ("prod13.dual", "r+");
  Soutdata[14] = $fopen ("prod14.dual", "r+");
  Soutdata[15] = $fopen ("prod15.dual", "r+");
  Soutdata[16] = $fopen ("prod16.dual", "r+");
  Soutdata[17] = $fopen ("prod17.dual", "r+");
  Soutdata[18] = $fopen ("prod18.dual", "r+");
  Soutdata[19] = $fopen ("prod19.dual", "r+");
  Soutdata[20] = $fopen ("prod20.dual", "r+");
  Soutdata[21] = $fopen ("prod21.dual", "r+");
  Soutdata[22] = $fopen ("prod22.dual", "r+");
  Soutdata[23] = $fopen ("prod23.dual", "r+");
  Soutdata[24] = $fopen ("prod24.dual", "r+");
  Soutdata[25] = $fopen ("prod25.dual", "r+");
  Soutdata[26] = $fopen ("prod26.dual", "r+");
  Soutdata[27] = $fopen ("prod27.dual", "r+");
  Soutdata[28] = $fopen ("prod28.dual", "r+");
  Soutdata[29] = $fopen ("prod29.dual", "r+");
  Soutdata[30] = $fopen ("prod30.dual", "r+");
  Soutdata[31] = $fopen ("prod31.dual", "r+");
end

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
/*
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
*/
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
  checklast = $fscanf (Bindata[7], "%h", fileB[7][1:0]); end
always @(posedge Bcomp[7] & !init) begin
fileB[7][1:0] = 0; end
/*
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
*/
// test bench iterface  The first file record is read during init
// the resulting wavefront has to be blocked during init and then enabled when init goes low
wire [7:0] Aenable, Benable;
wire [7:0] Acomp, Bcomp;

//build A input buffer close with file read
for (i=0; i<8; i=i+1) begin
THnotN  tbb3(Aenable[i], ACOMP[i], init);
TH22N  ob4 (Ain[i][0], fileA[i][0], Aenable[i], init);
TH22N  ob5 (Ain[i][1], fileA[i][1], Aenable[i], init);
TH12 u11 (Acomp[i], Ain[i][1], Ain[i][0]);  // auto consume sum
end

//build B input buffer close with file read
for (i=0; i<8; i=i+1) begin
THnotN  tbb2(Benable[i], BCOMP[i], init);
TH22N  ob2 (Bin[i][0], fileB[i][0], Benable[i], init);
TH22N  ob3 (Bin[i][1], fileB[i][1], Benable[i], init);
TH12 u10 (Bcomp[i], Bin[i][1], Bin[i][0]);  // auto consume sum
end

///// testbench input
/////////////////////////////
///// Circuit Under Test

wire [1:0] sum [7:0];
wire [7:0]ACOMP, BCOMP;
wire [1:0] AA [64:0];
wire [63:0] AACOMP;
wire [63:0] AAACOMP;
wire [63:0] AAPPCOMP;
wire [1:0] BB [64:0];
wire [1:0] PP [64:0];
wire [63:0] PPCOMP;
wire [63:0] BBCOMP;
wire [63:0] BBBCOMP;
wire [63:0] BBPPCOMP;

// 8 bit multiplier array
//THnotN  u0(carry[0][0], sumcarryCOMP[0], init); // auto produce carryin
//assign AM[0] = Ain[0; // auto produce carryin

// establish the pipeline column array for AA
for (m=0; m<8; m=m+1) begin // seed the front of each column
    dualbuf db6 (AA[m*8], AAACOMP[m*8], Ain[m], ACOMP[m], init);
  for (n=0; n<7; n=n+1) begin// pipe the seed along each row and column
    dualbuf db0 (AA[(m*8)+n+1], AAACOMP[(m*8)+n+1], AA[(m*8)+n], AACOMP[(m*8)+n], init);
  end
end

// establish the pipeline row array for BB
for (m=0; m<8; m=m+1) begin // seed the front of each row
    dualbuf db7 (BB[m], BBBCOMP[m], Bin[m], BCOMP[m], init);
  for (n=0; n<7; n=n+1) begin// pipe the seed along each row and column
    dualbuf db1 (BB[(n*8)+m+8], BBBCOMP[(n*8)+m+8], BB[(n*8)+m], BBCOMP[(n*8)+m], init);
  end
end
// get the last comp of each AA array and sink the last digit
for (m=1; m<9; m=m+1) begin
  TH12 db12 (AACOMP[(m*8)-1], AA[(m*8)-2][0], AA[(m*8)-2][1]);
end
// get the last comp of each BB array and sink the last digit
for (m=0; m<8; m=m+1) begin
  TH12 db13 (BBCOMP[48+m+8], BB[48+m][0], BB[48+m][1]);
end

/////////////////////////////
// add in the partial products into the array and sink their output
/////////////////////////////
for (m=0; m<8; m=m+1) begin // 
  for (n=0; n<8; n=n+1) begin// 
    pprodA pp0 (PP[m*8+n], PPCOMP[m*8+n], AA[m*8+n], AAPPCOMP[m*8+n], BB[m*8+n], BBPPCOMP[m*8+n], init);
//    TH12 pp1 (PPCOMP[m*8+n], PP[m*8+n][0], PP[m*8+n][1]); // autoconsume PP 
  end
end
// generate closures for the AA array
for (m=0; m<8; m=m+1) begin // 
  for (n=0; n<7; n=n+1) begin// 
   TH22 pp2 (AAACOMP[m*8+n], AACOMP[m*8+n+1], AAPPCOMP[m*8+n]);
  end
end
// generate closures for the BB array
for (m=0; m<7; m=m+1) begin // 
  for (n=0; n<8; n=n+1) begin// 
   TH22 pp3 (BBBCOMP[m*8+n], BBCOMP[(m+1)*8+n], BBPPCOMP[m*8+n]);
  end
end
// close the ends of the BB pipelines
for (m=0; m<8; m=m+1) begin // 
  assign BBBCOMP[56+m] = BBPPCOMP[56+m];
end
// close the ends of the AA pipelines
for (m=0; m<64; m=m+8) begin // 
  assign AAACOMP[7+m] = BBPPCOMP[7+m];
end

wire [1:0] prod [15:0];
wire [15:0] prodCOMP;
wire [1:0] prodtemp [84:0];
wire [1:0] carry [89:0];
wire [84:0] prodtempCOMP;
wire [89:0] carryCOMP;

//  bit 0
dualbuf db0 (prod[0], prodCOMP[0], PP[0], PPCOMP[0], init);
//TH12 bit0(prodCOMP[0], prod[0][0], prod[0][1]); // autoconsume prod
//  bit 1
halfaddI add1(prod[1], prodCOMP[1], carry[0], carryCOMP[0], PP[8], PPCOMP[8], PP[1], PPCOMP[1], init);
//TH12 bit1(prodCOMP[1], prod[1][0], prod[1][1]); // autoconsume prod
//  bit 2
fulladdI add2(prodtemp[0], prodtempCOMP[0], carry[1], carryCOMP[1], PP[16], PPCOMP[16], PP[9], PPCOMP[9], carry[0], carryCOMP[0], init);
dualbuf db2 (prodtemp[1], prodtempCOMP[1], PP[2], PPCOMP[2], init);
halfaddI add21(prod[2], prodCOMP[2], carry[2], carryCOMP[2], prodtemp[0], prodtempCOMP[0], prodtemp[1], prodtempCOMP[1], init);
//TH12 bit2(prodCOMP[2], prod[2][0], prod[2][1]); // autoconsume prod
//  bit 3
fulladdI add31(prodtemp[2], prodtempCOMP[2], carry[3], carryCOMP[3], PP[24], PPCOMP[24], PP[17], PPCOMP[17], carry[1], carryCOMP[1], init);
halfaddI add32(prodtemp[3], prodtempCOMP[3], carry[4], carryCOMP[4], PP[10], PPCOMP[10], PP[3], PPCOMP[3], init);
fulladdI add33(prod[3], prodCOMP[3], carry[5], carryCOMP[5], prodtemp[2], prodtempCOMP[2], prodtemp[3], prodtempCOMP[3], carry[2], carryCOMP[2], init);
//TH12 bit3(prodCOMP[3], prod[3][0], prod[3][1]); // autoconsume prod
//  bit 4
fulladdI add41(prodtemp[4], prodtempCOMP[4], carry[6], carryCOMP[6], PP[32], PPCOMP[32], PP[25], PPCOMP[25], carry[3], carryCOMP[3], init);
fulladdI add42(prodtemp[5], prodtempCOMP[5], carry[7], carryCOMP[7], PP[18], PPCOMP[18], PP[11], PPCOMP[11], carry[4], carryCOMP[4], init);
fulladdI add43(prodtemp[6], prodtempCOMP[6], carry[8], carryCOMP[8], prodtemp[4], prodtempCOMP[4], prodtemp[5], prodtempCOMP[5], carry[5], carryCOMP[5], init);
dualbuf db41 (prodtemp[7], prodtempCOMP[7], PP[4], PPCOMP[4], init);
dualbuf db42 (prodtemp[8], prodtempCOMP[8], prodtemp[7], prodtempCOMP[7], init);
halfaddI add44(prod[4], prodCOMP[4], carry[9], carryCOMP[9], prodtemp[6], prodtempCOMP[6], prodtemp[8], prodtempCOMP[8], init);
//TH12 bit4(prodCOMP[4], prod[4][0], prod[4][1]); // autoconsume prod
//  bit 5
fulladdI add51(prodtemp[9], prodtempCOMP[9], carry[10], carryCOMP[10], PP[40], PPCOMP[40], PP[33], PPCOMP[33], carry[6], carryCOMP[6], init);
fulladdI add52(prodtemp[10], prodtempCOMP[10], carry[11], carryCOMP[11], PP[26], PPCOMP[26], PP[19], PPCOMP[19], carry[7], carryCOMP[7], init);
halfaddI add53(prodtemp[11], prodtempCOMP[11], carry[12], carryCOMP[12], PP[12], PPCOMP[12], PP[5], PPCOMP[5], init);
fulladdI add54(prodtemp[12], prodtempCOMP[12], carry[13], carryCOMP[13], prodtemp[9], prodtempCOMP[9], prodtemp[10], prodtempCOMP[10], carry[8], carryCOMP[8], init);
dualbuf db5 (prodtemp[13], prodtempCOMP[13], prodtemp[11], prodtempCOMP[11], init);
fulladdI add55(prod[5], prodCOMP[5], carry[14], carryCOMP[14], prodtemp[12], prodtempCOMP[12], prodtemp[13], prodtempCOMP[13], carry[9], carryCOMP[9], init);
//TH12 bit5(prodCOMP[5], prod[5][0], prod[5][1]); // autoconsume prod
//  bit 6
fulladdI add61(prodtemp[14], prodtempCOMP[14], carry[15], carryCOMP[15], PP[48], PPCOMP[48], PP[41], PPCOMP[41], carry[10], carryCOMP[10], init);
fulladdI add62(prodtemp[15], prodtempCOMP[15], carry[16], carryCOMP[16], PP[34], PPCOMP[34], PP[27], PPCOMP[27], carry[11], carryCOMP[11], init);
fulladdI add63(prodtemp[16], prodtempCOMP[16], carry[17], carryCOMP[17], PP[20], PPCOMP[20], PP[13], PPCOMP[13], carry[12], carryCOMP[12], init);
fulladdI add64(prodtemp[18], prodtempCOMP[18], carry[18], carryCOMP[18], prodtemp[14], prodtempCOMP[14], prodtemp[15], prodtempCOMP[15], carry[13], carryCOMP[13], init);
dualbuf db6 (prodtemp[17], prodtempCOMP[17], PP[6], PPCOMP[6], init);
halfaddI add65(prodtemp[19], prodtempCOMP[19], carry[19], carryCOMP[19], prodtemp[16], prodtempCOMP[16], prodtemp[17], prodtempCOMP[17], init);
fulladdI add66(prod[6], prodCOMP[6], carry[20], carryCOMP[20], prodtemp[18], prodtempCOMP[18], prodtemp[19], prodtempCOMP[19], carry[14], carryCOMP[14], init);
//TH12 bit6(prodCOMP[6], prod[6][0], prod[6][1]); // autoconsume prod
//  bit 7
halfaddN add70(prodtemp[20], prodtempCOMP[20], carry[21], carryCOMP[21], PP[56], PPCOMP[56], carry[15], carryCOMP[15], init);
halfaddI add71(prodtemp[21], prodtempCOMP[21], carry[22], carryCOMP[22], PP[49], PPCOMP[49], carry[16], carryCOMP[16], init);
fulladdI add72(prodtemp[22], prodtempCOMP[22], carry[23], carryCOMP[23], PP[42], PPCOMP[42], PP[35], PPCOMP[35], carry[17], carryCOMP[17], init);
halfaddI add74(prodtemp[23], prodtempCOMP[23], carry[24], carryCOMP[24], PP[28], PPCOMP[28], PP[21], PPCOMP[21], init);
halfaddN add75(prodtemp[24], prodtempCOMP[24], carry[25], carryCOMP[25], PP[7], PPCOMP[7], PP[14], PPCOMP[14], init);
halfaddI add76(prodtemp[25], prodtempCOMP[25], carry[26], carryCOMP[26], prodtemp[20], prodtempCOMP[20], prodtemp[21], prodtempCOMP[21], init);
halfaddI add77(prodtemp[26], prodtempCOMP[26], carry[27], carryCOMP[27], prodtemp[22], prodtempCOMP[22], carry[18], carryCOMP[18], init);
fulladdI add78(prodtemp[27], prodtempCOMP[27], carry[28], carryCOMP[28], prodtemp[23], prodtempCOMP[23], prodtemp[24], prodtempCOMP[24], carry[19], carryCOMP[19], init);
dualbuf db7  (prodtemp[28], prodtempCOMP[28], prodtemp[25], prodtempCOMP[25], init);
fulladdI add79(prodtemp[29], prodtempCOMP[29], carry[29], carryCOMP[29], prodtemp[26], prodtempCOMP[26], prodtemp[27], prodtempCOMP[27], carry[20], carryCOMP[20], init);
halfaddI add79a(prod[7], prodCOMP[7], carry[30], carryCOMP[30], prodtemp[28], prodtempCOMP[28], prodtemp[29], prodtempCOMP[29], init);
//TH12 bit7(prodCOMP[7], prod[7][0], prod[7][1]); // autoconsume prod
//  bit 8
halfaddN add80(prodtemp[30], prodtempCOMP[30], carry[31], carryCOMP[31], PP[57], PPCOMP[57], carry[21], carryCOMP[21], init);
halfaddI add81(prodtemp[31], prodtempCOMP[31], carry[32], carryCOMP[32], PP[50], PPCOMP[50], carry[22], carryCOMP[22], init);
fulladdI add82(prodtemp[32], prodtempCOMP[32], carry[33], carryCOMP[33], PP[43], PPCOMP[43], PP[36], PPCOMP[36], carry[23], carryCOMP[23], init);
fulladdI add83(prodtemp[33], prodtempCOMP[33], carry[34], carryCOMP[34], PP[29], PPCOMP[29], PP[22], PPCOMP[22], carry[24], carryCOMP[24], init);
halfaddN add84(prodtemp[34], prodtempCOMP[34], carry[35], carryCOMP[35], PP[15], PPCOMP[15], carry[25], carryCOMP[25], init);
halfaddI add85(prodtemp[35], prodtempCOMP[35], carry[36], carryCOMP[36], prodtemp[30], prodtempCOMP[30], carry[26], carryCOMP[26], init);
fulladdI add86(prodtemp[36], prodtempCOMP[36], carry[37], carryCOMP[37], prodtemp[31], prodtempCOMP[31], prodtemp[32], prodtempCOMP[32], carry[27], carryCOMP[27], init);
fulladdI add87(prodtemp[37], prodtempCOMP[37], carry[38], carryCOMP[38], prodtemp[33], prodtempCOMP[33], prodtemp[34], prodtempCOMP[34], carry[28], carryCOMP[28], init);
halfaddI add88(prodtemp[38], prodtempCOMP[38], carry[39], carryCOMP[39], prodtemp[35], prodtempCOMP[35], carry[29], carryCOMP[29], init);
halfaddI add89(prodtemp[39], prodtempCOMP[39], carry[40], carryCOMP[40], prodtemp[36], prodtempCOMP[36], prodtemp[37], prodtempCOMP[37], init);
fulladdI add89a(prod[8], prodCOMP[8], carry[41], carryCOMP[41], prodtemp[38], prodtempCOMP[38], prodtemp[39], prodtempCOMP[39], carry[30], carryCOMP[30], init);
//TH12 bit8(prodCOMP[8], prod[8][0], prod[8][1]); // autoconsume prod
//  bit 9
halfaddN add90(prodtemp[40], prodtempCOMP[40], carry[42], carryCOMP[42], PP[58], PPCOMP[58], carry[31], carryCOMP[31], init);
halfadd1 add91(prodtemp[41], prodtempCOMP[41], carry[43], carryCOMP[43], PP[51], PPCOMP[51], carry[32], carryCOMP[32], init);
fulladdI add92(prodtemp[42], prodtempCOMP[42], carry[44], carryCOMP[44], PP[44], PPCOMP[44], PP[37], PPCOMP[37], carry[33], carryCOMP[33], init);
halfaddI add93(prodtemp[43], prodtempCOMP[43], carry[45], carryCOMP[45], PP[30], PPCOMP[30], carry[34], carryCOMP[34], init);
halfaddN add94(prodtemp[44], prodtempCOMP[44], carry[46], carryCOMP[46], PP[23], PPCOMP[23], carry[35], carryCOMP[35], init);
halfaddI add95(prodtemp[45], prodtempCOMP[45], carry[47], carryCOMP[47], prodtemp[40], prodtempCOMP[40], carry[36], carryCOMP[36], init);
fulladdI add96(prodtemp[46], prodtempCOMP[46], carry[48], carryCOMP[48], prodtemp[41], prodtempCOMP[41], prodtemp[42], prodtempCOMP[42], carry[37], carryCOMP[37], init);
fulladdI add97(prodtemp[47], prodtempCOMP[47], carry[49], carryCOMP[49], prodtemp[43], prodtempCOMP[43], prodtemp[44], prodtempCOMP[44], carry[38], carryCOMP[38], init);
halfaddI add98(prodtemp[48], prodtempCOMP[48], carry[50], carryCOMP[50], prodtemp[45], prodtempCOMP[45], carry[39], carryCOMP[39], init);
fulladdI add99(prodtemp[49], prodtempCOMP[49], carry[51], carryCOMP[51], prodtemp[46], prodtempCOMP[46], prodtemp[47], prodtempCOMP[47], carry[40], carryCOMP[40], init);
fulladdI add99a(prod[9], prodCOMP[9], carry[52], carryCOMP[52], prodtemp[48], prodtempCOMP[48], prodtemp[49], prodtempCOMP[49], carry[41], carryCOMP[41], init);

//TH12 bit9(prodCOMP[9], prod[9][0], prod[9][1]); // autoconsume prod
//  bit 10
halfaddN add100(prodtemp[50], prodtempCOMP[50], carry[53], carryCOMP[53], PP[59], PPCOMP[59], carry[42], carryCOMP[42], init);
fulladdI add101(prodtemp[51], prodtempCOMP[51], carry[54], carryCOMP[54], PP[52], PPCOMP[52], carry[43], carryCOMP[43], carry[44], carryCOMP[44], init);
fulladdI add102(prodtemp[52], prodtempCOMP[52], carry[55], carryCOMP[55], PP[45], PPCOMP[45], PP[38], PPCOMP[38], carry[45], carryCOMP[45], init);
halfaddN add103(prodtemp[53], prodtempCOMP[53], carry[56], carryCOMP[56], PP[31], PPCOMP[31], carry[46], carryCOMP[46], init);
fulladdI add104(prodtemp[54], prodtempCOMP[54], carry[57], carryCOMP[57], prodtemp[50], prodtempCOMP[50], prodtemp[51], prodtempCOMP[51], carry[47], carryCOMP[47], init);
halfaddI add105(prodtemp[55], prodtempCOMP[55], carry[58], carryCOMP[58], prodtemp[52], prodtempCOMP[52], carry[48], carryCOMP[48], init);
halfaddI add106(prodtemp[56], prodtempCOMP[56], carry[59], carryCOMP[59], prodtemp[53], prodtempCOMP[53], carry[49], carryCOMP[49], init);
halfaddI add107(prodtemp[57], prodtempCOMP[57], carry[60], carryCOMP[60], prodtemp[54], prodtempCOMP[54], carry[50], carryCOMP[50], init);
fulladdI add108(prodtemp[58], prodtempCOMP[58], carry[61], carryCOMP[61], prodtemp[55], prodtempCOMP[55], prodtemp[56], prodtempCOMP[56], carry[51], carryCOMP[51], init);
fulladdI add109(prod[10], prodCOMP[10], carry[62], carryCOMP[62], prodtemp[57], prodtempCOMP[57], prodtemp[58], prodtempCOMP[58], carry[52], carryCOMP[52], init);
//TH12 bit10(prodCOMP[10], prod[10][0], prod[10][1]); // autoconsume prod
//  bit 11
halfaddN add110(prodtemp[59], prodtempCOMP[59], carry[63], carryCOMP[63], PP[60], PPCOMP[60], carry[53], carryCOMP[53], init);
fulladdI add111(prodtemp[60], prodtempCOMP[60], carry[64], carryCOMP[64], PP[53], PPCOMP[53], PP[46], PPCOMP[46], carry[54], carryCOMP[54], init);
halfaddN add112(prodtemp[61], prodtempCOMP[61], carry[65], carryCOMP[65], PP[39], PPCOMP[39], carry[55], carryCOMP[55], init);
dualbuf db11  (prodtemp[62], prodtempCOMP[62], carry[56], carryCOMP[56], init);
fulladdI add113(prodtemp[63], prodtempCOMP[63], carry[66], carryCOMP[66], prodtemp[59], prodtempCOMP[59], prodtemp[60], prodtempCOMP[60], carry[57], carryCOMP[57], init);
fulladdI add114(prodtemp[64], prodtempCOMP[64], carry[67], carryCOMP[67], prodtemp[61], prodtempCOMP[61], prodtemp[62], prodtempCOMP[62], carry[58], carryCOMP[58], init);
dualbuf db11a  (prodtemp[65], prodtempCOMP[65], carry[59], carryCOMP[59], init);
halfaddI add115(prodtemp[66], prodtempCOMP[66], carry[68], carryCOMP[68], prodtemp[63], prodtempCOMP[63], prodtemp[65], prodtempCOMP[65], init);
fulladdI add116(prodtemp[67], prodtempCOMP[67], carry[69], carryCOMP[69], prodtemp[64], prodtempCOMP[64], carry[60], carryCOMP[60], carry[61], carryCOMP[61], init);
fulladdI add117(prod[11], prodCOMP[11], carry[70], carryCOMP[70], prodtemp[66], prodtempCOMP[66], prodtemp[67], prodtempCOMP[67], carry[62], carryCOMP[62], init);
//TH12 bit11(prodCOMP[11], prod[11][0], prod[11][1]); // autoconsume prod
//  bit 12
halfaddN add120(prodtemp[68], prodtempCOMP[68], carry[71], carryCOMP[71], PP[61], PPCOMP[61], carry[63], carryCOMP[63], init);
halfaddI add121(prodtemp[69], prodtempCOMP[69], carry[72], carryCOMP[72], PP[54], PPCOMP[54], carry[64], carryCOMP[64], init);
halfaddN add122(prodtemp[70], prodtempCOMP[70], carry[73], carryCOMP[73], PP[47], PPCOMP[47], carry[65], carryCOMP[65], init);
fulladdI add123(prodtemp[71], prodtempCOMP[71], carry[74], carryCOMP[74], prodtemp[68], prodtempCOMP[68], prodtemp[69], prodtempCOMP[69], carry[66], carryCOMP[66], init);
halfaddI add124(prodtemp[72], prodtempCOMP[72], carry[75], carryCOMP[75], prodtemp[70], prodtempCOMP[70], carry[67], carryCOMP[67], init);
fulladdI add125(prodtemp[73], prodtempCOMP[73], carry[76], carryCOMP[76], prodtemp[71], prodtempCOMP[71], prodtemp[72], prodtempCOMP[72], carry[68], carryCOMP[68], init);
dualbuf db12  (prodtemp[74], prodtempCOMP[74], carry[69], carryCOMP[69], init);
fulladdI add126(prod[12], prodCOMP[12], carry[77], carryCOMP[77], prodtemp[73], prodtempCOMP[73], prodtemp[74], prodtempCOMP[74], carry[70], carryCOMP[70], init);
//TH12 bit12(prodCOMP[12], prod[12][0], prod[12][1]); // autoconsume prod
//  bit 13
halfaddN add130(prodtemp[75], prodtempCOMP[75], carry[78], carryCOMP[78], PP[62], PPCOMP[62], carry[71], carryCOMP[71], init);
halfaddN add131(prodtemp[76], prodtempCOMP[76], carry[79], carryCOMP[79], PP[55], PPCOMP[55], carry[72], carryCOMP[72], init);
dualbuf db13  (prodtemp[77], prodtempCOMP[77], carry[73], carryCOMP[73], init);
fulladdI add132(prodtemp[78], prodtempCOMP[78], carry[80], carryCOMP[80], prodtemp[75], prodtempCOMP[75], prodtemp[76], prodtempCOMP[76], prodtemp[77], prodtempCOMP[77], init);
halfaddI add133(prodtemp[79], prodtempCOMP[79], carry[81], carryCOMP[81], carry[74], carryCOMP[74], carry[75], carryCOMP[75], init);
fulladdI add134(prodtemp[80], prodtempCOMP[80], carry[82], carryCOMP[82], prodtemp[78], prodtempCOMP[78], prodtemp[79], prodtempCOMP[79], carry[76], carryCOMP[76], init);
halfaddI add135(prod[13], prodCOMP[13], carry[83], carryCOMP[83], prodtemp[80], prodtempCOMP[80], carry[77], carryCOMP[77], init);
//TH12 bit13(prodCOMP[13], prod[13][0], prod[13][1]); // autoconsume prod
//  bit 14
fulladdI add140(prodtemp[81], prodtempCOMP[81], carry[84], carryCOMP[84], PP[63], PPCOMP[63], carry[78], carryCOMP[78], carry[79], carryCOMP[79], init);
fulladdI add141(prodtemp[82], prodtempCOMP[82], carry[85], carryCOMP[85], prodtemp[81], prodtempCOMP[81], carry[80], carryCOMP[80], carry[81], carryCOMP[81], init);
halfaddI add142(prodtemp[83], prodtempCOMP[83], carry[86], carryCOMP[86], prodtemp[82], prodtempCOMP[82], carry[82], carryCOMP[82], init);
halfaddI add143(prod[14], prodCOMP[14], carry[87], carryCOMP[87], prodtemp[83], prodtempCOMP[83], carry[83], carryCOMP[83], init);
//TH12 bit14(prodCOMP[14], prod[14][0], prod[14][1]); // autoconsume prod
//  bit 15
halfaddI add150(prodtemp[84], prodtempCOMP[84], carry[88], carryCOMP[88], carry[84], carryCOMP[84], carry[85], carryCOMP[85], init);
fulladdI add151(prod[15], prodCOMP[15], carry[89], carryCOMP[89], prodtemp[84], prodtempCOMP[84], carry[86], carryCOMP[86], carry[87], carryCOMP[87], init);
//TH12 bit15(prodCOMP[15], prod[15][0], prod[15][1]); // autoconsume prod

TH12 bit160(carryCOMP[88], carry[88][0], carry[88][1]); // autoconsume last carry
TH12 bit161(carryCOMP[89], carry[89][0], carry[89][1]); // autoconsume last carry


///// Circuit Under Test
//////////////////////////////
////// test bench output

//wire carrycomp;
wire [31:0] sumcomp;
wire [31:0] testenable;
wire [1:0] sumout [31:0];
//build output buffer close with input buffer

for (i=0; i<16; i=i+1) begin
THnotN  u0(testenable[i], sumcomp[i], init); // auto produce carryin
TH22  ob0 (sumout[i][0], prod[i][0], testenable[i]);
TH22  ob1 (sumout[i][1], prod[i][1], testenable[i]);
TH12 u3 (sumcomp[i], sumout[i][1], sumout[i][0]);  // auto consume sum
assign prodCOMP[i] = sumcomp[i];
end

wire [63:0] displaysum;
for (i=0; i<32; i=i+1) begin
assign displaysum[2*i+1] = sumout[i][1];
assign displaysum[2*i] = sumout[i][0];
end

// test against output file
always @(posedge sumcomp[0] & !init) begin
  check = $fscanf (Soutdata[0], "%h", filesum[0][1:0]); 
  count0 = count0+1;
if(sumout[0] != filesum[0]) begin
  $display( "00 fail %d result ox%h  expected 0x%h", count0, sumout[0] ,filesum[0]);
  test = 1;
end
end
always @(negedge sumcomp[0] & !init) begin
filesum[0][1:0] = 0;
end

always @(posedge sumcomp[1] & !init) begin
  check = $fscanf (Soutdata[1], "%h", filesum[1][1:0]);
  count1 = count1+1;
if(sumout[1] != filesum[1]) begin
  $display( "01 fail %d result ox%h  expected 0x%h", count1, sumout[1] ,filesum[1]);
  test = 1;
end
end
always @(negedge sumcomp[1] & !init) begin
filesum[1][1:0] = 0; end

always @(posedge sumcomp[2] & !init) begin
  check = $fscanf (Soutdata[2], "%h", filesum[2][1:0]);
  count2 = count2+1;
if(sumout[2] != filesum[2]) begin
  $display( "02 fail %d result ox%h  expected 0x%h", count2, sumout[2] ,filesum[2]);
  test = 1;
end
end
always @(negedge sumcomp[2] & !init) begin
filesum[2][1:0] = 0; end

always @(posedge sumcomp[3] & !init) begin
  check = $fscanf (Soutdata[3], "%h", filesum[3][1:0]);
  count3 = count3+1;
if(sumout[3] != filesum[3]) begin
  $display( "03 fail %d result ox%h  expected 0x%h", count3, sumout[3] ,filesum[3]);
  test = 1;
end
end
always @(negedge sumcomp[3] & !init) begin
filesum[3][1:0] = 0; end

always @(posedge sumcomp[4] & !init) begin
  check = $fscanf (Soutdata[4], "%h", filesum[4][1:0]);
  count4 = count4+1;
if(sumout[4] != filesum[4]) begin
  $display( "04 fail %d result ox%h  expected 0x%h", count4, sumout[4] ,filesum[4]);
  test = 1;
end
end
always @(negedge sumcomp[4] & !init) begin
filesum[4][1:0] = 0; end

always @(posedge sumcomp[5] & !init) begin
  check = $fscanf (Soutdata[5], "%h", filesum[5][1:0]);
  count5 = count5+1;
if(sumout[5] != filesum[5]) begin
  $display( "05 fail %d result ox%h  expected 0x%h", count5, sumout[5] ,filesum[5]);
  test = 1;
end
end
always @(negedge sumcomp[5] & !init) begin
filesum[5][1:0] = 0; end

always @(posedge sumcomp[6] & !init) begin
  check = $fscanf (Soutdata[6], "%h", filesum[6][1:0]);
  count6 = count6+1;
if(sumout[6] != filesum[6]) begin
  $display( "06 fail %d result ox%h  expected 0x%h", count6, sumout[6] ,filesum[6]);
  test = 1;
end
end
always @(negedge sumcomp[6] & !init) begin
filesum[6][1:0] = 0; end

always @(posedge sumcomp[7] & !init) begin
  check = $fscanf (Soutdata[7], "%h", filesum[7][1:0]);
  count7 = count7+1;
if(sumout[7] != filesum[7]) begin
  $display( "07 fail %d result ox%h  expected 0x%h", count7, sumout[7] ,filesum[7]);
  test = 1;
end
end
always @(negedge sumcomp[7] & !init) begin
filesum[7][1:0] = 0; end

always @(posedge sumcomp[8] & !init) begin
  check = $fscanf (Soutdata[8], "%h", filesum[8][1:0]);
  count8 = count8+1;
if(sumout[8] != filesum[8]) begin
  $display( "08 fail %d result ox%h  expected 0x%h", count8, sumout[8] ,filesum[8]);
  test = 1;
end
end
always @(negedge sumcomp[8] & !init) begin
filesum[8][1:0] = 0; end

always @(posedge sumcomp[9] & !init) begin
  check = $fscanf (Soutdata[9], "%h", filesum[9][1:0]);
  count9 = count9+1;
if(sumout[9] != filesum[9]) begin
  $display( "09 fail %d result ox%h  expected 0x%h", count9, sumout[9] ,filesum[9]);
  test = 1;
end
end
always @(negedge sumcomp[9] & !init) begin
filesum[9][1:0] = 0; end

always @(posedge sumcomp[10] & !init) begin
  check = $fscanf (Soutdata[10], "%h", filesum[10][1:0]);
  count10 = count10+1;
if(sumout[10] != filesum[10]) begin
  $display( "10 fail %d result ox%h  expected 0x%h", count10, sumout[10] ,filesum[10]);
  test = 1;
end
end
always @(negedge sumcomp[10] & !init) begin
filesum[10][1:0] = 0; end

always @(posedge sumcomp[11] & !init) begin
  check = $fscanf (Soutdata[11], "%h", filesum[11][1:0]);
  count11 = count11+1;
if(sumout[11] != filesum[11]) begin
  $display( "11 fail %d result ox%h  expected 0x%h", count11, sumout[11] ,filesum[11]);
  test = 1;
end
end
always @(negedge sumcomp[11] & !init) begin
filesum[11][1:0] = 0; end

always @(posedge sumcomp[12] & !init) begin
  check = $fscanf (Soutdata[12], "%h", filesum[12][1:0]);
  count12 = count12+1;
if(sumout[12] != filesum[12]) begin
  $display( "12 fail %d result ox%h  expected 0x%h", count12, sumout[12] ,filesum[12]);
  test = 1;
end
end
always @(negedge sumcomp[12] & !init) begin
filesum[12][1:0] = 0; end

always @(posedge sumcomp[13] & !init) begin
  check = $fscanf (Soutdata[13], "%h", filesum[13][1:0]);
  count13 = count13+1;
if(sumout[13] != filesum[13]) begin
  $display( "13 fail %d result ox%h  expected 0x%h", count13, sumout[13] ,filesum[13]);
  test = 1;
end
end
always @(negedge sumcomp[13] & !init) begin
filesum[13][1:0] = 0; end

always @(posedge sumcomp[14] & !init) begin
  check = $fscanf (Soutdata[14], "%h", filesum[14][1:0]);
  count14 = count14+1;
if(sumout[14] != filesum[14]) begin
  $display( "14 fail %d result ox%h  expected 0x%h", count14, sumout[14] ,filesum[14]);
  test = 1;
end
end
always @(negedge sumcomp[14] & !init) begin
filesum[14][1:0] = 0; end

always @(posedge sumcomp[15] & !init) begin
  check = $fscanf (Soutdata[15], "%h", filesum[15][1:0]);
  count15 = count15+1;
if(sumout[15] != filesum[15]) begin
  $display( "15 fail %d result ox%h  expected 0x%h", count15, sumout[15] ,filesum[15]);
  test = 1;
end
end
always @(negedge sumcomp[15] & !init) begin
filesum[15][1:0] = 0; end
/*
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
*/
always @(checklast == 0) begin
 if (test == 0) begin
	$display( "pass"); end
else begin
	$display( "fail"); end
end

endmodule
