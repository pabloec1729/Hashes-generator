`timescale 1ns / 1ps

module salidas(
    //Entradas
    input                             clk, 
    input                             reset_L,
    input [23:0] bounty,
    input [1:0] num_entradas,  //Máximo índice de la cantidad de entradas a descifrar
    output reg [1:0]            rd_ptr,
    output reg [23:0] bounty_out,
    output reg fin
);

    always@(posedge clk) begin
        
        if ( reset_L == 0 )begin
            rd_ptr <= 0;
            bounty_out <= 0;
            fin <= 0;
        
        end
        else begin
            if (bounty_out != bounty) begin
                if (rd_ptr < num_entradas) begin
                    rd_ptr <= rd_ptr + 1;
                    bounty_out <= bounty; 
                end
                if (rd_ptr == num_entradas && fin == 0) begin
                    bounty_out <= bounty;
                    fin <= 1;
                end
                    
                
            end           
        end
         
    end

endmodule
// 	//bloque_in [127:0] = 128'h397d9f2f40ca9e6c6b1f3324fded873c;
// 	//bloque_in [127:0] = 128'hed18be0f984ae0e2e3128efe0fa23491;
// 	bloque_in [127:0] = 128'h8855c7ac8b73f8f29701eff1ba0f98b3;