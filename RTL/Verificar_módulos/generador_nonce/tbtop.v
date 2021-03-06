// `include "clock.v"

// `include "cmos/cmos_cells.v"
`include "probador.v"
`include "generador_nonce.v"
`include "clock.v"

module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			clk;			// From reloj of clock.v
wire [23:0]		nonce;			// From noncegen of generador_nonce.v
wire			reset_L;		// From tb of probador.v
wire			valid;			// From tb of probador.v
// End of automatics
   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));

   generador_nonce noncegen (/*AUTOINST*/
			     // Outputs
			     .nonce		(nonce[23:0]),
			     // Inputs
			     .clk		(clk),
			     .reset_L		(reset_L),
			     .valid		(valid));
   
    probador tb (/*AUTOINST*/
		 // Outputs
		 .reset_L		(reset_L),
		 .valid			(valid),
		 // Inputs
		 .clk			(clk),
		 .nonce			(nonce[23:0]));
   

 
endmodule





