`timescale 1ns / 1ps

module RAM_memory #(
    //Parametros
    parameter INDEX_PTR = 2, // 2 bits para los punteros
    parameter QUEUE_SIZE = 2**INDEX_PTR,//4,        //Cantiad de filas de cada fifo = 4   
    parameter DATA_SIZE = 96 //8             //cantidad de bits de los registros de cada fifo = 128 
)(
    //Entradas
    input                             clk, 
    input                             reset_L,
    input [1:0] rd_ptr,
    output reg  [95:0] entrada
);
    
    //memoria a la cual se le accesa con una direccion
    reg [DATA_SIZE-1:0] ram_mem [QUEUE_SIZE-1:0]; // 128 bits cada registro, 4 registros
        //    [7:0]                      [9:0]
    always@(posedge clk) begin
        if ( reset_L == 0 )begin
            entrada <= 'b0;
            ram_mem[0] <= 'h397d9f2f40ca9e6c6b1f3324;
            ram_mem[1] <= 'hba23491e0f98ed0e2e3128e1;
            ram_mem[2] <= 'hed18be0f984ae0e2e3128efe;
            ram_mem[3] <= 'h8a7b78d8e9f789f3d89ec7c7;
        end
        else begin
            entrada <= ram_mem[rd_ptr];
        
            
            
        end
         
    end

endmodule
// 	//bloque_in [127:0] = 128'h397d9f2f40ca9e6c6b1f3324fded873c;
// 	//bloque_in [127:0] = 128'hed18be0f984ae0e2e3128efe0fa23491;
// 	bloque_in [127:0] = 128'h8855c7ac8b73f8f29701eff1ba0f98b3;
