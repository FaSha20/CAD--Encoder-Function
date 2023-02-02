`timescale 1ns/1ns
module rev_reader(clk, ld, pout);
  
  input clk;
  input ld;
  output reg [0:1599] pout;

  reg [0:24] in_mem [0:63];
  
  always @(posedge clk) begin
      if(ld) begin
	$display(ld);
        $readmemb("./file/permute_out.txt", in_mem);
      end
  end

  assign pout = { in_mem[0], in_mem[1],in_mem[2], in_mem[3],in_mem[4], in_mem[5],in_mem[6], in_mem[7],
                in_mem[8], in_mem[9],in_mem[10], in_mem[11],in_mem[12], in_mem[13],in_mem[14], in_mem[15],
                in_mem[16], in_mem[17],in_mem[18], in_mem[19],in_mem[20], in_mem[21],in_mem[22], in_mem[23],
                in_mem[24], in_mem[25],in_mem[26], in_mem[27],in_mem[28], in_mem[29],in_mem[30], in_mem[31],
                in_mem[32], in_mem[33],in_mem[34], in_mem[35],in_mem[36], in_mem[37],in_mem[38], in_mem[39],
                in_mem[40], in_mem[41],in_mem[42], in_mem[43],in_mem[44], in_mem[45], in_mem[46],in_mem[47],
                in_mem[48], in_mem[49],in_mem[50], in_mem[51],in_mem[52], in_mem[53],in_mem[54], in_mem[55],
                in_mem[56], in_mem[57],in_mem[58], in_mem[59],in_mem[60], in_mem[61],in_mem[62], in_mem[63]};
  
   
endmodule


   
