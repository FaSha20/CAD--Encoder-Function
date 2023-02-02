
module permuter(
	clk,
	in_mem
);
	input clk;
	input[0:24] in_mem [0:63];
	
	integer x, fd;
	reg [0:24] buffer [0:63];
	
	genvar k, j, i;
	generate 

        for(k = 0; k < 64; k=k+1)
            for(j = 0; j < 5; j=j+1)
             	for(i = 0; i < 5; i=i+1)
                     assign buffer[k][(((j+3)%5)+2)%5 + 5*(((2*(i+3)%5 + 3*(j+3)%5)+2)%5)] = in_mem[k][i+5*j];

      	endgenerate	 

    always @(posedge clk)begin
	fd = $fopen("./file/permute_out.txt", "w");
        for (x = 0; x<64; x=x+1)begin
    	     $fwriteb(fd, buffer[x]);
    	     $fdisplay(fd, "");
	end
	$fclose(fd);	
   end


endmodule
