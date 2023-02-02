`timescale 1ns/1ns
module counter24 (clk, rst, cnt_up, co, cnt);
	
	parameter N = 5;
	input clk;
	input rst;
	input cnt_up;
	output co;
	output reg [N-1:0] cnt;
	
	always @ (posedge clk, posedge rst) begin
		if (rst) 
			cnt <= 0;
		if (cnt_up)
			cnt <= cnt + 1;
	end

	assign co = (cnt == 23) ? 1'b1 : 1'b0;
endmodule



