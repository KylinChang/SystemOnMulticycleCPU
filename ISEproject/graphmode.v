`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:46 08/31/2015 
// Design Name: 
// Module Name:    graphmode 
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
module graphmode(
input wire clk,
input wire GPIOvga_we,
input wire[15:0] vram_waddr,

input wire[10:0] x,
input wire[10:0] y,
output reg[15:0] vram_addr,

input wire[31:0] bkm,
input wire[31:0] dragon,
input wire[31:0] thorn1
    );

reg[10:0] xpix,ypix;
reg[15:0] graph_addr;

parameter font_size=4800;
parameter dragon_size=1800;
parameter thorn_size=1250;

parameter bkg_width=320;
parameter bkg_height=120;
parameter dragon_width=40;
parameter dragon_height=45;
parameter thorn_width=25;
parameter thorn_height=50;
parameter black =49000;

always@(posedge clk) begin
	
	
		if(y>bkg_height || x>bkg_width) begin
			graph_addr[15:0] = black;
		end
		else if(y>=dragon[15:0] && y<dragon[15:0]+dragon_height && x>=dragon[30:16] && x<dragon[30:16]+dragon_width) begin
			xpix[10:0]=x[10:0]-dragon[26:16];
			ypix[10:0]=y[10:0]-dragon[10:0];
			if(dragon[31]==1) begin//front
				graph_addr[15:0]=font_size+{2'b00,ypix,5'b0_0000}+{4'b0000,ypix,3'b000}+{7'b000_0000,xpix};
			end
			else begin//back
				graph_addr[15:0]=font_size+dragon_size+{2'b00,ypix,5'b0_0000}+{4'b0000,ypix,3'b000}+{7'b000_0000,xpix};
			end
		end 
		else if(y>=thorn1[15:0] && y<thorn1[15:0]+thorn_height && x>=thorn1[31:16] && x<thorn1[31:16]+thorn_width)begin
			xpix[10:0]=x[10:0]-thorn1[26:16];
			ypix[10:0]=y[10:0]-thorn1[10:0];
			graph_addr[15:0]=font_size+dragon_size+dragon_size+{3'b000,ypix,4'b0000}+{4'b0000,ypix,3'b000}+{7'b000_0000,ypix}+{7'b000_0000,xpix};
		end
		else if(y>=0 && y<bkg_height && x>=0 && x<bkg_width) begin
			xpix[10:0]=x[10:0]+bkm[31:0];
			ypix[10:0]=y[10:0];
			graph_addr[15:0]=font_size+dragon_size+dragon_size+thorn_size+{1'b0,ypix,6'b00_0000}+{ypix,8'b0000_0000}+{7'b000_0000,xpix};
		end
		
			
		if(GPIOvga_we)
			vram_addr[15:0] = vram_waddr[15:0];
		else
			vram_addr[15:0] = graph_addr[15:0];
	end


endmodule
