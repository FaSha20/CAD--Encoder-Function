`timescale 1ns/1ns

module TB();

	reg start = 1'b0, clk = 1'b0,rst = 1'b1;
	wire start_par,
    	start_rot, 
    	start_per,  
    	start_rev, 
    	start_RC,

	ready_par, 
	ready_rot, 
	ready_per, 
	ready_rev, 
	ready_RC,
	ready;
	wire[3:0]ps,ns;

    DataPath dp(
	clk,
	rst, 
	start_par,
    	start_rot, 
    	start_per,  
    	start_rev, 
    	start_RC,

	ready_par, 
	ready_rot, 
	ready_per, 
	ready_rev, 
	ready_RC
);

    Controller cu(
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
	
		
	always #2 clk = ~clk;
	initial begin
		#5 rst = 1'b0;
		#5 start = 1'b1;
		#10 start = 1'b0;
		#20000
		#30 $stop;
	end

endmodule
