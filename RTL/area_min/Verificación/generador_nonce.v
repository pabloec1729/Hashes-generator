`timescale 1ns / 1ps
module generador_nonce (
    input clk,
    input reset_L,
    input valid,
    inout fin,
    output reg [31:0] nonce
);
    
    reg [7:0] rand;
    always @(posedge clk) begin
        
        if (fin == 0) begin
            if (reset_L == 0) begin
                nonce <= 0;
                rand <= 0;
            end
            else begin
                if (valid == 0) begin
                    // rand <= $random;
                    nonce <= $random + 32534345445767677;
                end
            end
        end
    end

endmodule