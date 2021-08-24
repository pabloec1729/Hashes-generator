ALL: BUILD RUN CLEAN

BUILD:
	#yosys yosy.ys
	#sed -i 's/RAM_memory/RAM_synth/g' RAM_synth.v
	 iverilog -o tb.o  tbtop.v
RUN:
	 
	 vvp tb.o
	gtkwave test.vcd 

CLEAN:
	 rm tb.o
	
