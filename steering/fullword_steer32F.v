`timescale 1ps / 1ps


module fullword_steer32F;

 /* Make an init that pulses once. */
  reg init = 1;
  initial begin
     # 3500 init = 0;
     # 200000 $stop;

  end
initial
 begin
    $dumpfile("fullword_steer32F.vcd");
    $dumpvars(0, fullword_steer32F);
    
 end

integer Aindata, Bindata, sumdata, check;
wire [1:0] Ain [31:0];
wire [1:0] Bin [31:0];
reg [63:0] fileA;
reg [63:0] fileB;
reg [63:0] fileC;
genvar i;

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
wire Aenable, Benable, steerDONE;
wire [31:0] Acomp, Bcomp;

//build A input buffer close with file read
THnotN  tbb3(Aenable, steerDONE, init);
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
THnotN  tbb2(Benable, steerDONE, init);
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

wire [1:0] Sm [31:0];
wire [1:0] Tm [31:0];
wire [1:0] Um [31:0];
wire [1:0] Vm [31:0];
wire [3:0] steer [32:0];
wire [32:0] SCOMP, TCOMP, UCOMP, VCOMP;

// generate steer
ring4gen r5 ( steer[0][3:0], steerDONE, init);

// bits 0 through 31 steer
// The COMPS are fanned out to each instance
// steer is daisy chained through the instances the end effect is the same
for (i=0; i<32; i=i+1) begin
  steerF ci (Sm[i][1:0], Tm[i][1:0], Um[i][1:0], Vm[i][1:0], Ain[i][1:0], steer[i][3:0], steer[i+1][3:0]);
end

///// Circuit Under Test
//////////////////////////////
////// test bench output

wire AND440, AND441, AND442, AND443, AND444, AND445, AND446, AND447, ANDCOMP45, ANDCOMP46, FULLSCOMP;
wire [31:0] Scomp;
wire [31:0] Senable;
wire [1:0] Sout [31:0];
//build output buffer for S with auto consume
for (i=0; i<32; i=i+1) begin
THnotN  u40(Senable[i], FULLSCOMP, init);
TH22  ob40 (Sout[i][0], Sm[i][0], Senable[i]);
TH22  ob41 (Sout[i][1], Sm[i][1], Senable[i]);
TH12 u43 (Scomp[i], Sout[i][1], Sout[i][0]);  // auto consume sum
end
TH44 cl440 (AND400, Scomp[0], Scomp[1], Scomp[2], Scomp[3]); 
TH44 cl441 (AND410, Scomp[4], Scomp[5], Scomp[6], Scomp[7]); 
TH44 cl442 (AND420, Scomp[8], Scomp[9], Scomp[10], Scomp[11]); 
TH44 cl443 (AND430, Scomp[12], Scomp[13], Scomp[14], Scomp[15]); 
TH44 cl444 (AND440, Scomp[16], Scomp[17], Scomp[18], Scomp[19]); 
TH44 cl445 (AND450, Scomp[20], Scomp[21], Scomp[22], Scomp[23]); 
TH44 cl446 (AND460, Scomp[24], Scomp[25], Scomp[26], Scomp[27]); 
TH44 cl447 (AND470, Scomp[28], Scomp[29], Scomp[30], Scomp[31]); 
TH44 cl448 (ANDCOMP45, AND400, AND410, AND420, AND430); 
TH44 cl449 (ANDCOMP46, AND440, AND450, AND460, AND470); 
TH22 cl450 (FULLSCOMP, ANDCOMP45, ANDCOMP46); 

wire AND540, AND541, AND542, AND543, AND544, AND545, AND546, AND547, ANDCOMP55, ANDCOMP56, FULLTCOMP;
wire [31:0] Tcomp;
wire [31:0] Tenable;
wire [1:0] Tout [31:0];
//build output buffer for T with auto consume
for (i=0; i<32; i=i+1) begin
THnotN  u50(Tenable[i], FULLTCOMP, init);
TH22  ob50 (Tout[i][0], Tm[i][0], Tenable[i]);
TH22  ob51 (Tout[i][1], Tm[i][1], Tenable[i]);
TH12 u53 (Tcomp[i], Tout[i][1], Tout[i][0]);  // auto consume sum
end
TH44 cl540 (AND500, Tcomp[0], Tcomp[1], Tcomp[2], Tcomp[3]); 
TH44 cl541 (AND510, Tcomp[4], Tcomp[5], Tcomp[6], Tcomp[7]); 
TH44 cl542 (AND520, Tcomp[8], Tcomp[9], Tcomp[10], Tcomp[11]); 
TH44 cl543 (AND530, Tcomp[12], Tcomp[13], Tcomp[14], Tcomp[15]); 
TH44 cl544 (AND540, Tcomp[16], Tcomp[17], Tcomp[18], Tcomp[19]); 
TH44 cl545 (AND550, Tcomp[20], Tcomp[21], Tcomp[22], Tcomp[23]); 
TH44 cl546 (AND560, Tcomp[24], Tcomp[25], Tcomp[26], Tcomp[27]); 
TH44 cl547 (AND570, Tcomp[28], Tcomp[29], Tcomp[30], Tcomp[31]); 
TH44 cl548 (ANDCOMP55, AND500, AND510, AND520, AND530); 
TH44 cl549 (ANDCOMP56, AND540, AND550, AND560, AND570); 
TH22 cl550 (FULLTCOMP, ANDCOMP55, ANDCOMP56); 

wire AND640, AND641, AND642, AND643, AND644, AND645, AND646, AND647, ANDCOMP65, ANDCOMP66, FULLUCOMP;
wire [31:0] Ucomp;
wire [31:0] Uenable;
wire [1:0] Uout [31:0];
//build output buffer for U with auto consume
for (i=0; i<32; i=i+1) begin
THnotN  u60(Uenable[i], FULLUCOMP, init); 
TH22  ob60 (Uout[i][0], Um[i][0], Uenable[i]);
TH22  ob61 (Uout[i][1], Um[i][1], Uenable[i]);
TH12 u63 (Ucomp[i], Uout[i][1], Uout[i][0]);  // auto consume sum
end
TH44 cl640 (AND600, Ucomp[0], Ucomp[1], Ucomp[2], Ucomp[3]); 
TH44 cl641 (AND610, Ucomp[4], Ucomp[5], Ucomp[6], Ucomp[7]); 
TH44 cl642 (AND620, Ucomp[8], Ucomp[9], Ucomp[10], Ucomp[11]); 
TH44 cl643 (AND630, Ucomp[12], Ucomp[13], Ucomp[14], Ucomp[15]); 
TH44 cl644 (AND640, Ucomp[16], Ucomp[17], Ucomp[18], Ucomp[19]); 
TH44 cl645 (AND650, Ucomp[20], Ucomp[21], Ucomp[22], Ucomp[23]); 
TH44 cl646 (AND660, Ucomp[24], Ucomp[25], Ucomp[26], Ucomp[27]); 
TH44 cl647 (AND670, Ucomp[28], Ucomp[29], Ucomp[30], Ucomp[31]); 
TH44 cl648 (ANDCOMP65, AND600, AND610, AND620, AND630); 
TH44 cl649 (ANDCOMP66, AND640, AND650, AND660, AND670); 
TH22 cl650 (FULLUCOMP, ANDCOMP65, ANDCOMP66); 

wire AND740, AND741, AND742, AND743, AND744, AND745, AND746, AND747, ANDCOMP75, ANDCOMP76, FULLVCOMP;
wire [31:0] Vcomp;
wire [31:0] Venable;
wire [1:0] Vout [31:0];
//build output buffer for V with auto consume
for (i=0; i<32; i=i+1) begin
THnotN  u70(Venable[i], FULLVCOMP, init); 
TH22  ob70 (Vout[i][0], Vm[i][0], Venable[i]);
TH22  ob71 (Vout[i][1], Vm[i][1], Venable[i]);
TH12 u73 (Vcomp[i], Vout[i][1], Vout[i][0]);  // auto consume sum
end
TH44 cl740 (AND700, Vcomp[0], Vcomp[1], Vcomp[2], Vcomp[3]); 
TH44 cl741 (AND710, Vcomp[4], Vcomp[5], Vcomp[6], Vcomp[7]); 
TH44 cl742 (AND720, Vcomp[8], Vcomp[9], Vcomp[10], Vcomp[11]); 
TH44 cl743 (AND730, Vcomp[12], Vcomp[13], Vcomp[14], Vcomp[15]); 
TH44 cl744 (AND740, Vcomp[16], Vcomp[17], Vcomp[18], Vcomp[19]); 
TH44 cl745 (AND750, Vcomp[20], Vcomp[21], Vcomp[22], Vcomp[23]); 
TH44 cl746 (AND760, Vcomp[24], Vcomp[25], Vcomp[26], Vcomp[27]); 
TH44 cl747 (AND770, Vcomp[28], Vcomp[29], Vcomp[30], Vcomp[31]); 
TH44 cl748 (ANDCOMP75, AND700, AND710, AND720, AND730); 
TH44 cl749 (ANDCOMP76, AND740, AND750, AND760, AND770); 
TH22 cl750 (FULLVCOMP, ANDCOMP75, ANDCOMP76); 

TH14 c1751 (steerDONE, FULLSCOMP, FULLTCOMP, FULLUCOMP, FULLVCOMP);

wire Oenable;
wire [31:0] sumcomp;
wire [1:0] sumout [31:0];
wire [1:0] sum [31:0];
wire [63:0] displaysum, Acheck;
//build output buffer close with input buffer
THnotN  tbb4(Oenable, steerDONE, init);
for (i=0; i<32; i=i+1) begin
TH14 ck800 (sum[i][1], Sout[i][1], Tout[i][1], Uout[i][1], Vout[i][1]);
TH14 ck801 (sum[i][0], Sout[i][0], Tout[i][0], Uout[i][0], Vout[i][0]);
TH22  ob0 (displaysum[2*i], sum[i][0], Oenable);
TH22  ob1 (displaysum[2*i+1], sum[i][1], Oenable);
TH22  ob02 (Acheck[2*i], Ain[i][0], Oenable);
TH22  ob03 (Acheck[2*i+1], Ain[i][1], Oenable);
TH12 u3 (sumcomp[i], displaysum[2*i], displaysum[2*i+1]);  // auto consume sum
end

// completeness tree
wire AND40, AND41, AND42, AND43, AND44, AND45, AND46, AND47, ANDCOMP5, ANDCOMP6, ANDCOMP7;
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

always @(posedge ANDCOMP7 & !init) begin
  check = $fscanf (sumdata, "%h", fileC);
if(displaysum == Acheck) begin
  $display( "pass result ox%h  expected 0x%h", displaysum , Acheck);
end
else begin
  $display( "fail result ox%h  expected 0x%h", displaysum , Acheck);
end
end


endmodule
