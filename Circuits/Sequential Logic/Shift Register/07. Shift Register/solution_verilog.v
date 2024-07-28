module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);
    reg x1,x2,x3;
    always @(posedge clk) begin
        if(!resetn)
        	{x1,x2,x3,out} <= 0;
        else begin
            out <= x3;
            x3 <= x2;
            x2 <= x1;
            x1 <= in;
        end
    end
endmodule