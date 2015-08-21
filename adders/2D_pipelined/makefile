TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Two D pipelined 32 bit adder with full adder A
addA:  twoD_adder32A.v ../fulladdA.v
	$(TOOL) -o twoD_adder32A $(NCLLIB) ../fulladdA.v twoD_adder32A.v
	$(SIM) twoD_adder32A

# Two D pipelined 32 bit adder with full adder B
addB:  twoD_adder32B.v ../fulladdB.v
	$(TOOL) -o twoD_adder32B $(NCLLIB) ../fulladdB.v twoD_adder32B.v
	$(SIM) twoD_adder32B

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out