// Testbench Code Goes here

module probador (
    input                             clk, 
    output reg                             reset_L,
    output reg [23:0] bounty,
    output reg [1:0] num_entradas,  //Máximo índice de la cantidad de entradas a descifrar
    input [1:0]            rd_ptr,
    input [23:0] bounty_out,
    input fin
);




`include "driver.v"
//`include "checker_RAM.v"

//parameter ITERATIONS = 200;

// integer log;

initial begin

  $dumpfile("test.vcd");
  $dumpvars(0);

  // log = $fopen("tb.log");
  // $fdisplay(log, "time=%5d, Simulation Start", $time); ////////
  // $fdisplay(log, "time=%5d, Starting Reset", $time); ///////

  drv_init();

  

  // $fdisplay(log, "time=%5d, Reset Completed", $time); /////

  // $fdisplay(log, "time=%5d, Starting Test", $time);
  // checker(ITERATIONS);


  // $fdisplay(log, "time=%5d, Test Completed", $time);
  // $fdisplay(log, "time=%5d, Simulation Completed", $time);
  // $fclose(log);
  #600 $finish;
end





endmodule
