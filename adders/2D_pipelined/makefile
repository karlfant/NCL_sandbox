TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Two D pipelined 32 bit adder with full adder A
addA:  twoD_adder32A.v fulladdA.v
	$(TOOL) -o twoD_adder32A $(NCLLIB) fulladdA.v twoD_adder32A.v
	$(SIM) twoD_adder32A

# Two D pipelined 32 bit adder with full adder A
addAB:  twoD_adder32AB.v fulladdAB.v
	$(TOOL) -o twoD_adder32AB $(NCLLIB) fulladdAB.v twoD_adder32AB.v
	$(SIM) twoD_adder32AB

# Two D pipelined 32 bit adder with full adder B
addB:  twoD_adder32B.v fulladdB.v
	$(TOOL) -o twoD_adder32B $(NCLLIB) fulladdB.v twoD_adder32B.v
	$(SIM) twoD_adder32B

# Two D pipelined 32 bit adder with full adder C
addC:  twoD_adder32C.v fulladdC.v
	$(TOOL) -o twoD_adder32C $(NCLLIB) fulladdC.v twoD_adder32C.v
	$(SIM) twoD_adder32C

# Two D pipelined 32 bit adder with full adder D
addD:  twoD_adder32D.v fulladdD.v
	$(TOOL) -o twoD_adder32D $(NCLLIB) fulladdD.v twoD_adder32D.v
	$(SIM) twoD_adder32D

# Two Q pipelined 32 bit adder with full adder Q
addQ:  twoD_adder32Q.v fulladdQ.v
	$(TOOL) -o twoD_adder32Q $(NCLLIB) fulladdQ.v twoD_adder32Q.v
	$(SIM) twoD_adder32Q

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out