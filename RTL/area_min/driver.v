task drv_init;
  begin @(posedge clk)
	reset_L <= 0; 
	num_entradas <= 0;  
	target = 'h40;
	@(posedge clk)
	reset_L <= 0;
	@(posedge clk)
	reset_L <= 1;
  	end
endtask
/////////////////////////////










