module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	wire a1,a2,a3,a4;
    and and1 (a1, p1a, p1b, p1c);
    and and2 (a2, p1d, p1e, p1f);
    and and3 (a3, p2a, p2b);
    and and4 (a4, p2c, p2d);
    or or1 (p1y, a1, a2);
    or or2 (p2y, a3, a4);

endmodule
