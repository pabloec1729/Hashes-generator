`timescale 1ns / 10ps
module comparador (
    input clk,
    input reset_L,
    input [23:0] H,
    input [31:0] nonce_1,
    input [7:0] target,
    input fin,
    output reg valid,
    output reg [31:0] nonce_valido,  
    output reg [23:0] bounty
);

    always @(posedge clk) begin
        if (reset_L == 0) begin
            valid <= 0;
            bounty <= 0;
            nonce_valido <= 0;
        end
        else begin
            if (fin == 0) begin
                if (H[23:16] < target) begin
                    if (H[15:8] < target) begin
                        nonce_valido <= nonce_1;
                        valid <= 1;     //Valid = 1 si se cumple la condición
                        bounty <= H;    //Siempre se guarda el último bounty
                    end
                    
                end 
                else begin
                    valid <= 0;         
                end 
            end
        end        
            
    end

endmodule