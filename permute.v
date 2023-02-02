module permute(
	clk,
	rst,
	start,
	ready
);
	input clk, rst, start;
	output ready;
	wire rd;
 
	permute_DP dp(clk, rd);
	
	permute_CU cu(clk, rst, start, ready, rd);	

endmodule

