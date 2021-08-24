`timescale 1ns / 1ps
module clock (clk);

output clk;
reg clk;

initial begin
clk = 0;
end

always begin
 #100 clk = !clk;
end

endmodule
