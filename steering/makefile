TOOL=iverilog
SIM=VVP -n
NCLLIB=../common/NCL_LIB.v

# Two D pipelined 32 bit steer A with 4 cycle steer control
steerA:  twoD_steer32A.v steerA.v ring4gen.v
	$(TOOL) -o twoD_steer32A $(NCLLIB) ring4gen.v steerA.v twoD_steer32A.v
	$(SIM) twoD_steer32A

# Two D pipelined 32 bit steer B with bitriquat steer control with auto consumed paths
steerB:  twoD_steer32B.v steerA.v bitriquatC.v ring2gen.v ring3gen.v
	$(TOOL) -o twoD_steer32B $(NCLLIB)  bitriquatC.v ring2gen.v ring3gen.v steerA.v twoD_steer32B.v
	$(SIM) twoD_steer32B

# Two D pipelined 32 bit steer C optimized steer pipelining
steerC:  twoD_steer32C.v steerC.v bitriquatC.v
	$(TOOL) -o twoD_steer32C $(NCLLIB) ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32C.v
	$(SIM) twoD_steer32C

# Two D pipelined 32 bit steer D steer to 4 with adders
steerD1:  twoD_steer32D1.v steerC.v bitriquatC.v ../common/dualbuf.v
	$(TOOL) -o twoD_steer32D1 $(NCLLIB) ../common/fulladd.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32D1.v
	$(SIM) twoD_steer32D1

# Two D pipelined 32 bit steer D steer to 4 with adders
steerD2:  twoD_steer32D2.v steerC.v bitriquatC.v ../common/dualbuf.v
	$(TOOL) -o twoD_steer32D2 $(NCLLIB) ../common/fulladd2D.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32D2.v
	$(SIM) twoD_steer32D2

# Two D pipelined 32 bit steer D steer to 4 with adders
steerD3:  twoD_steer32D3.v steerC.v bitriquatC.v ../common/dualbuf.v
	$(TOOL) -o twoD_steer32D3 $(NCLLIB) ../common/fulladdI.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32D3.v
	$(SIM) twoD_steer32D3

# Two D pipelined 32 bit steer E steer to 4 with adders with slow U and race
steerE:  twoD_steer32E.v steerC.v bitriquatC.v ../common/dualbuf.v ../common/fulladd.v
	$(TOOL) -o twoD_steer32E $(NCLLIB) ../common/fulladd.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32E.v
	$(SIM) twoD_steer32E

# Two D pipelined 32 bit steer F steer to 4 with adders with slow V and race
# and with reconvergence steering
steerF:  twoD_steer32F.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32F $(NCLLIB) ../common/fulladd.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectA.v twoD_steer32F.v
	$(SIM) twoD_steer32F

# Two D pipelined 32 bit steer F steer to 4 with adders with slow V and race
# and with reconvergence steering
steerFC:  twoD_steer32FC.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32FC $(NCLLIB) ../common/fulladd.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectC.v twoD_steer32FC.v
	$(SIM) twoD_steer32FC

# Two D pipelined 32 bit steer F steer to 4 with adders with slow U and race
# and with reconvergence steering
steerFN:  twoD_steer32FN.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32FN $(NCLLIB) ../common/fulladd.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectA.v twoD_steer32FN.v
	$(SIM) twoD_steer32FN
# Two D pipelined 32 bit steer F steer to 4 with adders with slow U and race
# and with OR path completeness
steerG:  twoD_steer32G.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32G $(NCLLIB) ../common/fulladd.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectA.v twoD_steer32G.v
	$(SIM) twoD_steer32G

# Two D pipelined 32 bit steer F steer to 4 with adders with delay removed
# and with OR path completeness
steerGN:  twoD_steer32GN.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32GN $(NCLLIB) ../common/fulladd.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectA.v twoD_steer32GN.v
	$(SIM) twoD_steer32GN

# Two D pipelined 32 bit steer F steer to 4 with adders with slow V and race
# and with reconvergence steering
steerK:  twoD_steer32K.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32K $(NCLLIB) ../common/fulladd.v ../common/fulladd2D.v ../common/fulladdI.v ../common/dualbuf.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectA.v twoD_steer32K.v
	$(SIM) twoD_steer32K

# Two D pipelined 32 bit steer F steer to 4 with adders with slow V and race
# and with reconvergence steering
steerK2:  twoD_steer32K2.v steerC.v bitriquatC.v selectA.v
	$(TOOL) -o twoD_steer32K2 $(NCLLIB) ../common/fulladd.v ../common/fulladd2D.v ../common/fulladdI.v ../common/dualbuf.v ../common/dualbufD.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectA.v twoD_steer32K2.v
	$(SIM) twoD_steer32K2

# Two D pipelined 32 bit steer F steer to 4 with adders with slow V and race
# and with reconvergence steering
steerK3:  twoD_steer32K3.v steerC.v bitriquatC.v selectC.v
	$(TOOL) -o twoD_steer32K3 $(NCLLIB) ../common/fulladd.v ../common/fulladd2D.v ../common/fulladdI.v ../common/dualbuf.v ../common/dualbufD.v ring2gen.v ring3gen.v bitriquatC.v steerC.v selectC.v twoD_steer32K3.v
	$(SIM) twoD_steer32K3


# FULL WORD pipelined 32 bit steer F ring4gen.v
steerfull:  fullword_steer32F.v steerF.v 
	$(TOOL) -o fullword_steer32F $(NCLLIB) ring4gen.v steerF.v fullword_steer32F.v
	$(SIM) fullword_steer32F

