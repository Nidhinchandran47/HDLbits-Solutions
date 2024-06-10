module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire a1;
    wire [15:0] a2,a3;
    add16 inst0(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .cout(a1),
        .sum(sum[15:0])
    );
    add16 inst1(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(a2)
    );
    add16 inst2(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(a3)
    );
    always @(*)
        case (a1)
            0: sum[31:16] = a2;
            1: sum[31:16] = a3;
        endcase

endmodule