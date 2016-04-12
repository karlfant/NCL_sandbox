TOOL=iverilog
SIM=VVP -n
# NCLLIB=../../common/NCL_LIB.v
NCLLIB=../../common/NCL_LIB_unity.v

# Two D pipelined 8 bit multiplier array
mul8U3:  twoD_mult8U3.v dualbuf.v pprodA.v
	$(TOOL) -o twoD_mult8U3 $(NCLLIB)  pprodA.v dualbuf.v twoD_mult8U3.v
	$(SIM) twoD_mult8U3

# Two D pipelined 8 bit multiplier array just A B pipelines
mul8U2:  twoD_mult8U2.v dualbuf.v
	$(TOOL) -o twoD_mult8U2 $(NCLLIB)  dualbuf.v twoD_mult8U2.v
	$(SIM) twoD_mult8U2

# Two D pipelined 8 bit multiplier array full unsigned multiplier
mul8U4:  twoD_mult8U4.v dualbuf.v pprodA.v fulladdI.v halfaddI.v
	$(TOOL) -o twoD_mult8U4 $(NCLLIB) fulladdI.v halfaddI.v pprodA.v dualbuf.v twoD_mult8U4.v
	$(SIM) twoD_mult8U4

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out