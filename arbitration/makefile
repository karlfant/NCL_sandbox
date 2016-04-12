TOOL=iverilog
SIM=VVP -n
NCLLIB=../common/NCL_LIB.v
# NCLLIB=../common/NCL_LIB_unity.v


# Arbiter study
countarbA:  countarbA.v shiftcount4H.v
	$(TOOL) -o countarbA $(NCLLIB) shiftcount4H.v countarbA.v
	$(SIM) countarbA

# Arbiter study with free to dual component containing arbiter
countarbD:  countarbD.v updncount.v $(NCLLIB)
	$(TOOL) -o countarbD $(NCLLIB) updncount.v countarbD.v
	$(SIM) countarbD

# Arbiter study with free to dual component containing arbiter
countnoarbD:  countnoarbD.v updncount.v
	$(TOOL) -o countnoarbD $(NCLLIB) updncount.v countnoarbD.v
	$(SIM) countnoarbD

# Arbiter study with free to quaternary component containing arbiter
countarbQ:  countarbQ.v updncount.v freetoquad.v
	$(TOOL) -o countarbQ $(NCLLIB) updncount.v countarbQ.v freetoquad.v
	$(SIM) countarbQ

# Arbiter study with free dual to dual component containing arbiter
countarbDD:  countarbDD.v updncount.v freedualtodual.v 
	$(TOOL) -o countarbDD $(NCLLIB) updncount.v countarbDD.v freedualtodual.v
	$(SIM) countarbDD

# Arbiter study with free to trinary component containing arbiter
countarbT:  countarbT.v updncount.v freetotrinary.v
	$(TOOL) -o countarbT $(NCLLIB) updncount.v countarbT.v freetotrinary.v
	$(SIM) countarbT


# generate the 32 single digit hex files from a file of 32 bit hex numbers
dualbits:	hextodualbits.c
	gcc hextodualbits.c
	./a.out