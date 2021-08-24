module contador (
    input clk,
    input reset_L,
    output [5:0] counter
);

    reg [5:0] counter;

    always @(posedge clk ) begin
        if (reset_L == 0) begin
            counter <= 0;
        end 
        else begin
            if (counter < 33) begin
                counter <= counter + 1;
            end
            
            if (counter ==  33) begin
                counter <= 0;
            end
        end
    end
endmodule