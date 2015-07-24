TOOL=iverilog
SIM=VVP
NCLLIB=../common/NCL_LIB.v

# single rail four oscillation pipeline structure
pipeline1:  pipeline1.v
	$(TOOL) -o pipeline1 $(NCLLIB) pipeline1.v
	$(SIM) pipeline1

# single rail four oscillation pipeline ring structure
ring1:   ring1.v
	$(TOOL) -o ring1 $(NCLLIB) ring1.v
	$(SIM) ring1

# single rail fanout-fanin pipeline structure
fanoutfanin:  fanoutfanin1.v
	$(TOOL) -o fanoutfanin1 $(NCLLIB) fanoutfanin1.v
	$(SIM) fanoutfanin1

