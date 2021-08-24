// `include "clock.v"

// `include "CMOS/cmos_cells.v"
`include "probador.v"
`include "clock.v"
`include "micro_ucr_hash.v"


module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [23:0]		H;			// From hash of micro_ucr_hash.v, ...
wire [127:0]		bloque_in;		// From tb of probador.v
wire			clk;			// From reloj of clock.v
wire			fill;			// From tb of probador.v
wire			reset_L;		// From tb of probador.v
// End of automatics
   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));

   micro_ucr_hash hash (/*AUTOINST*/
			// Outputs
			.H		(H[23:0]),
			// Inputs
			.clk		(clk),
			.reset_L	(reset_L),
			.bloque_in	(bloque_in[127:0]),
			.fill		(fill));
   
    probador tb (/*AUTOINST*/
		 // Outputs
		 .reset_L		(reset_L),
		 .fill			(fill),
		 .bloque_in		(bloque_in[127:0]),
		 // Inputs
		 .clk			(clk),
		 .H			(H[23:0]));



 
endmodule





