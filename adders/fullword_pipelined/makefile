TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# full word pipelined 32 bit adder with fulladd.A
addA:  fullword_adder32A.v fulladdA.v
	$(TOOL) -o fullword_adder32A $(NCLLIB) fulladdA.v fullword_adder32A.v
	$(SIM) fullword_adder32A

# full word pipelined 32 bit adder with fulladd.A
addAB:  fullword_adder32AB.v fulladdAB.v
	$(TOOL) -o fullword_adder32AB $(NCLLIB) fulladdAB.v fullword_adder32AB.v
	$(SIM) fullword_adder32AB

# full word pipelined 32 bit adder with fulladd.B
addB:  fullword_adder32A.v fulladdA.v
	$(TOOL) -o fullword_adder32B $(NCLLIB) fulladdB.v fullword_adder32B.v
	$(SIM) fullword_adder32B

# 32 bit adder with fullword completeness and fulladd.C
addC:  fullword_adder32C.v fulladdC.v $(NCLLIB)
	$(TOOL) -o fullword_adder32C $(NCLLIB) fulladdC.v fullword_adder32C.v
	$(SIM) fullword_adder32C

# 32 bit adder with fullword completeness and fulladd.D
addD:  fullword_adder32D.v fulladdD.v $(NCLLIB)
	$(TOOL) -o fullword_adder32D $(NCLLIB) fulladdD.v fullword_adder32D.v
	$(SIM) fullword_adder32D

# 32 bit adder with fullword completeness and fulladd.Q
addQ:  fullword_adder32Q.v fulladdQ.v $(NCLLIB)
	$(TOOL) -o fullword_adder32Q $(NCLLIB) fulladdQ.v fullword_adder32Q.v
	$(SIM) fullword_adder32Q

# generate a dual rail hex file from a file of 32 bit binary hex numbers
hextodual:	hextodual.c
	gcc hextodual.c
	./a.out