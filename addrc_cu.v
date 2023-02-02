module addrc_CU(input clk,rst,start,output reg ready,ld);
    reg [2:0] ns, ps;
    parameter [2:0]
        START = 0,
        READ = 1,
        DONE = 2;

    always @(posedge clk, posedge rst) begin
        if (rst) ps <= START;
        else ps <= ns;
    end

    always @ (ps, start) begin
        case (ps)
            START     : ns = start ? READ : START;
            READ     : ns = DONE;
            DONE      :ns =  START ;
            default: ns = START;
        endcase
    end

    always @ (ps) begin
        {ld,ready} = 1'b0;
        case (ps)
            START: begin
                ready = 1'b1;
            end
            READ: begin
                ld = 1'b1;
            end

        endcase
    end
endmodule
