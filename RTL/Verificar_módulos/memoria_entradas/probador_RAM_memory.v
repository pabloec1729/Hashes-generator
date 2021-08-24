// Testbench Code Goes here

module probador_RAM_memory #(
    //Parametros
    parameter INDEX_PTR = 2, 
    parameter QUEUE_SIZE = 2**INDEX_PTR,//4,          
    parameter DATA_SIZE = 128 
)(
    
    input                             clk,
    output reg reset_L,
    output reg next
);




`include "driver_RAM.v"
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
