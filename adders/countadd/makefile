TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# Digit pipelined 32 bit adder with full adder A with counter input
countadd:  count_adder32A.v fulladdA.v twoD_counter32A.v twoD_counter_ringA.v
	$(TOOL) -o count_adder32A $(NCLLIB) twoD_counter_ringA.v twoD_counter32A.v fulladdA.v count_adder32A.v
	$(SIM) count_adder32A
