`timescale 1ns / 1ps
module micro_ucr_hash (input clk, 
                        input reset_L,
                        input [127:0] bloque_in,
                        input fill,
                        output [23:0] H);
//    reg [7:0] bloque [15:0];                                      
    reg [23:0] H;

    reg [7:0] H_0;
    reg [7:0] H_1;
    reg [7:0] H_2;
   
   
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;

    reg [7:0] k;
    reg [7:0] x;

    reg [7:0] W [31:0];

    reg [6:0] count;

    always @(*) begin
        if (reset_L == 0) begin
            W[0] = 0;
            W[1] = 0;
            W[2] = 0;
            W[3] = 0;
            W[4] = 0;
            W[5] = 0;
            W[6] = 0;
            W[7] = 0;
            W[8] = 0;
            W[9] = 0;
            W[10] = 0;
            W[11] = 0;
            W[12] = 0;
            W[13] = 0;
            W[14] = 0;
            W[15] = 0;
            W[16] = 0;
            W[17] = 0;
            W[18] = 0;
            W[19] = 0;
            W[20] = 0;
            W[21] = 0;
            W[22] = 0;
            W[23] = 0;
            W[24] = 0;
            W[25] = 0;
            W[26] = 0;
            W[27] = 0;
            W[28] = 0;
            W[29] = 0;
            W[30] = 0;
            W[31] = 0; 
        end
        else begin
        
            W[0] = bloque_in[7:0];
            W[1] = bloque_in[15:8];
            W[2] = bloque_in[23:16];
            W[3] = bloque_in[31:24];
            W[4] = bloque_in[39:32];
            W[5] = bloque_in[47:40];
            W[6] = bloque_in[55:48];
            W[7] = bloque_in[63:56];
            W[8] = bloque_in[71:64];
            W[9] = bloque_in[79:72];
            W[10] = bloque_in[87:80];
            W[11] = bloque_in[95:88];
            W[12] = bloque_in[103:96];
            W[13] = bloque_in[111:104];
            W[14] = bloque_in[119:112];
            W[15] = bloque_in[127:120];
            W[16] = W[13] | W[7] ^ W[2];
            W[17] = W[14] | W[8] ^ W[3];
            W[18] = W[15] | W[9] ^ W[4];
            W[19] = W[16] | W[10] ^ W[5];
            W[20] = W[17] | W[11] ^ W[6];//     W[i] = W[i - 3] | W[i - 9] ^ W[i - 14];
            W[21] = W[18] | W[12] ^ W[7];
            W[22] = W[19] | W[13] ^ W[8];
            W[23] = W[20] | W[14] ^ W[9];
            W[24] = W[21] | W[15] ^ W[10];
            W[25] = W[22] | W[16] ^ W[11];
            W[26] = W[23] | W[17] ^ W[12];
            W[27] = W[24] | W[18] ^ W[13];
            W[28] = W[25] | W[19] ^ W[14];
            W[29] = W[26] | W[20] ^ W[15];
            W[30] = W[27] | W[21] ^ W[16];
            W[31] = W[28] | W[22] ^ W[17];


                //   W[16] =(W[13] | W[7])^ W[2];
                // W[17] =(W[14] | W[8])^ W[3];
                // W[18] =(W[15] | W[9])^ W[4];
                // W[19] =(W[16] | W[10])^ W[5];
                // W[20] =(W[17] | W[11])^ W[6];//     W[i] =(W[i - 3] | W[i - 9])^ W[i - 14];
                // W[21] =(W[18] | W[12])^ W[7];
                // W[22] =(W[19] | W[13])^ W[8];
                // W[23] =(W[20] | W[14])^ W[9];
                // W[24] =(W[21] | W[15])^ W[10];
                // W[25] =(W[22] | W[16])^ W[11];
                // W[26] =(W[23] | W[17])^ W[12];
                // W[27] =(W[24] | W[18])^ W[13];
                // W[28] =(W[25] | W[19])^ W[14];
                // W[29] =(W[26] | W[20])^ W[15];
                // W[30] =(W[27] | W[21])^ W[16];
                // W[31] =(W[28] | W[22])^ W[17];
        end   
        
    end     

    always @(posedge clk ) begin
       
        if (reset_L == 0) begin
            H <= 0;
            H_0 <= 8'h01;
            H_1 <= 8'h89; 
            H_2 <= 8'hfe;

            a <= 8'h01;
            b <= 8'h89;
            c <= 8'hfe;

            k <= 8'h99;
            x <= (a ^ b);

            count <= 0;
        end
        else begin

            if (count <= 16) begin
                k <= 8'h99;
                x <= a ^ b;
            end 
            else begin
                if (count <= 31) begin
                k <= 8'ha1;
                x <= (a | b);
                end
            end
            if (count < 32) begin //arreglar 32
                a <= (b^c);
                b <= c << 4;
                c <= x + k + W[count];
                count <= count + 1;
            end
            
            if (count == 32) begin
                H [23:16] <= H_0;
                H [15:8] <= H_1;
                H [7:0] <= H_2;
                H_0 <= H_0 + a;
                H_1 <= H_1 + b;
                H_2 <= H_2 + c;
            end 
                
        end
                
    end
endmodule

// module for_loop (output reg [15:0] for_out);
// // Integer, no es un cable que se sintetiza, es simplemente para la iteraci??n del for loop
// integer i = 0;
// always @ (*) begin
// 	// Valor por defecto
// 	for_out = 'b0;
// 	// For loop utilizado para escribir menos l??neas
// 	// y a la vez que la cantidad de l??neas las determine el for loop.
// 	for(i = 0; i < 4; i = i + 1) begin
// 		// Indexaci??n por partes, a la izquierda del "+:" el bit inicial,
// 		// a la derecha del "+:" el tama??o del bus. En el ejemplo, cuando i=0,
// 		// for_out [4*0 +: 4] = 0; es igual a for_out [3:0] = 0; con 3=0+(4-1)
// 		// con i=1, for_out [4*1 +: 4] = 4'd1; es igual a for_out [7:4] = 1; con 7=4+(4-1)
// 		for_out [4*i +: 4] = i;
// 	end
// end
// endmodule
