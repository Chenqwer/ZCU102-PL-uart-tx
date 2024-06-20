`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/02/27 09:36:43
// Design Name: 
// Module Name: uart_byte_tx_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_byte_tx_tb();

    reg clk_p;
    reg clk_n;
    reg rst;
    reg [7:0] data;
    wire uart_tx;
    wire led;
    
    uart_byte_tx uart_byte_tx(
        .clk_n(clk_n),
        .clk_p(clk_p),
        .rst(rst),
        .data(data),
        .uart_tx(uart_tx),
        .led(led)
    );
    
//    defparam uart_byte_tx.MCNT_DLY=125_000_0-1;//改為10ms易於仿真
    defparam uart_byte_tx.MCNT_DLY=125_00-1;
    initial clk_p=1;
    always #4 clk_p=~clk_p;
    initial clk_n=0;
    always #4 clk_n=~clk_n;
    
    initial begin
        rst=1;
        #201;
        rst=0;
//        data=8'b01010101;
         data=8'b01101100;
        #30000000;
        data=8'b10101010;
//        data=8'b10100010;
        #30000000;
        $stop;
    end
    
endmodule
