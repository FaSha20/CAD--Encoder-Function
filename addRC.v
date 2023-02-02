module addRC(
	clk,
	rst,
	start,
	loop_num,
	ready
);
	input clk, rst, start;
	input[0:4] loop_num;
	output ready;
	wire ld;
 
   	addrc_DP dp(clk,rst,ld,loop_num);

	addrc_CU cu(clk,rst,start,ready,ld);	
	
endmodule