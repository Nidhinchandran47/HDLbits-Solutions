module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire[7:0] a1,a2,a3;
    my_dff8 inst0(
        .clk(clk),
        .d(d),
        .q(a1)
    );
    my_dff8 inst1(
        .clk(clk),
        .d(a1),
        .q(a2)
    );
    my_dff8 inst2(
        .clk(clk),
        .d(a2),
        .q(a3)
    );
    
        // This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = o1;
			2'h2: q = o2;
			2'h3: q = o3;
		endcase 

endmodule
