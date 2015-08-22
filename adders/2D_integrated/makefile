TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Two D integrated pipelined 32 bit adder with full adder A
addA:  twoD2Dint_adder32A.v ../fulladdA.v
	$(TOOL) -o twoD2Dint_adder32A $(NCLLIB) fulladdA2Dint.v twoD2Dint_adder32A.v
	$(SIM) twoD2Dint_adder32A

# Two D integrated pipelined 32 bit adder with full adder B
addB:  twoD2Dint_adder32B.v ../fulladdB.v
	$(TOOL) -o twoD2Dint_adder32B $(NCLLIB) fulladdB2Dint.v twoD2Dint_adder32B.v
	$(SIM) twoD2Dint_adder32B

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out