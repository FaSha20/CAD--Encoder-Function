module shift_reg(
	clk,
	in_mem
);
	input clk;
	input[0:24] in_mem [0:63];
	
	integer x, fd;
	reg [0:24] buffer [0:63];
	reg [0:6]shift;
	
	genvar p, k;
	generate 

        for(k = 0; k < 64; k=k+1)
            for(p = 0; p < 25; p=p+1)begin
		
                assign buffer[k][p] = (p == 0 ) ? in_mem[(k - 21 + 7'd64)%64][p]:
				      (p == 1 ) ? in_mem[(k - 8 + 7'd64)%64][p]:
				      (p == 2 ) ? in_mem[(k - 41 + 7'd64)%64][p]:
				      (p == 3 ) ? in_mem[(k - 45 + 7'd64)%64][p]:
				      (p == 4 ) ? in_mem[(k - 15 + 7'd64)%64][p]:
				      (p == 5 ) ? in_mem[(k - 56 + 7'd64)%64][p]:
				      (p == 6 ) ? in_mem[(k - 14 + 7'd64)%64][p]:
				      (p == 7 ) ? in_mem[(k - 18 + 7'd64)%64][p]:
				      (p == 8 ) ? in_mem[(k - 2 + 7'd64)%64][p]:
				      (p == 9 ) ? in_mem[(k - 61 + 7'd64)%64][p]:
				      (p == 10 ) ? in_mem[(k - 28 + 7'd64)%64][p]:
  				      (p == 11 ) ? in_mem[(k - 27 + 7'd64)%64][p]:
				      (p == 12 ) ? in_mem[(k - 0 + 7'd64)%64][p]:
				      (p == 13 ) ? in_mem[(k - 1 + 7'd64)%64][p]:
				      (p == 14 ) ? in_mem[(k - 62 + 7'd64)%64][p]:
				      (p == 15 ) ? in_mem[(k - 55 + 7'd64)%64][p]:
				      (p == 16 ) ? in_mem[(k - 20 + 7'd64)%64][p]:
				      (p == 17 ) ? in_mem[(k - 36 + 7'd64)%64][p]:
				      (p == 18 ) ? in_mem[(k - 44 + 7'd64)%64][p]:
				      (p == 19 ) ? in_mem[(k - 6 + 7'd64)%64][p]:
				      (p == 20 ) ? in_mem[(k - 25 + 7'd64)%64][p]:
				      (p == 21 ) ? in_mem[(k - 39 + 7'd64)%64][p]:
				      (p == 22 ) ? in_mem[(k - 3 + 7'd64)%64][p]:
				      (p == 23 ) ? in_mem[(k - 10 + 7'd64)%64][p]:
				      in_mem[(k - 43 + 7'd64)%64][p];
	    end
    endgenerate	 

    always @(posedge clk)begin
	fd = $fopen("./file/rotate_out.txt", "w");
        for (x = 0; x<64; x=x+1)begin
    	     $fwriteb(fd, buffer[x]);
    	     $fdisplay(fd, "");
	end
	$fclose(fd);	
   end


endmodule
