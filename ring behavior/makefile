TOOL=iverilog
SIM=VVP -n
NCLLIB=../common/NCL_LIB.v

# single rail four oscillation pipeline structure
pipeline1:  pipeline1.v
	$(TOOL) -o pipeline1 $(NCLLIB) pipeline1.v
	$(SIM) pipeline1

# dual rail 3 oscillation pipeline ring structure
ring3:   ring3.v
	$(TOOL) -o ring3 $(NCLLIB) ring3.v
	$(SIM) ring3

# dual rail 4 oscillation pipeline ring structure
ring4:   ring4.v
	$(TOOL) -o ring4 $(NCLLIB) ring4.v
	$(SIM) ring4

# dual rail 23 oscillation pipeline ring structure
ring23:   ring23.v
	$(TOOL) -o ring23 $(NCLLIB) ring23.v
	$(SIM) ring23

# dual rail 24 oscillation pipeline ring structure
ring24:   ring24.v
	$(TOOL) -o ring24 $(NCLLIB) ring24.v
	$(SIM) ring24

# dual rail 24 oscillation pipeline ring structure
ring24bal:   ring24bal.v
	$(TOOL) -o ring24bal $(NCLLIB) ring24bal.v
	$(SIM) ring24bal

# single rail fanout-fanin pipeline structure
fanoutfanin1:  fanoutfanin1.v
	$(TOOL) -o fanoutfanin1 $(NCLLIB) fanoutfanin1.v
	$(SIM) fanoutfanin1

