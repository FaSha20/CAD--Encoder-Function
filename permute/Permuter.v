`timescale 1ns/1ns
module Permuter (
    p_in,

    p_out
);

    input [24:0] p_in;

    output [24:0] p_out;

    genvar i, j;

    generate 
        for(j = 0; j < 5; j=j+1)
            for(i = 0; i < 5; i=i+1)
                assign p_out[(((j+3)%5)+2)%5 + 5*(((2*(i+3)%5 + 3*(j+3)%5)+2)%5)] = p_in[i+5*j];
    endgenerate
    
endmodule
