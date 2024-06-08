module top_module ( input clk, input d, output q );
    wire a1,a2;
    my_dff inst0(
        .clk(clk),
        .d(d),
        .q(a1)
    );
    my_dff inst1(
        .clk(clk),
        .d(a1),
        .q(a2)
    );
    my_dff inst2(
        .clk(clk),
        .d(a2),
        .q(q)
    );
endmodule
