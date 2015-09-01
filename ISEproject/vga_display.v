`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:55 06/20/2015 
// Design Name: 
// Module Name:    vga_display 
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
module vga_display(
input wire mode,
input wire font_data,

input wire vidon,
input wire[9:0] hc,
input wire[9:0] vc,
input wire[7:0] M,
//output wire[15:0] graph_addr,
output wire[10:0] x,
output wire[10:0] y,
output reg[2:0] red,
output reg[2:0] green,
output reg[1:0] blue,
output reg enable
    );

parameter hbp=144;
parameter vbp=31;
parameter width=640;
parameter height=480;
parameter initx=80;
parameter inity=80;

//wire[10:0] xpix,ypix,x,y;
reg R,G,B;

assign x=hc-hbp;
assign y=vc-vbp;
//assign xpix=x/2;
//assign ypix=y/2;
//
//assign graph_addr[15:0]={ypix,7'b000_0000}+{1'b0,ypix,6'b00_0000}+{2'b00,ypix,5'b0_0000}+{3'b000,ypix,4'b0000}+{8'b0000_0000,xpix};

always@* begin
	if(hc >= hbp && hc < hbp+width && vc >= vbp && vc < vbp+height)
		enable <= 1;
	else 
		enable <= 0;
end

always@* begin
	red = 0;
	green = 0;
	blue = 0;
	if(mode == 0)begin
		if(enable == 1 && vidon == 1) begin
			red = M[7:5];
			green = M[4:2];
			blue = M[1:0];
		end
	end
	else begin
		if(enable==1 && vidon==1) begin
			if(font_data==1) begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			else begin
				red = 3'b000;
				green = 3'b000;
				blue = 2'b00;
			end
		end
	end
end

endmodule
