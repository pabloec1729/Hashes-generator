`timescale 1ns / 10ps
module concatenador (
    input clk,
    input reset_L,
    input [95:0] entrada,
    input [31:0] nonce,
    input [5:0] count, 
    output [127:0] bloque_in
);
    reg [127:0] bloque_in;

    always @(posedge clk) begin
        if (reset_L == 0) begin
            bloque_in <= 0;
        end
        else begin
            if (count == 0) begin
                bloque_in[127:32] <= entrada;
                bloque_in[31:0] <= nonce;
            end
           
        end
    end

endmodule