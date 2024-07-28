module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF m1 (
        .w(LEDR[1]),
        .e(KEY[1]),
        .r(SW[0]),
        .clk(KEY[0]),
        .l(KEY[2]),
        .q(LEDR[0])
    );
    MUXDFF m2 (
        .w(LEDR[2]),
        .e(KEY[1]),
        .r(SW[1]),
        .clk(KEY[0]),
        .l(KEY[2]),
        .q(LEDR[1])
    );
    MUXDFF m3 (
        .w(LEDR[3]),
        .e(KEY[1]),
        .r(SW[2]),
        .clk(KEY[0]),
        .l(KEY[2]),
        .q(LEDR[2])
    );
    MUXDFF m4 (
        .w(KEY[3]),
        .e(KEY[1]),
        .r(SW[3]),
        .clk(KEY[0]),
        .l(KEY[2]),
        .q(LEDR[3])
    );

endmodule

module MUXDFF (
	input w,
    input e,
    input r,
    input clk,
    input l,
    output reg q
);
    always @ (posedge clk) begin
        if(l)
            q <= r;
        else if(e)
            q <= w;
        else 
            q <= q;
    end
endmodule
