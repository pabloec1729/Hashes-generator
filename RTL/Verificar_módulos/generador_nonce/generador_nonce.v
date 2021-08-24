`timescale 1ns / 1ps
module generador_nonce (
    input clk,
    input reset_L,
    input valid,
    output reg [23:0] nonce
);
    

    always @(posedge clk) begin
        if (reset_L == 0) begin
            nonce <= 0;
        end
        else begin
           if (valid == 0) begin
               nonce <= $random;
           end 
        end
    end

endmodule