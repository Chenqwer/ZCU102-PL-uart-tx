`timescale 1ns / 1ps


module uart_byte_tx(
    clk_n,
    clk_p,
    rst,
    data,
    uart_tx,
    led
    );
    wire clk;
    input clk_n;
    input clk_p;
    IBUFDS
    #(
    .IOSTANDARD("DEFAULT")
    )
    IBUFDS_inst
    (
    .O(clk),
    .I(clk_p),
    .IB(clk_n)
    );
    input rst;
    input [7:0] data;
    output reg uart_tx;
    output reg led;
    
     //band rate 9600
     // 1/9600*125000000-1=13019
     reg [14:0] baud_div_cnt;
     reg en_baud_cnt;
     parameter MCNT_BAUD=13020-1;//max baud
     always@(posedge clk or posedge rst)
     if(rst)
        baud_div_cnt<=0;
     else if(en_baud_cnt) begin
        if(baud_div_cnt==MCNT_BAUD)
            baud_div_cnt<=0;
        else
            baud_div_cnt<=baud_div_cnt+1'd1;
    end
    else 
        baud_div_cnt<=0;

    //en_baud_cnt
    reg [3:0] bit_cnt;
    always@(posedge clk or posedge rst)
    if(rst)
        en_baud_cnt<=0;
    else if(delay_cnt==MCNT_DLY)
        en_baud_cnt<=1;
    else if(bit_cnt==9 && baud_div_cnt==MCNT_BAUD)
        en_baud_cnt<=0;
        
    //bit_cnt
    parameter MCNT_BIT=10-1;//start+8bits+stop (10bits)
    always@(posedge clk or posedge rst)
    if(rst)
        bit_cnt<=0;
    else if(baud_div_cnt == MCNT_BAUD) begin
        if(bit_cnt == MCNT_BIT)
            bit_cnt<=0;
        else
            bit_cnt<=bit_cnt+1;
    end
    
    //delay_cnt 
    reg [26:0] delay_cnt;//delay a second
    parameter MCNT_DLY = 125_000_000-1;
    always@(posedge clk or posedge rst)
    if(rst)
        delay_cnt<=0;
    else if(delay_cnt==MCNT_DLY)
        delay_cnt<=0;
    else
        delay_cnt<=delay_cnt+1'd1;   
         
    reg [7:0] r_data;
    always@(posedge clk or posedge rst)
    if(rst)
        r_data<=0;
    else if(delay_cnt==MCNT_DLY)
        r_data<=data;
    else
        r_data<=r_data;
    //uart_tx
    always@(posedge clk or posedge rst)
    if(rst)
        uart_tx<=1'd1;
    else if(en_baud_cnt == 0)
        uart_tx<=1'd1;
    else begin
        case(bit_cnt)
            0:uart_tx<=1'd0;
            1:uart_tx<=r_data[0];
            2:uart_tx<=r_data[1];
            3:uart_tx<=r_data[2];
            4:uart_tx<=r_data[3];
            5:uart_tx<=r_data[4];
            6:uart_tx<=r_data[5];
            7:uart_tx<=r_data[6];
            8:uart_tx<=r_data[7];
            9:uart_tx<=1'd1;
            default:uart_tx<=uart_tx;
        endcase
    end
    
    //led
    always@(posedge clk or posedge rst)
    if(rst)
        led<=0;
    else if(bit_cnt==9 && baud_div_cnt==MCNT_BAUD)
        led<=~led;
        

        
endmodule


