module top_module (
    input [7:0] in,
    output reg [2:0] pos );
	always @(*) begin
        casez (in[7:0])
        8'bzzzzzzz1: pos = 0;   
        8'bzzzzzz10: pos = 1;
        8'bzzzzz100: pos = 2;
        8'bzzzz1000: pos = 3;
        8'bzzz10000: pos = 4;
        8'bzz100000: pos = 5;
        8'bz1000000: pos = 6;
        8'b10000000: pos = 7;
        default: pos = 0;
    endcase
end

endmodule