`include "micro_ucr_hash.v"
`include "concatenador.v"
`include "comparador.v"
`include "generador_nonce.v"
`include "RAM_memory.v"
`include "salidas.v"
module hash (
	input [7:0] target,
	input clk,
	input reset_L,
	input [1:0] num_entradas,
	output [23:0] bounty_out,
	output [31:0] nonce_valido_out,
	output fin);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [23:0]		H;			// From micro_hash of micro_ucr_hash.v
   wire [127:0]		bloque_in;		// From concatenador of concatenador.v
   wire [23:0]		bounty;			// From comparador of comparador.v
   wire [95:0]		entrada;		// From RAM of RAM_memory.v
   wire [31:0]		nonce;			// From gen_nonce of generador_nonce.v
   wire [31:0]		nonce_1;		// From micro_hash of micro_ucr_hash.v
   wire [31:0]		nonce_valido;		// From comparador of comparador.v
   wire [1:0]		rd_ptr;			// From salidas of salidas.v
   wire			valid;			// From comparador of comparador.v
   // End of automatics
    micro_ucr_hash micro_hash (/*AUTOINST*/
			       // Outputs
			       .nonce_1		(nonce_1[31:0]),
			       .H		(H[23:0]),
			       // Inputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .bloque_in	(bloque_in[127:0]),
			       .fin		(fin));

   concatenador concatenador (/*AUTOINST*/
			      // Outputs
			      .bloque_in	(bloque_in[127:0]),
			      // Inputs
			      .clk		(clk),
			      .reset_L		(reset_L),
			      .entrada		(entrada[95:0]),
			      .nonce		(nonce[31:0]));
   
	comparador comparador (/*AUTOINST*/
			       // Outputs
			       .valid		(valid),
			       .nonce_valido	(nonce_valido[31:0]),
			       .bounty		(bounty[23:0]),
			       // Inputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .H		(H[23:0]),
			       .nonce_1		(nonce_1[31:0]),
			       .target		(target[7:0]),
			       .fin		(fin));

	generador_nonce gen_nonce (/*AUTOINST*/
				   // Outputs
				   .nonce		(nonce[31:0]),
				   // Inouts
				   .fin			(fin),
				   // Inputs
				   .clk			(clk),
				   .reset_L		(reset_L),
				   .valid		(valid));

	RAM_memory RAM (/*AUTOINST*/
			// Outputs
			.entrada	(entrada[95:0]),
			// Inputs
			.clk		(clk),
			.reset_L	(reset_L),
			.rd_ptr		(rd_ptr[1:0]));

	salidas salidas (/*AUTOINST*/
			 // Outputs
			 .rd_ptr		(rd_ptr[1:0]),
			 .bounty_out		(bounty_out[23:0]),
			 .nonce_valido_out	(nonce_valido_out[31:0]),
			 .fin			(fin),
			 // Inputs
			 .clk			(clk),
			 .target		(target[7:0]),
			 .valid			(valid),
			 .reset_L		(reset_L),
			 .bounty		(bounty[23:0]),
			 .num_entradas		(num_entradas[1:0]),
			 .nonce_valido		(nonce_valido[31:0]));

	

endmodule
