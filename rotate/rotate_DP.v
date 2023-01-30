module rotate_DP(
	clk, 
	rd, 
	co
);
	input clk;
	input rd;
	output co;
	
	wire [0:24] in_mem [0:63];

	rot_reader rdd(clk, rd, in_mem);

	shift_reg shr(clk, in_mem, co);

endmodule