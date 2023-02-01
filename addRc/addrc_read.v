`timescale 1ns/1ns
module addrc_read(clk,ld,out);

  input clk;
  input ld;
  output reg [0:24] out [0:63];
  //output reg [0:1599]in ;


  always @(posedge clk) begin

      if(ld) 
        $readmemb("./input2.txt", out);

  end
    
endmodule

