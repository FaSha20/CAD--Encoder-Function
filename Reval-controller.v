`include "ISA.v"

module RevaluateCU(
    input clk,
    input rst,
    input start,
    input datapath_done,

    output reg dataset_reset,
	output reg done,
	output reg write,
	output reg read,
	output reg count
);
    
    reg [`LEN_STATE - 1:0] ns, ps;
    parameter [`LEN_STATE - 1:0]
        IDLE = 0,
	READ = 4,
        START = 1,
        COUNT = 2,
        DONE = 3;

    always @(posedge clk, posedge rst) begin
        if (rst) ps <= IDLE;
        else ps <= ns;
    end

    always @ (ps, start, datapath_done) begin
        case (ps)
            IDLE      : ns = start ? READ : IDLE;
	    READ      : ns = START;
            START     : ns = COUNT;
            COUNT     : ns = datapath_done ? DONE : COUNT;
            DONE      : ns = IDLE;
            default: ns = IDLE;
        endcase
    end

    always @ (ps) begin
        dataset_reset = `DISABLE;
        done = `DISABLE;
        write = `DISABLE;
	read = `DISABLE;
        count = `DISABLE;
        case (ps)
            IDLE: begin
                dataset_reset = `ENABLE;
            end
	    READ: begin
                read = `ENABLE;
            end
            START: begin
                write = `ENABLE;
            end
            COUNT: begin
                write = `ENABLE;
                count = `ENABLE;
            end
            DONE: begin
                done = `ENABLE;
            end
        endcase
    end
endmodule
