// Testbench Code Goes here
`timescale 1ns / 1ps
module probador(
input clk, 
input [7:0] nonce,
output reset_L,
output reg valid
);

reg reset_L;

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
 #1000 $finish;
end





endmodule
