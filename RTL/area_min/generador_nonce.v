`timescale 1ns / 10ps
module generador_nonce (
    input clk,
    input reset_L,
    input valid,
    input fin,
    output reg [31:0] nonce
);
    
    reg [31:0] rand;
    always @(posedge clk) begin
        
        if (fin == 0) begin
            if (reset_L == 0) begin
                nonce <= 'h80a9d9e7;
                rand  <= 'h234b724a;
            end
            else begin
                if (valid == 0) begin
                    // rand <= $random;
                    nonce <= nonce + rand;
                end
            end
        end
    end

endmodule