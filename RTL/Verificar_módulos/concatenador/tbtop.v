// `include "clock.v"

// `include "cmos/cmos_cells.v"
`include "probador.v"
`include "concatenador.v"
`include "clock.v"

module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [127:0]		bloque_in;		// From concatenador of concatenador.v
wire			clk;			// From reloj of clock.v
wire [95:0]		entrada;		// From tb of probador.v
wire [31:0]		nonce;			// From tb of probador.v
wire			reset_L;		// From tb of probador.v
// End of automatics
   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));

   concatenador concatenador (/*AUTOINST*/
			      // Outputs
			      .bloque_in	(bloque_in[127:0]),
			      // Inputs
			      .clk		(clk),
			      .reset_L		(reset_L),
			      .entrada		(entrada[95:0]),
			      .nonce		(nonce[31:0]));
   
    probador tb (/*AUTOINST*/
		 // Outputs
		 .reset_L		(reset_L),
		 .entrada		(entrada[95:0]),
		 .nonce			(nonce[31:0]),
		 // Inputs
		 .clk			(clk),
		 .bloque_in		(bloque_in[127:0]));
   

 
endmodule





