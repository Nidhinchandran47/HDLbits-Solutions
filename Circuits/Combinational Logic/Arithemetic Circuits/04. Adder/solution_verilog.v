module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	wire c1,c2,c3;
    FA in0(
        .x(x[0]),
        .y(y[0]),
        .cin(0),
        .sum(sum[0]),
        .cout(c1)
    );
    FA in1(
        .x(x[1]),
        .y(y[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );
    FA in2(
        .x(x[2]),
        .y(y[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );
    FA in3(
        .x(x[3]),
        .y(y[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(sum[4])
    );
endmodule

module FA(
    input x,
    input y,
    input cin,
    output sum,
    output cout);
    assign sum = x ^ y ^ cin;
    assign cout = x&y | x&cin | y&cin ;
endmodule
