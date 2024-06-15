module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    wire [7:0] m1,m2;
    assign m1 = a > b ? b : a;
    assign m2 = c > d ? d : c;
    assign min = m1>m2 ? m2 : m1;
endmodule