TOOL=iverilog
SIM=VVP -n
NCLLIB=../common/NCL_LIB.v
# NCLLIB=../common/NCL_LIB_unity.v


# Arbiter study with free to dual component containing arbiter
arbD:  arbD.v $(NCLLIB)
	$(TOOL) -o arbD $(NCLLIB) arbD.v
	$(SIM) arbD

# Arbiter study with free to quaternary component containing arbiter
arbQ:  arbQ.v freetoquad.v
	$(TOOL) -o arbQ $(NCLLIB) arbQ.v freetoquad.v
	$(SIM) arbQ

# Arbiter study with free dual to dual component containing arbiter
arbDD:  arbDD.v freedualtodual.v 
	$(TOOL) -o arbDD $(NCLLIB) arbDD.v freedualtodual.v
	$(SIM) arbDD

# Arbiter study with free to trinary component containing arbiter
arbT:  arbT.v freetotrinary.v
	$(TOOL) -o arbT $(NCLLIB) arbT.v freetotrinary.v
	$(SIM) arbT


# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out