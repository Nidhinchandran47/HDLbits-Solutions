module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    genvar i;
    wire [100:0] wcout;
    assign wcout[0] = cin;
    generate
        for(i = 0; i < 400; i = i + 4)
            begin:bcd
                bcd_fadd inst(a[i+3:i], b[i+3:i], wcout[(i+1)/4], wcout[(i+1)/4+1], sum[i+3:i]);
            end
    endgenerate
    assign  cout = wcout[100];

endmodule
