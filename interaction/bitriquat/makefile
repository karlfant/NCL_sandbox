TOOL=iverilog
SIM=VVP -n
NCLLIB=../../common/NCL_LIB.v

# bitriquat minterm form
bitriquat:  bitriquat.v
	$(TOOL) -o bitriquat $(NCLLIB) ring2gen.v ring3gen.v bitriquat.v
	$(SIM) bitriquat

# bitriquat optimization A
bitriquatA:  bitriquatA.v
	$(TOOL) -o bitriquatA $(NCLLIB) ring2gen.v ring3gen.v bitriquatA.v
	$(SIM) bitriquatA

# bitriquat optimization B
bitriquatB:  bitriquatB.v
	$(TOOL) -o bitriquatB $(NCLLIB) ring2gen.v ring3gen.v bitriquatB.v
	$(SIM) bitriquatB

# bitriquat optimization C
bitriquatC:  bitriquatC.v
	$(TOOL) -o bitriquatC $(NCLLIB) ring2gen.v ring3gen.v bitriquatC.v
	$(SIM) bitriquatC


