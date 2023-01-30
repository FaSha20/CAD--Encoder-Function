`timescale 1ns/1ns
module DataPath(
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

  input clk, rst, ld_fr, ld_fw, start_par, start_rot, start_per, start_rev, start_RC;
  output ready_par, ready_rot, ready_per, ready_rev, ready_RC;

/* 
  reg [0:24] file2par [0:63];
  wire [0:24] par2rot [0:63];
  wire [0:24] rot2per [0:63];
  wire [0:24] per2rev [0:63];
  wire [0:24] rev2rc [0:63];
  wire [0:24] rc2file [0:63];
             
 file_reader FileR(
                    .clk(clk), 
                    .ld(ld_fr),
                    .pout(file2par)
                    );                
*/
  col_parity cpar(clk, rst, start_par, ready_par);
/*
  rotate(clk, rst, start_rot, ready_rot, .in_mem(par2rot), .out_mem(rot2per));

  permute(clk, rst, start_per, ready_per, .in_mem(rot2per), .out_mem(per2rev));

  revaluate(clk, rst, start_rev, ready_rev, .in_mem(per2rev), .out_mem(rev2rc));

  add_RC(clk, rst, start_rc, ready_rc, .in_mem(rev2rc), .out_mem(rc2file));
 
  
  file_writer FileW(
                    .clk(clk), 
                    .ld(ld_fw), 
                    .pin(rc2file), 
                    );
 */ 
endmodule

