// Testbench Code Goes here
`timescale 1ns / 1ps
module probador(
input clk, 
output reset_L,
output fill,
output [127:0] bloque_in,
input [23:0] H
);

reg fill;
reg reset_L;
reg [127:0] bloque_in;

`include "driver.v"
initial begin

  $dumpfile("test.vcd");
  $dumpvars(0);

  // log = $fopen("tb.log");
//   $fdisplay(log, "time=%5d, Simulation Start", $time); ////////
//   $fdisplay(log, "time=%5d, Starting Reset", $time); ///////
  
  drv_init();
  // bloque_in_fill();
  
  
//   $fdisplay(log, "time=%5d, Reset Completed", $time); /////

//   $fdisplay(log, "time=%5d, Starting Test", $time);
//   checker(ITERATIONS);


//   $fdisplay(log, "time=%5d, Test Completed", $time);
//   $fdisplay(log, "time=%5d, Simulation Completed", $time);
//   $fclose(log);
 #10000 $finish;
end





endmodule
