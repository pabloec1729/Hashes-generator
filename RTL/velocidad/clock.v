`timescale 1ns / 10ps
module clock (clk);

output clk;
reg clk;

initial begin
clk = 0;
end

always begin
 #1000 clk = !clk;
end

endmodule
