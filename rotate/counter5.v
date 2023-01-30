module Counter5(
	clk,
	rst,
	up_cnt,
	co,
	out
);
	input clk, rst, up_cnt;
	output reg co;
	output reg[5:0] out;

	always @(posedge clk, posedge rst) begin

		if(rst)
			out <= 6'd0;

		else if(up_cnt) begin

			case(out)
			3'b011 : out <= 3'b100;
			3'b100 : out <= 3'b000;
			3'b000 : out <= 3'b001; 
			3'b001 : out <= 3'b010;
			default  out <= 3'b011;
			endcase
		end
		
	end

	assign co = (out == 3'b010);

endmodule
