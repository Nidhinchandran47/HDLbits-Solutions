module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    FA FA0 (a[0],b[0],cin,sum[0],cout[0]);
    generate
        for(i = 1; i < 100; i++)
            begin:fa_gen
            FA FA1(a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate       
endmodule
        
        module FA(
            input a,b,cin,
            output sum,carry);
            assign sum = a ^ b ^ cin;
            assign carry = (a&b) | (a&cin) | (b&cin);
        endmodule
