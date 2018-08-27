`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/27 15:25:25
// Design Name: 
// Module Name: tb_odd_fre
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


module tb_odd_fre(
	
    );
		reg     clk_i;
		reg     rst_n;
		wire    clk_div;
		
		
	odd_fre odd_fre_inst(
	    .clk_i(clk_i),
	    .rst_n(rst_n),
	    .clk_div(clk_div)
    );
	
	always #1  clk_i = ~clk_i;
	
	initial begin
		clk_i = 0;
		rst_n = 0;
		#100
		rst_n =1;
 	end
		
endmodule
