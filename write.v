`timescale 1ns/1ns
module writer (clk, en, pin);
  
  input clk;
  input en;
  input [0:24] pin [0:63];
  
  integer fd,x;         // file handler  
  always @(posedge clk)begin

   if(en)begin

	fd = $fopen("./file/output_0.out", "w");
        for (x = 0; x<64; x=x+1)begin
	    $fwriteb(fd, pin[x]);
	    $fdisplay(fd, "");
	end
	$fclose(fd);
   end

  end

endmodule

