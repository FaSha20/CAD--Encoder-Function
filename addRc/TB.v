`timescale 1ns/1ns

module TB();

	reg start = 1'b0, clk = 1'b0,rst = 1'b1;
	
	wire ready, ld;


	datapath dp(clk,rst,ld);

	controller cu(clk,rst,start,ready,ld);	
	
		
	always #20 clk = ~clk;
	initial begin
		#20 rst = 1'b0;
		#20 start = 1'b1;
		#30 start = 1'b0;
		#3000

		#30 $stop;
	end

endmodule
