module top_module (
    input in1,
    input in2,
    output out);
    wire n1;
    not a (n1, in2);
    and b (out, in1,n1);

endmodule