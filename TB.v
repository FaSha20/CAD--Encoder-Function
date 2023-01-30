`timescale 1ns/1ns

module TB();

	reg start = 1'b0, clk = 1'b0,rst = 1'b1, ld = 1'b0, ld2 = 1'b0;
	wire start_par, start_rot, start_per, start_rev, start_RC;
	wire ready_par, ready_rot, ready_per, ready_rev, ready_RC;
	wire[3:0] ps, ns;
	wire ld_fw, ld_fr;

DataPath dp(
	clk,
	rst, 
	start_par,
	start_par,
    	start_rot, 
    	start_per,  
    	start_rev, 
    	start_RC,
	ld_fr, 
	ld_fw,

	ready_par, 
	ready_rot, 
	ready_per, 
	ready_rev, 
	ready_RC
);

controller cu(
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
    ld_fr, 
    ld_fw,
    ps,
    ns
);  
	
	//col_parity cpar(clk, rst, start, ready);
		
	always #20 clk = ~clk;
	initial begin
		#20 rst = 1'b0;
		#20 start = 1'b1;
		#30 start = 1'b0;
		//#25 ld2 = 1'b1;
		#2000000
		#30 $stop;
	end

endmodule