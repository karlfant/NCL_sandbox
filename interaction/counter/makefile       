TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# 32 bit counter with fullword completeness and halfadder A
fullword_counter32A:  fullword_counter32A.v fullword_counter_ringA.v
	$(TOOL) -o fullword_counter32A $(NCLLIB) fullword_counter_ringA.v fullword_counter32A.v
	$(SIM) fullword_counter32A

# 32 bit counter with fullword completeness and halfadder B
fullword_counter32B:  fullword_counter32B.v fullword_counter_ringB.v
	$(TOOL) -o fullword_counter32B $(NCLLIB) fullword_counter_ringB.v fullword_counter32B.v
	$(SIM) fullword_counter32B

# 32 bit counter with digit completeness and halfadder A
digit_counter32A:  digit_counter32A.v digit_counter_ringA.v
	$(TOOL) -o digit_counter32A $(NCLLIB) digit_counter_ringA.v digit_counter32A.v
	$(SIM) digit_counter32A

# 32 bit counter with digit completeness and halfadder B
digit_counter32B:  digit_counter32B.v digit_counter_ringB.v
	$(TOOL) -o digit_counter32B $(NCLLIB) digit_counter_ringB.v digit_counter32B.v
	$(SIM) digit_counter32B

# 32 bit counter with two D completeness and halfadder A
twoD_counter32A:  twoD_counter32A.v twoD_counter_ringA.v
	$(TOOL) -o twoD_counter32A $(NCLLIB) twoD_counter_ringA.v twoD_counter32A.v
	$(SIM) twoD_counter32A

# 32 bit counter with two D completeness and halfadder B
twoD_counter32B:  twoD_counter32B.v twoD_counter_ringB.v
	$(TOOL) -o twoD_counter32B $(NCLLIB) twoD_counter_ringB.v twoD_counter32B.v
	$(SIM) twoD_counter32B

