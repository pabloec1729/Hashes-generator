// `include "clock.v"

// `include "cmos/cmos_cells.v"
`include "probador.v"
`include "comparador.v"
`include "clock.v"

module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [23:0]		H;			// From tb of probador.v
wire [23:0]		bounty;			// From comparador of comparador.v
wire			clk;			// From reloj of clock.v
wire			valid;			// From comparador of comparador.v
// End of automatics
   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));

   comparador comparador (/*AUTOINST*/
			  // Outputs
			  .valid		(valid),
			  .bounty		(bounty[23:0]),
			  // Inputs
			  .clk			(clk),
			  .reset_L		(reset_L),
			  .H			(H[23:0]));
   
    probador tb (/*AUTOINST*/
		 // Outputs
		 .H			(H[23:0]),
		 // Inputs
		 .clk			(clk),
		 .reset_L		(reset_L),
		 .valid			(valid),
		 .bounty		(bounty[23:0]));
   

 
endmodule





