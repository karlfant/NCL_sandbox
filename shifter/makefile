TOOL=iverilog
SIM=VVP -n
NCLLIB=../common/NCL_LIB.v
# NCLLIB=../common/NCL_LIB_unity.v

# full word completeness closes with the shift bits
# digit completeness closes for the data
# 5 stage pipeline
fullwordshiftF:  fullword_lshift32F.v 
	$(TOOL) -o fullword_lshift32F $(NCLLIB) fullword_lshift32F.v
	$(SIM) fullword_lshift32F

# full word completeness closes with the shift bits
# full word completeness closes for the data
# 5 stage pipeline
fullwordshiftG:  fullword_lshift32G.v 
	$(TOOL) -o fullword_lshift32G $(NCLLIB) fullword_lshift32G.v
	$(SIM) fullword_lshift32G

# 2D flow presented to the shifter fullwordshiftF
# full word completeness closes with the shift bits
# digit completeness closes for the data
# 5 stage pipeline
fullwordshift2D:  fullword_lshift2D32.v halfaddI.v
	$(TOOL) -o fullword_lshift2D32 $(NCLLIB) halfaddI.v fullword_lshift2D32.v
	$(SIM) fullword_lshift2D32

# ragged flow presented to the shifter fullwordshiftF
# full word completeness closes with the shift bits
# digit completeness closes for the data
# 5 stage pipeline
fullwordshiftragB:  fullword_lshiftragB32.v fulladdB.v
	$(TOOL) -o fullword_lshiftragB32 $(NCLLIB) fulladdB.v fullword_lshiftragB32.v
	$(SIM) fullword_lshiftragB32

# whole shifter is a single combination network in a single oscillation
fullcomboshift:  fullcombo_lshift32.v 
	$(TOOL) -o fullcombo_lshift32 $(NCLLIB) fullcombo_lshift32.v
	$(SIM) fullcombo_lshift32

# whole shifter is a single combination network in a single oscillation
fullcomboshiftB:  fullcombo_lshift32B.v 
	$(TOOL) -o fullcombo_lshift32B $(NCLLIB) fullcombo_lshift32B.v
	$(SIM) fullcombo_lshift32B

# whole shifter is a single combination network in a single oscillation
fullcomboshiftC:  fullcombo_lshift32C.v 
	$(TOOL) -o fullcombo_lshift32C $(NCLLIB) fullcombo_lshift32C.v
	$(SIM) fullcombo_lshift32C

# generate the shift test bench output
charshift:	charshift.c
	gcc charshift.c
	./a.out

# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out