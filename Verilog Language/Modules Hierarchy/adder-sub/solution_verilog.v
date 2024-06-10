module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
); 
    wire [31:0] ones;
    wire carry;
    assign ones = b ^ {32{sub}};
    
    add16 inst0 (
        .a(a[15:0]),
        .b(ones[15:0]),
        .cin(sub),
        .cout(carry),
        .sum(sum[15:0])
    );
    add16 inst1 (
        .a(a[31:16]),
        .b(ones[31:16]),
        .cin(carry),
        .sum(sum[31:16])
    );

endmodule