// Testbench Code Goes here
`timescale 1ns / 1ps
module probador(
    input clk,
    input [23:0] bounty_out,
    input fin,
    output reset_L,
    input [31:0] nonce_valido_out,
    output reg [1:0] num_entradas,
    output reg [7:0] target
);

reg reset_L;

`include "driver.v"

initial begin

  $dumpfile("test.vcd");
  #200 $dumpvars(0);

  // log = $fopen("tb.log");
//   $fdisplay(log, "time=%5d, Simulation Start", $time); ////////
//   $fdisplay(log, "time=%5d, Starting Reset", $time); ///////
  
  #200 drv_init();
  // bloque_in_fill();
  
  
//   $fdisplay(log, "time=%5d, Reset Completed", $time); /////

//   $fdisplay(log, "time=%5d, Starting Test", $time);
//   checker(ITERATIONS);


//   $fdisplay(log, "time=%5d, Test Completed", $time);
//   $fdisplay(log, "time=%5d, Simulation Completed", $time);
//   $fclose(log);
 #50000 $finish;
end





endmodule
