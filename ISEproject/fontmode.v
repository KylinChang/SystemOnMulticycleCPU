`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:06 08/31/2015 
// Design Name: 
// Module Name:    fontmode 
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
module fontmode(
input wire clk,
input wire GPIOvga_we,
input wire[15:0] vram_waddr,
input wire[10:0] x,
input wire[10:0] y,
output reg[15:0] vram_addr
    );

always@(negedge clk) begin
	if(GPIOvga_we)
			vram_addr[15:0] = vram_waddr[15:0];
	else
			vram_addr[15:0] = {2'b00,y[10:3],6'b00_0000}+{4'b0000,y[10:3],4'b0000}+{8'b0000_0000,x[10:3]};
end

endmodule
