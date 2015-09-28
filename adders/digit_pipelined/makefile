TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Digit pipelined 32 bit adder with full adder A
addA:  digit_adder32A.v fulladdA.v
	$(TOOL) -o digit_adder32A $(NCLLIB) fulladdA.v digit_adder32A.v
	$(SIM) digit_adder32A

# Digit pipelined 32 bit adder with full adder B
addB:  digit_adder32B.v fulladdB.v
	$(TOOL) -o digit_adder32B $(NCLLIB) fulladdB.v digit_adder32B.v
	$(SIM) digit_adder32B

# Digit pipelined 32 bit adder with full adder Q
addQ:  digit_adder32Q.v fulladdQ.v
	$(TOOL) -o digit_adder32Q $(NCLLIB) fulladdQ.v digit_adder32Q.v
	$(SIM) digit_adder32Q

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out