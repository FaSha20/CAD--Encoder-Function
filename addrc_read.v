`timescale 1ns/1ns
module addrc_read(clk,ld,out);

  input clk;
  input ld;
  output reg [0:24] out [0:63];

  always @(posedge clk) begin

      if(ld) 
        $readmemb("./file/revaluate_out.txt", out);

  end
    
endmodule

