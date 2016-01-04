TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v
# NCLLIB=../../common/NCL_LIB_unity.v

# Two D pipelined 8 bit multiplier array
mul8S:  twoD_mult8S.v dualbuf.v pprodA.v fulladdI.v halfaddI.v halfaddN.v halfadd1.v
	$(TOOL) -o twoD_mult8S $(NCLLIB) fulladdI.v halfaddI.v halfaddN.v halfadd1.v pprodA.v dualbuf.v twoD_mult8S.v
	$(SIM) twoD_mult8S


# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out