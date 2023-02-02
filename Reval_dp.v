`include "ISA.v"

module RevaluateDP(
    input clk,
    input rst,
    input count,
    input write,
    input read,
    output done
);
    wire [2:0] i;
    wire i_overflow;
    wire [0:`NUM_CELLS - 1] data_out;
    wire [0:`NUM_CELLS - 1] data_in;
    integer x, fd;

    

    rev_reader rrd(clk, read, data_in);

    Counter #(.WORD_LENGTH(3)) i_counter(
        .clk(clk),
        .rst(rst),
        .en(count),
        .max(3'd`NUM_ROW),//4

        .overflow(i_overflow),
        .out(i)
    );

    wire [2:0] j;
    wire j_overflow;
    Counter #(.WORD_LENGTH(3)) j_counter(
        .clk(clk),
        .rst(rst),
        .en(i_overflow),
        .max(3'd`NUM_COLUMN), //4

        .overflow(j_overflow),
        .out(j)
    );

    wire [5:0] k;
    Counter #(.WORD_LENGTH(6)) k_counter(
        .clk(clk),
        .rst(rst),
        .en(j_overflow),
        .max(6'd`NUM_PAGE),

        .overflow(done),
        .out(k)
    );

    wire current_cell, next_cell, next_next_cell;
    MUX3Dto1 cell_mux(
        .mat(data_in),
        .i(i),
        .j(j),
        .k(k),

        .out(current_cell)
    );

    wire [2:0] ii = (i + 1) % `NUM_ROW;
    MUX3Dto1 next_cell_mux(
        .mat(data_in),
        .i(ii),
        .j(j),
        .k(k),

        .out(next_cell)
    );

    wire [2:0] iii = (i + 2) % `NUM_ROW;
    MUX3Dto1 next_next_cell_mux(
        .mat(data_in),
        .i(iii),
        .j(j),
        .k(k),

        .out(next_next_cell)
    );

    wire [`LEN_ADDRESS - 1:0] address_in = k * `NUM_ROW * `NUM_COLUMN + j * `NUM_ROW + i;
    Memory memory(
        .clk(clk),
        .rst(rst),
        .mem_write(write),
        .address_in(address_in),
        .data_in(current_cell ^ (~next_cell & next_next_cell)),

        .data_out(data_out)
    );


	always @(posedge clk)begin
	fd = $fopen("./file/revaluate_out.txt", "w");
    	$fwriteb(fd, data_out[0:24]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[25:49]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[50:74]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[75:99]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[100:124]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[125:149]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[150:174]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[175:199]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[200:224]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[225:249]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[250:274]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[275:299]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[300:324]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[325:349]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[350:374]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[375:399]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[400:424]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[425:449]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[450:474]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[475:499]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[500:524]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[525:549]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[550:574]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[575:599]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[600:624]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[625:649]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[650:674]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[675:699]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[700:724]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[725:749]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[750:774]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[775:799]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[800:824]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[825:849]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[850:874]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[875:899]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[900:924]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[925:949]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[950:974]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[975:999]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1000:1024]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1025:1049]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1050:1074]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1075:1099]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1100:1124]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1125:1149]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1150:1174]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1175:1199]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1200:1224]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1225:1249]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1250:1274]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1275:1299]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1300:1324]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1325:1349]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1350:1374]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1375:1399]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1400:1424]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1425:1449]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1450:1474]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1475:1499]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1500:1524]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1525:1549]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1550:1574]);
    	$fdisplay(fd, "");
	$fwriteb(fd, data_out[1575:1599]);
    	$fdisplay(fd, "");
	
	$fclose(fd);	
   	end

endmodule
