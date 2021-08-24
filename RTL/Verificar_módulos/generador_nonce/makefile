ALL: BUILD RUN CLEAN

BUILD:
	#yosys yosy.ys
	#sed -i 's/generador/generador_synth/g' generador_synth.v
	 iverilog -o tb.o  tbtop.v
RUN:
	 
	 vvp tb.o
	gtkwave test.vcd 

CLEAN:
	rm tb.o
	
