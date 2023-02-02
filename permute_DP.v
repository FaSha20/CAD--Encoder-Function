
`timescale 1ns/1ns
module permute_DP (
    clk,
    rd
);
    input clk;
    input rd;
	
    wire [0:24] in_mem [0:63];


    per_reader prd(clk, rd, in_mem);

    permuter pr(clk,in_mem);

endmodule