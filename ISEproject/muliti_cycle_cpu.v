`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:43 04/28/2012 
// Design Name: 
// Module Name:    single_cycle_Cpu_9 
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
module Muliti_CPU(input clk,							//muliti_CPU
						input reset,
						input MIO_ready,
								
						output[31:0] PC_out,		   	//TEST
						output[31:0] inst_out,			//TEST
						output mem_w,
						output[31:0] Addr_out,
						output[31:0] Data_out, 
						input [31:0] Data_in,
						output CPU_MIO,
						input INT,
						output[4:0]state					//Test
					  );

wire zero,overflow,MemRead,MemReada,MemWrite;
wire IorD,IRWrite,RegWrite,ALUSrcA,PCWrite,PCWriteCond;
wire Branch;
wire[1:0] RegDst,MemtoReg,PCSource,ALUSrcB;
wire[2:0] ALU_operation;
//wire[31:0] inst_in;

assign MemReada=~MemRead;
assign mem_w=MemReada&MemWrite;

ctrl U11(
.clk(clk),
.reset(reset),
.zero(zero),
.overflow(overflow),
.MIO_ready(MIO_ready),
.Inst_in(inst_out[31:0]),

.MemRead(MemRead),
.MemWrite(MemWrite),
.CPU_MIO(CPU_MIO),
.IorD(IorD),
.IRWrite(IRWrite),
.RegWrite(RegWrite),
.ALUSrcA(ALUSrcA),
.PCWrite(PCWrite),
.PCWriteCond(PCWriteCond),
.Branch(Branch),
.RegDst(RegDst[1:0]),
.MemtoReg(MemtoReg[1:0]),
.ALUSrcB(ALUSrcB[1:0]),
.PCSource(PCSource[1:0]),
.ALU_operation(ALU_operation[2:0]),
.state_out(state[4:0])
);
								  

data_path U1_2(
.clk(clk),
.reset(reset),
.MIO_ready(MIO_ready),
.IorD(IorD),
.IRWrite(IRWrite),
.RegWrite(RegWrite),
.ALUSrcA(ALUSrcA),
.PCWrite(PCWrite),
.PCWriteCond(PCWriteCond),
.Branch(Branch),
.RegDst(RegDst[1:0]),
.MemtoReg(MemtoReg[1:0]),
.ALUSrcB(ALUSrcB[1:0]),
.PCSource(PCSource[1:0]),
.ALU_operation(ALU_operation[2:0]),
.data2CPU(Data_in[31:0]),

.zero(zero),
.overflow(overflow),
.PC_Current(PC_out[31:0]),
.Inst_R(inst_out[31:0]),
.data_out(Data_out[31:0]),
.M_addr(Addr_out[31:0])
);

endmodule




