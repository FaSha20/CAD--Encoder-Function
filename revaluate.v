`include "ISA.v"

module revaluate(
    input clk,
    input rst,
    input start,
    output done
);
    wire controller_reset_signal, controller_write_signal, controller_count_signal,read_signal;
    wire datapath_done_signal;
   
    RevaluateDP revaluate(
        .clk(clk),
        .rst(controller_reset_signal),
        .count(controller_count_signal),
        .write(controller_write_signal),
	.read(read_signal),
        .done(datapath_done_signal)        
    );
    RevaluateCU controller(
        .clk(clk),
        .rst(rst),
        .start(start),
        .datapath_done(datapath_done_signal),

        .dataset_reset(controller_reset_signal),
        .done(done),
        .write(controller_write_signal),
	.read(read_signal),
        .count(controller_count_signal)
    );
endmodule
