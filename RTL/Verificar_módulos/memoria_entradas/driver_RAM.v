task drv_init;
  begin @(posedge clk)
	reset_L <= 0;    
	@(posedge clk)
	reset_L <= 0;
	@(posedge clk)
	reset_L <= 1;
	next <= 0;
	@(posedge clk)
	next <= 0;
	@(posedge clk)
	next <= 1;
	@(posedge clk)
	next <= 0;
	@(posedge clk)
	next <= 0;
	@(posedge clk)
	next <= 0;
	@(posedge clk)
	next <= 1;
	@(posedge clk)
	next <= 0;
	@(posedge clk)
	next <= 1;
	@(posedge clk)
	next <= 0;
  end
endtask
/////////////////////////////










