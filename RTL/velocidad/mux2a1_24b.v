module mux2a1_24b (
    input clk,
    input reset_L,
    input [23:0] A,
    input [23:0] B,
    input [5:0] counter,
    input [5:0] counter_2d,
    output reg [23:0] Y 
);

reg sel;

always @(posedge clk ) begin
    if (reset_L == 0) begin
        Y <= 'hfe8901;
        sel <= 1;
    end 
    else begin
        if (sel == 1) begin
            Y <= A;
        end else begin
            Y <= B;
        end

        if (counter == 33) begin
            sel <= 1;
        end
        if (counter_2d == 33) begin
            sel <= 0;
        end
    end
end
endmodule