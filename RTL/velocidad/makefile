ALL: BUILD RUN CLEAN

BUILD:
	#yosys yosy.ys
	#sed -i 's/RAM_memory/RAM_synth/g' RAM_synth.v
	 #sed -i 's/nonce/nonce_synth/g' hash_synth.v
	 #sed -i 's/hash/hash_synth/g' hash_synth.v
	 #sed -i 's/fin/fin_synth/g' hash_synth.v
	 #sed -i 's/bounty/bounty_synth/g' hash_synth.v
	 iverilog -o tb.o  tbtop.v
RUN:
	 
	 vvp tb.o
	gtkwave test.vcd 

CLEAN:
	 rm tb.o
	
