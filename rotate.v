module rotate(
	clk,
	rst,
	start,
	ready
);
	input clk, rst, start;
	output ready;
	wire rd;
 
	rotate_DP dp(clk, rd);
	
	rotate_CU cu(clk, rst, start, ready, rd);	

endmodule
