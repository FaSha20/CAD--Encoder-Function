`timescale 1ns/1ns
module file_writer (clk, rst, en, pin, co);
  
  input clk;
  input rst;
  input en;
  input pin;
  input co;
  
  integer fd;         // file handler  

  initial begin
    fd = $fopen("./file/colpar_out.txt", "w"); 
  end

  always @(posedge clk) begin
    if(en) begin
      $fwriteb(fd, pin);
      if(co)
        $fdisplay(fd, "");    
    end    
  end

endmodule
