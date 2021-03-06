`include "micro_ucr_hash.v"
`include "concatenador.v"
`include "comparador.v"
`include "generador_nonce.v"
`include "RAM_memory.v"
`include "salidas.v"
`include "contador.v"
`include "contador_2d.v"
`include "mux2a1_24b.v"
`include "mux2a1_32b.v"

module hash (
	input [7:0] target,
	input clk,
	input reset_L,
	input [1:0] num_entradas,
	output [23:0] bounty_out,
	output [31:0] nonce_valido_out,
	output [31:0] nonce,
	output fin);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [23:0]		Hhash1;			// From micro_hash_1 of micro_ucr_hash.v, ...
	wire [23:0]		Hhash2;			// From micro_hash_2 of micro_ucr_hash.v, ...
   wire [23:0]		Y;			// From mux0 of mux2a1_24b.v
   wire [127:0]		bloque_in;		// From concatenador of concatenador.v
   wire [127:0]		bloque_in_1;		// From concatenador of concatenador.v
   wire [23:0]		bounty;			// From comparador of comparador.v
   wire [5:0]		counter;		// From contador_hash_1 of contador.v
   wire [5:0]		counter_2d;		// From contador_hash_2 of contador_2d.v
   wire [95:0]		entrada;		// From RAM of RAM_memory.v
   wire [31:0]		nonce_1_1;		// From micro_hash_1 of micro_ucr_hash.v, ...
   wire [31:0]		nonce_1_2;		// From micro_hash_1 of micro_ucr_hash.v, ...
   wire [31:0]		nonce_valido;		// From comparador of comparador.v
   wire [31:0]		Ynonce;		// From comparador of comparador.v
   wire [1:0]		rd_ptr;			// From salidas of salidas.v
   wire			valid;			// From comparador of comparador.v
   // End of automatics


	mux2a1_32b mux1 (/*AUTOINST*/
			 // Outputs
			 .Y			(Ynonce[31:0]),
			 // Inputs
			 .clk			(clk),
			 .reset_L		(reset_L),
			 .A			(nonce_1_1[31:0]),
			 .B			(nonce_1_2[31:0]),
			 .counter		(counter[5:0]),
			 .counter_2d		(counter_2d[5:0]));

			 mux2a1_24b mux0 (/*AUTOINST*/
			 // Outputs
			 .Y			(Y[23:0]),
			 // Inputs
			 .clk			(clk),
			 .reset_L		(reset_L),
			 .A			(Hhash1[23:0]),
			 .B			(Hhash2[23:0]),
			 .counter		(counter[5:0]),
			 .counter_2d		(counter_2d[5:0]));


    micro_ucr_hash micro_hash_1 (/*AUTOINST*/
				 // Outputs
				 .nonce_1		(nonce_1_1[31:0]),
				 .H			(Hhash1[23:0]),
				 // Inputs
				 .clk			(clk),
				 .reset_L		(reset_L),
				 .bloque_in		(bloque_in[127:0]),
				 .fin			(fin),
				 .counter		(counter[5:0]));

	  micro_ucr_hash micro_hash_2 (/*AUTOINST*/
				       // Outputs
				       .nonce_1		(nonce_1_2[31:0]),
				       .H		(Hhash2[23:0]),
				       // Inputs
				       .clk		(clk),
				       .reset_L		(reset_L),
				       .bloque_in	(bloque_in_1[127:0]),
				       .fin		(fin),
				       .counter		(counter_2d[5:0]));

	contador contador_hash_1 (/*AUTOINST*/
				  // Outputs
				  .counter		(counter[5:0]),
				  // Inputs
				  .clk			(clk),
				  .reset_L		(reset_L));

	contador_2d contador_hash_2 (/*AUTOINST*/
				     // Outputs
				     .counter_2d	(counter_2d[5:0]),
				     // Inputs
				     .clk		(clk),
				     .reset_L		(reset_L),
				     .counter		(counter[5:0]));

   concatenador concatenador (/*AUTOINST*/
			      // Outputs
			      .bloque_in	(bloque_in[127:0]),
			      .bloque_in_1	(bloque_in_1[127:0]),
			      // Inputs
			      .clk		(clk),
			      .reset_L		(reset_L),
			      .entrada		(entrada[95:0]),
			      .nonce		(nonce[31:0]),
			      .counter		(counter[5:0]),
			      .counter_2d	(counter_2d[5:0]));
   
	comparador comparador (/*AUTOINST*/
			       // Outputs
			       .valid		(valid),
			       .nonce_valido	(nonce_valido[31:0]),
			       .bounty		(bounty[23:0]),
			       // Inputs
			       .clk		(clk),
			       .reset_L		(reset_L),
			       .H		(Y[23:0]),
			       .nonce_1		(Ynonce[31:0]),
			       .target		(target[7:0]),
			       .fin		(fin));

	generador_nonce gen_nonce (/*AUTOINST*/
				   // Outputs
				   .nonce		(nonce[31:0]),
				   // Inputs
				   .clk			(clk),
				   .reset_L		(reset_L),
				   .valid		(valid),
				   .fin			(fin));

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
