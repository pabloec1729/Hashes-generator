module mux2a1_32b (
    input clk,
    input reset_L,
    input [31:0] A,
    input [31:0] B,
    input [5:0] counter,
    input [5:0] counter_2d,
    output reg [31:0] Y 
);

reg sel;

always @(posedge clk ) begin
    if (reset_L == 0) begin
        Y <= 'h0;
        sel <= 1;
    end 
    else begin
        if (sel == 1) begin
            Y <= A;
        end else begin
            Y <= B;
        end

        if (counter == 0) begin
            sel <= 1;
        end
        if (counter_2d == 0) begin
            sel <= 0;
        end
    end
end
endmodule