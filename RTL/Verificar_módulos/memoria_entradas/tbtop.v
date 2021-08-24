`include "clock.v"
`include "CMOS/cmos_cells.v"
`include "RAM_memory.v"
`include "probador_RAM_memory.v"
// `include "RAM_synth.v"

module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			clk;			// From reloj of clock.v
wire [127:0]	data_out;		// From RAM of RAM_memory.v
wire			next;			// From tb_RAM of probador_RAM_memory.v
wire reset_L;
// End of automatics

   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));
   
   RAM_memory RAM (/*AUTOINST*/
		   // Outputs
		   .data_out		(data_out[127:0]),
		   // Inputs
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .next		(next));
   
   probador_RAM_memory tb_RAM (/*AUTOINST*/
			       // Outputs
			       .next		(next),
			       // Inputs
				   .reset_L (reset_L),
			       .clk		(clk));
   
   
endmodule





