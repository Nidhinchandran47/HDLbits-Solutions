module top_module (
	input [99:0] a,
	input [99:0] b,
	input cin,
	output cout,
	output [99:0] sum
);

	// The concatenation {cout, sum} is a 101-bit vector.
	assign {cout, sum} = a+b+cin;

endmodule