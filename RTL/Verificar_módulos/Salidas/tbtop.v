`include "clock.v"
`include "CMOS/cmos_cells.v"
`include "probador.v"
`include "salidas.v"
// `include "RAM_synth.v"

module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [23:0]		bounty;			// From prob of probador.v
wire [23:0]		bounty_out;		// From salida of salidas.v
wire			clk;			// From reloj of clock.v
wire			fin;			// From salida of salidas.v
wire [1:0]		num_entradas;		// From prob of probador.v
wire [1:0]		rd_ptr;			// From salida of salidas.v
wire			reset_L;		// From prob of probador.v
// End of automatics

   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));
   
   salidas salida (/*AUTOINST*/
		   // Outputs
		   .rd_ptr		(rd_ptr[1:0]),
		   .bounty_out		(bounty_out[23:0]),
		   .fin			(fin),
		   // Inputs
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .bounty		(bounty[23:0]),
		   .num_entradas	(num_entradas[1:0]));
   
   probador prob (/*AUTOINST*/
		  // Outputs
		  .reset_L		(reset_L),
		  .bounty		(bounty[23:0]),
		  .num_entradas		(num_entradas[1:0]),
		  // Inputs
		  .clk			(clk),
		  .rd_ptr		(rd_ptr[1:0]),
		  .bounty_out		(bounty_out[23:0]),
		  .fin			(fin));
   
   
endmodule





