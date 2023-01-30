module shift_reg(
	clk,
	in_mem,
	co
);
	input clk;
	input[0:24] in_mem [0:63];
	output reg co;
	
	integer k, i, x, fd;
	reg [0:24] buffer [0:63];
	reg [0:5]shift;
	
	//dcder dcd(i, shift);

	initial begin
		for(i = 0; i < 64; i= i+1) begin
			buffer[i] = 25'd0;
    		end
		for(i=0;i<25;i=i+1)begin
			shift = (i == 5'd0) ? 6'd21:
		(i == 5'd1 ) ? 6'd8:
		(i == 5'd2 ) ? 6'd41:
		(i == 5'd3 ) ? 6'd45:
		(i == 5'd4 ) ? 6'd15:
		(i == 5'd5 ) ? 6'd56:
		(i == 5'd6 ) ? 6'd14:
		(i == 5'd7 ) ? 6'd18:
		(i == 5'd8 ) ? 6'd2:
		(i == 5'd9 ) ? 6'd61:
		(i == 5'd10 ) ? 6'd28:
		(i == 5'd11) ? 6'd27:
		(i == 5'd12) ? 6'd0:
		(i == 5'd13) ? 6'd1:
		(i == 5'd14) ? 6'd62:
		(i == 5'd15) ? 6'd55:
		(i == 5'd16) ? 6'd20:
		(i == 5'd17) ? 6'd36:
		(i == 5'd18) ? 6'd44:
		(i == 5'd19) ? 6'd6:
		(i == 5'd20) ? 6'd25:
		(i == 5'd21) ? 6'd39:
		(i == 5'd22) ? 6'd3:
		(i == 5'd23) ? 6'd10:
		(i == 5'd24) ? 6'd43: 6'd0;
			co = 1'b0;
			$display(shift);
			for(k=0;k<64;k=k+1)begin
				buffer[k][i] = in_mem[(k - shift + 64)%64][i];
			end
			if(i == 24)begin
				co = 1'b1;        
				fd = $fopen("./rotate_out.txt", "w");
           			for (x = 0; x<64; x=x+1)begin
					$fwriteb(fd, buffer[x]);
					$fdisplay(fd, "");
				end
				$fclose(fd);
			end
		end
	end
  	 
 

endmodule
