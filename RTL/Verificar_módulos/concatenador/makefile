ALL: BUILD RUN CLEAN

BUILD:
	#yosys yosy.ys
	#sed -i 's/micro_ucr_hash/micro_ucr_hash_synth/g' micro_ucr_hash_synth.v
	 iverilog -o tb.o  tbtop.v
RUN:
	 
	 vvp tb.o
	gtkwave test.vcd 

CLEAN:
	rm tb.o
	
