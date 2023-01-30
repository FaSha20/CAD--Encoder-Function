`timescale 1ns/1ns
module rot_reader(clk, ld, pout);
  
  parameter N = 25;
  parameter M = 64;
  input clk;
  input ld;
  output reg [0:24] pout [0:63];
  
  always @(posedge clk) begin
      if(ld)
        $readmemb("./colpar_out.txt", pout);
   end
   
endmodule


