TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# full word pipelined 32 bit adder with full adder A
addA:  fullword_adder32A.v ../fulladdA.v
	$(TOOL) -o fullword_adder32A $(NCLLIB) ../fulladdA.v fullword_adder32A.v
	$(SIM) fullword_adder32A

# full word pipelined 32 bit adder with full adder B
addB:  fullword_adder32A.v ../fulladdA.v
	$(TOOL) -o fullword_adder32B $(NCLLIB) ../fulladdB.v fullword_adder32B.v
	$(SIM) fullword_adder32B


# generate a dual rail hex file from a file of 32 bit binary hex numbers
hextodual:	hextodual.c
	gcc hextodual.c
	./a.out