//Init task for clean output signals

task drv_init;
  begin @(posedge clk)//Inicializando registros e enable = 0
	reset_L <= 0;    
	@(posedge clk)
	reset_L <= 1;
	valid = 0;
	@(posedge clk)
	valid = 0;
	@(posedge clk)
	valid = 0;
	@(posedge clk)
	valid = 0;
	@(posedge clk)
	valid = 0;
	@(posedge clk)
	valid = 0;
	@(posedge clk)
	valid = 1;
	@(posedge clk)
	valid = 1;
	@(posedge clk)
	valid = 0;
end
endtask


// task bloque_in_fill;
// begin @(posedge clk)
// 	//bloque_in [127:0] = 128'h3c87edfd24331f6b6c9eca402f9f7d39;
// 																	//cual es?
// 	//bloque_in [127:0] = 128'h397d9f2f40ca9e6c6b1f3324fded873c;
// 	//bloque_in [127:0] = 128'hed18be0f984ae0e2e3128efe0fa23491;
// 	bloque_in [127:0] = 128'h8855c7ac8b73f8f29701eff1ba0f98b3;
// 	// bloque_in [63:32] = $random;
// 	// bloque_in [95:64] = $random;
// 	// bloque_in [127:95] = $random;
// end
// endtask
/////////////////////////////










