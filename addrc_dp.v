module addrc_DP(clk,rst,ld,loop_num);

    input clk,rst ;
    input[0:4]loop_num;
    wire [0:24] in_mem [0:63] ;
    output   ld;
    reg [0:63] RC [0:23]; 
    reg [0:63] rc;
    reg [0:63] xor_out;
    integer x,fd,j;
    reg [0:5] index = 6'd0;

    initial begin 
        RC[0] = 64'h0000000000000001;
        RC[1] = 64'h0000000000008082;
        RC[2] = 64'h800000000000808A;
        RC[3] = 64'h8000000080008000;
        RC[4] = 64'h000000000000808B;
        RC[5] = 64'h0000000080000001;
        RC[6] = 64'h8000000080008081;
        RC[7] = 64'h8000000000008009;
        RC[8] = 64'h000000000000008A;
        RC[9] = 64'h0000000000000088;
        RC[10] = 64'h0000000080008009;
        RC[11] = 64'h000000008000000A;
        RC[12] = 64'h000000008000808B;
        RC[13] = 64'h800000000000008B;
        RC[14] = 64'h8000000000008089;
        RC[15] = 64'h8000000000008003;
        RC[16] = 64'h8000000000008002;
        RC[17] = 64'h8000000000000080;
        RC[18] = 64'h000000000000800A;
        RC[19] = 64'h800000008000000A;
        RC[20] = 64'h8000000080008081;
        RC[21] = 64'h8000000000008080;
        RC[22] = 64'h0000000080000001;
        RC[23] = 64'h8000000080008008;
    end
	
    assign rc = RC[loop_num];

    addrc_read adrc(clk, ld,in_mem);
	
    genvar i ;
    generate       

        for (i = 0 ; i < 64 ; i = i + 1 ) begin 
	    assign xor_out[i] = rc[i] ^ in_mem[i][12];
        end

    endgenerate
	
    always @(posedge clk)begin
	fd = $fopen("./file/output_0.out", "w");
        for (x = 0; x<64; x=x+1)begin
		for (j = 0; j<25; j=j+1)begin
			if(j==12)begin
				$fwriteb(fd, xor_out[x]);
			end
			else
    	     			$fwriteb(fd, in_mem[x][j]);
		end
    	     $fdisplay(fd, "");
	end
	$fclose(fd);	
   end

endmodule







