`timescale 1ns/1ns
module Controller (
    clk,
    rst,
    start,
    ready_par, 
    ready_rot, 
    ready_per,  
    ready_rev,
    ready_RC,
    
    ready,
    start_par,
    start_rot, 
    start_per,  
    start_rev, 
    start_RC,
    ps,
    ns
);  
    input clk, rst;
    input start;
    input ready_par, 
	ready_rot, 
	ready_per, 
	ready_rev, 
	ready_RC;
    output reg ready,
    start_par,
    start_rot, 
    start_per, 
    start_rev, 
    start_RC;
	
    output reg [3:0] ps, ns;

    parameter [3:0] 
        IDLE = 4'd0,
        READ = 4'd1,
	COL = 4'd2,
        COL_PARITY = 4'd3,
	ROT = 4'd4,
	ROTATE = 4'd5,
	PER = 4'd6,
        PERMUTE = 4'd7,
	REV = 4'd8,
        REVALUATE = 4'd9,
	RC = 4'd10, 
	ADD_RC = 4'd11,
	WRITE = 4'd12;

    
    always @(ps, start, ready_par, ready_rot, ready_per, ready_rev, ready_RC) begin
        case (ps)
            IDLE:  ns = start ? COL : IDLE;
	    COL: ns = ready_par ? COL : COL_PARITY;
	    COL_PARITY:  ns = ready_par ? ROT : COL_PARITY; 
	    ROT: ns = ready_rot ? ROT : ROTATE ;	
 	    ROTATE:  ns = ready_rot ? PER : ROTATE;
	    PER: ns = ready_per ? PER : PERMUTE;
	    PERMUTE:  ns = ready_per ? REV : PERMUTE;
	    REV: ns = ready_rev ? REV : REVALUATE;
  	    REVALUATE:  ns = ready_rev ? RC : REVALUATE;
   	    RC: ns = ready_RC ? RC : ADD_RC;
	    ADD_RC:  ns = ready_RC ? IDLE : ADD_RC;
            default: ns = IDLE;
        endcase
    end

    always @(ps) begin
        {ready, start_par, start_rot, start_per, start_rev, start_RC} = 0;
        case (ps)
            IDLE: ready = 1'b1;
	    COL: start_par = 1'b1;
 	    ROT: start_rot = 1'b1;
	    PER: start_per = 1'b1;
  	    REV: start_rev = 1'b1;
	    RC: start_RC = 1'b1;
        endcase
    end

    always @(posedge clk, posedge rst) begin
        if(rst)
            ps <= IDLE;
        else
            ps <= ns;
    end


endmodule
