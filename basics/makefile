TOOL=iverilog
SIM=VVP
NCLLIB=../common/NCL_LIB.v

pipeline1:  pipeline1.v
	$(TOOL) -o pipeline1 $(NCLLIB) pipeline1.v
	$(SIM) pipeline1

ring1:   ring1.v
	$(TOOL) -o ring1 $(NCLLIB) ring1.v
	$(SIM) ring1

fanoutfanin:  fanoutfanin1.v
	$(TOOL) -o fanoutfanin1 $(NCLLIB) fanoutfanin1.v
	$(SIM) fanoutfanin1

fanoutfan:  fanoutfan1.v
	$(TOOL) -o fanoutfan1 $(NCLLIB) fanoutfan1.v
	$(SIM) fanoutfan1

