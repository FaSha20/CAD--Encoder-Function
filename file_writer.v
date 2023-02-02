`timescale 1ns/1ns
module file_writer (clk, rst, en, pin, co, co64);
  
  input clk;
  input rst;
  input en;
  input pin;
  input co;
  input co64;
  
  integer fd;         // file handler  

  initial begin
    fd = $fopen("./file/colpar_out.txt", "w"); 
  end

  always @(posedge clk) begin
    
    if(en) begin
      $fwriteb(fd, pin);
      if(co) begin
        $fdisplay(fd, "");
	if(co64)
        $fclose(fd);	
	end    
    end  
    //$display(co64);
    //if(co64)
	//$fclose(fd);  
  end

endmodule
