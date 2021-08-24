module contador_2d (
    input clk,
    input reset_L,
    input [5:0] counter,
    output [5:0] counter_2d
);

    reg [5:0] counter_2d;
    reg [5:0] counter_d;

    always @(posedge clk ) begin
        if (reset_L == 0) begin
            counter_d <= 63;
            counter_2d <= 63;
        end 
        else begin
            counter_d <= counter;
            counter_2d <= counter_d;
        end
       
    end
endmodule