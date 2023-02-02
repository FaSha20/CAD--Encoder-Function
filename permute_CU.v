`timescale 1ns/1ns
module permute_CU (
    clk,
    rst,
    start,
    
    ready,
    rd
);  
    input clk, rst;
    input start;
    output reg ready, rd;
	
    reg [1:0] ps, ns;

    parameter [1:0] 
        IDLE = 2'd0,
        READ = 2'd1,
	DO = 2'd2;

    
    always @(ps, start) begin
        case (ps)
            IDLE:  ns = start ? READ : IDLE;
            READ:  ns = DO;
	    DO: ns = IDLE;
            default: ns = IDLE;
        endcase
    end

    always @(ps) begin
        {ready, rd} = 0;
        case (ps)
            IDLE: ready = 1'b1;
            READ: rd = 1'b1;
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if(rst)
            ps <= IDLE;
        else
            ps <= ns;
    end


endmodule