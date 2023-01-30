`timescale 1ns/1ns

module TB();

	reg start = 1'b0, clk = 1'b0,rst = 1'b1;
	
	wire[1:0] ps, ns;
	wire co,  ready, rd;
	

	rotate_DP dp(clk, rd, co);
	
	rotate_CU cu(clk, rst, start, co, ready, rd, ps, ns);	
	
		
	always #20 clk = ~clk;
	initial begin
		#20 rst = 1'b0;
		#20 start = 1'b1;
		#30 start = 1'b0;
		#2000
		#30 $stop;
	end

endmodule
