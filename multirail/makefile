TOOL=iverilog
SIM=VVP
NCLLIB=../common/NCL_LIB.v

# two rail four oscillation pipeline structure
pipeline2:  pipeline2.v
	$(TOOL) -o pipeline2 $(NCLLIB) pipeline2.v
	$(SIM) pipeline2

# four rail four oscillation pipeline structure
pipeline4:  pipeline4.v
	$(TOOL) -o pipeline4 $(NCLLIB) pipeline4.v
	$(SIM) pipeline4

# two rail four oscillation pipeline ring structure
ring2:   ring2.v
	$(TOOL) -o ring2 $(NCLLIB) ring2.v
	$(SIM) ring2

# three rail four oscillation pipeline ring structure
ring3:   ring3.v
	$(TOOL) -o ring3 $(NCLLIB) ring3.v
	$(SIM) ring3

# four rail four oscillation pipeline ring structure
ring4:   ring4.v
	$(TOOL) -o ring4 $(NCLLIB) ring4.v
	$(SIM) ring4

# four rail ring feeding four rail pipeline
ring4pipe4:   ring4pipe4.v
	$(TOOL) -o ring4pipe4 $(NCLLIB) ring4gen.v ring4pipe4.v
	$(SIM) ring4pipe4

