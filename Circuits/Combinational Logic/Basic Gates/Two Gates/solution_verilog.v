module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire a;
    xnor g1 (a,in1,in2);
    xor g2 (out,a,in3);

endmodule