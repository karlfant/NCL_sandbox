TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Two D pipelined 8 bit multiplier array
mul32A3:  twoD_mult32A3.v dualbuf.v pprodA.v
	$(TOOL) -o twoD_mult32A3 $(NCLLIB)  pprodA.v dualbuf.v twoD_mult32A3.v
	$(SIM) twoD_mult32A3


# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out