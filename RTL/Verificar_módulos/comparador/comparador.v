`timescale 1ns / 1ps
module comparador (
    input clk,
    input reset_L,
    input [23:0] H,
    output reg valid,  
    output reg [23:0] bounty
);
    reg [7:0] target;

    always @(posedge clk) begin
        if (reset_L == 0) begin
            target <= 7'h40;  //Valor del target en hexadecimal
            valid <= 0;
            bounty <= 0;
        end
        else begin
            if (H[23:16] < target) begin
                if (H[15:8] < target) begin
                    valid <= 1;     //Valid = 1 si no se cumple la condición
                    bounty <= H;    //Siempre se guarda el último bounty
                end
                
            end 
            else begin
                valid <= 0;         
            end
        end
    end

endmodule