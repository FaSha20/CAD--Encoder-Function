module datapath(clk,rst,ld);

    input clk,rst ;
    wire [0:24] in_mem [0:63] ;
    output   ld;
    reg [63:0] RC [23:0];
    
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
     addrc_read adrc(clk, ld,in_mem);

    genvar i ;
    generate       

        for (i = 0 ; i < 24 ; i = i + 1 ) begin : sth1
            xor_part xo1(clk,in_mem,RC[i]);
        end

    endgenerate

endmodule



module xor_part (clk,in_mem,RC);

input clk;
input [0:24] in_mem [0:63];
input [0:63] RC ;

reg done;
reg extra,test;
reg [0:24] buffer [0:63];
integer z;
integer i,fd,j,a;

always @(posedge clk) begin

    for (j = 0 ; j < 64 ; j = j + 1) begin
            extra = in_mem[j][12];
            for (z = 0 ; z < 64 ; z = z + 1 ) begin 
                //fd = $fopen("./addrc_out.txt", "w");
                //for (i = 0;i < 64 ; i = i + 1 ) begin    
                //extra = in_mem[j][12];
                extra = extra ^ RC[z];
                    //done = 1'b1 ;
            end
            fd = $fopen("./addrc_out.txt", "w");
            for (i = 0;i < 64; i = i + 1 ) begin
                //for (a = 0 ; a < 25 ; a = a + 1) begin
                    if (i == 12 ) begin 

                        buffer[j][i] = extra ;
                
                    end 
                    else begin
                        buffer[j][i] = in_mem[j][i];
                    end
                    $fwriteb(fd, buffer[i]);
                    $fdisplay(fd, "");
                //end
            end
            
            $fclose(fd);
    end
end
endmodule 





module sth (input clk,rst,input [0:1599]in , input [0:63] RC , output reg [1599:0] out);



integer z;

integer i;

always @(posedge clk) begin



        for (z = 0 ; z < 64 ; z = z + 1 ) begin 



            for (i = 13 ; i < 1600 ; i = i + 25 ) begin 

                out[i] = in[i] ^ RC[z];

            end

	end

end



assign out = in ;



endmodule 



/*

module RC (input clk,rst, output reg [23:0] RC [64:0]);



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

        RC[19] = 64'h000000008000000A;

        RC[20] = 64'h8000000080008081;

        RC[21] = 64'h8000000000008080;

        RC[22] = 64'h0000000080000001;

        RC[23] = 64'h8000000080008008;



    end

	

endmodule

*/




