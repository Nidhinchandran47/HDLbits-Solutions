module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    wire b_not;
    and a1 (out_and, a, b);
    or a2 (out_or, a, b);
    xor a3 (out_xor, a, b);
    nand a4 (out_nand, a, b);
    nor a5 (out_nor, a, b);
    xnor a6 (out_xnor, a, b);
    not a7 (b_not, b);
    and a8 (out_anotb, a, b_not);
    

endmodule