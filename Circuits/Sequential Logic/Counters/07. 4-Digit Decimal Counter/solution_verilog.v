module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    bcd_count m0(clk, reset, 1'b1, q[3:0]);
    bcd_count m1(clk, reset, ena[1], q[7:4]);
    bcd_count m2(clk, reset, ena[2], q[11:8]);
    bcd_count m3(clk, reset, ena[3], q[15:12]);
    assign ena[1] = q[0] & q[3];
    assign ena[2] = q[4] & q[7] & q[0] & q[3];
    assign ena[3] = q[8] & q[11] & q[4] & q[7] & q[0] & q[3];
    
endmodule

module bcd_count (
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [3:0] q);
    always @ (posedge clk) begin
        if(reset)
            q <= 0;
        else if (q == 9 && enable)
            q <= 0;
        else if(enable)
            q <= q + 1;
        else
            q <= q;
    end

endmodule
