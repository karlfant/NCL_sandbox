/////////////////////////////
// NCL sandbox
// 32 bit left shift
// digit wise wavefront path completeness
// ragged wavefront presentation from 2D pipelined adder adding 0
// Karl Fant Jan 2016
/////////////////////////////

`timescale 1ps / 1ps

module fullword_lshiftragB32;

 /* Make an init that pulses once. */
  reg init = 1;
  reg test = 0;
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
  reg [8:0] count16 = 0;
  reg [8:0] count17 = 0;
  reg [8:0] count18 = 0;
  reg [8:0] count19 = 0;
  reg [8:0] count20 = 0;
  reg [8:0] count21 = 0;
  reg [8:0] count22 = 0;
  reg [8:0] count23 = 0;
  reg [8:0] count24 = 0;
  reg [8:0] count25 = 0;
  reg [8:0] count26 = 0;
  reg [8:0] count27 = 0;
  reg [8:0] count28 = 0;
  reg [8:0] count29 = 0;
  reg [8:0] count30 = 0;
  reg [8:0] count31 = 0;
  initial begin
     # 10000 init = 0;
     # 200000 $stop;
  end
initial
 begin
    $dumpfile("fullword_lshiftragB32.vcd");
    $dumpvars(0, fullword_lshiftragB32);
    checklast = 1;
 end

integer Aindata[31:0], Bindata[31:0], Soutdata[31:0];
integer check, checklast;
wire [1:0] Ain [31:0];
wire [1:0] Bin [31:0];
reg [1:0] fileA [31:0];
reg [1:0] fileB [31:0];
reg [1:0] filesum [31:0];
genvar i;

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
  Soutdata[0] = $fopen ("shift0.dual", "r+");
  Soutdata[1] = $fopen ("shift1.dual", "r+");
  Soutdata[2] = $fopen ("shift2.dual", "r+");
  Soutdata[3] = $fopen ("shift3.dual", "r+");
  Soutdata[4] = $fopen ("shift4.dual", "r+");
  Soutdata[5] = $fopen ("shift5.dual", "r+");
  Soutdata[6] = $fopen ("shift6.dual", "r+");
  Soutdata[7] = $fopen ("shift7.dual", "r+");
  Soutdata[8] = $fopen ("shift8.dual", "r+");
  Soutdata[9] = $fopen ("shift9.dual", "r+");
  Soutdata[10] = $fopen ("shift10.dual", "r+");
  Soutdata[11] = $fopen ("shift11.dual", "r+");
  Soutdata[12] = $fopen ("shift12.dual", "r+");
  Soutdata[13] = $fopen ("shift13.dual", "r+");
  Soutdata[14] = $fopen ("shift14.dual", "r+");
  Soutdata[15] = $fopen ("shift15.dual", "r+");
  Soutdata[16] = $fopen ("shift16.dual", "r+");
  Soutdata[17] = $fopen ("shift17.dual", "r+");
  Soutdata[18] = $fopen ("shift18.dual", "r+");
  Soutdata[19] = $fopen ("shift19.dual", "r+");
  Soutdata[20] = $fopen ("shift20.dual", "r+");
  Soutdata[21] = $fopen ("shift21.dual", "r+");
  Soutdata[22] = $fopen ("shift22.dual", "r+");
  Soutdata[23] = $fopen ("shift23.dual", "r+");
  Soutdata[24] = $fopen ("shift24.dual", "r+");
  Soutdata[25] = $fopen ("shift25.dual", "r+");
  Soutdata[26] = $fopen ("shift26.dual", "r+");
  Soutdata[27] = $fopen ("shift27.dual", "r+");
  Soutdata[28] = $fopen ("shift28.dual", "r+");
  Soutdata[29] = $fopen ("shift29.dual", "r+");
  Soutdata[30] = $fopen ("shift30.dual", "r+");
  Soutdata[31] = $fopen ("shift31.dual", "r+");
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
  checklast = $fscanf (Bindata[4], "%h", fileB[4][1:0]); end
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
  check = $fscanf (Bindata[31], "%h", fileB[31][1:0]); end
always @(posedge Bcomp[31] & !init) begin
fileB[31][1:0] = 0; end

// test bench iterface  The first file record is read during init
// the resulting wavefront has to be blocked during init and then enabled when init goes low
wire [31:0] Aenable, Benable;
wire [31:0] AinCOMP, BinCOMP, Acomp, Bcomp;

//build A input buffer close with file read
for (i=0; i<32; i=i+1) begin
THnotN  tbb3(Aenable[i], AinCOMP[i], init);
TH22N  ob4 (Ain[i][0], fileA[i][0], Aenable[i], init);
TH22N  ob5 (Ain[i][1], fileA[i][1], Aenable[i], init);
TH12 u11 (Acomp[i], Ain[i][1], Ain[i][0]);  // auto consume sum
end

//build B input buffer close with file read
for (i=0; i<32; i=i+1) begin
THnotN  tbb2(Benable[i], BinCOMP[i], init);
TH22N  ob2 (Bin[i][0], fileB[i][0], Benable[i], init);
TH22N  ob3 (Bin[i][1], fileB[i][1], Benable[i], init);
TH12 u10 (Bcomp[i], Bin[i][1], Bin[i][0]);  // auto consume sum
end


///// testbench input
/////////////////////////////
///// Circuit Under Test

///////////////////
////// adder adding 0 to provide ragged input flow
///////////////////
wire [32:0] sumcarryCOMP;
wire [31:0] suminCOMP;
wire [31:0] countCOMP, countSCOMP, countNCOMP;
wire [1:0] Count [31:0];
wire [1:0] carry [32:0];
wire [1:0] zeroin [32:0];
//genvar i;

// 4 stage pipeline
THnotN  u0(carry[0][0], suminCOMP[0], init); // auto produce carryin
assign carry[0][1] = 1'b0; // auto produce carryin

// two D digit pipelined counter
for (i=0; i<32; i=i+1) begin
THnotN  u0(zeroin[i][0], suminCOMP[i], init); // auto produce carryin
assign zeroin[i][1] = 1'b0; // auto produce carryin
fulladdB u2(Count[i], countCOMP[i], carry[i+1], sumcarryCOMP[i+1], Ain[i], zeroin[i], carry[i], sumcarryCOMP[i], init);
assign AinCOMP[i] = suminCOMP[i];
TH22 u1 (suminCOMP[i], sumcarryCOMP[i], sumcarryCOMP[i+1]);
end
TH12 u33 (sumcarryCOMP[32], carry[32][0], carry[32][1]);  // auto consume carryout

///////////////////////////////
/////bit 0 shift         ///////////
//////////////////////////////

wire [1:0] column0 [31:0], tempA0 [31:0], tempB0 [31:0];
wire [1:0] steer0;
wire [31:0] steer0enable, column0COMP, column0NCOMP, column0SCOMP;
wire [31:31] CountSHCOMP;

assign steer0 = Bin[0];

//Count[0] to column0[0] or zero  to column0[0]
for (i=0; i<1; i=i+1) begin
THnotN  u00(steer0enable[i], column0COMP[i], init); // auto produce carryin
TH33 t030 (tempA0[i][0], Count[i][0], steer0[0], steer0enable[i]);   // Count TO 0
TH33 t035 (column0[i][1], Count[i][1], steer0[0], steer0enable[i]);   // Count TO 0
TH22 t036 (tempB0[i][0], CountSHCOMP[i+31], steer0enable[i]);   // ZERO TO 0-15[0]
TH12 t037 (column0[i][0], tempA0[i][0], tempB0[i][0]);   // column1 or ZERO TO 0[0]
TH33W2 T033 (countNCOMP[i], steer0[0], column0[i][0], column0[i][1]); // no shift closure
TH33W2 T034 (countSCOMP[i+31], steer0[1], column0[i][0], column0[i][1]); // no shift closure
end

//Count[31:1] to column0[31:1] or Count[30:0] to column0[31:1]
for (i=1; i<32; i=i+1) begin
THnotN  u00(steer0enable[i], column0COMP[i], init); // auto produce carryin
TH33 t0310 (tempA0[i][0], Count[i][0], steer0[0], steer0enable[i]); // no shift flow
TH33 t0311 (tempA0[i][1], Count[i][1], steer0[0], steer0enable[i]); // no shift flow
TH33 t0317 (tempB0[i][0], Count[i-1][0], steer0[1], steer0enable[i]); // shift flow
TH33 t0318 (tempB0[i][1], Count[i-1][1], steer0[1], steer0enable[i]); // shift flow
TH12 t031 (column0[i][0], tempA0[i][0], tempB0[i][0]);   // shift or not to column1[0]
TH12 t0319 (column0[i][1], tempA0[i][1], tempB0[i][1]);   // shift or not to column1[1]
//TH33W2 T0312 (AinSHCOMP[i-1], steer0[1], column0[i][0], column0[i][1]); // shift closure
TH33W2 T0313 (countNCOMP[i], steer0[0], column0[i][0], column0[i][1]); // no shift closure
TH33W2 T0314 (countSCOMP[i-1], steer0[1], column0[i][0], column0[i][1]); // no shift closure
end

// Count[31] to sink
for (i=31; i<32; i=i+1) begin
TH33W2 t037 (CountSHCOMP[i], steer0[1], Count[i][0], Count[i][1]);
end

// collect digit closure for Ain
for (i=0; i<32; i=i+1) begin
TH12 t028 (countCOMP[i], countSCOMP[i], countNCOMP[i]);
end

// completeness tree for Bin - steer
wire AND040, AND041, AND042, AND043, AND044, AND045, AND046, AND047, AND048, AND049, AND050, AND051, ANDCOMP05, ANDCOMP06, ANDCOMP07, ANDCOMP08;
TH44 cl040 (AND040, countCOMP[0], countCOMP[1], countCOMP[2], countCOMP[3]); 
TH44 cl041 (AND041, countCOMP[4], countCOMP[5], countCOMP[6], countCOMP[7]); 
TH44 cl042 (AND042, countCOMP[8], countCOMP[9], countCOMP[10], countCOMP[11]); 
TH44 cl043 (AND043, countCOMP[12], countCOMP[13], countCOMP[14], countCOMP[15]); 
TH44 cl044 (AND044, countCOMP[16], countCOMP[17], countCOMP[18], countCOMP[19]); 
TH44 cl045 (AND045, countCOMP[20], countCOMP[21], countCOMP[22], countCOMP[23]); 
TH44 cl046 (AND046, countCOMP[24], countCOMP[25], countCOMP[26], countCOMP[27]); 
TH44 cl047 (AND047, countCOMP[28], countCOMP[29], countCOMP[30], countCOMP[31]); 
TH44 cl052 (ANDCOMP05, AND040, AND041, AND042, AND043); 
TH44 cl053 (ANDCOMP06, AND044, AND045, AND046, AND047); 
TH22 cl055 (BinCOMP[0], ANDCOMP05, ANDCOMP06); 

///////////////////////////////
/////bit 1 shift         ///////////
//////////////////////////////

wire [1:0] column1 [31:0], tempA1 [31:0], tempB1 [31:0];
wire [1:0] steer1;
wire [31:0] steer1enable, column1COMP, column1SCOMP, column1NCOMP;
wire [31:30] column0SHCOMP;

assign steer1 = Bin[1];

//column0[1:0] to column1[1:0] or zero  to column1[1:0]
for (i=0; i<2; i=i+1) begin
THnotN  u10(steer1enable[i], column1COMP[i], init); // auto produce carryin
TH33 t130 (tempA1[i][0], column0[i][0], steer1[0], steer1enable[i]);   // column0 TO 0-1
TH33 t135 (column1[i][1], column0[i][1], steer1[0], steer1enable[i]);   // column0 TO 0-1
TH22 t136 (tempB1[i][0], column0SHCOMP[i+30], steer1enable[i]);   // ZERO TO 0-15[0]
TH12 t137 (column1[i][0], tempA1[i][0], tempB1[i][0]);   // column1 or ZERO TO 0-1[0]
TH33W2 T133 (column0NCOMP[i], steer1[0], column1[i][0], column1[i][1]); // no shift closure
TH33W2 T134 (column0SCOMP[i+30], steer1[1], column1[i][0], column1[i][1]); // shift closure
end

//column0[31:2] to column1[31:2] or column0[29:0] to column1[31:2]
for (i=2; i<32; i=i+1) begin
THnotN  u10(steer1enable[i], column1COMP[i], init); // auto produce carryin
TH33 t1310 (tempA1[i][0], column0[i][0], steer1[0], steer1enable[i]); // no shift flow
TH33 t1311 (tempA1[i][1], column0[i][1], steer1[0], steer1enable[i]); // no shift flow
TH33 t1317 (tempB1[i][0], column0[i-2][0], steer1[1], steer1enable[i]); // shift flow
TH33 t1318 (tempB1[i][1], column0[i-2][1], steer1[1], steer1enable[i]); // shift flow
TH12 t131 (column1[i][0], tempA1[i][0], tempB1[i][0]);   // shift or not to column1[0]
TH12 t1319 (column1[i][1], tempA1[i][1], tempB1[i][1]);   // shift or not to column1[1]
TH33W2 T1313 (column0NCOMP[i], steer1[0], column1[i][0], column1[i][1]); // no shift closure
TH33W2 T1312 (column0SCOMP[i-2], steer1[1], column1[i][0], column1[i][1]); // shift closure
end

// column0[31:30] to sink
for (i=30; i<32; i=i+1) begin
TH33W2 t137 (column0SHCOMP[i], steer1[1], column0[i][0], column0[i][1]);
end

// collect digit closure for column0
for (i=0; i<32; i=i+1) begin
TH12 t128 (column0COMP[i], column0NCOMP[i], column0SCOMP[i]);
end

// completeness tree for Bin - steer
wire AND140, AND141, AND142, AND143, AND144, AND145, AND146, AND147, AND148, AND149, AND150, AND151, ANDCOMP15, ANDCOMP16, ANDCOMP17, ANDCOMP18;
TH44 cl140 (AND140, column0COMP[0], column0COMP[1], column0COMP[2], column0COMP[3]); 
TH44 cl141 (AND141, column0COMP[4], column0COMP[5], column0COMP[6], column0COMP[7]); 
TH44 cl142 (AND142, column0COMP[8], column0COMP[9], column0COMP[10], column0COMP[11]); 
TH44 cl143 (AND143, column0COMP[12], column0COMP[13], column0COMP[14], column0COMP[15]); 
TH44 cl144 (AND144, column0COMP[16], column0COMP[17], column0COMP[18], column0COMP[19]); 
TH44 cl145 (AND145, column0COMP[20], column0COMP[21], column0COMP[22], column0COMP[23]); 
TH44 cl146 (AND146, column0COMP[24], column0COMP[25], column0COMP[26], column0COMP[27]); 
TH44 cl147 (AND147, column0COMP[28], column0COMP[29], column0COMP[30], column0COMP[31]); 
TH44 cl152 (ANDCOMP15, AND140, AND141, AND142, AND143); 
TH44 cl153 (ANDCOMP16, AND144, AND145, AND146, AND147); 
TH22 cl155 (BinCOMP[1], ANDCOMP15, ANDCOMP16); 

///////////////////////////////
/////bit 2 shift         ///////////
//////////////////////////////

wire [1:0] column2 [31:0], tempA2 [31:0], tempB2 [31:0];
wire [1:0] steer2;
wire [31:0] steer2enable, column2COMP, column2SCOMP, column2NCOMP;
wire [31:28] column1SHCOMP;

assign steer2 = Bin[2];

//column1[3:0] to column2[3:0] or zero  to column2[3:0]
for (i=0; i<4; i=i+1) begin
THnotN  u20(steer2enable[i], column2COMP[i], init); // auto produce carryin
TH33 t230 (tempA2[i][0], column1[i][0], steer2[0], steer2enable[i]);   // column1 TO 0-3
TH33 t235 (column2[i][1], column1[i][1], steer2[0], steer2enable[i]);   // column1 TO 0-3
TH22 t236 (tempB2[i][0], column1SHCOMP[i+28], steer2enable[i]);   // ZERO TO 0-15[0]
TH12 t237 (column2[i][0], tempA2[i][0], tempB2[i][0]);   // column1 or ZERO TO 0-3[0]
TH33W2 T233 (column1NCOMP[i], steer2[0], column2[i][0], column2[i][1]); // no shift closure
TH33W2 T234 (column1SCOMP[i+28], steer2[1], column2[i][0], column2[i][1]); // shift closure
end

//column1[31:4] to column2[31:4] or column1[27:0] to column2[31:4]
for (i=4; i<32; i=i+1) begin
THnotN  u20(steer2enable[i], column2COMP[i], init); // auto produce carryin
TH33 t2310 (tempA2[i][0], column1[i][0], steer2[0], steer2enable[i]); // no shift flow
TH33 t2311 (tempA2[i][1], column1[i][1], steer2[0], steer2enable[i]); // no shift flow
TH33 t2317 (tempB2[i][0], column1[i-4][0], steer2[1], steer2enable[i]); // shift flow
TH33 t2318 (tempB2[i][1], column1[i-4][1], steer2[1], steer2enable[i]); // shift flow
TH12 t231 (column2[i][0], tempA2[i][0], tempB2[i][0]);   // shift or not to column2[0]
TH12 t2319 (column2[i][1], tempA2[i][1], tempB2[i][1]);   // shift or not to column2[1]
TH33W2 T2313 (column1NCOMP[i], steer2[0], column2[i][0], column2[i][1]); // no shift closure
TH33W2 T2312 (column1SCOMP[i-4], steer2[1], column2[i][0], column2[i][1]); // shift closure
end

// column1[31:27] to sink
for (i=28; i<32; i=i+1) begin
TH33W2 t37 (column1SHCOMP[i], steer2[1], column1[i][0], column1[i][1]);
end

// collect digit closure for column1
for (i=0; i<32; i=i+1) begin
TH12 t228 (column1COMP[i], column1SCOMP[i], column1NCOMP[i]);
end

// completeness tree for Bin - steer
wire AND240, AND241, AND242, AND243, AND244, AND245, AND246, AND247, AND248, AND249, AND250, AND251, ANDCOMP25, ANDCOMP26, ANDCOMP27, ANDCOMP28;
TH44 cl240 (AND240, column1COMP[0], column1COMP[1], column1COMP[2], column1COMP[3]); 
TH44 cl241 (AND241, column1COMP[4], column1COMP[5], column1COMP[6], column1COMP[7]); 
TH44 cl242 (AND242, column1COMP[8], column1COMP[9], column1COMP[10], column1COMP[11]); 
TH44 cl243 (AND243, column1COMP[12], column1COMP[13], column1COMP[14], column1COMP[15]); 
TH44 cl244 (AND244, column1COMP[16], column1COMP[17], column1COMP[18], column1COMP[19]); 
TH44 cl245 (AND245, column1COMP[20], column1COMP[21], column1COMP[22], column1COMP[23]); 
TH44 cl246 (AND246, column1COMP[24], column1COMP[25], column1COMP[26], column1COMP[27]); 
TH44 cl247 (AND247, column1COMP[28], column1COMP[29], column1COMP[30], column1COMP[31]); 
TH44 cl252 (ANDCOMP25, AND240, AND241, AND242, AND243); 
TH44 cl253 (ANDCOMP26, AND244, AND245, AND246, AND247); 
TH22 cl255 (BinCOMP[2], ANDCOMP25, ANDCOMP26); 

///////////////////////////////
/////bit 3 shift         ///////////
//////////////////////////////

wire [1:0] column3 [31:0], tempA3 [31:0], tempB3 [31:0];
wire [1:0] steer3;
wire [31:0] steer3enable, column3COMP, column3SCOMP, column3NCOMP;
wire [31:24] column2SHCOMP;

assign steer3 = Bin[3];

//column2[7:0] to column4[7:0] or zero  to column4[7:0]
for (i=0; i<8; i=i+1) begin
THnotN  u0(steer3enable[i], column3COMP[i], init); // auto produce carryin
TH33 t30 (tempA3[i][0], column2[i][0], steer3[0], steer3enable[i]);   // column2 TO 0-7
TH33 t35 (column3[i][1], column2[i][1], steer3[0], steer3enable[i]);   // column2 TO 0-7
TH22 t36 (tempB3[i][0], column2SHCOMP[i+24], steer3enable[i]);   // ZERO TO 0-15[0]
TH12 t37 (column3[i][0], tempA3[i][0], tempB3[i][0]);   // column2 or ZERO TO 0-7[0]
TH33W2 T33 (column2NCOMP[i], steer3[0], column3[i][0], column3[i][1]); // no shift closure
TH33W2 T134 (column2SCOMP[i+24], steer3[1], column3[i][0], column3[i][1]); // shift closure
end

//column2[31:8] to column4[31:8] or column2[23:0] to column4[31:8]
for (i=8; i<32; i=i+1) begin
THnotN  u0(steer3enable[i], column3COMP[i], init); // auto produce carryin
TH33 t310 (tempA3[i][0], column2[i][0], steer3[0], steer3enable[i]); // no shift flow
TH33 t311 (tempA3[i][1], column2[i][1], steer3[0], steer3enable[i]); // no shift flow
TH33 t317 (tempB3[i][0], column2[i-8][0], steer3[1], steer3enable[i]); // shift flow
TH33 t318 (tempB3[i][1], column2[i-8][1], steer3[1], steer3enable[i]); // shift flow
TH12 t31 (column3[i][0], tempA3[i][0], tempB3[i][0]);   // shift or not to column3[0]
TH12 t319 (column3[i][1], tempA3[i][1], tempB3[i][1]);   // shift or not to column3[1]
TH33W2 T313 (column2NCOMP[i], steer3[0], column3[i][0], column3[i][1]); // no shift closure
TH33W2 T312 (column2SCOMP[i-8], steer3[1], column3[i][0], column3[i][1]); // shift closure
end

// column2[31:23] to sink
for (i=24; i<32; i=i+1) begin
TH33W2 t37 (column2SHCOMP[i], steer3[1], column2[i][0], column2[i][1]);
end

// collect digit closure for column2
for (i=0; i<32; i=i+1) begin
TH12 t28 (column2COMP[i], column2SCOMP[i], column2NCOMP[i]);
end

// completeness tree for Bin - steer
wire AND40, AND41, AND42, AND43, AND44, AND45, AND46, AND47, AND48, AND49, AND50, AND51, ANDCOMP5, ANDCOMP6, ANDCOMP7, ANDCOMP8;
TH44 cl40 (AND40, column2COMP[0], column2COMP[1], column2COMP[2], column2COMP[3]); 
TH44 cl41 (AND41, column2COMP[4], column2COMP[5], column2COMP[6], column2COMP[7]); 
TH44 cl42 (AND42, column2COMP[8], column2COMP[9], column2COMP[10], column2COMP[11]); 
TH44 cl43 (AND43, column2COMP[12], column2COMP[13], column2COMP[14], column2COMP[15]); 
TH44 cl44 (AND44, column2COMP[16], column2COMP[17], column2COMP[18], column2COMP[19]); 
TH44 cl45 (AND45, column2COMP[20], column2COMP[21], column2COMP[22], column2COMP[23]); 
TH44 cl46 (AND46, column2COMP[24], column2COMP[25], column2COMP[26], column2COMP[27]); 
TH44 cl47 (AND47, column2COMP[28], column2COMP[29], column2COMP[30], column2COMP[31]); 
TH44 cl52 (ANDCOMP5, AND40, AND41, AND42, AND43); 
TH44 cl53 (ANDCOMP6, AND44, AND45, AND46, AND47); 
TH22 cl55 (BinCOMP[3], ANDCOMP5, ANDCOMP6); 

///////////////////////////////
/////bit 4 shift         ///////////
//////////////////////////////
wire [1:0] column4 [31:0], tempA4 [31:0], tempB4 [31:0];
wire [1:0] steer4;
wire [31:0] steer4enable;
wire [31:16] column3SHCOMP;

assign steer4 = Bin[4];

//column3[15:0] to column4[15:0] or zero  to column4[15:0]
for (i=0; i<16; i=i+1) begin
THnotN  u0(steer4enable[i], sumcomp[i], init); // digit enable
TH33 t0 (tempA4[i][0], column3[i][0], steer4[0], steer4enable[i]);   // column3 TO 0-15
TH33 t5 (column4[i][1], column3[i][1], steer4[0], steer4enable[i]);   // column3 TO 0-15
TH22 t6 (tempB4[i][0], column3SHCOMP[i+16], steer4enable[i]);   // ZERO TO 0-15[0]
TH12 t7 (column4[i][0], tempA4[i][0], tempB4[i][0]);   // column3 or ZERO TO 0-15[0]
TH33W2 T3 (column3NCOMP[i], steer4[0], column4[i][0], column4[i][1]); // no shift closure
TH33W2 T4 (column3SCOMP[i+16], steer4[1], column4[i][0], column4[i][1]); // shift closure
end

//column3[31:16] to column4[31:16] or column3[15:0] to column4[31:16]
for (i=16; i<32; i=i+1) begin
THnotN  u0(steer4enable[i], sumcomp[i], init); // digit enable
TH33 t10 (tempA4[i][0], column3[i][0], steer4[0], steer4enable[i]); // no shift flow
TH33 t11 (tempA4[i][1], column3[i][1], steer4[0], steer4enable[i]); // no shift flow
TH33 t17 (tempB4[i][0], column3[i-16][0], steer4[1], steer4enable[i]); // shift flow
TH33 t18 (tempB4[i][1], column3[i-16][1], steer4[1], steer4enable[i]); // shift flow
TH12 t1 (column4[i][0], tempA4[i][0], tempB4[i][0]);   // shift or not to column4[0]
TH12 t19 (column4[i][1], tempA4[i][1], tempB4[i][1]);   // shift or not to column4[1]
TH33W2 T13 (column3NCOMP[i], steer4[0], column4[i][0], column4[i][1]); // no shift closure
TH33W2 T12 (column3SCOMP[i-16], steer4[1], column4[i][0], column4[i][1]); // shift closure
end

// column3[31:16] to sink
for (i=16; i<32; i=i+1) begin
TH33W2 t27 (column3SHCOMP[i], steer4[1], column3[i][0], column3[i][1]);
end

// collect digit closures for column3
for (i=0; i<32; i=i+1) begin
TH12 t28 (column3COMP[i], column3SCOMP[i], column3NCOMP[i]);
end

// completeness tree for Bin - steer
wire AND60, AND61, AND62, AND63, AND64, AND65, AND66, AND67, AND68, AND69, AND70, AND71, ANDCOMP95, ANDCOMP96, ANDCOMP97, ANDCOMP98;
TH44 cl60 (AND60, column3COMP[0], column3COMP[1], column3COMP[2], column3COMP[3]); 
TH44 cl61 (AND61, column3COMP[4], column3COMP[5], column3COMP[6], column3COMP[7]); 
TH44 cl62 (AND62, column3COMP[8], column3COMP[9], column3COMP[10], column3COMP[11]); 
TH44 cl63 (AND63, column3COMP[12], column3COMP[13], column3COMP[14], column3COMP[15]); 
TH44 cl64 (AND64, column3COMP[16], column3COMP[17], column3COMP[18], column3COMP[19]); 
TH44 cl65 (AND65, column3COMP[20], column3COMP[21], column3COMP[22], column3COMP[23]); 
TH44 cl66 (AND66, column3COMP[24], column3COMP[25], column3COMP[26], column3COMP[27]); 
TH44 cl67 (AND67, column3COMP[28], column3COMP[29], column3COMP[30], column3COMP[31]); 
TH44 cl72 (ANDCOMP95, AND60, AND61, AND62, AND63); 
TH44 cl73 (ANDCOMP96, AND64, AND65, AND66, AND67); 
TH22 cl75 (BinCOMP[4], ANDCOMP95, ANDCOMP96); 

///// Circuit Under Test
//////////////////////////////
////// test bench output

wire [31:0] sumcomp;
wire [31:0] testenable;
wire [1:0] sumout [31:0];
wire [1:0] sum [31:0];
wire [1:0] Acheck [31:0];
//build output buffer close with input buffer

for (i=0; i<32; i=i+1) begin
THnotN  u0(testenable[i], sumcomp[i], init); // auto produce carryin
TH22  ob0 (sumout[i][0], column4[i][0], testenable[i]);
TH22  ob1 (sumout[i][1], column4[i][1], testenable[i]);
TH12 u3 (sumcomp[i], sumout[i][1], sumout[i][0]);  // auto consume sum
//assign column4COMP[i] = sumcomp[i];
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

always @(posedge sumcomp[16] & !init) begin
  check = $fscanf (Soutdata[16], "%h", filesum[16][1:0]);
  count16 = count16+1;
if(sumout[16] != filesum[16]) begin
  $display( "16 fail %d result ox%h  expected 0x%h", count16, sumout[16] ,filesum[16]);
  test = 1;
end
end
always @(negedge sumcomp[16] & !init) begin
filesum[16][1:0] = 0; end

always @(posedge sumcomp[17] & !init) begin
  check = $fscanf (Soutdata[17], "%h", filesum[17][1:0]);
  count17 = count17+1;
if(sumout[17] != filesum[17]) begin
  $display( "17 fail %d result ox%h  expected 0x%h", count17, sumout[17] ,filesum[17]);
  test = 1;
end
end
always @(negedge sumcomp[17] & !init) begin
filesum[17][1:0] = 0; end

always @(posedge sumcomp[18] & !init) begin
  check = $fscanf (Soutdata[18], "%h", filesum[18][1:0]);
  count18 = count18+1;
if(sumout[18] != filesum[18]) begin
  $display( "18 fail %d result ox%h  expected 0x%h", count18, sumout[18] ,filesum[18]);
  test = 1;
end
end
always @(negedge sumcomp[18] & !init) begin
filesum[18][1:0] = 0; end

always @(posedge sumcomp[19] & !init) begin
  check = $fscanf (Soutdata[19], "%h", filesum[19][1:0]);
  count19 = count19+1;
if(sumout[19] != filesum[19]) begin
  $display( "19 fail %d result ox%h  expected 0x%h", count19, sumout[19] ,filesum[19]);
  test = 1;
end
end
always @(negedge sumcomp[19] & !init) begin
filesum[19][1:0] = 0; end

always @(posedge sumcomp[20] & !init) begin
  check = $fscanf (Soutdata[20], "%h", filesum[20][1:0]);
  count20 = count20+1;
if(sumout[20] != filesum[20]) begin
  $display( "20 fail %d result ox%h  expected 0x%h", count20, sumout[20] ,filesum[20]);
  test = 1;
end
end
always @(negedge sumcomp[20] & !init) begin
filesum[20][1:0] = 0; end

always @(posedge sumcomp[21] & !init) begin
  check = $fscanf (Soutdata[21], "%h", filesum[21][1:0]);
  count21 = count21+1;
if(sumout[21] != filesum[21]) begin
  $display( "21 fail %d result ox%h  expected 0x%h", count21, sumout[21] ,filesum[21]);
  test = 1;
end
end
always @(negedge sumcomp[21] & !init) begin
filesum[21][1:0] = 0; end

always @(posedge sumcomp[22] & !init) begin
  check = $fscanf (Soutdata[22], "%h", filesum[22][1:0]);
  count22 = count22+1;
if(sumout[22] != filesum[22]) begin
  $display( "22 fail %d result ox%h  expected 0x%h", count22, sumout[22] ,filesum[22]);
  test = 1;
end
end
always @(negedge sumcomp[22] & !init) begin
filesum[22][1:0] = 0; end

always @(posedge sumcomp[23] & !init) begin
  check = $fscanf (Soutdata[23], "%h", filesum[23][1:0]);
  count23 = count23+1;
if(sumout[23] != filesum[23]) begin
  $display( "23 fail %d result ox%h  expected 0x%h", count23, sumout[23] ,filesum[23]);
  test = 1;
end
end
always @(negedge sumcomp[23] & !init) begin
filesum[23][1:0] = 0; end

always @(posedge sumcomp[24] & !init) begin
  check = $fscanf (Soutdata[24], "%h", filesum[24][1:0]);
  count24 = count24+1;
if(sumout[24] != filesum[24]) begin
  $display( "24 fail %d result ox%h  expected 0x%h", count24, sumout[24] ,filesum[24]);
  test = 1;
end
end
always @(negedge sumcomp[24] & !init) begin
filesum[24][1:0] = 0; end

always @(posedge sumcomp[25] & !init) begin
  check = $fscanf (Soutdata[25], "%h", filesum[25][1:0]);
  count25 = count25+1;
if(sumout[25] != filesum[25]) begin
  $display( "25 fail %d result ox%h  expected 0x%h", count25, sumout[25] ,filesum[25]);
  test = 1;
end
end
always @(negedge sumcomp[25] & !init) begin
filesum[25][1:0] = 0; end

always @(posedge sumcomp[26] & !init) begin
  check = $fscanf (Soutdata[26], "%h", filesum[26][1:0]);
  count26 = count26+1;
if(sumout[26] != filesum[26]) begin
  $display( "26 fail %d result ox%h  expected 0x%h", count26, sumout[26] ,filesum[26]);
  test = 1;
end
end
always @(negedge sumcomp[26] & !init) begin
filesum[26][1:0] = 0; end

always @(posedge sumcomp[27] & !init) begin
  check = $fscanf (Soutdata[27], "%h", filesum[27][1:0]);
  count27 = count27+1;
if(sumout[27] != filesum[27]) begin
  $display( "27 fail %d result ox%h  expected 0x%h", count27, sumout[27] ,filesum[27]);
  test = 1;
end
end
always @(negedge sumcomp[27] & !init) begin
filesum[27][1:0] = 0; end

always @(posedge sumcomp[28] & !init) begin
  check = $fscanf (Soutdata[28], "%h", filesum[28][1:0]);
  count28 = count28+1;
if(sumout[28] != filesum[28]) begin
  $display( "28 fail %d result ox%h  expected 0x%h", count28, sumout[28] ,filesum[28]);
  test = 1;
end
end
always @(negedge sumcomp[28] & !init) begin
filesum[28][1:0] = 0; end

always @(posedge sumcomp[29] & !init) begin
  check = $fscanf (Soutdata[29], "%h", filesum[29][1:0]);
  count29 = count29+1;
if(sumout[29] != filesum[29]) begin
  $display( "29 fail %d result ox%h  expected 0x%h", count29, sumout[29] ,filesum[29]);
  test = 1;
end
end
always @(negedge sumcomp[29] & !init) begin
filesum[29][1:0] = 0; end

always @(posedge sumcomp[30] & !init) begin
  check = $fscanf (Soutdata[30], "%h", filesum[30][1:0]);
  count30 = count30+1;
if(sumout[30] != filesum[30]) begin
  $display( "30 fail %d result ox%h  expected 0x%h", count30, sumout[30] ,filesum[30]);
  test = 1;
end
end
always @(negedge sumcomp[30] & !init) begin
filesum[30][1:0] = 0; end

always @(posedge sumcomp[31] & !init) begin
  check = $fscanf (Soutdata[31], "%h", filesum[31][1:0]);
  count31 = count31+1;
if(sumout[31] != filesum[31]) begin
  $display( "31 fail %d result ox%h  expected 0x%h", count31, sumout[31] ,filesum[31]);
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
