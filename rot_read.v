`timescale 1ns/1ns
module rot_reader(clk, ld, pout);
  
  input clk;
  input ld;
  output reg [0:24] pout [0:63];
  
  always @(posedge clk) begin
      if(ld) begin
        $readmemb("./file/colpar_out.txt", pout);
      end
   end
   
endmodule


   