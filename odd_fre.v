`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/27 15:11:36
// Design Name: 
// Module Name: odd_fre
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


module odd_fre(
	input            clk_i,
	input            rst_n,
	output			 clk_div
    );
	localparam        DIV_ODD = 7;
	reg  [3:0]        Count_r1_p;
	reg  [3:0]        Count_r2_n;
	always @(posedge clk_i)
		if(!rst_n)
			Count_r1_p <= 0;
		else if(Count_r1_p == DIV_ODD-1)
			Count_r1_p <= 0;
		else 	
			Count_r1_p <=  Count_r1_p + 1;
	
	always @(negedge clk_i)
		if(!rst_n)
			Count_r2_n <= 0;
		else if(Count_r2_n == DIV_ODD-1)
			Count_r2_n <= 0;
		else 	
			Count_r2_n <=  Count_r2_n + 1;
	wire clk1_p;
	wire clk1_n;
	assign clk1_p = (Count_r1_p <= (DIV_ODD-1)/2) ? 1 : 0;
	assign clk1_n = (Count_r2_n <= (DIV_ODD-1)/2) ? 1 : 0;
	assign clk_div = clk1_n && clk1_p;
endmodule
