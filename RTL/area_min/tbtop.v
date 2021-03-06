`include "clock.v"
`include "probador.v"
`include "hash.v"
`include "hash_synth.v"
`include "osu018_stdcells.v"

// `include "RAM_synth.v"

module tbtop;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [23:0]		bounty_out;		// From hash_cond of hash.v
wire [23:0]		bounty_synth_out;	// From synth of hash_synth.v
wire			clk;			// From reloj of clock.v
wire			fin;			// From hash_cond of hash.v
wire			fin_synth;		// From synth of hash_synth.v
wire [31:0]		nonce;			// From hash_cond of hash.v
wire [31:0]		nonce_synth;		// From synth of hash_synth.v
wire [31:0]		nonce_synth_valido_out;	// From synth of hash_synth.v
wire [31:0]		nonce_valido_out;	// From hash_cond of hash.v
wire [1:0]		num_entradas;		// From prob of probador.v
wire			reset_L;		// From prob of probador.v
wire [7:0]		target;			// From prob of probador.v
// End of automatics

   clock reloj (/*AUTOINST*/
		// Outputs
		.clk			(clk));
   
   hash hash_cond (/*AUTOINST*/
		   // Outputs
		   .bounty_out		(bounty_out[23:0]),
		   .nonce_valido_out	(nonce_valido_out[31:0]),
		   .nonce		(nonce[31:0]),
		   .fin			(fin),
		   // Inputs
		   .target		(target[7:0]),
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .num_entradas	(num_entradas[1:0]));
   
   probador prob (/*AUTOINST*/
		  // Outputs
		  .reset_L		(reset_L),
		  .num_entradas		(num_entradas[1:0]),
		  .target		(target[7:0]),
		  // Inputs
		  .clk			(clk),
		  .bounty_out		(bounty_out[23:0]),
		  .fin			(fin),
		  .nonce_valido_out	(nonce_valido_out[31:0]));
   
	hash_synth synth (/*AUTOINST*/
			  // Outputs
			  .fin_synth		(fin_synth),
			  .bounty_synth_out	(bounty_synth_out[23:0]),
			  .nonce_synth_valido_out(nonce_synth_valido_out[31:0]),
			  .nonce_synth		(nonce_synth[31:0]),
			  // Inputs
			  .clk			(clk),
			  .reset_L		(reset_L),
			  .target		(target[7:0]),
			  .num_entradas		(num_entradas[1:0]));
   
endmodule





