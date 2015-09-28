TOOL=iverilog
SIM=VVP -n
NCLLIB=../common/NCL_LIB.v
ADD=../common/fulladdA.v

# Two D pipelined 32 bit steer A
steerA:  twoD_steer32A.v steerA.v ring4gen.v
	$(TOOL) -o twoD_steer32A $(NCLLIB) ring4gen.v steerA.v twoD_steer32A.v
	$(SIM) twoD_steer32A

# Two D pipelined 32 bit steer B
steerB:  twoD_steer32B.v steerA.v bitriquatC.v ring2gen.v ring3gen.v
	$(TOOL) -o twoD_steer32B $(NCLLIB) ring2gen.v ring3gen.v bitriquatC.v steerA.v twoD_steer32B.v
	$(SIM) twoD_steer32B

# Two D pipelined 32 bit steer C
steerC:  twoD_steer32C.v steerC.v bitriquatC.v
	$(TOOL) -o twoD_steer32C $(NCLLIB) ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32C.v
	$(SIM) twoD_steer32C

# Two D pipelined 32 bit steer D
steerD:  twoD_steer32D.v steerC.v bitriquatC.v
	$(TOOL) -d synth2 -o twoD_steer32D $(NCLLIB) $(ADD) ring2gen.v ring3gen.v bitriquatC.v steerC.v twoD_steer32D.v
	$(SIM) twoD_steer32D

# Two D pipelined 32 bit steer D2
steerD2:  twoD_steer32D2.v steerD2.v bitriquatC.v
	$(TOOL) -o twoD_steer32D2 $(NCLLIB) $(ADD) ring2gen.v ring3gen.v bitriquatC.v steerD2.v twoD_steer32D2.v
	$(SIM) twoD_steer32D2

# Two D pipelined 32 bit steer D3
steerD3:  twoD_steer32D3.v steerD3.v bitriquatC.v
	$(TOOL) -o twoD_steer32D3 $(NCLLIB) $(ADD) ring2gen.v ring3gen.v bitriquatC.v steerD3.v twoD_steer32D3.v
	$(SIM) twoD_steer32D3

# FULL WORD pipelined 32 bit steer F ring4gen.v
steerF:  fullword_steer32F.v steerF.v 
	$(TOOL) -o fullword_steer32F $(NCLLIB) ring4gen.v steerF.v fullword_steer32F.v
	$(SIM) fullword_steer32F

