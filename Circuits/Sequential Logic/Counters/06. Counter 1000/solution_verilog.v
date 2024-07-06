module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] temp0, temp1, temp2; 
    bcdcount counter0 (clk, reset, c_enable[0], temp0); // fastest
    bcdcount counter1 (clk, reset, c_enable[1], temp1);
    bcdcount counter2 (clk, reset, c_enable[2], temp2); // slowest
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = temp0[0] & temp0[3];
    assign c_enable[2] = temp0[0] & temp0[3] & temp1[0] & temp1[3];
    assign OneHertz = temp0[0] & temp0[3] & temp1[0] & temp1[3] & temp2[0] & temp2[3];

endmodule
