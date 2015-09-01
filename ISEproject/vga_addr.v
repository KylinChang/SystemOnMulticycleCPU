`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:02 07/13/2015 
// Design Name: 
// Module Name:    vga_addr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga_addr(
input wire mode,
input wire GPIOvga_we,
input wire[15:0] fontmode_addr,
input wire[15:0] graphmode_addr,
output reg[15:0] vram_addr
    );

always@* begin
	
	if(mode==1) 
		vram_addr=fontmode_addr;
	else
		vram_addr=graphmode_addr;
end


endmodule
