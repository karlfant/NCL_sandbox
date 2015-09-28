TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Two D pipelined 32 bit adder with full adder A1
addA1:  twoD_adder32A1.v fulladdA1.v
	$(TOOL) -o twoD_adder32A1 $(NCLLIB) fulladdA1.v twoD_adder32A1.v
	$(SIM) twoD_adder32A1

# Two D pipelined 32 bit adder with full adder A2
addA2:  twoD_adder32A2.v fulladdA2.v
	$(TOOL) -o twoD_adder32A2 $(NCLLIB) fulladdA2.v twoD_adder32A2.v
	$(SIM) twoD_adder32A2

# Two D pipelined 32 bit adder with full adder B1
addB1:  twoD_adder32B1.v fulladdB1.v
	$(TOOL) -o twoD_adder32B1 $(NCLLIB) fulladdB1.v twoD_adder32B1.v
	$(SIM) twoD_adder32B1

# Two D pipelined 32 bit adder with full adder B1
addB2:  twoD_adder32B2.v fulladdB2.v
	$(TOOL) -o twoD_adder32B2 $(NCLLIB) fulladdB2.v twoD_adder32B2.v
	$(SIM) twoD_adder32B2

# Two D pipelined 32 bit adder with full adder C1
addC1:  twoD_adder32C1.v fulladdC1.v
	$(TOOL) -o twoD_adder32C1 $(NCLLIB) fulladdC1.v twoD_adder32C1.v
	$(SIM) twoD_adder32C1

# Two D pipelined 32 bit adder with full adder D1
addD1:  twoD_adder32D1.v fulladdD1.v
	$(TOOL) -o twoD_adder32D1 $(NCLLIB) fulladdD1.v twoD_adder32D1.v
	$(SIM) twoD_adder32D1

# Two D pipelined 32 bit adder with full adder D1
addD2:  twoD_adder32D2.v fulladdD2.v
	$(TOOL) -o twoD_adder32D2 $(NCLLIB) fulladdD2.v twoD_adder32D2.v
	$(SIM) twoD_adder32D2

# Two D pipelined 32 bit adder with full adder D1
addD3:  twoD_adder32D3.v fulladdD3.v
	$(TOOL) -o twoD_adder32D3 $(NCLLIB) fulladdD3.v twoD_adder32D3.v
	$(SIM) twoD_adder32D3

# Two D pipelined 32 bit adder with full adder D1
addD4:  twoD_adder32D4.v fulladdD4.v
	$(TOOL) -o twoD_adder32D4 $(NCLLIB) fulladdD4.v twoD_adder32D4.v
	$(SIM) twoD_adder32D4

# Two D pipelined 32 bit adder with full adder D1
addD5:  twoD_adder32D5.v fulladdD5.v
	$(TOOL) -o twoD_adder32D5 $(NCLLIB) fulladdD5.v twoD_adder32D5.v
	$(SIM) twoD_adder32D5

# Quaternary 32 bit adder integrated 1
addQ1:  twoD_adder32Q1.v fulladdQ1.v
	$(TOOL) -o twoD_adder32Q1 $(NCLLIB) fulladdQ1.v twoD_adder32Q1.v
	$(SIM) twoD_adder32Q1

# Quaternary 32 bit adder integrated 2
addQ2:  twoD_adder32Q2.v fulladdQ2.v
	$(TOOL) -o twoD_adder32Q2 $(NCLLIB) fulladdQ2.v twoD_adder32Q2.v
	$(SIM) twoD_adder32Q2

# Quaternary 32 bit adder integrated 3
addQ3:  twoD_adder32Q3.v fulladdQ3.v
	$(TOOL) -o twoD_adder32Q3 $(NCLLIB) fulladdQ3.v twoD_adder32Q3.v
	$(SIM) twoD_adder32Q3

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out