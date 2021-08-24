task drv_init;
  begin @(posedge clk)
	reset_L <= 0; 
	num_entradas <= 3;  
	
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha23220;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2321; 
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2322;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2323;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2324;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2325;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2326;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2327;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2328;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2329;
	@(posedge clk)
	reset_L <= 1;
	bounty <= 'ha2330;
  end
endtask
/////////////////////////////










