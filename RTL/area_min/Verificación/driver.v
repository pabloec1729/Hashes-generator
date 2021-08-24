task drv_init;
  begin @(posedge clk)
	reset_L <= 0; 
	num_entradas <= 3;  
	target = 'h30;
	@(posedge clk)
	reset_L <= 0;
	@(posedge clk)
	reset_L <= 1;
  	end
endtask
/////////////////////////////










