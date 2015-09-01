`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:02 03/06/2015 
// Design Name: 
// Module Name:    keyboard 
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
module keyboard(
			input clk25,
			input PS2C,
			input PS2D,
			output reg[31:0] xkey
			);
	
//	reg[1:0] PS2CF;
//	reg[3:0] counter;
//	reg[10:0] temp;
//   
//	initial begin
//		PS2CF = 2'b00;
//		counter = 4'b0000;
//		temp[10:0] = 11'b000_0000_0000;
//	end
//	
//	always@(posedge clk25) begin
//				PS2CF[1:0]={PS2CF[0],PS2C};
//				if(PS2CF[1]==1 && PS2CF[0]==0) begin
//					if(counter<11) begin
//						temp[10:0]={PS2D,temp[10:1]};
//						counter=counter+1;
//					end
//					else begin
//						xkey[31:0]={xkey[23:0],temp[8:1]};
//					end
//				end
//	end
	wire ready;
	reg[7:0] fifo[7:0];
	wire[7:0] data;
	reg[9:0] buffer;
	reg[3:0] count;
	reg[2:0] w_ptr, r_ptr;
	reg[1:0] ps2_clk_sync;
	wire sampling;
	assign sampling=ps2_clk_sync[1] & ~ps2_clk_sync[0];
	always@(posedge clk25) begin
		ps2_clk_sync <= {ps2_clk_sync[0],PS2C};
		if(sampling) begin
			if(count==4'd10) begin
				if(buffer[0]==0 && (PS2D) && (^buffer[9:1])) begin
					if(w_ptr+3'b1 != r_ptr) begin
						fifo[w_ptr] <= buffer[8:1];
						w_ptr <= w_ptr + 3'b1;
					end
				end
				count <= 0;
			end
			else begin
				buffer[count] <= PS2D;
				count <= count + 4'b1;
			end
		end
		
		if(ready) begin
			r_ptr <= r_ptr + 3'b1;
			xkey[31:0] <= {xkey[23:0],data[7:0]};
		end
		
	end
	
	assign ready = (w_ptr != r_ptr);
	assign data = fifo[r_ptr];
	
endmodule
